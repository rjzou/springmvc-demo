<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    <title>Dashboard Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="${ctx}/resources/css/bootstrap.min.css">

    <!-- Custom styles for this template -->
    <link href="${ctx}/resources/css/dashboard.css" rel="stylesheet">

 	<script src="${ctx}/resources/js/jquery-1.11.3.min.js"></script>
  	<script src="${ctx}/resources/js/bootstrap.min.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <sitemesh:head/>
  </head>

  <body>
  
  <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">未来出租房智能管理系统</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
          	<li><a href="#">${pageContext.request.userPrincipal.name}</a></li>
            <li><a href="${ctx}/main">Dashboard</a></li>
            <li><a href="#">Settings</a></li>
            <li><a href="#">Profile</a></li>
            <li><a href="#">Help</a></li>
            <li>
            	<sec:authorize access="hasRole('ROLE_USER')">
				<!-- For login user -->
				<c:url value="/j_spring_security_logout" var="logoutUrl" />
				<form action="${logoutUrl}" method="post" id="logoutForm">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>
				<script>
					function formSubmit() {
						document.getElementById("logoutForm").submit();
					}
				</script>
		
				<c:if test="${pageContext.request.userPrincipal.name != null}">
						<a href="javascript:formSubmit()"> Logout </a>
				</c:if>

			</sec:authorize>
            </li>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li <c:if test="${params.page_id == 'room_checkin'}">class="active" </c:if>><a href="${ctx}/room_checkin">开始入住 <span class="sr-only">(current)</span></a></li>
            <li <c:if test="${params.page_id == 'room_checkin_query'}">class="active" </c:if>><a href="${ctx}/room_checkin_query">入住查询</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li <c:if test="${params.page_id == 'room_money'}">class="active" </c:if>><a href="${ctx}/room_money">收房租</a></li>
            <li <c:if test="${params.page_id == 'room_money_query'}">class="active" </c:if>><a href="${ctx}/room_money_query">收租查询</a></li>
            <li <c:if test="${params.page_id == 'room_checkout'}">class="active" </c:if>><a href="${ctx}/room_checkout">现在退房</a></li>
            <li <c:if test="${params.page_id == 'room_waterelect'}">class="active" </c:if>><a href="${ctx}/room_waterelect">抄水电表</a></li>
            <li <c:if test="${params.page_id == 'netcfg'}">class="active" </c:if>><a href="${ctx}/netcfg">网络开关</a></li>
          </ul>
          <ul class="nav nav-sidebar">
          	<li <c:if test="${params.page_id == 'house'}">class="active" </c:if>><a href="${ctx}/house">楼房配置</a></li>
            <li <c:if test="${params.page_id == 'room'}">class="active" </c:if>><a href="${ctx}/room">房间配置</a></li>
            <li <c:if test="${params.page_id == 'waterelectcfg'}">class="active" </c:if>><a href="${ctx}/waterelectcfg">水电价配置</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <sitemesh:body/>
          
          
        </div>
      </div>
    </div>

  </body>
</html>
