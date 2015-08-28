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
</head>
<body>
	<!-- content-wrapper -->
	<div class="col-md-10 content-wrapper">
		<div class="row">
			<div class="col-md-4 ">
				<ul class="breadcrumb">
					<li><i class="fa fa-home"></i><a href="#">首页</a></li>
					<li class="active">入住查询</li>
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
								action="${ctx}/room_checkin_query" method="post">
								<div class="form-group">
									<select class="selectpicker" name="selectHouse" title="请选择..."
										multiple>
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
											$("#houseid").val(v_select_houses);
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
									</select> <input type="hidden" id="roomtypeid" name="roomtypeid" />
								</div>
								<div class="form-group">

									<input type="text" class="form-control" id="roomno"
										name="roomno" placeholder="输入房间号" value="${params.roomno}">
								</div>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<button type="submit" class="btn btn-primary"
									onclick="return to_search();">查询</button>
								<p class="text-left"></p>
							</form>
						</div>
						<!-- /.row -->
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>#</th>
										<th>栋 / 房间号 / 房型</th>
										<th>客户姓名</th>
										<th>入住日期</th>
										<th>实收月租</th>
										<th>实收押金</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list.content}" var="item"
										varStatus="status">
										<tr>
											<td>${status.count }</td>
											<td>${item.housename }/ ${item.roomno } /
												${item.typename }</td>
											<td>${item.customname }</td>
											<td>${item.in_date }</td>
											<td>${item.monthmoney }元</td>
											<td>${item.pressmoney }元</td>
											<td><a class="btn btn-info btn-sm"
												href="${ctx}/room_checkin_query_page?houseid=${item.houseid }&roomno=${item.roomno }&year=${item.d_year }&month=${item.d_month }"
												role="button">详情</a></td>
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