<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="theme" content="basic_theme" />
<link rel="stylesheet"
	href="${ctx_cdn}/resources/css/bootstrap-select.css?Ver=20150821">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.3/js/bootstrap-select.min.js?Ver=20150821"></script>
</head>
<body>
<div class="row">
	<form role="form" method="post" action="${ctx}/room_add">
	  <c:if test="${!empty message}">  
            <div class="alert alert-success" role="alert">${message}</div>
      </c:if> 
		<div class="form-group">
		<label class="control-label" for="selectHouse">楼房</label>
		<div class="input-group">
			<select class="selectpicker" id="selectHouse" name="selectHouse" required>
				<option value="" >请选择...</option> 
				<c:forEach var="house" items="${houses}">  
				  	<option value="${house.id}" <c:if test="${house.id == params.houseid}">selected="selected"</c:if>  > 
						${house.housename}  
						</option> 
				</c:forEach>
			</select>
			</div>
		</div>

		<div class="form-group">
			<label class="control-label" for="roomno">房间号</label> 
			<input
				type="number" class="form-control" id="roomno" name="roomno" value="${params.roomno}"
				placeholder="输入房间号" required>
		</div>

		<div class="form-group">
			<label class="control-label" for="monthmoney">参考月租</label>
			<input type="number" class="form-control" id="monthmoney" name="monthmoney" value="${params.monthmoney}"
				placeholder="输入参考月租" required>
		</div>
		<div class="form-group">
			<label class="control-label" for="pressmoney">参考押金</label>
			<input type="number" class="form-control" id="pressmoney" name="pressmoney" value="${params.pressmoney}"
				placeholder="输入参考押金" required>
		</div>
		<div class="radio">
	       <label>
	        <input type="radio" name="optionsRoomtypes" id="optionsRadios1" value="danjian"  required <c:if test="${params.typecode eq 'danjian' }">checked</c:if>>
	        单间
	      </label>
	      <label>
	        <input type="radio" name="optionsRoomtypes" id="optionsRadios2" value="yifangyiting" required <c:if test="${params.typecode eq 'yifangyiting' }">checked</c:if>>
	        一房一厅
	      </label>
	      <label>
	        <input type="radio" name="optionsRoomtypes" id="optionsRadios3" value="liangfangyiting" required <c:if test="${params.typecode eq 'liangfangyiting' }">checked</c:if>>
	        两房一厅
	      </label>
	       <label>
	        <input type="radio" name="optionsRoomtypes" id="optionsRadios4" value="dianpu" required <c:if test="${params.typecode eq 'dianpu' }">checked</c:if>>
	       店铺
	      </label>
	    </div>
		<div class="form-group">
			<label class="control-label" for="description">备注</label>
			<input type="text" class="form-control" id="description" name="description" value="${params.description}"
				placeholder="备注">
		</div>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		<button type="submit" class="btn btn-primary">保存</button>
		<a class="btn btn-info" href="${ctx}/room_toadd" role="button">继续新增</a>
		<a class="btn btn-default" href="${ctx}/room" role="button">返回</a>
	</form>
</div>
</body>
</html>