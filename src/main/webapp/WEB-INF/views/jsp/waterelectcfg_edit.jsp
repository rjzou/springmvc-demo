<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="theme" content="basic_theme" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.9.0/validator.min.js?Ver=20150821"></script>
</head>
<body>
<div class="row">
	<form role="form" method="post" action="${ctx}/waterelectcfg_edit" data-toggle="validator">
	  <c:if test="${!empty message}">  
            <div class="alert alert-success" role="alert">${message}</div>
            <script type="text/javascript">
            function autojump(){
            	location.href="${ctx}/waterelectcfg";
            }
            setTimeout("autojump()",10000);
            </script>
      </c:if> 
      <input type="hidden" id="year" name="year" value="${params.year}"/>
      <input type="hidden" id="month" name="month" value="${params.month}"/>
		<table class="table table-bordered">
        <tr>
            <th class="col-sm-2">年份</th>
            <td>${params.year}</td>
        </tr>
          <tr>
            <th class="col-sm-2">月份</th>
            <td>${params.month}</td>
        </tr>
        </table>
		<div class="form-group">
			<label class="control-label" for="inputWaterPrice">水价格(原水价格 ${params.waterprice}元)</label> 
			<input
				type="number" class="form-control" id="inputWaterPrice" name="inputWaterPrice" value="${params.inputWaterPrice}"
				placeholder="输入新的水价格" required  min="0" step="0.1">
		</div>

		<div class="form-group">
			<label class="control-label" for="inputElectPrice">电价格(原电价格 ${params.electprice}元)</label>
			<input type="number" class="form-control" id="inputElectPrice" name="inputElectPrice" value="${params.inputElectPrice}"
				placeholder="输入新的电价格" required  min="0" step="0.1">
		</div>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		<button type="submit" class="btn btn-primary">保存</button>
		<a class="btn btn-default" href="${ctx}/waterelectcfg" role="button">返回</a>
	</form>
</div>
</body>
</html>