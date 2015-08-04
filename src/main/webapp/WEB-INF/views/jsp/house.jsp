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
  
    <input type="text" class="form-control" placeholder="Search">
  </div>
  <button type="submit" class="btn btn-default">查询</button>
  <a class="btn btn-primary" href="${ctx}/house_toadd" role="button">新建楼房</a>
</form>
</div><!-- /.row -->
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>楼房编号</th>
					<th>楼房名字</th>
					<th>备注</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list.content}" var="item" varStatus="status">
					<tr>
						<td>${item.id }</td>
						<td>${item.housename }</td>
						<td>${item.description }</td>
						<td>
							<a class="btn btn-info btn-sm" href="${ctx}/house_toedit?id=${item.id }" role="button">编辑</a>
							<a class="btn btn-warning btn-sm" href="${ctx}/house_toadd" role="button">删除</a>
							<a class="btn btn-default btn-sm" href="${ctx}/house_toadd" role="button">禁用</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<pagebar:pagebar total="${list.totalPages}" current="${list.number + 1}" />
</body>
</html>