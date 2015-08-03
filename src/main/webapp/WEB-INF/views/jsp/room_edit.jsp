<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="pagebar" uri="/WEB-INF/pagebar.tld"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="theme" content="basic_theme" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap-select.css">
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap-select.js"></script>
</head>
<body>
<div class="row">
	<form role="form" method="post" action="${pageContext.request.contextPath}/room_add">
	  <c:if test="${!empty message}">  
            <div class="alert alert-success" role="alert">${message}</div>
      </c:if> 
		<div class="form-group">
		<label class="control-label" for="selectHouse">楼房</label>
		<div class="input-group">
			<select class="selectpicker" id="selectHouse" name="selectHouse">
				<option selected="selected"  value="1">1栋</option>
				<option  value="2">2栋</option>
				<option  value="3">3栋</option>
			</select>
			</div>
		</div>

		<div class="form-group">
			<label class="control-label" for="inputRoom">房间号</label> 
			<input
				type="number" class="form-control" id="inputRoom" name="inputRoom" value="${room_no}"
				placeholder="输入房间号" required>
		</div>

		<div class="form-group">
			<label class="control-label" for="inputMonthMoney">月租</label>
			<input type="number" class="form-control" id="inputMonthMoney" name="inputMonthMoney" value="${month_money}"
				placeholder="输入月租" required>
		</div>
		<div class="form-group">
			<label class="control-label" for="inputDescription">备注</label>
			<input type="text" class="form-control" id="inputDescription" name="inputDescription"  value="${description}"
				placeholder="备注">
		</div>
		<button type="submit" class="btn btn-primary">保存</button>
		<a class="btn btn-default" href="${pageContext.request.contextPath}/room" role="button">返回</a>
	</form>
</div>
</body>
</html>