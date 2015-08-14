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
	<form role="form" method="post">
	  <c:if test="${!empty message}">  
            <div class="alert alert-success" role="alert">${message}</div>
            <script type="text/javascript">
            function autojump(){
            	location.href="${ctx}/room_checkout";
            }
            setTimeout("autojump()",10000);
            </script>
      </c:if>
      <c:if test="${!empty error}">  
            <div class="alert alert-danger" role="alert">${error}</div>
            <script type="text/javascript">
            function autojump(){
            	location.href="${ctx}/room_checkout";
            }
            setTimeout("autojump()",10000);
            </script>
      </c:if>  

		<a class="btn btn-default" href="${ctx}/room_checkout" role="button">返回</a>
	</form>
</div>

</body>
</html>