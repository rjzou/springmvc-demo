<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="pagebar" uri="/WEB-INF/pagebar.tld"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="theme" content="basic_theme" />
    <!-- pager css  -->
	<link href="${pageContext.request.contextPath}/resources/css/pager.css" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-select.css">
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap-select.js"></script>
</head>
<body>
<div class="row">
  <form class="navbar-form navbar-left" role="search">
  <div class="form-group">
  <select class="selectpicker" multiple>
      <option selected="selected">1栋</option>
      <option selected="selected">2栋</option>
      <option selected="selected">3栋</option>
  </select>
  </div>
  <div class="form-group">
  
    <input type="text" class="form-control" placeholder="Search">
  </div>
  <button type="submit" class="btn btn-default">查询</button>
  <a class="btn btn-primary" href="${pageContext.request.contextPath}/room_toadd" role="button">新建房间</a>
</form>
</div><!-- /.row -->
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>栋</th>
					<th>房间号</th>
					<th>月租</th>
					<th>备注</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list.content}" var="item" varStatus="status">
					<tr>
						<td>${item.house_id } 栋</td>
						<td>${item.room_no }</td>
						<td>${item.month_money }</td>
						<td>${item.description }</td>
						<td>
							<a class="btn btn-info btn-sm" href="${pageContext.request.contextPath}/room_toedit?house_id=${item.house_id }&room_no=${item.room_no }" role="button">编辑</a>
							<a class="btn btn-warning btn-sm" href="${pageContext.request.contextPath}/room_toadd" role="button">删除</a>
							<a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/room_toadd" role="button">禁用</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div id="page">
		<pagebar:pagebar total="${list.totalPages}"
			current="${list.number + 1}" />
	</div>
</body>
</html>