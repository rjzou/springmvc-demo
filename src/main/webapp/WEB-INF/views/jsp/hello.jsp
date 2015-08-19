<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Maven + Spring MVC</title>
  <link rel="stylesheet" href="${ctx}/resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="${ctx}/resources/css/typeahead.css">
	<script type="text/javascript" src="${ctx}/resources/js/jquery-1.11.3.min.js"></script>
   <!-- 
    <script type="text/javascript" src="${ctx}/resources/js/bootstrap3-typeahead.js"></script>
     -->
    <script type="text/javascript" src="${ctx}/resources/js/typeahead.bundle.js"></script>
 <script type="text/javascript" src="${ctx}/resources/js/handlebars.js"></script>
 
<style type="text/css">


</style>
</head>
 <body>
	<div id="scrollable-dropdown-menu">
	  <input class="typeahead" type="text" placeholder="" autocomplete="off" spellcheck="false">
	</div>
    
     <script type="text/javascript">
    	
    	
    	/*** 2.Ajax数据预读示例 ***/

    	// 远程数据源
    	var prefetch_provinces = new Bloodhound({
    	    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('customname'),
    	    queryTokenizer: Bloodhound.tokenizers.whitespace,
    	    // 预获取并缓存
    	    prefetch: '${ctx}/json/getCustomJson',
    	    remote:{
    	        url: '${ctx}/json/getCustomJson?customname=%QUERY',
    	        wildcard: '%QUERY'
    	      }
    	});

    	prefetch_provinces.initialize();

    	$('#scrollable-dropdown-menu .typeahead').typeahead({
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
    	        suggestion: Handlebars.compile('<div><strong>{{customname}}</strong> / {{iphone}} / {{cardid}}</div>')
    	    }
    	  });
    	
    	$('#scrollable-dropdown-menu .typeahead').bind('typeahead:select', function(ev, suggestion) {
  		  console.log('Selection: ' + suggestion.customname);
  		});
    	
  	
	</script>
</body>
</html>