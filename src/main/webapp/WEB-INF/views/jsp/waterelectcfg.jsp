<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="theme" content="basic_theme" />
	<link rel="stylesheet" href="${ctx_cdn}/resources/css/bootstrap-select.css?Ver=20150821">
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.3/js/bootstrap-select.min.js?Ver=20150821"></script>

</head>
<body>
<div class="row">
  <form class="navbar-form navbar-left" role="search" method="post">
  <div class="form-group">
  <select class="selectpicker" id="selectYear" name="selectYear"  title="请选择..." multiple>
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
  <input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
  <button type="submit" class="btn btn-default" onclick="return to_search();">查询</button>
  <a class="btn btn-primary" href="${ctx}/waterelectcfg_toadd" role="button">生成水电价格</a>
</form>
</div><!-- /.row -->
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>#</th>
					<th>年</th>
					<th>月</th>
					<th>水价</th>
					<th>电价</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list.content}" var="item" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${item.year }</td>
						<td>${item.month }</td>
						<td>${item.waterprice }元</td>
						<td>${item.electprice }元</td>
						<td>
							<a class="btn btn-info btn-sm" href="${ctx}/waterelectcfg_toedit?year=${item.year }&month=${item.month }" role="button">修改价格</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<pagebar:pagebar total="${list.totalPages}" current="${list.number + 1}" />
</body>
</html>