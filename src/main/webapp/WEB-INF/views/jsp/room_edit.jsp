<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="theme" content="basic_theme" />
<link rel="stylesheet"
	href="${ctx_cdn}/resources/css/bootstrap-select.css?Ver=20150821">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.3/js/bootstrap-select.min.js?Ver=20150821"></script>
<script type="text/javascript"
	src="${ctx}/resources/js/validator.min.js?Ver=20150821"></script>
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

						<form role="form" method="post" action="${ctx}/room_edit"
							data-toggle="validator">
							<c:if test="${!empty message}">
								<div class="alert alert-success" role="alert">${message}</div>
							</c:if>
							<input type="hidden" id="houseid" name="houseid"
								value="${params.houseid}" /> <input type="hidden" id="roomno"
								name="roomno" value="${params.roomno}" />
							<div class="form-group">
								<label class="control-label" for="selectHouse">楼房</label>
								<div class="input-group">
									<select class="selectpicker" id="selectHouse"
										name="selectHouse">
										<c:forEach var="house" items="${houses}">
											<option value="${house.id}"
												<c:if test="${house.id == params.houseid}">selected="selected"</c:if>>
												${house.housename}</option>
										</c:forEach>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label" for="inputRoom">房间号</label> <input
									type="number" class="form-control" id="inputRoom"
									name="inputRoom" value="${params.roomno}" placeholder="输入房间号"
									min="0" step="1" pattern="^[0-9]{1,}$" maxlength="10" required>
							</div>

							<div class="form-group">
								<label class="control-label" for="inputMonthMoney">参考月租</label>
								<input type="number" class="form-control" id="inputMonthMoney"
									name="inputMonthMoney" value="${params.monthmoney}"
									placeholder="输入参考月租" min="0" step="1" pattern="^[0-9]{1,}$"
									maxlength="10" required>
							</div>
							<div class="form-group">
								<label class="control-label" for="inputPressMoney">参考押金</label>
								<input type="number" class="form-control" id="inputPressMoney"
									name="inputPressMoney" value="${params.pressmoney}"
									placeholder="输入参考押金" min="0" step="1" pattern="^[0-9]{1,}$"
									maxlength="10" required>
							</div>
							<div class="radio">
								<label> <input type="radio" name="optionsRoomtypes"
									id="optionsRadios1" value="danjian" required
									<c:if test="${params.typecode eq 'danjian' }">checked</c:if>>
									单间
								</label> <label> <input type="radio" name="optionsRoomtypes"
									id="optionsRadios2" value="yifangyiting" required
									<c:if test="${params.typecode eq 'yifangyiting' }">checked</c:if>>
									一房一厅
								</label> <label> <input type="radio" name="optionsRoomtypes"
									id="optionsRadios2" value="liangfangyiting" required
									<c:if test="${params.typecode eq 'liangfangyiting' }">checked</c:if>>
									两房一厅
								</label> <label> <input type="radio" name="optionsRoomtypes"
									id="optionsRadios4" value="dianpu" required
									<c:if test="${params.typecode eq 'dianpu' }">checked</c:if>>
									店铺
								</label>
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
							<a class="btn btn-warning" href="${ctx}/room" role="button">返回</a>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>

</body>
</html>