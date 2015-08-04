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
	<form role="form" method="post" action="${ctx}/room_checkin_add">
	  <c:if test="${!empty message}">  
            <div class="alert alert-success" role="alert">${message}</div>
      </c:if> 
      <div class="form-group">
	      <button type="submit" class="btn btn-primary">保存</button>
		  <a class="btn btn-default" href="${ctx}/room_checkin" role="button">返回</a>
	  </div>
      <input type="hidden" id="hiddenHouseid" name="hiddenHouseid" value="${params.hiddenHouseid}"/>
      <input type="hidden" id="hiddenRoomno" name="hiddenRoomno" value="${params.hiddenRoomno}"/>

		<div class="form-group">
			<label class="control-label" for="inputUsername">客户姓名</label>
			<input type="text" class="form-control" id="inputUsername" name="inputUsername" value="${params.inputUsername}"
				placeholder="输入客户姓名" required>
		</div>
		<div class="form-group">
			<label class="control-label" for="inputIphone">客户手机</label>
			<input type="text" class="form-control" id="inputIphone" name="inputIphone"   value="${params.inputIphone}"
				placeholder="输入客户手机" required>
		</div>
		<div class="form-group">
			<label class="control-label" for="inputUserid">身份证</label>
			<input type="text" class="form-control" id="inputUserid" name="inputUserid"    value="${params.inputUserid}"
				placeholder="输入身份证">
		</div>
		<div class="form-group">
			<label class="control-label" for="inputMonthMoney">月租</label>
			<input type="number" class="form-control" id="inputMonthMoney" name="inputMonthMoney"  value="${params.inputMonthMoney}"
				placeholder="输入参考月租" required>
		</div>
		<div class="form-group">
			<label class="control-label" for="inputPressMoney">押金</label>
			<input type="number" class="form-control" id="inputPressMoney" name="inputPressMoney"  value="${params.inputPressMoney}"
				placeholder="输入参考押金" required>
		</div>
		<div class="form-group">
			<label class="control-label" for="inputWater">水读数</label>
			<input type="number" class="form-control" id="inputWater" name="inputWater" value="${params.inputWater}"
				placeholder="输入水读数" required>
		</div>
		<div class="form-group">
			<label class="control-label" for="inputElect">电读数</label>
			<input type="number" class="form-control" id="inputElect" name="inputElect" value="${params.inputElect}"
				placeholder="输入电读数" required>
		</div>
		
		<div class="form-group">
			<label class="control-label" for="inputIp">ip</label>
			<input type="text" class="form-control" id="inputIp" name="inputIp"   value="${params.inputIp}"
				placeholder="输入ip">
		</div>
		<div class="form-group">
			<label class="control-label" for="inputInternet">网费</label>
			<input type="number" class="form-control" id="inputInternet" name="inputInternet"  value="${params.inputInternet}"
				placeholder="输入网费" required>
		</div>
		<div class="form-group">
			<label class="control-label" for="inputTrash">卫生费</label>
			<input type="number" class="form-control" id="inputTrash" name="inputTrash"  value="${params.inputTrash}"
				placeholder="输入卫生费" required>
		</div>
		<button type="submit" class="btn btn-primary">保存</button>
		<a class="btn btn-default" href="${ctx}/room_checkin" role="button">返回</a>
	</form>
</div>
</body>
</html>