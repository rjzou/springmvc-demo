<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="theme" content="basic_theme" />
<link rel="stylesheet" href="${ctx}/resources/css/bootstrap-select.css">
<script src="${ctx}/resources/js/bootstrap-select.js"></script>
<script src="${ctx}/resources/js/bootstrap-confirmation.min.js"></script>
</head>
<body>
<div class="row">
	<form role="form" method="post" action="${ctx}/room_money_add">
	  <c:if test="${!empty message}">  
            <div class="alert alert-success" role="alert">${message}</div>
            <script type="text/javascript">
            function autojump(){
            	location.href="${ctx}/room_money";
            }
            setTimeout("autojump()",100000);
            </script>
      </c:if>
      <c:if test="${!empty danger}">  
            <div class="alert alert-danger" role="alert">${danger}</div>
            <script type="text/javascript">
            function autojump(){
            	location.href="${ctx}/room_towaterelect?houseid=${params.houseid}&roomno=${params.roomno}";
            }
            setTimeout("autojump()",10000);
            </script>
      </c:if>  
      <div class="form-group">
      	<button type="submit" class="btn btn-primary" data-toggle="confirmation"  data-placement="bottom" data-popout="true" <c:if test="${!empty danger}">disabled</c:if> >确认收房租</button>
		<a class="btn btn-default" href="${ctx}/room_money" role="button">返回</a>
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
            <th class="col-sm-2">房租(元)</th>
            <td><input oninput="inputChange();" type="number" id="monthmoney" name="monthmoney" value="${params.monthmoney}"/><span class="label label-warning">涨房租或者减房租进行修改</span></td>
        </tr>
         <tr>
            <th class="col-sm-2">用水费(元)</th>
            <td>
	            <c:choose>
				    <c:when test="${!empty danger}">
				       <span class="label label-danger">没有抄水表</span>
				    </c:when>
				    <c:otherwise>
				        (${params.curwater}-${params.water})*${params.waterprice} = <span class="label label-danger">${params.usedwaterprice}</span>
				    </c:otherwise>
				</c:choose>
            </td>
        </tr>
         <tr>
            <th class="col-sm-2">用电费(元)</th>
            <td>
            	<c:choose>
				    <c:when test="${!empty danger}">
				       <span class="label label-danger">没有抄电表</span>
				    </c:when>
				    <c:otherwise>
				        (${params.curelect}-${params.elect})*${params.electprice} = <span class="label label-danger">${params.usedelectprice}</span>
				    </c:otherwise>
				</c:choose>
            </td>
        </tr>
          <tr>
            <th class="col-sm-2">网费(元)</th>
            <td>
            <input type="number" oninput="inputChange();" id="netprice" name="netprice" value="${params.netprice}"/>
             <input type="checkbox" name="needInternet" id="needInternet" value="${params.needinternet}"  <c:if test="${params.needinternet == '1'}"> checked="checked"</c:if>  onclick="intenetHandler(this);">
        	<span class="label label-info">需要网络</span>
            </td>
        </tr>
         <tr>
            <th class="col-sm-2">卫生费(元)</th>
            <td><span class="label label-danger">${params.trash}</span></td>
        </tr>
        <tr>
            <th class="col-sm-2">需要收费用(元)</th>
            <td>
            	 <c:choose>
				    <c:when test="${!empty danger}">
				       <h3><span class="label label-danger">没有抄水电表</span></h3>
				    </c:when>
				    <c:otherwise>
	            <span class="label label-danger" id="lmonthmoney">${params.monthmoney}</span>+<span class="label label-danger">${params.usedwaterprice}</span>
	            +<span class="label label-danger">${params.usedelectprice}</span>+<span class="label label-danger" id="lnetprice">${params.netprice}</span>
	            +<span class="label label-danger">${params.trash}</span>
	             = <h3>需要收取费用 <span class="label label-warning" id="lroommoney">${params.roommoney}</span> 元</h3>
              		</c:otherwise>
				</c:choose>
             </td>
        </tr>
		</table>
 	<input type="hidden" id="houseid" name="houseid" value="${params.houseid}"/>
 	<input type="hidden" id="roomno" name="roomno" value="${params.roomno}"/>
 	
 	<input type="hidden" id="pressmoney" name="pressmoney" value="${params.pressmoney}"/>
 	<input type="hidden" id="roommoney" name="roommoney" value="${params.roommoney}"/>
 		<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
 	 	<div class="form-group">
			<button class="btn btn-primary" data-toggle="confirmation" data-placement="top" data-popout="true" <c:if test="${!empty danger}">disabled</c:if> >确认收房租</button>
			<a class="btn btn-default" href="${ctx}/room_money" role="button">返回</a>
		</div>
	</form>
</div>
<script type="text/javascript">
$($('[data-toggle="confirmation"]').confirmation({
	title:"只有在收到房租后才点确认操作，确定收到房租了吗?",
	onConfirm: function(event) { return true; },
	onCancel: function(event) { return false; }
}));

function intenetHandler(o){
	if($(o).attr("checked")){
		$(o).removeAttr("checked");
		$("#netprice").val(0);
	}
	else{
		$(o).attr("checked","checked");
		$("#netprice").val(40);
	}
	inputChange();
}
function inputChange(){
	var v_monthmoney = parseFloat($("#monthmoney").val());
	var v_usedwaterprice = parseFloat(${params.usedwaterprice});
	var v_usedelectprice = parseFloat(${params.usedelectprice});
	var v_netprice = parseFloat($("#netprice").val());
	var v_trash = parseFloat(${params.trash});
	$("#lmonthmoney").text(v_monthmoney);
	$("#lnetprice").text(v_netprice);
	var v_roommoney = (v_monthmoney + v_usedwaterprice + v_usedelectprice + v_netprice + v_trash).toFixed(1);
	$("#lroommoney").text(v_roommoney);
	$("#roommoney").text(v_roommoney);
}

</script>
</body>
</html>