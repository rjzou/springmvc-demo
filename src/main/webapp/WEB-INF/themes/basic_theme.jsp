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
    <link rel="icon" href="${ctx_cdn}/resources/favicon.ico">

    <title>出租房智能管理系统V1.0</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="${ctx_cdn}/resources/css/bootstrap.min.css">

    <!-- Custom styles for this template -->
    <link href="${ctx_cdn}/resources/css/dashboard.css" rel="stylesheet">

 	<script type="text/javascript" src="${ctx_cdn}/resources/js/jquery-1.11.3.min.js"></script>
  	<script type="text/javascript" src="${ctx_cdn}/resources/js/bootstrap.min.js"></script>
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
          <a class="navbar-brand" href="#">出租房智能管理系统V1.0</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
           	<li><a href="${ctx}/main">我的待办</a></li>
           	<li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">常用 <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="${ctx}/room_checkin">开始入住</a></li>
                <li><a href="${ctx}/room_money">收房租</a></li>
                <li><a href="${ctx}/room_checkout">现在退房</a></li>
                <li><a href="${ctx}/room_waterelect">抄水表</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="${ctx}/room_checkin_query">入住查询</a></li>
                <li><a href="${ctx}/room_money_query">收租查询</a></li>
                <li><a href="${ctx}/room_checkout_query">退房查询</a></li>
                <li><a href="${ctx}/custom_query">客户查询</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">配置 <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="${ctx}/house">楼房配置</a></li>
                <li><a href="${ctx}/room">房间配置</a></li>
                <li><a href="${ctx}/waterelectcfg">水电价配置</a></li>
              </ul>
            </li>
            <li><a href="#">帮助</a></li>
          	
           <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">欢迎 ${pageContext.request.userPrincipal.name} <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="#">个人资料</a></li>
                <li><a href="${ctx}/user_password">修改密码</a></li>
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
						<a href="javascript:formSubmit()"> 登出 </a>
				</c:if>

				</sec:authorize>
			
            	</li>
              </ul>
            </li>
           
          </ul>
          <form class="navbar-form navbar-right" action="https://www.baidu.com/baidu" method="get" target="_blank">
            <input type="text" class="form-control" name="word" placeholder="Search...">
          </form>
        </div>
      </div>
    </nav>
     
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li <c:if test="${params.page_id == 'room_checkin'}">class="active" </c:if>><a href="${ctx}/room_checkin">开始入住 <span class="sr-only">(current)</span></a></li>
            <li <c:if test="${params.page_id == 'room_money'}">class="active" </c:if>><a href="${ctx}/room_money">收房租</a></li>
            <li <c:if test="${params.page_id == 'room_checkout'}">class="active" </c:if>><a href="${ctx}/room_checkout">现在退房</a></li>
            <li <c:if test="${params.page_id == 'room_waterelect'}">class="active" </c:if>><a href="${ctx}/room_waterelect">抄水电表</a></li>
            
          </ul>
          <ul class="nav nav-sidebar">
           <li <c:if test="${params.page_id == 'room_checkin_query'}">class="active" </c:if>><a href="${ctx}/room_checkin_query">入住查询</a></li>
           <li <c:if test="${params.page_id == 'room_money_query'}">class="active" </c:if>><a href="${ctx}/room_money_query">收租查询</a></li>
           <li <c:if test="${params.page_id == 'room_checkout_query'}">class="active" </c:if>><a href="${ctx}/room_checkout_query">退房查询</a></li>
           <li <c:if test="${params.page_id == 'custom_query'}">class="active" </c:if>><a href="${ctx}/custom_query">客户查询</a></li>
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
