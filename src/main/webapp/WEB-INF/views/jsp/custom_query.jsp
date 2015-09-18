<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="theme" content="basic_theme" />
</head>
<body>
<div class="row">
  <form class="navbar-form navbar-left" role="search" action="${ctx}/custom_query" method="post">
  
  <div class="form-group">
    <input type="text" class="form-control" placeholder="输入客户姓名"  id="customname" name="customname" value="${params.customname}"/>
  </div>
    <div class="form-group">
    <input type="text" class="form-control" placeholder="输入手机号码"  id="iphone" name="iphone" value="${params.iphone}"/>
  </div>
  
   	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
  <button type="submit" class="btn btn-default">查询</button>
</form>
</div><!-- /.row -->
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>#</th>
					<th>客户姓名</th>
					<th>手机</th>
					<th>身份证</th>
					<th>时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list.content}" var="item" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${item.customname }</td>
						<td>${item.iphone }</td>
						<td>${item.cardid }</td>
						<td>${item.in_date }</td>
						<td>
							<a class="btn btn-primary btn-sm" href="${ctx}/custom_query_page?id=${item.id }" role="button">详情</a>
						</td>
						
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<pagebar:pagebar total="${list.totalPages}" current="${list.number + 1}" />
</body>
</html>