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
	  <c:if test="${!empty message}">  
            <div class="alert alert-success" role="alert">${message}</div>
            <script type="text/javascript">
            function autojump(){
            	location.href="${ctx}/room_checkout";
            }
            setTimeout("autojump()",10000);
            </script>
      </c:if>
      <c:if test="${!empty danger}">  
            <div class="alert alert-danger" role="alert">${danger}</div>
            <script type="text/javascript">
            function autojump(){
            	location.href="${ctx}/room_checkout";
            }
            setTimeout("autojump()",10000);
            </script>
      </c:if>  
        <div class="panel panel-default">
		  <!-- Default panel contents -->
		  <div class="panel-heading">入住资料</div>
		   <!-- Table -->
			<div class="table-responsive">
		       <table class="table table-bordered">
		        <tr>
		            <th class="col-sm-2">楼房</th>
		            <td>${params.housename}</td>
		        </tr>
		          <tr>
		            <th class="col-sm-2">房间号</th>
		            <td>${params.roomno}</td>
		        </tr>
		  		  <tr>
		            <th class="col-sm-2">入住姓名</th>
		            <td>${params.customname}</td>
		        </tr>
		        <tr>
		            <th class="col-sm-2">入住日期</th>
		            <td><span class="label label-success">${params.in_date}</span> 已经入住 <span class="label label-success">${params.in_days}</span> 天</td>
		        </tr>
		        <c:if test="${!empty params.ip}">
		          	<tr>
			            <th class="col-sm-2">网络IP</th>
			            <td>${params.ip}</td>
		        	</tr>
		        </c:if>
				</table>
			</div>
		</div>
		<div class="panel panel-default">
		  <!-- Default panel contents -->
		  <div class="panel-heading">收租记录</div>
		
		  <!-- Table -->
		  <div class="table-responsive">
		  <table class="table table-condensed">
		  <thead>
		  <tr>
		  	<th class="col-sm-1">实收日期</th>
		  	<th class="col-sm-1">实收月租</th>
		  	<th class="col-sm-1">实收押金</th>
		  	<th class="col-sm-1">实抄水/电读数</th>
		  	<th class="col-sm-1">本月水/电价</th>
		  	<th class="col-sm-1">实收网费</th>
		  	<th class="col-sm-1">实收卫生费</th>
		  	<th class="col-sm-1">实收钥匙串押金</th>
		  	<th class="col-sm-1">实收总费用</th>
		  </tr>
		  </thead>
			<tbody>
		  <c:forEach items="${list.content}" var="item" varStatus="status">
		    <tr>
	            <td><span class="label label-success">${item.s_date }</span></td>
	            <td><span class="label label-success">${item.monthmoney }</span></td>
	            <td><span class="label label-success">${item.pressmoney}</span></td>
	            <td><span class="label label-success">${item.water}/${item.elect}</span></td>
	            <td><span class="label label-success">${item.waterprice}/${item.electprice}</span></td>
	            <td><span class="label label-success">${item.netprice}</span></td>
	            <td><span class="label label-success">${item.trash}</span></td>
	            <td><span class="label label-success">${item.sum_keyprice}</span></td>
	            <td><span class="label label-success">${item.roommoney}</span></td>
        	</tr>
        	</c:forEach>
        	</tbody>
		  </table>
		  </div>
		</div>
 	<input type="hidden" id="houseid" name="houseid" value="${params.houseid}"/>
 	<input type="hidden" id="roomno" name="roomno" value="${params.roomno}"/>
 	<input type="hidden" id="paymoney" name="paymoney" value="${params.paymoney}"/>
 	  <c:choose>
			<c:when test="${!empty params.return_url }">
				<a class="btn btn-default" href="${params.return_url}" role="button">返回</a>
			</c:when>
			<c:otherwise>
				<a class="btn btn-default" href="${ctx}/room_checkin_query" role="button">返回</a>
			</c:otherwise>
	  </c:choose>
	</form>
</div>
</body>
</html>