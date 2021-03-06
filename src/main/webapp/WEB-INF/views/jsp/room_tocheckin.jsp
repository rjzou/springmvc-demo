<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="theme" content="basic_theme" />
<link rel="stylesheet"
	href="${ctx_cdn}/resources/css/bootstrap-select.css?Ver=20150821">
<link rel="stylesheet"
	href="${ctx_cdn}/resources/css/typeahead.css?Ver=20150821">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.3/js/bootstrap-select.min.js?Ver=20150821"></script>
<script type="text/javascript"
	src="${ctx_cdn}/resources/js/typeahead.bundle.js?Ver=20150821"></script>
<script type="text/javascript"
	src="${ctx_cdn}/resources/js/handlebars.js?Ver=20150821"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.9.0/validator.min.js?Ver=20150821"></script>
</head>
<body>
	<!-- content-wrapper -->
	<div class="col-md-10 content-wrapper">
		<div class="row">
			<div class="col-md-4 ">
				<ul class="breadcrumb">
					<li><i class="fa fa-home"></i><a href="#">首页</a></li>
					<li class="active">收房租</li>
				</ul>
			</div>
		</div>
		<!-- main -->
		<div class="content">
			<div class="main-content">
				<!-- WIDGET TICKET TABLE -->
					<div class="widget-content">
						<!-- INLINE FORM -->
						<div class="widget-content">

							<form role="form" method="post" action="${ctx}/room_checkin_add"
								data-toggle="validator">
								<c:if test="${!empty message}">
									<div class="alert alert-success" role="alert">${message}</div>
									<script type="text/javascript">
										function autojump() {
											location.href = "${ctx}/room_checkin";
										}
										setTimeout("autojump()", 10000);
									</script>
								</c:if>

								<c:if test="${!empty info}">
									<h3>
										<div class="alert alert-info" role="alert">${info}</div>
									</h3>
								</c:if>

								<input type="hidden" id="houseid" name="houseid"
									value="${params.houseid}" /> <input type="hidden" id="roomno"
									name="roomno" value="${params.roomno}" /> <input type="hidden"
									id="method" name="method" value="${params.method}" /> <input
									type="hidden" id="customid" name="customid"
									value="${params.customid}" />
								<!--  <input type="hidden" id="tmpcustomid" name="tmpcustomid"/>  -->
								<div class="form-group scrollable-dropdown-menu">
									<label class="control-label" for="inputCustomname">客户姓名</label>
									<input type="text" class="form-control typeahead"
										id="inputCustomname" name="inputCustomname"
										value="${params.inputCustomname}" placeholder="输入客户姓名"
										autocomplete="off" spellcheck="false" required />
								</div>
								<div class="form-group">
									<label class="control-label" for="inputIphone">客户手机</label> <input
										type="text" class="form-control" id="inputIphone"
										name="inputIphone" value="${params.inputIphone}"
										placeholder="输入客户手机" required />
								</div>
								<div class="form-group">
									<label class="control-label" for="inputCardid">身份证</label> <input
										type="text" class="form-control" id="inputCardid"
										name="inputCardid" value="${params.inputCardid}"
										placeholder="输入身份证" required />
								</div>
								<div class="form-group">
									<label class="control-label" for="inputMonthMoney">实收月租(参考月租<span
										class="label label-success"> ${params.monthmoney}</span> 元)
									</label> <input type="number" class="form-control" id="inputMonthMoney"
										name="inputMonthMoney" value="${params.inputMonthMoney}"
										min="0" step="1" pattern="^[0-9]{1,}$" maxlength="10"
										placeholder="输入实收月租" required />
								</div>
								<div class="form-group">
									<label class="control-label" for="inputPressMoney">实收押金(参考押金<span
										class="label label-success"> ${params.pressmoney}</span> 元)
									</label> <input type="number" class="form-control" id="inputPressMoney"
										name="inputPressMoney" value="${params.inputPressMoney}"
										min="0" step="1" pattern="^[0-9]{1,}$" maxlength="10"
										placeholder="输入实收押金" required />
								</div>
								<div class="form-group">
									<label class="control-label" for="inputWater">水读数</label> <input
										type="number" class="form-control" id="inputWater"
										name="inputWater" value="${params.inputWater}" min="0"
										step="1" pattern="^[0-9]{1,}$" maxlength="10"
										placeholder="输入水读数" required />
								</div>
								<div class="form-group">
									<label class="control-label" for="inputElect">电读数</label> <input
										type="number" class="form-control" id="inputElect"
										name="inputElect" value="${params.inputElect}" min="0"
										step="1" pattern="^[0-9]{1,}$" maxlength="10"
										placeholder="输入电读数" required />
								</div>
								<div class="form-group">
									<label class="control-label" for="inputTrash">实收卫生费(参考卫生费
										<span class="label label-success">${params.trash}</span> 元)
									</label> <input type="number" class="form-control" id="inputTrash"
										name="inputTrash" value="${params.inputTrash}" min="0"
										step="1" pattern="^[0-9]{1,}$" maxlength="10"
										placeholder="输入卫生费" required />
								</div>
								<div class="form-group">
									<label class="control-label" for="inputInternet">实收网费(参考网费
										<span class="label label-success">${params.internet}</span> 元)
									</label> <label> <input type="checkbox" name="needInternet"
										id="needInternet" value="0"
										<c:if test="${!empty params.needinternet}"> checked="checked"</c:if>
										onclick="intenetHandler(this);"> <span
										class="label label-info">需要网络</span>
									</label> <input type="number" class="form-control" id="inputInternet"
										name="inputInternet" value="${params.inputInternet}" min="0"
										step="1" pattern="^[0-9]{1,}$" maxlength="10"
										placeholder="输入网费">
								</div>
								<div class="form-group">
									<label class="control-label" for="inputKeycount">钥匙(参考钥匙串
										<span class="label label-success">${params.keycount}</span> 个)
									</label> <input type="number" class="form-control" id="inputKeycount"
										name="inputKeycount" value="${params.inputKeycount}" min="0"
										step="1" max="10" pattern="^[0-9]{1,}$" maxlength="2"
										placeholder="输入钥匙数量">
								</div>
								<div class="form-group">
									<label class="control-label" for="inputKeyprice">钥匙串押金(参考钥匙串押金
										<span class="label label-success">${params.keyprice}</span> 元)
									</label> <input type="number" class="form-control" id="inputKeyprice"
										name="inputKeyprice" value="${params.inputKeyprice}" min="0"
										step="1" pattern="^[0-9]{1,}$" maxlength="2"
										placeholder="输入钥匙价格">
								</div>
								<div class="form-group">
									<label class="control-label" for="inputIp">IP</label> <input
										type="text" class="form-control" id="inputIp" name="inputIp"
										value="${params.inputIp}" placeholder="输入ip">
								</div>


								<button type="submit" class="btn btn-success"
									onclick="return calc();">
									<c:choose>
										<c:when test="${!empty params.calctxt}">
			       		${params.calctxt}
			    </c:when>
										<c:otherwise>
			        	计算应收
			    </c:otherwise>
									</c:choose>
								</button>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<button type="submit" class="btn btn-primary"
									onclick="return save();">确定入住</button>
								<a class="btn btn-warning" href="${ctx}/room_checkin"
									role="button">返回</a>
							</form>
						</div>
					</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
