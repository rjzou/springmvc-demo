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
	<form role="form" id="form1" method="post" action="${ctx}/netcfg_close_save">
	  <c:if test="${!empty message}">  
            <div class="alert alert-success" role="alert">${message}</div>
            <script type="text/javascript">
            function autojump(){
            	location.href="${ctx}/netcfg";
            }
            setTimeout("autojump()",10000);
            </script>
      </c:if> 
      <input type="hidden" id="houseid" name="houseid" value="${params.houseid}"/>
      <input type="hidden" id="roomno" name="roomno" value="${params.roomno}"/>
      <input type="hidden" id="netprice" name="netprice" value="${params.netprice}"/>
      <input type="hidden" id="method" name="method" value="${params.method}"/>
		<table class="table table-bordered">
        <tr>
            <th class="col-sm-2">栋</th>
            <td>${params.housename}</td>
        </tr>
          <tr>
            <th class="col-sm-2">房间号</th>
            <td>${params.roomno}</td>
        </tr>
          <tr>
            <th class="col-sm-2">客户姓名</th>
            <td>${params.customname}</td>
        </tr>
          <tr>
            <th class="col-sm-2">网络价格</th>
            <td>${params.netprice} 元/月</td>
        </tr>
         <tr>
            <th class="col-sm-2">开通天数</th>
            <td>${params.in_days} 天</td>
        </tr>
         <tr>
            <th class="col-sm-2">总费用</th>
            <td>${params.sumprice} 元</td>
        </tr>
        </table>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<button type="submit" class="btn btn-primary"  data-toggle="confirmation" data-placement="top" data-popout="true"  onclick="return save();">关闭网络</button>
		<a class="btn btn-default" href="${ctx}/netcfg_close" role="button">返回</a>
	</form>
</div>
<script src="${ctx}/resources/js/bootstrap-confirmation.js"></script>
<script type="text/javascript">
$(function() {
	$('[data-toggle="confirmation"]').confirmation({
		title:"确定关闭网络吗?",
		btnOkClass:'btn btn-sm btn-success',
		btnOkLabel:"确认",
		btnCancelLabel:"取消",
		onConfirm: function() { $("#form1").submit(); },
		onCancel: function() { return false; }
	});
});

function save(){
	$("#method").val('save');
	return true;	
}
function calc(){
	$("#method").val('calc');
	return true;	
}
</script>
</body>
</html>