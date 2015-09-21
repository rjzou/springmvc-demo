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
	<form role="form" id="form1" method="post" action="${ctx}/house_del">
	  <c:if test="${!empty message}">  
            <div class="alert alert-success" role="alert">${message}</div>
      </c:if> 
      <input type="hidden" id="id" name="id" value="${params.id}"/>
 	 <table class="table table-bordered">
        <tr>
            <th class="col-sm-2">楼房编号</th>
            <td>${params.id}</td>
        </tr>
          <tr>
            <th class="col-sm-2">楼房名称</th>
            <td>${params.housename}</td>
        </tr>
          <tr>
            <th class="col-sm-2">楼房描述</th>
            <td>${params.description}</td>
        </tr>
        </table>
        	<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		<button type="submit" class="btn btn-primary" data-toggle="confirmation" data-placement="top" data-popout="true" <c:if test="${!empty danger}">disabled</c:if> >确认删除</button>
		<a class="btn btn-default" href="${ctx}/house" role="button">返回</a>
	</form>
</div>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-confirmation/1.0.3/bootstrap-confirmation.min.js"></script>
<script type="text/javascript">
$(function() {
	$('[data-toggle="confirmation"]').confirmation({
		title:"确定要删除该楼栋信息吗?",
		btnOkClass:'btn btn-sm btn-success',
		btnOkLabel:"确认",
		btnCancelLabel:"取消",
		onConfirm: function() { $("#form1").submit(); },
		onCancel: function() { return false; }
	});
});
</script>
</body>
</html>