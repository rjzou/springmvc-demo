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
	<form role="form" id="form1" method="post" action="${ctx}/room_checkout_add">
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
            <td><span class="label label-danger">${params.netprice}</span></td>
        </tr>
         <tr>
            <th class="col-sm-2">卫生费(元)</th>
            <td><span class="label label-danger">${params.trash}</span></td>
        </tr>
         <tr>
            <th class="col-sm-2">钥匙押金(元)</th>
            <td>${params.keycount} 个 * ${params.keyprice} 元/个 = <span class="label label-danger">${params.sumkeyprice}</span></td>
        </tr>
        <tr>
            <th class="col-sm-2">需要退费(押金-水费-电费-网费-卫生费-钥匙押金)</th>
            <td>
            	 <c:choose>
				    <c:when test="${!empty danger}">
				       <h3><span class="label label-danger">没有抄水电表</span></h3>
				    </c:when>
				    <c:otherwise>
	            <span class="label label-success">${params.pressmoney}</span> - <span class="label label-danger">${params.usedwaterprice}</span>
	             - <span class="label label-danger">${params.usedelectprice}</span> - <span class="label label-danger">${params.netprice}</span>
	             - <span class="label label-danger">${params.trash}</span> - <span class="label label-danger">${params.sumkeyprice}</span>
	             = <h3>${params.msg}<span class="label label-warning">${params.coutmoney} 元</span></h3>
              		</c:otherwise>
				</c:choose>
             </td>
        </tr>
		</table>
 	<input type="hidden" id="houseid" name="houseid" value="${params.houseid}"/>
 	<input type="hidden" id="roomno" name="roomno" value="${params.roomno}"/>
 	<input type="hidden" id="coutmoney" name="coutmoney" value="${params.coutmoney}"/>
 		<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		<button type="submit" class="btn btn-primary" data-toggle="confirmation" data-placement="top" <c:if test="${!empty danger}">disabled</c:if> >确认退房</button>
		<a class="btn btn-default" href="${ctx}/room_checkout" role="button">返回</a>
	</form>
</div>
<script src="${ctx}/resources/js/bootstrap-confirmation.js"></script>
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
</script>
</body>
</html>