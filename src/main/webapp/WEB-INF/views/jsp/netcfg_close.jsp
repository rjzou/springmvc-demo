<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="theme" content="basic_theme" />
	<link rel="stylesheet" href="${ctx}/resources/css/bootstrap-select.css">
	<script src="${ctx}/resources/js/bootstrap-select.js"></script>
</head>
<body>
<ul class="nav nav-pills">
  <li role="presentation"><a href="${ctx}/netcfg">开通网络</a></li>
  <li role="presentation" class="active"><a href="${ctx}/netcfg_close">关闭网络</a></li>
</ul>
<div class="row">
  <form class="navbar-form navbar-left" role="search" method="post">
  <div class="form-group">
  <select class="selectpicker" id="selectYear" name="selectYear" multiple>
	  <option value="2015" <c:if test="${fn:contains(params.year, '2015') == true}">selected="selected"</c:if>>2015</option>
      <option value="2016" <c:if test="${fn:contains(params.year, '2016') == true}">selected="selected"</c:if>>2016</option>
  </select>
  </div>
  <input type="hidden" id="year" name="year" value="${params.year}"/>
  <script type="text/javascript">
  function to_search(){
	 var v_select_years = $(".selectpicker[name='selectYear']").val();
	 $("#year").val(v_select_years);
	 return true;
  }
  </script>
  <button type="submit" class="btn btn-default" onclick="return to_search();">查询</button>
</form>
</div><!-- /.row -->
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>*</th>
					<th>栋</th>
					<th>房间号</th>
					<th>客户名称</th>
					<th>网费</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list.content}" var="item" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${item.housename }</td>
						<td>${item.roomno }</td>
						<td>${item.customname }元</td>
						<td>${item.netprice }元</td>
						<td>
							<a class="btn btn-info btn-sm" href="${ctx}/netcfg_toclose?houseid=${item.houseid }&roomno=${item.roomno }" role="button">关闭</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<pagebar:pagebar total="${list.totalPages}" current="${list.number + 1}" />
</body>
</html>