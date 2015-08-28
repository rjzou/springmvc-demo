<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="theme" content="basic_theme" />
<script type="text/javascript"
	src="${ctx}/resources/js/validator.min.js"></script>
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

						<form role="form" method="post"
							action="${ctx}/room_waterelect_save" data-toggle="validator">
							<c:if test="${!empty message}">
								<div class="alert alert-success" role="alert">${message}</div>
								<script type="text/javascript">
									function autojump() {
										location.href = "${ctx}/room_waterelect";
									}
									setTimeout("autojump()", 10000);
								</script>
							</c:if>
							<table class="table table-bordered">
								<tr>
									<th class="col-sm-2">楼房</th>
									<td>${params.housename}</td>
								</tr>
								<tr>
									<th class="col-sm-2">房间号</th>
									<td>${params.roomno}</td>
								</tr>
								<tr>
									<th class="col-sm-2">入住姓名</th>
									<td>${params.customname}</td>
								</tr>
								<tr>
									<th class="col-sm-2">上次抄表时间</th>
									<td>${params.pre_s_date}</td>
								</tr>
								<tr>
									<th class="col-sm-2">上次水度数</th>
									<td>${params.water}</td>
								</tr>
								<tr>
									<th class="col-sm-2">上次电读数</th>
									<td>${params.elect}</td>
								</tr>
							</table>
							<input type="hidden" id="houseid" name="houseid"
								value="${params.houseid}" /> <input type="hidden" id="roomno"
								name="roomno" value="${params.roomno}" />
							<div class="form-group">
								<label class="control-label" for="inputWater">水读数</label> <input
									type="number" class="form-control" id="inputWater"
									name="inputWater" value="${params.inputWater}"
									placeholder="输入水读数" min="0" step="1" pattern="^[0-9]{1,}$"
									maxlength="10" required>
							</div>

							<div class="form-group">
								<label class="control-label" for="inputElect">电读数</label> <input
									type="number" class="form-control" id="inputElect"
									name="inputElect" value="${params.inputElect}"
									placeholder="输入电读数" min="0" step="1" pattern="^[0-9]{1,}$"
									maxlength="10" required>
							</div>
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<button type="submit" class="btn btn-primary">保存抄表</button>
							<a class="btn btn-warning" href="${ctx}/room_waterelect"
								role="button">返回</a>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>

</body>
</html>