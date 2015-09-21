<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="theme" content="basic_theme" />
<script type="text/javascript" src="${ctx}/resources/js/validator.min.js"></script>
</head>
<body>
<div class="row">
	<form role="form" id="form1" method="post" action="${ctx}/room_checkout_add" data-toggle="validator">
	  <c:if test="${!empty message}">  
            <div class="alert alert-success" role="alert">${message}</div>
            <script type="text/javascript">
            function autojump(){
            	location.href="${ctx}/room_checkout";
            }
            setTimeout("autojump()",10000);
            </script>
      </c:if>
      <c:if test="${!empty danger}">  
            <div class="alert alert-danger" role="alert">${danger}</div>
            <script type="text/javascript">
            function autojump(){
            	location.href="${ctx}/room_checkout";
            }
            setTimeout("autojump()",10000);
            </script>
      </c:if>  
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
            <th class="col-sm-2">上次收租时间</th>
            <td><span class="label label-success">${params.pre_s_date}</span></td>
        </tr>
        <tr>
            <th class="col-sm-2">已住天数</th>
            <td><span class="label label-success">${params.in_days}</span> 天</td>
        </tr>
        <tr>
            <th class="col-sm-2">实收月租(元)</th>
            <td><span class="label label-success">${params.monthmoney}</span></td>
        </tr>
  		<tr>
            <th class="col-sm-2">实收押金(元)</th>
            <td><span class="label label-success">${params.pressmoney}</span></td>
        </tr>
         <tr>
            <th class="col-sm-2">用水费(元)</th>
            <td>
	            <c:choose>
				    <c:when test="${!empty danger}">
				       <span class="label label-danger">没有抄水表</span>
				    </c:when>
				    <c:otherwise>
				        
				        <div class="col-xs-4 form-group">
				        <input  type="number" class="form-control" id="curwater" name="curwater" class="form-control  input-sm" value="${params.curwater}"   min="0" step="1"  pattern="^[0-9]{1,}$" maxlength="10" required  oninput="inputChange();"/>
				        </div>
				         <strong>-${params.water} * ${params.waterprice} 
				         = </strong>
				        
				        <span class="label label-danger" id="spanusedwaterprice">${params.usedwaterprice}</span>
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
				        <div class="col-xs-4" form-group">
				        <input  type="number" class="form-control" id="curelect" class="form-control  input-sm" name="curelect" value="${params.curelect}"   min="0" step="1"  pattern="^[0-9]{1,}$" maxlength="10" required  oninput="inputChange();"/>
				        </div>
				        <strong>
				        -${params.elect}  *  ${params.electprice} 
				        = </strong>
				        <span class="label label-danger" id="spanusedelectprice">${params.usedelectprice}</span>
				    </c:otherwise>
				</c:choose>
            </td>
        </tr>
          <tr>
            <th class="col-sm-2">网费(元)</th>
            <td><span class="label label-danger">${params.netprice}</span></td>
        </tr>
         <tr>
            <th class="col-sm-2">卫生费(元)</th>
            <td><span class="label label-danger">${params.trash}</span></td>
        </tr>
         <tr>
            <th class="col-sm-2">钥匙押金(元)</th>
            <td>
            	标配 ${params.keycount} 个 * ${params.keyprice} 元/个 = <span class="label label-success">${params.sumkeyprice}</span>
            </td>
        </tr>
          <tr>
            <th class="col-sm-2">归还(个)</th>
            <td>
            	
            	<div class="col-xs-4" form-group">
            		<input  type="number" class="form-control" id="keycount" name="keycount" class="form-control  input-sm" value="${params.keycount}"   min="0" step="1"  pattern="^[0-9]{1,}$" maxlength="10" required  oninput="inputChange();"/>
            	</div>
            </td>
        </tr>
        <tr>
            <th class="col-sm-2">退房总费用</th>
            <td>
            	 <c:choose>
				    <c:when test="${!empty danger}">
				       <h3><span class="label label-danger">没有抄水电表</span></h3>
				    </c:when>
				    <c:otherwise>
	            <span class="label label-success">${params.pressmoney}</span> - <span class="label label-danger" id="lusedwaterprice">${params.usedwaterprice}</span>
	             - <span class="label label-danger" id="lusedelectprice">${params.usedelectprice}</span> - <span class="label label-danger">${params.netprice}</span>
	             - <span class="label label-danger">${params.trash}</span> - <span class="label label-danger" id="lkeyprice">0.0</span> 
	             = <h4>${params.msg}<span class="label label-warning" id="lcoutmoney">${params.backpressmoney}</span> 元</h4>
	             <h4>房租退还<span class="label label-warning">${params.backmonthmoney}</span> 元</h4>
	             <h3>共计需退还<span class="label label-warning" id="lsumbackmoney">${params.sumbackmoney}</span> 元</h3>
              		</c:otherwise>
				</c:choose>
             </td>
        </tr>
		</table>
 	<input type="hidden" id="houseid" name="houseid" value="${params.houseid}"/>
 	<input type="hidden" id="roomno" name="roomno" value="${params.roomno}"/>
 	<input type="hidden" id="sumbackmoney" name="sumbackmoney" value="${params.sumbackmoney}"/>
 		<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		<button type="submit" class="btn btn-primary" data-toggle="confirmation" data-placement="top" <c:if test="${!empty danger}">disabled</c:if> >确认退房</button>
		<a class="btn btn-default" href="${ctx}/room_checkout" role="button">返回</a>
	</form>
	<br/>
	<p>
		<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
  		从收租日起不足一个星期，房租费按30元/天计算;超过一个星期房租费不予退还;
  	</p>
