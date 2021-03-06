<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="theme" content="basic_theme" />
<link rel="stylesheet"
	href="${ctx}/resources/css/bootstrap-select.css?Ver=20150821">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.3/js/bootstrap-select.min.js?Ver=20150821"></script>
</head>
<body>
	<!-- content-wrapper -->
	<div class="col-md-10 content-wrapper">
		<div class="row">
			<div class="col-md-4 ">
				<ul class="breadcrumb">
					<li><i class="fa fa-home"></i><a href="#">首页</a></li>
					<li class="active">开始入住</li>
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
									<form class="form-inline" role="search"
										action="${ctx}/room_checkin" method="post">
										<div class="form-group">
											<select class="selectpicker" name="selectHouse"
												title="请选择..." multiple>
												<c:forEach var="house" items="${houses}">
													<option value="${house.id}"
														<c:if test="${fn:contains(params.houseid, house.id) == true }">selected="selected"</c:if>>
														${house.housename}</option>
												</c:forEach>
											</select> <input type="hidden" id="houseid" name="houseid"
												value="${params.houseid}" />
											<script type="text/javascript">
												function to_search() {
													var v_select_houses = $(
															".selectpicker[name='selectHouse']")
															.val();
													var v_select_room_type = $(
															".selectpicker[name='selectRoomtype']")
															.val();
													$("#houseid").val(
															v_select_houses);
													$("#roomtypeid").val(
															v_select_room_type);
													return true;
												}
											</script>
										</div>

										<div class="form-group">
											<select class="selectpicker" name="selectRoomtype"
												title="请选择..." multiple>
												<c:forEach var="type" items="${types}">
													<option value="${type.typecode}"
														<c:if test="${fn:contains(params.roomtypeid, type.typecode) == true }">selected="selected"</c:if>>
														${type.typename}</option>
												</c:forEach>
											</select> <input type="hidden" id="roomtypeid" name="roomtypeid"
												value="${params.roomtypeid}" />
										</div>
										<div class="form-group">

											<input type="text" class="form-control" placeholder="输入房间号"
												id="roomno" name="roomno" value="${params.roomno}" />
										</div>
										<input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}" />
										<button type="submit" class="btn btn-primary"
											onclick="return to_search();">查询</button>
										<span class="label label-danger">还有空房${params.empty_room_count}间</span>
  <span class="label label-info">今天入住${params.today_checkin_room_count}间</span>
  <span class="label label-warning">今天退房${params.today_checkout_room_count}间</span>
									</form>
								</div>
						<!-- /.row -->
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>#</th>
										<th>栋 / 房间号 / 房型</th>
										<th>参考月租</th>
										<th>参考押金</th>
										<th>操作</th>
										<th>备注</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list.content}" var="item"
										varStatus="status">
										<tr>
											<td>${status.count }</td>
											<td>${item.housename }/${item.roomno }/${item.typename }</td>
											<td>${item.monthmoney }</td>
											<td>${item.pressmoney }</td>
											<td><a class="btn btn-info btn-sm"
												href="${ctx}/room_tocheckin?houseid=${item.houseid }&roomno=${item.roomno }"
												role="button">入住</a></td>
											<td>${item.description }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
			</div>
			<pagebar:pagebar total="${list.totalPages}"
				current="${list.number + 1}" />

		</div>
		<!-- /main -->
	</div>
</body>
</html>