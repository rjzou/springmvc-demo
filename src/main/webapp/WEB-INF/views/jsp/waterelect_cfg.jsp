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
<div class="row">
  <form class="navbar-form navbar-left" role="search">
  <div class="form-group">
  <select class="selectpicker" multiple>
	  <option>2015</option>
      <option>2016</option>
  </select>
  </div>
  <button type="submit" class="btn btn-default">查询</button>
</form>
</div><!-- /.row -->
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>*</th>
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
						<td>${item.waterprice }</td>
						<td>${item.electprice }</td>
						<td>
							<a class="btn btn-info btn-sm" href="${ctx}/waterelect_tocfg?houseid=${item.houseid }&roomno=${item.roomno }" role="button">抄表</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<pagebar:pagebar total="${list.totalPages}" current="${list.number + 1}" />
</body>
</html>