<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="theme" content="basic_theme" />
<link rel="stylesheet" href="${ctx_cdn}/resources/css/bootstrap-select.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.3/js/bootstrap-select.min.js"></script>
<script src="${ctx_cdn}/resources/js/bootstrap-confirmation.min.js"></script>
</head>
<body>
<div class="row">
	<form role="form" method="post" action="#">
	  <c:if test="${!empty message}">  
            <div class="alert alert-success" role="alert">${message}</div>
            <script type="text/javascript">
            function autojump(){
            	location.href="${ctx}/room_checkout";
            }
            setTimeout("autojump()",100000);
            </script>
      </c:if>
      <c:if test="${!empty danger}">  
            <div class="alert alert-danger" role="alert">${danger}</div>
            <script type="text/javascript">
            function autojump(){
            	location.href="${ctx}/room_checkout";
            }
            setTimeout("autojump()",100000);
            </script>
      </c:if>  
      <div class="form-group">
		<a class="btn btn-default" href="${ctx}/room_money_query" role="button">返回</a>
	  </div>
      <table class="table table-bordered">
      <tr>
            <th class="col-sm-2">收租周期</th>
            <td>第${params.times}次</td>
        </tr>
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
            <th class="col-sm-2">月租(元)</th>
            <td><span class="label label-success">${params.monthmoney}</span></td>
        </tr>
         <c:if test="${params.times == 1}">  
  		<tr>
            <th class="col-sm-2">押金(元)</th>
            <td><span class="label label-success">${params.pressmoney}</span></td>
        </tr>
         </c:if>  
         <c:if test="${params.times > 1}">  
         <tr>
            <th class="col-sm-2">用水费(元)</th>
            <td>
	            <c:choose>
				    <c:when test="${!empty danger}">
				       <span class="label label-danger">没有抄水表</span>
				    </c:when>
				    <c:otherwise>
				        (${params.water}-${params.pre_water})*${params.waterprice} = <span class="label label-success">${params.usedwaterprice}</span>
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
				        (${params.elect}-${params.pre_elect})*${params.electprice} = <span class="label label-success">${params.usedelectprice}</span>
				    </c:otherwise>
				</c:choose>
            </td>
        </tr>
         </c:if>  
          <tr>
            <th class="col-sm-2">网费(元)</th>
            <td><span class="label label-success">${params.netprice}</span></td>
        </tr>
         <tr>
            <th class="col-sm-2">卫生费(元)</th>
            <td><span class="label label-success">${params.trash}</span></td>
        </tr>
         <c:if test="${params.times == 1}">  
         <tr>
            <th class="col-sm-2">钥匙押金(元)</th>
            <td>${params.keycount} 个 * ${params.keyprice} 元/个 = <span class="label label-success">${params.sumkeyprice}</span></td>
        </tr>
         </c:if>  
        <tr>
            <th class="col-sm-2">总收费用(房租
             <c:if test="${params.times == 1}">  
            +押金
             </c:if>  
            +水费+电费+网费+卫生费
             <c:if test="${params.times == 1}">  
            +钥匙押金
             </c:if>  
            )</th>
            <td>
            	 <c:choose>
				    <c:when test="${!empty danger}">
				       <h3><span class="label label-danger">没有抄水电表</span></h3>
				    </c:when>
				    <c:otherwise>
	            <span class="label label-success">${params.monthmoney}</span>
	            <c:if test="${params.times == 1}">  
	            +<span class="label label-success">${params.pressmoney}</span>
	            </c:if>  
	            <c:if test="${params.times > 1}">  
	            +<span class="label label-success">${params.usedwaterprice}</span>
	            +<span class="label label-success">${params.usedelectprice}</span>
	            </c:if>  
	            +<span class="label label-success">${params.netprice}</span>
	            +<span class="label label-success">${params.trash}</span>
	            <c:if test="${params.times == 1}">  
	            +<span class="label label-success">${params.sumkeyprice}</span>
	             </c:if>  
	             = <h3>${params.msg}<span class="label label-warning">${params.roommoney} 元</span></h3>
              		</c:otherwise>
				</c:choose>
             </td>
        </tr>
		</table>
 	<input type="hidden" id="houseid" name="houseid" value="${params.houseid}"/>
 	<input type="hidden" id="roomno" name="roomno" value="${params.roomno}"/>
 	<input type="hidden" id="paymoney" name="paymoney" value="${params.paymoney}"/>
		<a class="btn btn-default" href="${ctx}/room_money_query" role="button">返回</a>
	</form>
</div>
</body>
</html>