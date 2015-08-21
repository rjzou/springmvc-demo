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
	<form role="form" method="post" action="${ctx}/house_edit" data-toggle="validator">
	  <c:if test="${!empty message}">  
            <div class="alert alert-success" role="alert">${message}</div>
      </c:if> 
      <c:if test="${!empty error}">  
            <div class="alert alert-danger" role="alert">${error}</div>
      </c:if>  
 	<input type="hidden" id="hiddenid" name="hiddenid" value="${id}"/>
		<div class="form-group">
			<label class="control-label" for="housename">楼房名字</label> 
			<input
				type="text" class="form-control" id="housename" name="housename"  value="${params.housename}"
				placeholder="输入楼房名字" required>
				<div class="help-block with-errors"></div>
		</div>
		<div class="form-group">
			<label class="control-label" for="description">备注</label>
			<input type="text" class="form-control" id="description" name="description" value="${params.description}"
				placeholder="备注">
		</div>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		<button type="submit" class="btn btn-primary">保存</button>
		<a class="btn btn-default" href="${ctx}/house" role="button">返回</a>
	</form>
</div>
</body>
</html>