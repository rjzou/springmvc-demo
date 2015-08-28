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

						<form role="form" method="post" action="${ctx}/house_edit"
							data-toggle="validator">
							<c:if test="${!empty message}">
								<div class="alert alert-success" role="alert">${message}</div>
							</c:if>
							<c:if test="${!empty error}">
								<div class="alert alert-danger" role="alert">${error}</div>
							</c:if>
							<input type="hidden" id="hiddenid" name="hiddenid" value="${id}" />
							<div class="form-group">
								<label class="control-label" for="housename">楼房名字</label> <input
									type="text" class="form-control" id="housename"
									name="housename" value="${params.housename}"
									placeholder="输入楼房名字" required>
								<div class="help-block with-errors"></div>
							</div>
							<div class="form-group">
								<label class="control-label" for="description">备注</label> <input
									type="text" class="form-control" id="description"
									name="description" value="${params.description}"
									placeholder="备注">
							</div>
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<button type="submit" class="btn btn-primary">保存</button>
							<a class="btn btn-warning" href="${ctx}/house" role="button">返回</a>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>

</body>
</html>