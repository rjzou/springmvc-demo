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
  <select class="selectpicker"  title="请选择..." multiple>
	  	<c:forEach var="house" items="${houses}">  
	  	<option value="${house.id}"> 
			${house.housename}  
			</option> 
		</c:forEach>
  </select>
  </div>
  <div class="form-group">
  
    <input type="text" class="form-control" placeholder="Search">
  </div>
  <button type="submit" class="btn btn-default">查询</button>
</form>
</div><!-- /.row -->
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>#</th>
					<th>栋</th>
					<th>房间号</th>
					<th>入住姓名</th>
					<th>入住时间</th>
					<th>上次抄表时间</th>
					<th>上次水读数</th>
					<th>上次电读数</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list.content}" var="item" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${item.housename }</td>
						<td>${item.roomno }</td>
						<td>${item.customname }</td>
						<td>${item.in_date }</td>
						<td>${item.pre_s_date }</td>
						<td>${item.water }</td>
						<td>${item.elect }</td>
						<td>
							<a class="btn btn-info btn-sm" href="${ctx}/room_towaterelect?houseid=${item.houseid }&roomno=${item.roomno }" role="button">抄表</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<pagebar:pagebar total="${list.totalPages}" current="${list.number + 1}" />
</body>
</html>