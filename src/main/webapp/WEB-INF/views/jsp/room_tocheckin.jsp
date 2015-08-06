<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="theme" content="basic_theme" />
<link rel="stylesheet"
	href="${ctx}/resources/css/bootstrap-select.css">
<script
	src="${ctx}/resources/js/bootstrap-select.js"></script>
</head>
<body>
<div class="row">
	<form role="form" method="post" action="${ctx}/room_checkin_add">
	  <c:if test="${!empty message}">  
            <div class="alert alert-success" role="alert">${message}</div>
            <script type="text/javascript">
            function autojump(){
            	location.href="${ctx}/room_checkin";
            }
            setTimeout("autojump()",10000);
            </script>
      </c:if> 
      <input type="hidden" id="houseid" name="houseid" value="${params.houseid}"/>
      <input type="hidden" id="roomno" name="roomno" value="${params.roomno}"/>
	  <input type="hidden" id="method" name="method" value="${params.method}"/>
		<div class="form-group">
			<label class="control-label" for="inputCustomname">客户姓名</label>
			<input type="text" class="form-control" id="inputCustomname" name="inputCustomname" value="${params.inputCustomname}"
				placeholder="输入客户姓名" required>
		</div>
		<div class="form-group">
			<label class="control-label" for="inputIphone">客户手机</label>
			<input type="text" class="form-control" id="inputIphone" name="inputIphone"   value="${params.inputIphone}"
				placeholder="输入客户手机" required>
		</div>
		<div class="form-group">
			<label class="control-label" for="inputCardid">身份证</label>
			<input type="text" class="form-control" id="inputCardid" name="inputCardid"    value="${params.inputCardid}"
				placeholder="输入身份证">
		</div>
		<div class="form-group">
			<label class="control-label" for="inputMonthMoney">实收月租(参考月租<span class="label label-success"> ${params.monthmoney}</span> 元)</label>
			<input type="number" class="form-control" id="inputMonthMoney" name="inputMonthMoney"  value="${params.inputMonthMoney}"
				placeholder="输入实收月租" required>
		</div>
		<div class="form-group">
			<label class="control-label" for="inputPressMoney">实收押金(参考押金<span class="label label-success"> ${params.pressmoney}</span> 元)</label>
			<input type="number" class="form-control" id="inputPressMoney" name="inputPressMoney"  value="${params.inputPressMoney}"
				placeholder="输入实收押金" required>
		</div>
		<div class="form-group">
			<label class="control-label" for="inputWater">水读数</label>
			<input type="number" class="form-control" id="inputWater" name="inputWater" value="${params.inputWater}"
				placeholder="输入水读数" required>
		</div>
		<div class="form-group">
			<label class="control-label" for="inputElect">电读数</label>
			<input type="number" class="form-control" id="inputElect" name="inputElect" value="${params.inputElect}"
				placeholder="输入电读数" required>
		</div>
		<div class="form-group">
			<label class="control-label" for="inputTrash">实收卫生费(参考卫生费 <span class="label label-success">${params.trash}</span> 元)</label>
			<input type="number" class="form-control" id="inputTrash" name="inputTrash"  value="${params.inputTrash}"
				placeholder="输入卫生费" required>
		</div>
		<div class="form-group">
			<label class="control-label" for="inputInternet">实收网费(参考网费 <span class="label label-success">${params.internet}</span> 元)</label>
			 <label>
        <input type="checkbox" name="needInternet" id="needInternet" value="0"  <c:if test="${!empty params.needinternet}"> checked="checked"</c:if>  onclick="intenetHandler(this);">
        <span class="label label-info">需要网络</span>
      </label>
			<input type="number" class="form-control" id="inputInternet" name="inputInternet"  value="${params.inputInternet}"
				placeholder="输入网费">
		</div>
		<div class="form-group">
			<label class="control-label" for="inputKeycount">钥匙(参考钥匙串 <span class="label label-success">${params.keycount}</span> 个)</label>
			<input type="number" class="form-control" id="inputKeycount" name="inputKeycount"  value="${params.inputKeycount}"
				placeholder="输入钥匙数量">
		</div>
		<div class="form-group">
			<label class="control-label" for="inputKeyprice">钥匙串价格(参考钥匙串价格 <span class="label label-success">${params.keyprice}</span> 元)</label>
			<input type="number" class="form-control" id="inputKeyprice" name="inputKeyprice"  value="${params.inputKeyprice}"
				placeholder="输入钥匙价格">
		</div>
		<div class="form-group">
			<label class="control-label" for="inputIp">IP</label>
			<input type="text" class="form-control" id="inputIp" name="inputIp"   value="${params.inputIp}"
				placeholder="输入ip">
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
		<button type="submit" class="btn btn-primary" onclick="return save();">确定入住</button>
		<a class="btn btn-default" href="${ctx}/room_checkin" role="button">返回</a>
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
function intenetHandler(o){
	if($(o).attr("checked")){
		$(o).removeAttr("checked");
		$("#inputInternet").val(0);
	}
	else{
		$(o).attr("checked","checked");
		$("#inputInternet").val('${params.internet}');
	}
	
}
</script>
</body>
</html>