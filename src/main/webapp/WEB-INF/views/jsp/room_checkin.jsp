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
  <form class="navbar-form navbar-left" role="search" action="${ctx}/room_checkin_search" method="post">
   <div class="form-group">
  <select class="selectpicker" name="selectHouse" multiple>
	  	<c:forEach var="house" items="${houses}">  
	  	<option value="${house.id}"> 
			${house.housename}  
			</option> 
		</c:forEach>
  </select>
  <script type="text/javascript">
  function test(){
	 alert($("select[name='selectHouse']").val());
	 return false;
  }
  </script>
  </div>
  
  <div class="form-group">
  <select class="selectpicker" name="selectRoomtype" multiple>
	  	<c:forEach var="type" items="${types}">  
	  	<option value="${type.typecode}"> 
			${type.typename}  
			</option> 
		</c:forEach>
  </select>
  </div>
  <div class="form-group">
  
    <input type="text" class="form-control" placeholder="输入房间号">
  </div>
  <button type="submit" class="btn btn-default" onclick="return test();">查询</button>
  <p class="text-left">
  <span class="label label-danger">还有空房21间</span>
  </p>
</form>
</div><!-- /.row -->
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>*</th>
					<th>栋</th>
					<th>房间号</th>
					<th>参考月租</th>
					<th>参考押金</th>
					<th>操作</th>
					<th>备注</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list.content}" var="item" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${item.housename }</td>
						<td>${item.roomno }</td>
						<td>${item.monthmoney }</td>
						<td>${item.pressmoney }</td>
						<td>
							<a class="btn btn-primary btn-sm" href="${ctx}/room_tocheckin?houseid=${item.houseid }&roomno=${item.roomno }" role="button">入住</a>
						</td>
						<td>${item.description }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<pagebar:pagebar total="${list.totalPages}" current="${list.number + 1}" />
</body>
</html>