</div>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-confirmation/1.0.3/bootstrap-confirmation.min.js"></script>
<script type="text/javascript">
$(function() {
	$('[data-toggle="confirmation"]').confirmation({
		title:"只有在收到房租后才点确认操作，确定收到房租了吗?",
		btnOkClass:'btn btn-sm btn-success',
		btnOkLabel:"确认",
		btnCancelLabel:"取消",
		onConfirm: function() { $("#form1").submit(); },
		onCancel: function() { return false; }
	});
});

function inputChange(){
	var v_monthmoney = parseFloat('${params.monthmoney}');
	var v_pressmoney = parseFloat('${params.pressmoney}');
	var v_curwater = 0;
	if($('#curwater').val() != ''){
		v_curwater = parseFloat($('#curwater').val());
	}
	var v_curelect = 0;
	if($('#curelect').val() != ''){
		v_curelect = parseFloat($('#curelect').val());
	}
	var v_water = parseFloat('${params.water}');
	var v_elect = parseFloat('${params.elect}');
	var v_waterprice =  parseFloat('${params.waterprice}');
	var v_electprice =  parseFloat('${params.electprice}');
	var v_usedwaterprice = (v_curwater - v_water ) * v_waterprice ;
	var v_usedelectprice = (v_curelect - v_elect ) * v_electprice ;
	var v_netprice = parseFloat('${params.netprice}');
	var v_trash = parseFloat('${params.trash}');
	var v_keycount = $("#keycount").val();
	var v_loseprice = (2 - v_keycount) * 10;
	$("#lusedwaterprice,#spanusedwaterprice").text(v_usedwaterprice.toFixed(1));
	$("#lusedelectprice,#spanusedelectprice").text(v_usedelectprice.toFixed(1));
	$("#lkeyprice").text(v_loseprice.toFixed(1));
	var v_coutmoney = (v_pressmoney - v_usedwaterprice - v_usedelectprice - v_netprice - v_trash - v_loseprice).toFixed(1);
	$("#lcoutmoney").text(v_coutmoney);
	var v_backmonthmoney = parseFloat('${params.backmonthmoney}');
	var v_sumbackmoney = (parseFloat(v_coutmoney)  + v_backmonthmoney).toFixed(1)
	$("#lsumbackmoney").text(v_sumbackmoney);
	$("#sumbackmoney").val(v_sumbackmoney);
}
</script>
</body>
</html>