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
  <form class="navbar-form navbar-left" role="search" action="${ctx}/room_checkin" method="post">
   <div class="form-group">
  <select class="selectpicker" name="selectHouse" multiple>
	  	<c:forEach var="house" items="${houses}">  
	  	<option value="${house.id}"  <c:if test="${fn:contains(params.houseid, house.id) == true }">selected="selected"</c:if> > 
			${house.housename}  
			</option> 
		</c:forEach>
  </select>
   <input type="hidden" id="houseid" name="houseid" value="${params.houseid}"/>
  <script type="text/javascript">
  function to_search(){
	 var v_select_houses = $(".selectpicker[name='selectHouse']").val();
	 var v_select_room_type = $(".selectpicker[name='selectRoomtype']").val();
	 $("#houseid").val(v_select_houses);
	 $("#roomtypeid").val(v_select_room_type);
	 return true;
  }
  </script>
  </div>
  
  <div class="form-group">
  <select class="selectpicker" name="selectRoomtype" multiple>
	  	<c:forEach var="type" items="${types}">  
	  	<option value="${type.typecode}" <c:if test="${fn:contains(params.roomtypeid, type.typecode) == true }">selected="selected"</c:if>> 
			${type.typename}  
			</option> 
		</c:forEach>
  </select>
   <input type="hidden" id="roomtypeid" name="roomtypeid" />
  </div>
  <div class="form-group">
  
    <input type="text" class="form-control" placeholder="输入房间号">
  </div>
  <button type="submit" class="btn btn-default" onclick="return to_search();">查询</button>
  <p class="text-left">
  <span class="label label-danger">本月有21间需要收房租</span>
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
					<th>实收月租</th>
					<th>实收押金</th>
					<th>上月收费日期</th>
					<th>本月应收日期</th>
					<th>上月实收费用</th>
					<th>操作</th>
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
						<td>${item.pre_s_day }</td>
						<td>${item.cin_day }</td>
						<td>${item.roommoney }</td>
						<td>
							<a class="btn btn-primary btn-sm" href="${ctx}/room_to_money?houseid=${item.houseid }&roomno=${item.roomno }" role="button">收房租</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<pagebar:pagebar total="${list.totalPages}" current="${list.number + 1}" />
</body>
</html>