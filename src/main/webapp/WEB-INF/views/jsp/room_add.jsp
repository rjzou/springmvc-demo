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
	<form role="form" method="post" action="${ctx}/room_add">
	  <c:if test="${!empty message}">  
            <div class="alert alert-success" role="alert">${message}</div>
      </c:if> 
		<div class="form-group">
		<label class="control-label" for="selectHouse">楼房</label>
		<div class="input-group">
			<select class="selectpicker" id="selectHouse" name="selectHouse" required>
				<option value="" >---请选择---</option> 
				<c:forEach var="house" items="${houses}">  
				  	<option value="${house.id}"> 
						${house.housename}  
						</option> 
				</c:forEach>
			</select>
			</div>
		</div>

		<div class="form-group">
			<label class="control-label" for="inputRoom">房间号</label> 
			<input
				type="number" class="form-control" id="inputRoom" name="inputRoom" value="${params.inputRoom}"
				placeholder="输入房间号" required>
		</div>

		<div class="form-group">
			<label class="control-label" for="inputMonthMoney">参考月租</label>
			<input type="number" class="form-control" id="inputMonthMoney" name="inputMonthMoney" value="${params.inputMonthMoney}"
				placeholder="输入参考月租" required>
		</div>
		<div class="form-group">
			<label class="control-label" for="inputPressMoney">参考押金</label>
			<input type="number" class="form-control" id="inputPressMoney" name="inputPressMoney" value="${params.inputPressMoney}"
				placeholder="输入参考押金" required>
		</div>
		<div class="radio">
	      <label>
	        <input type="radio" name="optionsRoomtypes" id="optionsRadios1" value="danjian" checked required>
	        单间
	      </label>
	      <label>
	        <input type="radio" name="optionsRoomtypes" id="optionsRadios2" value="yifangyiting" required>
	        一房一厅
	      </label>
	      <label>
	        <input type="radio" name="optionsRoomtypes" id="optionsRadios2" value="liangfangyiting" required>
	        两房一厅
	      </label>
	    </div>
		<div class="form-group">
			<label class="control-label" for="inputDescription">备注</label>
			<input type="text" class="form-control" id="inputDescription" name="inputDescription" value="${params.inputDescription}"
				placeholder="备注">
		</div>
		<button type="submit" class="btn btn-primary">保存</button>
		<a class="btn btn-default" href="${ctx}/room" role="button">返回</a>
	</form>
</div>
</body>
</html>