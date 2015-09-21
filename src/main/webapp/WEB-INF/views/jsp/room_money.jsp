<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="theme" content="basic_theme" />
	<link rel="stylesheet" href="${ctx_cdn}/resources/css/bootstrap-select.css">
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.3/js/bootstrap-select.min.js"></script>
</head>
<body>
<div class="row">
  <form class="navbar-form navbar-left" role="search" action="${ctx}/room_money" method="post">
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
   <input type="hidden" id="roomtypeid" name="roomtypeid" />
  </div>
  <div class="form-group">
  
    <input type="text" class="form-control" placeholder="输入房间号">
  </div>
  <input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
  <button type="submit" class="btn btn-default" onclick="return to_search();">查询</button>
</form>
</div><!-- /.row -->
	<div class="table-responsive">
		<table class="table table-striped">
			<thead> 
				<tr>
					<th>#</th>
					<th>栋 / 房间号 / 房型</th>
					<th>客户名称</th>
					<th>上月实收月租</th>
					<th>上月实收押金</th>
					<th>上月收租日期</th>
					<th>上月实收费用</th>
					<th>本月应收日</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list.content}" var="item" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${item.housename } / ${item.roomno } / ${item.typename }</td>
						<td>${item.customname }</td>
						<td>${item.monthmoney } 元</td>
						<td>${item.pressmoney } 元</td>
						<td>${item.pre_s_date }</td>
						<td>${item.roommoney } 元</td>
						<td>${item.cin_day }</td>
						<td>
							<a class="btn btn-primary btn-sm" href="${ctx}/room_tomoney?houseid=${item.houseid }&roomno=${item.roomno }" role="button">收房租</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<pagebar:pagebar total="${list.totalPages}" current="${list.number + 1}" />
</body>
</html>