function save(){
	$("#method").val('save');
	//$("#custom_id").val($("#tmpcustomid").val());
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
<script type="text/javascript">
    	/*** 2.Ajax数据预读示例 ***/

    	// 远程数据源
    	// remote:{
    	//        url: '${ctx}/json/getCustomJson?customname=%QUERY',
    	//       wildcard: '%QUERY'
    	//      }
    	var prefetch_provinces = new Bloodhound({
    	    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('customname'),
    	    queryTokenizer: Bloodhound.tokenizers.whitespace,
    	    // 预获取并缓存
    	    prefetch: '${ctx}/json/getCustomJson',
        	remote:{
        	      url: '${ctx}/json/queryCustomJson?customname=%QUERY',
        	      wildcard: '%QUERY'
        	     }
    	});

    	prefetch_provinces.initialize();
    	var input_typeahead = $('.scrollable-dropdown-menu .typeahead');
    	input_typeahead.typeahead({
    	    hint: true,
    	    highlight: true,
    	    minLength: 1
    	  },
    	  {
    	    name: 'provinces',
    	    displayKey: 'customname',
    	    source: prefetch_provinces.ttAdapter(),
    	    templates: {
    	        empty: [
    	            '<div class="empty-message">',
    	            '没有找到相关数据',
    	            '</div>'
    	        ].join('\n'),
    	        suggestion: Handlebars.compile('<div><strong><i class="glyphicon glyphicon-user"></i> {{customname}}</strong>  <p class="text-warning"><i class="glyphicon glyphicon-phone"></i> {{iphone}}</p>  <p class="text-success"><i class="glyphicon glyphicon-send"></i> {{cardid}}</p></div>')
    	    }
    	  });
    	
    	input_typeahead.bind('typeahead:select', function(ev, suggestion) {
  		   // console.log('Selection: ' + suggestion.id);
  		   // $("#tmpcustomid").val(suggestion.id);
  		    $("#inputIphone").val(suggestion.iphone);
  			$("#inputCardid").val(suggestion.cardid);
  		});
    	
  	
	</script>
</body>
</html>