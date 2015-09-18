<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="theme" content="basic_theme" />
</head>
<body>
<div class="row">
	<form role="form" method="post" action="#">
	  
      <table class="table table-bordered">
        <tr>
            <th class="col-sm-2">客户名称</th>
            <td>${params.customname}</td>
        </tr>
          <tr>
            <th class="col-sm-2">手机</th>
            <td>${params.iphone}</td>
        </tr>
  		  <tr>
            <th class="col-sm-2">身份证</th>
            <td>${params.cardid}</td>
        </tr>
        <tr>
            <th class="col-sm-2">时间</th>
            <td>${params.year}/${params.month}/${params.day}</td>
        </tr>
		</table>
		 		<c:if test="${params.custom_room eq 'online'}">  
					<div class="panel panel-default">
					  <!-- Default panel contents -->
					  <div class="panel-heading">在住房间</div>
					
					  <!-- Table -->
					  <div class="table-responsive">
					  <table class="table table-condensed">
					  <thead>
					  <tr>
					  	<th class="col-sm-1">栋 / 房间号 / 房型</th>
					  	<th class="col-sm-1">入住日期</th>
					  	<th class="col-sm-1">入住天数</th>
					  	<th class="col-sm-1">实收总费用</th>
					  	<th class="col-sm-1">操作</th>
					  </tr>
					  </thead>
						<tbody>
					  <c:forEach items="${online_room_list.content}" var="item" varStatus="status">
					    <tr>
				            <td>${item.housename } / ${item.roomno } / ${item.typename }</td>
				            <td>${item.in_date }</span></td>
				            <td>${item.in_days }</td>
				            <td>${item.sum_roommoney }</span></td>
				           	<td>
										<a class="btn btn-primary btn-sm" href="${ctx}/room_checkin_query_page?houseid=${item.houseid }&roomno=${item.roomno }" role="button">详情</a>
									</td>
			        	</tr>
			        	</c:forEach>
			        	</tbody>
					  </table>
					  </div>
					</div>
				</c:if> 
				<c:if test="${params.custom_room eq 'offline'}">  
				<div class="panel panel-default">
				  <!-- Default panel contents -->
				  <div class="panel-heading">历史房间</div>
				
				  <!-- Table -->
				  <div class="table-responsive">
				  <table class="table table-condensed">
				  <thead>
				  <tr>
				  	<th class="col-sm-1">栋 / 房间号 / 房型</th>
				  	<th class="col-sm-1">入住时间</th>
				  	<th class="col-sm-1">入住天数</th>
				  	<th class="col-sm-1">退房时间</th>
				  	<th class="col-sm-1">实收总费用</th>
				  	<th class="col-sm-1">操作</th>
				  </tr>
				  </thead>
					<tbody>
				  		<c:forEach items="${offline_room_list.content}" var="item" varStatus="status">
					    	<tr>
				           		 <td>${item.housename } / ${item.roomno } / ${item.typename }</td>
					            <td>${item.in_date }</span></td>
					            <td>${item.in_days }</td>
					             <td>${item.out_date }</td>
					            <td>${item.sum_roommoney }</span></td>
					           	<td>
									<a class="btn btn-primary btn-sm" href="${ctx}/room_checkout_query_page?houseid=${item.houseid }&roomno=${item.roomno }" role="button">详情</a>
								</td>
			        		</tr>
		        		</c:forEach>
		        	</tbody>
				  </table>
				  </div>
				</div>
		 	</c:if> 
		<a class="btn btn-default" href="${ctx}/custom_query" role="button">返回</a>
	</form>
</div>
</body>
</html>