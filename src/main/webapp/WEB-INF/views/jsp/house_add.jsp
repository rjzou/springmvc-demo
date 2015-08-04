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
	<form role="form" method="post" action="${ctx}/house_add">
	  <c:if test="${!empty message}">  
            <div class="alert alert-success" role="alert">${message}</div>
      </c:if> 
		
		<div class="form-group">
			<label class="control-label" for="inputHousename">楼房名字</label> 
			<input
				type="text" class="form-control" id="inputHousename" name="inputHousename"  value="${params.inputHousename}"
				placeholder="输入楼房名字" required>
		</div>
		<div class="form-group">
			<label class="control-label" for="inputDescription">备注</label>
			<input type="text" class="form-control" id="inputDescription" name="inputDescription"  value="${params.inputDescription}"
				placeholder="备注">
		</div>
		<button type="submit" class="btn btn-primary">保存</button>
		<a class="btn btn-default" href="${ctx}/house" role="button">返回</a>
	</form>
</div>
</body>
</html>