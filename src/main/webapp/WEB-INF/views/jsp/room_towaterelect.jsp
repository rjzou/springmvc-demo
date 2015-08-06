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
	<form role="form" method="post" action="${ctx}/room_waterelect_save">
	  <c:if test="${!empty message}">  
            <div class="alert alert-success" role="alert">${message}</div>
            <script type="text/javascript">
            function autojump(){
            	location.href="${ctx}/room_waterelect";
            }
            setTimeout("autojump()",10000);
            </script>
      </c:if> 
       <div class="form-group">
      		<button type="submit" class="btn btn-primary">保存</button>
			<a class="btn btn-default" href="${ctx}/room_waterelect" role="button">返回</a>
	   </div>
      <table class="table table-bordered">
        <tr>
            <th class="col-sm-2">楼房</th>
            <td>${params.housename}</td>
        </tr>
          <tr>
            <th class="col-sm-2">房间号</th>
            <td>${params.roomno}</td>
        </tr>
  		  <tr>
            <th class="col-sm-2">入住姓名</th>
            <td>${params.customname}</td>
        </tr>
  		<tr>
            <th class="col-sm-2">上次水度数</th>
            <td>${params.water}</td>
        </tr>
          <tr>
            <th class="col-sm-2">上次电读数</th>
            <td>${params.elect}</td>
        </tr>
		</table>
 	<input type="hidden" id="houseid" name="houseid" value="${params.houseid}"/>
 	<input type="hidden" id="roomno" name="roomno" value="${params.roomno}"/>
		<div class="form-group">
			<label class="control-label" for="inputWater">水读数</label> 
			<input
				type="number" class="form-control" id="inputWater" name="inputWater" value="${params.inputWater}"
				placeholder="输入水读数" required>
		</div>

		<div class="form-group">
			<label class="control-label" for="inputElect">电读数</label>
			<input type="number" class="form-control" id="inputElect" name="inputElect" value="${params.inputElect}"
				placeholder="输入电读数" required>
		</div>
		<button type="submit" class="btn btn-primary">保存</button>
		<a class="btn btn-default" href="${ctx}/room_waterelect" role="button">返回</a>
	</form>
</div>
</body>
</html>