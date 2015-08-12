<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page session="true"%>
<%@include file="/tag.jsp"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>登录</title>

    <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="${ctx}/resources/css/bootstrap.min.css">

    <!-- Custom styles for this template -->
    <link href="${ctx}/resources/css/signin.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
    <div class="container">
      <form class="form-signin" method="post" action="<c:url value='/auth/login_check?targetUrl=${targetUrl}' />">
        <h2 class="form-signin-heading">Please sign in </h2>
                  <c:if test="${!empty message}">  
                             <div class="alert alert-info" role="alert">${message}</div>
                 </c:if> 
                 <c:if test="${!empty error}">  
                             <div class="alert alert-warning" role="alert">${error}</div>
                 </c:if> 
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="text" id="username" name="username" class="form-control" placeholder="Email address" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" name="remember-me" /> Remember me
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
        	<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
      </form>

    </div> <!-- /container -->

  </body>
</html>
