<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="theme" content="basic_theme" />
</head>
<body>
	<!-- content-wrapper -->
	<div class="col-md-10 content-wrapper">
		<div class="row">
			<div class="col-md-4 ">
				<ul class="breadcrumb">
					<li><i class="fa fa-home"></i><a href="#">首页</a></li>
					<li class="active">收房租</li>
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

						<form role="form" method="post">
							<c:if test="${!empty message}">
								<div class="alert alert-success" role="alert">${message}</div>
								<script type="text/javascript">
									function autojump() {
										location.href = "${ctx}/house";
									}
									setTimeout("autojump()", 10000);
								</script>
							</c:if>
							<c:if test="${!empty error}">
								<div class="alert alert-danger" role="alert">${error}</div>
								<script type="text/javascript">
									function autojump() {
										location.href = "${ctx}/house";
									}
									setTimeout("autojump()", 10000);
								</script>
							</c:if>
							<a class="btn btn-info" href="${ctx}/house_toadd" role="button">我要新增</a>
							<a class="btn btn-default" href="${ctx}/house" role="button">返回</a>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>

</body>
</html>