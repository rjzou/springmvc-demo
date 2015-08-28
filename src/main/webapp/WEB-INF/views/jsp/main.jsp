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
					<li class="active">我的待办</li>
				</ul>
			</div>
		</div>
		<!-- main -->
		<div class="content">
         <div class="main-content">
				<!-- WIDGET TICKET TABLE -->
				<div class="widget widget-table">
					<div class="widget-header">
						<h3><i class="fa fa-tasks"></i> 本月应抄水表</h3> <em>- 只最新显示5条</em>
						<div class="btn-group widget-header-toolbar">
							<a href="#" title="Focus" class="btn-borderless btn-focus"><i class="fa fa-eye"></i></a>
							<a href="#" title="Expand/Collapse" class="btn-borderless btn-toggle-expand"><i class="fa fa-chevron-up"></i></a>
							<a href="#" title="Remove" class="btn-borderless btn-remove"><i class="fa fa-times"></i></a>
						</div>
					</div>
					<div class="widget-content">
					  <!-- Table -->
					  <div class="table-responsive">
						  <table class="table table-striped  table-condensed">
			              <thead>
			                <tr>
			                  <th>#</th>
			                  <th>楼栋/房间号/房型</th>
			                  <th>客户姓名</th>
			                  <th>上次抄表时间</th>
			                  <th>上次水电读数</th>
			                  <th>本月应抄表日</th>
			                  <th>操作</th>
			                </tr>
			              </thead>
			              <tbody>
			                <c:choose>
								<c:when test="${empty room_we_list.content }">
									<tr>
										<td colspan="9"><p class="text-center">非常好,没有待办工作</p></td>
									</tr>
								</c:when>
								<c:otherwise>
				              		<c:forEach items="${room_we_list.content}" var="item" varStatus="status">
										<tr>
											<td>${status.count }</td>
											<td>${item.housename }/${item.roomno }/${item.typename }</td>
											<td>${item.customname }</td>
											<td>${item.pre_s_date }</td>
											<td>${item.water }/${item.elect }</td>
											<td>${item.cin_day }</td>
											<td>
												<a class="btn btn-primary btn-sm" href="${ctx}/room_towaterelect?houseid=${item.houseid }&roomno=${item.roomno }" role="button">抄表</a>
											</td>
											<td>${item.description }</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
			              </tbody>
			            </table>
					</div>
					</div>
		</div>
		 <div class="main-content">
		       <!-- WIDGET TICKET TABLE -->
				<div class="widget widget-table">
					<div class="widget-header">
						<h3><i class="fa fa-tasks"></i> 本月应收租</h3> <em>- 只最新显示5条</em>
						<div class="btn-group widget-header-toolbar">
							<a href="#" title="Focus" class="btn-borderless btn-focus"><i class="fa fa-eye"></i></a>
							<a href="#" title="Expand/Collapse" class="btn-borderless btn-toggle-expand"><i class="fa fa-chevron-up"></i></a>
							<a href="#" title="Remove" class="btn-borderless btn-remove"><i class="fa fa-times"></i></a>
						</div>
					</div>
					<div class="widget-content">
					  <!-- Table -->
					  <div class="table-responsive">
						  <table class="table table-striped  table-condensed">
			              <thead>
			                <tr>
			                  <th>#</th>
			                  <th>楼栋/房间号/房型</th>
			                  <th>客户姓名</th>
			                  <th>上月收租时间</th>
			                  <th>上月实收费用</th>
			                  <th>本月应收租日</th>
			                  <th>操作</th>
			                </tr>
			              </thead>
			              <tbody>
			              <c:choose>
							<c:when test="${empty room_money_list.content }">
								<tr>
									<td colspan="9"><p class="text-center">非常好,没有待办工作</p></td>
								</tr>
							</c:when>
							<c:otherwise>
				               	<c:forEach items="${room_money_list.content}" var="item" varStatus="status">
									<tr>
										<td>${status.count }</td>
										<td>${item.housename }/${item.roomno }/${item.typename }</td>
										<td>${item.customname }</td>
										<td>${item.pre_s_date }</td>
										<td>${item.roommoney }</td>
										<td>${item.cin_day }</td>
										<td>
											<a class="btn btn-primary btn-sm" href="${ctx}/room_tomoney?houseid=${item.houseid }&roomno=${item.roomno }" role="button">收房租</a>
										</td>
									</tr>
								</c:forEach>
							 </c:otherwise>
							</c:choose>
			              </tbody>
			            </table>
           		 </div>
				</div>
			</div>
			</div>
		</div>
		<!-- /main-content -->
		</div>
		<!-- /main -->
	</div>
  </body>
</html>
