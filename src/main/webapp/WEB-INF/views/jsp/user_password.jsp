<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="theme" content="basic_theme" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.9.0/validator.min.js?Ver=20150821"></script>
</head>
<body>

<body>
	<!-- content-wrapper -->
	<div class="col-md-10 content-wrapper">
		<div class="row">
			<div class="col-md-4 ">
				<ul class="breadcrumb">
					<li><i class="fa fa-home"></i><a href="#">首页</a></li>
					<li class="active">修改密码</li>
				</ul>
			</div>
		</div>
		<!-- main -->
		<div class="content">
			<div class="main-content">
				<!-- WIDGET TICKET TABLE -->
				<div class="widget-content">
						<!-- INLINE FORM -->
						<div class="widget-content">

							<form role="form" method="post" action="${ctx}/user_password"
							data-toggle="validator">
	  			<c:if test="${!empty message}">  
                             <div class="alert alert-info" role="alert">${message}</div>
                 </c:if> 
                 <c:if test="${!empty error}">  
                             <div class="alert alert-warning"
									role="alert">${error}</div>
                 </c:if> 

		<div class="form-group">
			<label class="control-label" for="username">用户名</label> 
			<input type="text" class="form-control" id="username" name="username"
									value="${params.username}" disabled="disabled">
		</div>

		<div class="form-group">
			<label class="control-label" for="password">密码</label>
			<input type="password" class="form-control" id="password"
									name="password" value="${params.password}" placeholder="密码"
									data-minlength="6" required>
				<span class="help-block">密码不能少于6个字符</span>
		</div>
		<div class="form-group">
			<label class="control-label" for="password2">重复密码</label>
			<input type="password" class="form-control" id="password2"
									name="password2" data-match="#password"
									value="${params.password2}" placeholder="重复密码"
									data-match-error="两次输入密码不对" required>
				<div class="help-block with-errors"></div>
		</div>
			<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
		<button type="submit" class="btn btn-primary">保存</button>
		<a class="btn btn-warning" href="${ctx}/main" role="button">返回</a>
	</form>
						</div>
					</div>
			</div>
		</div>
	</div>
	
</body></body>

</html>