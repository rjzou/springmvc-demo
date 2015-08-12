<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta name="theme" content="basic_theme" />
  </head>

  <body>
          <div class="panel panel-info">
			  <!-- Default panel contents -->
			  <div class="panel-heading">抄水表</div>
			  <!-- Table -->
			  <div class="table-responsive">
				  <table class="table table-striped  table-condensed">
	              <thead>
	                <tr>
	                  <th>#</th>
	                  <th>楼栋/房间号/房型</th>
	                  <th>客户名称</th>
	                  <th>上次抄表时间</th>
	                  <th>上次水/电读数</th>
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

         <div class="panel panel-info">
			  <!-- Default panel contents -->
			  <div class="panel-heading">收房租</div>
			  <!-- Table -->
			  <div class="table-responsive">
				  <table class="table table-striped  table-condensed">
	              <thead>
	                <tr>
	                  <th>#</th>
	                  <th>楼栋/房间号/房型</th>
	                  <th>客户名称</th>
	                  <th>上月实收月租</th>
	                  <th>上月实收押金</th>
	                  <th>上月收租日期</th>
	                  <th>上月实收费用</th>
	                  <th>本月应收日期</th>
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
								<td>${item.monthmoney }</td>
								<td>${item.pressmoney }</td>
								<td>${item.pre_s_date }</td>
								<td>${item.roommoney }</td>
								<td>${item.cin_day }</td>
								<td>
									<a class="btn btn-primary btn-sm" href="${ctx}/room_to_money?houseid=${item.houseid }&roomno=${item.roomno }" role="button">收房租</a>
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
			
			
  </body>
</html>
