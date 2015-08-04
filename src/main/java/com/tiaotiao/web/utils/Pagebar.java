package com.tiaotiao.web.utils;

import java.io.IOException;
import java.util.Arrays;
import java.util.Enumeration;

import javax.servlet.ServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

/**
 * 一个自定义的简单分页工具
 * 
 *
 */
@SuppressWarnings("serial")
public class Pagebar extends BodyTagSupport {

	/**
	 * 总页数 
	 */
	private int total;

	/**
	 * 当前页码
	 */
	private int current;

	/**
	 * 需要忽略的参数
	 */
	private String skipParams;
	
	/**
	 * 分页名称
	 * 
	 * ?p=1, ?p=2
	 * 默认为 p, 如果单个页面有多个 pagebar 需要放置,
	 * 每个都有自己的分页名称, 需要设置改参数
	 */
	private String p = "p";

	/* (non-Javadoc)
	 * @see javax.servlet.jsp.tagext.BodyTagSupport#doStartTag()
	 */
	@Override
	@SuppressWarnings("unchecked")
	public int doStartTag() throws JspException {
		ServletRequest req = pageContext.getRequest();
		Enumeration<String> paramsName = req.getParameterNames();

		String[] skips = null;
		if (skipParams != null) {
			skips = skipParams.split(",");
			Arrays.sort(skips);
		}

		StringBuilder sb = new StringBuilder();
		while (paramsName.hasMoreElements()) {
			String param = paramsName.nextElement();
			if ("p".equalsIgnoreCase(param)) {
				continue;
			}
			// skip
			if (skips != null) {
				if (Arrays.binarySearch(skips, param) >= 0) {
					continue;
				}
			}
			String[] vs = req.getParameterValues(param);
			for (String v : vs) {
				sb.append("&");
				sb.append(param).append("=").append(v);
			}
		}
		String tmp_sb = sb.toString();
		if(tmp_sb.contains("&layout=no")){
			tmp_sb.replaceAll("&layout=no", "");
			sb = new StringBuilder();
			sb.append(tmp_sb).append("&layout=no");
		}
		String params = sb.length() > 0 ? sb.toString() : null;

		JspWriter out = pageContext.getOut();
		try {
			if (current > total || current <= 0 || total <= 0) {
				out.append("<ul class=\"pagination\">\n");
				out.append("\t<li class=\"error\"><!--页码错误--></li>\n");
				return super.doStartTag();
			}

			out.append("<ul class=\"pagination\">\n");

			if (total  == 1) {
				return super.doStartTag();
			}

			if (current != 1) {
				out.append("\t<li><a href=\"").append(buildLink(1, params)).append("\">&laquo;</a></li>\n");
			} else {
				out.append("\t <li class=\"disabled\"><a ").append(buildLink(1, params)).append("\" >&laquo;</a></li>\n");
			}

			if (total > 10) {

				int g = current % 10;

				int next = 10;
				if (g > 5) {
					next = current - g + 20;
				} else {
					next = current - g + 10;
				}

				int prev = 0;
				if (g > 5) {
					prev = current - g - 10;
				} else {
					prev = current - g - 20;
				}

				if (prev < 0) {
					prev = 0;
				}

				if (current >= 1 && current < 4) {
					appendLinks(out, params, 1, 5);
					appendExtend(out);
					if (total > 10) {
						appendLinks(out, params, 10, 10);
						appendExtend(out);
					}
				} else if (current >= 4 && current < total - 3) {
					if (prev > 0) {
						if (prev > 1) {
							appendExtend(out);
						}
						appendLinks(out, params, prev, prev);
					}

					appendExtend(out);
					appendLinks(out, params, current - 2, current + 2);
					appendExtend(out);

					if (next < total) {
						appendLinks(out, params, next, next);
						appendExtend(out);
					}
				} else {
					if (prev > 1) {
						appendExtend(out);
					}
					if (prev == 0) {
						prev = 1;
					}
					appendLinks(out, params, prev, prev);
					appendExtend(out);
					appendLinks(out, params, current - 3, total);
				}
			} else {
				appendLinks(out, params, 1, total);
			}

			if (current != total) {
				out.append("\t<li><a href=\"").append(buildLink(total, params)).append("\" >&raquo;</a></li>\n");
			} else {
				out.append("\t<li class=\"disabled\"><a ").append(buildLink(total, params)).append("\" >&raquo;</a></li>\n");
			}
		} catch (IOException e) {
			throw new JspException(e);
		}
		return super.doStartTag();
	}

	/**
	 * @param out
	 * @throws IOException 
	 */
	private void appendExtend(JspWriter out) throws IOException {
		out.append("\t<span class=\"extend\">...</span>\n");
	}

	/**
	 * @param i
	 * @param params
	 * @return
	 */
	private CharSequence buildLink(int i, String params) {
		StringBuilder sb = new StringBuilder();
		sb.append("?").append(p).append("=").append(i);
		if (params != null) {
			sb.append(params);
		}
		return sb.toString();
	}

	/**
	 * @param out
	 * @param string
	 * @param end 
	 * @param start 
	 * @throws IOException 
	 */
	private void appendLinks(JspWriter out, String link, int start, int end) throws IOException {
		for (int i = start; i <= end; i++) {
			String page = Integer.toString(i);
			if (i == current) {
				out.append("\t<li class=\"active\"><a ")
				.append(">").append(page).append("</a></li>\n");
			} else {
				out.append("\t<li><a href=\"").append(buildLink(i, link)).append("\" ")
				.append(">").append(page).append("</a></li>\n");
			}
		}
	}

	/* (non-Javadoc)
	 * @see javax.servlet.jsp.tagext.BodyTagSupport#doEndTag()
	 */
	@Override
	public int doEndTag() throws JspException {
		JspWriter out = this.pageContext.getOut();
		try {
			out.append("\n</ul>");
		} catch (IOException e) {
			throw new JspException(e);
		}
		return super.doEndTag();
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public void setCurrent(int current) {
		this.current = current;
	}

	public void setSkipParams(String skipParams) {
		if (skipParams != null) {
			skipParams = skipParams.trim();
		}
		if (skipParams.length() > 0) {
			this.skipParams = skipParams;
		} else {
			this.skipParams = null;
		}
	}

	/**
	 * @param p set p
	 */
	public void setP(String p) {
		if (p == null) {
			p = "p";
		} else {
			p = p.trim();
		}
		this.p = p;
	}

}
