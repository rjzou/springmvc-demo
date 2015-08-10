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
	<form role="form" method="post" action="${ctx}/netcfg_open">
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
            <th class="col-sm-2">客户名称</th>
            <td>${params.customname}</td>
        </tr>
          <tr>
            <th class="col-sm-2">网络价格</th>
            <td>${params.netprice} 元</td>
        </tr>
        </table>
		<div class="form-group">
			<label class="control-label" for="inputIp">上网IP</label> 
			<input
				type="text" class="form-control" id="inputIp" name="inputIp" value="${params.inputIp}"
				placeholder="输入新的IP">
		</div>

		<div class="form-group">
			<label class="control-label" for="inputUsr">上网用户名</label>
			<input type="text" class="form-control" id="inputUsr" name="inputUsr" value="${params.inputUsr}"
				placeholder="输入新的上网用户名" >
		</div>
		
		<div class="form-group">
			<label class="control-label" for="inputPwd">上网密码</label>
			<input type="text" class="form-control" id="inputPwd" name="inputPwd" value="${params.inputPwd}"
				placeholder="输入新的上网密码" >
		</div>
		 <c:if test="${!empty info}">  
            <h3><div class="alert alert-info" role="alert"> ${info}</div><h3>
            <script type="text/javascript">
            function autosave(){
            	if(save()){
            		$('form').submit();
            	}
            }
            setTimeout("autosave()",10000);
            </script>
      	</c:if> 
		<button type="submit" class="btn btn-success" onclick="return calc();">
			<c:choose>
			    <c:when test="${!empty params.calctxt}">
			       		${params.calctxt}
			    </c:when>
			    <c:otherwise>
			        	计算应收
			    </c:otherwise>
			</c:choose>
		</button>
		<button type="submit" class="btn btn-primary" onclick="return save();">开通网络</button>
		<a class="btn btn-default" href="${ctx}/netcfg" role="button">返回</a>
	</form>
</div>
<script type="text/javascript">
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