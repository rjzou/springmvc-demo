<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="theme" content="basic_theme" />
	<link rel="stylesheet" href="${ctx_cdn}/resources/css/bootstrap-select.css">
	<script src="${ctx_cdn}/resources/js/bootstrap-select.js"></script>
</head>
<body>
<ul class="nav nav-pills">
  <li role="presentation" class="active"><a href="${ctx}/netcfg">开通网络</a></li>
  <li role="presentation"><a href="${ctx}/netcfg_close">关闭网络</a></li>
</ul>
<div class="row">
  <form class="navbar-form navbar-left" role="search" method="post">
   <div class="form-group">
  <select class="selectpicker" name="selectHouse"  title="请选择..." multiple>
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
  <select class="selectpicker" name="selectRoomtype"  title="请选择..." multiple>
	  	<c:forEach var="type" items="${types}">  
	  	<option value="${type.typecode}" <c:if test="${fn:contains(params.roomtypeid, type.typecode) == true }">selected="selected"</c:if>> 
			${type.typename}  
			</option> 
		</c:forEach>
  </select>
   <input type="hidden" id="roomtypeid" name="roomtypeid" value="${params.roomtypeid}"/>
  </div>
  <div class="form-group">
  
    <input type="text" class="form-control" placeholder="输入房间号"  id="roomno" name="roomno" value="${params.roomno}"/>
  </div>
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
  <button type="submit" class="btn btn-default" onclick="return to_search();">查询</button>
</form>
</div><!-- /.row -->
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>#</th>
					<th>栋</th>
					<th>客户姓名</th>
					<th>网费</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list.content}" var="item" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${item.housename } / ${item.roomno } / ${item.typename }</td>
						<td>${item.customname }</td>
						<td>${item.netprice }元</td>
						<td>
							<a class="btn btn-info btn-sm" href="${ctx}/netcfg_toopen?houseid=${item.houseid }&roomno=${item.roomno }" role="button">开通</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<pagebar:pagebar total="${list.totalPages}" current="${list.number + 1}" />
</body>
</html>