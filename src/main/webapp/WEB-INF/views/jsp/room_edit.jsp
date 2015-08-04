<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="theme" content="basic_theme" />
<link rel="stylesheet"
	href="${ctx}/resources/css/bootstrap-select.css">
<script
	src="${ctx}/resources/js/bootstrap-select.js"></script>
</head>
<body>
<div class="row">
	<form role="form" method="post" action="${ctx}/room_edit">
	  <c:if test="${!empty message}">  
            <div class="alert alert-success" role="alert">${message}</div>
      </c:if> 
      <input type="hidden" id="hiddenHouseid" name="hiddenHouseid" value="${houseid}"/>
      <input type="hidden" id="hiddenRoomno" name="hiddenRoomno" value="${roomno}"/>
		<div class="form-group">
		<label class="control-label" for="selectHouse">楼房</label>
		<div class="input-group">
			<select class="selectpicker" id="selectHouse" name="selectHouse">
				<c:forEach var="house" items="${houses}">  
				  	<option value="${house.id}" <c:if test="${house.id == houseid}">selected="selected"</c:if>  > 
						${house.housename}  
						</option> 
				</c:forEach>
			</select>
			</div>
		</div>

		<div class="form-group">
			<label class="control-label" for="inputRoom">房间号</label> 
			<input
				type="number" class="form-control" id="inputRoom" name="inputRoom" value="${roomno}"
				placeholder="输入房间号" required>
		</div>

		<div class="form-group">
			<label class="control-label" for="inputMonthMoney">参考月租</label>
			<input type="number" class="form-control" id="inputMonthMoney" name="inputMonthMoney" value="${monthmoney}"
				placeholder="输入参考月租" required>
		</div>
		<div class="form-group">
			<label class="control-label" for="inputPressMoney">参考押金</label>
			<input type="number" class="form-control" id="inputPressMoney" name="inputPressMoney"value="${pressmoney}"
				placeholder="输入参考押金" required>
		</div>
		<div class="form-group">
			<label class="control-label" for="inputDescription">备注</label>
			<input type="text" class="form-control" id="inputDescription" name="inputDescription"  value="${description}"
				placeholder="备注">
		</div>
		<button type="submit" class="btn btn-primary">保存</button>
		<a class="btn btn-default" href="${ctx}/room" role="button">返回</a>
	</form>
</div>
</body>
</html>