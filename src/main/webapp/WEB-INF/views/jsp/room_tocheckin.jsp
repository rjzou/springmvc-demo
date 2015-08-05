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
      </c:if> 
      <div class="form-group">
	      <button type="submit" class="btn btn-primary">保存</button>
		  <a class="btn btn-default" href="${ctx}/room_checkin" role="button">返回</a>
	  </div>
      <input type="hidden" id="hiddenHouseid" name="houseid" value="${params.houseid}"/>
      <input type="hidden" id="hiddenRoomno" name="roomno" value="${params.roomno}"/>

		<div class="form-group">
			<label class="control-label" for="inputUsername">客户姓名</label>
			<input type="text" class="form-control" id="inputUsername" name="inputUsername" value="${params.inputUsername}"
				placeholder="输入客户姓名" required>
		</div>
		<div class="form-group">
			<label class="control-label" for="inputIphone">客户手机</label>
			<input type="text" class="form-control" id="inputIphone" name="inputIphone"   value="${params.inputIphone}"
				placeholder="输入客户手机" required>
		</div>
		<div class="form-group">
			<label class="control-label" for="inputUserid">身份证</label>
			<input type="text" class="form-control" id="inputUserid" name="inputUserid"    value="${params.inputUserid}"
				placeholder="输入身份证">
		</div>
		<div class="form-group">
			<label class="control-label" for="inputMonthMoney">实收月租(参考月租 ${params.monthmoney} 元)</label>
			<input type="number" class="form-control" id="inputMonthMoney" name="inputMonthMoney"  value="${params.inputMonthMoney}"
				placeholder="输入实收月租" required>
		</div>
		<div class="form-group">
			<label class="control-label" for="inputPressMoney">实收押金(参考押金 ${params.pressmoney} 元)</label>
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
			<label class="control-label" for="inputTrash">实收卫生费(参考卫生费 ${params.trash} 元)</label>
			<input type="number" class="form-control" id="inputTrash" name="inputTrash"  value="${params.inputTrash}"
				placeholder="输入卫生费" required>
		</div>
		<div class="form-group">
			<label class="control-label" for="inputInternet">实收网费(参考网费 ${params.internet} 元)</label>
			<input type="number" class="form-control" id="inputInternet" name="inputInternet"  value="${params.inputInternet}"
				placeholder="输入网费">
		</div>
		<div class="form-group">
			<label class="control-label" for="inputKeycount">钥匙(参考钥匙串 ${params.keycount} 个)</label>
			<input type="number" class="form-control" id="inputKeycount" name="inputKeycount"  value="${params.inputKeycount}"
				placeholder="输入钥匙数量">
		</div>
		<div class="form-group">
			<label class="control-label" for="inputKeyprice">钥匙串价格(参考钥匙串价格 ${params.keyprice} 元)</label>
			<input type="number" class="form-control" id="inputKeyprice" name="inputKeyprice"  value="${params.inputKeyprice}"
				placeholder="输入钥匙价格">
		</div>
		<div class="form-group">
			<label class="control-label" for="inputIp">IP</label>
			<input type="text" class="form-control" id="inputIp" name="inputIp"   value="${params.inputIp}"
				placeholder="输入ip">
		</div>
		 <c:if test="${!empty info}">  
            <h3><div class="alert alert-info" role="alert"> 应收  ${info}元</div><h3>
      	</c:if> 
      
		<button type="button" class="btn btn-success" onclick="calc(this);">计算应收</button>
		<button type="submit" class="btn btn-primary">保存</button>
		<a class="btn btn-default" href="${ctx}/room_checkin" role="button">返回</a>
	</form>
</div>
<script type="text/javascript">
function calc(o){
	/*
	var monthmoney = $("#inputMonthMoney").val();
	var pressmoney = $("#inputPressMoney").val();
	var trash = $("#inputTrash").val();
	var internet = $("#inputInternet").val();
	var keycount = $("#inputKeycount").val();
	var keyprice = $("#inputKeyprice").val();
	var summoney = parseFloat(monthmoney) + parseFloat(pressmoney) + parseFloat(trash) + parseFloat(internet)+ (parseFloat(keycount) * parseFloat(keyprice));
	var txt = "<h3><div class=\"alert alert-info\" role=\"alert\">应收 "+summoney+"元</div><h3>";
	$(o).before(txt);
	*/
	
	$('form:first').attr('action','${ctx}/room_checkin_calc');
	$('form:first').attr('method','post');
	$('form:first').submit();
	
}
</script>
</body>
</html>