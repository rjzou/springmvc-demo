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
  
    <input type="text" class="form-control"  id="housename" name="housename" placeholder="请输入楼房名称"  value="${params.housename}">
  </div>
  	<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
  <button type="submit" class="btn btn-default">查询</button>
  <a class="btn btn-primary" href="${ctx}/house_toadd" role="button">新建楼房</a>
</form>
</div><!-- /.row -->
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>楼房编号</th>
					<th>楼房名称</th>
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
							<a class="btn btn-warning btn-sm" href="${ctx}/house_todel?id=${item.id }" role="button" >删除</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<pagebar:pagebar total="${list.totalPages}" current="${list.number + 1}" />
</body>
</html>