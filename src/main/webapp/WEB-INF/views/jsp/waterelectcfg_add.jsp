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
	<form role="form" method="post" action="${ctx}/waterelectcfg_add">
	  <c:if test="${!empty message}">  
            <div class="alert alert-success" role="alert">${message}</div>
      </c:if> 
		<div class="form-group">
			<label class="control-label" for="selectYear">待生成年份</label>
			<div class="input-group">
			<select class="selectpicker" id="selectYear" name="selectYear" required>
				<option value="2015" <c:if test="${fn:contains(params.year, '2015') == true}">selected="selected"</c:if>>2015</option>
      			<option value="2016" <c:if test="${fn:contains(params.year, '2016') == true}">selected="selected"</c:if>>2016</option>
			</select>
			</div>
		</div>

		<div class="form-group">
			<label class="control-label" for="inputWaterPrice">水价格(去年12月份水价格 ${params.waterprice}元)</label> 
			<input
				type="number" class="form-control" id="inputWaterPrice" name="inputWaterPrice" value="${params.inputWaterPrice}"
				placeholder="输入水价格" required>
		</div>

		<div class="form-group">
			<label class="control-label" for="inputElectPrice">电价格(去年12月份电价格 ${params.electprice}元)</label>
			<input type="number" class="form-control" id="inputElectPrice" name="inputElectPrice" value="${params.inputElectPrice}"
				placeholder="输入电价格" required>
		</div>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		<button type="submit" class="btn btn-primary">生成数据并保存</button>
		<a class="btn btn-default" href="${ctx}/waterelectcfg" role="button">返回</a>
	</form>
</div>
</body>
</html>