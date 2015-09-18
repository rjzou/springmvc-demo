<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Maven + Spring MVC</title>
 
<spring:url value="http://ethaizone.github.io/Bootstrap-Confirmation/assets/css/bootstrap.css" var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />

 <link href="http://ethaizone.github.io/Bootstrap-Confirmation/assets/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="http://ethaizone.github.io/Bootstrap-Confirmation/assets/css/docs.css" rel="stylesheet">
    <link href="http://ethaizone.github.io/Bootstrap-Confirmation/assets/js/google-code-prettify/prettify.css" rel="stylesheet">
</head>
 
 
<body>
<h4>Four directions</h4>
          <div class="bs-docs-example tooltip-demo">
            <ul class="bs-docs-tooltip-examples">
              <li><a class="btn" data-toggle="confirmation" data-placement="left">Confirmation on left</a></li>
              <li><a class="btn" data-toggle="confirmation" data-placement="top">Confirmation on top</a></li>
              <li><a class="btn" data-toggle="confirmation" data-placement="bottom">Confirmation on bottom</a></li>
              <li><a class="btn" data-toggle="confirmation" data-placement="right">Confirmation on right</a></li>
            </ul>
          </div>

          <h4>Singleton <span class="label label-important">New feature!</span></h4>
          <div class="bs-docs-example tooltip-demo">
            <ul class="bs-docs-tooltip-examples">
              <li><a class="btn" data-toggle="confirmation-singleton" data-placement="left">Confirmation on left</a></li>
              <li><a class="btn" data-toggle="confirmation-singleton" data-placement="top">Confirmation on top</a></li>
              <li><a class="btn" data-toggle="confirmation-singleton" data-placement="bottom">Confirmation on bottom</a></li>
              <li><a class="btn" data-toggle="confirmation-singleton" data-placement="right">Confirmation on right</a></li>
            </ul>
          </div>

          <h4>Popout <span class="label label-important">New feature!</span></h4>
          <div class="bs-docs-example tooltip-demo">
            <ul class="bs-docs-tooltip-examples">
              <li><a class="btn" data-toggle="confirmation-popout" data-placement="left">Confirmation on left</a></li>
              <li><a class="btn" data-toggle="confirmation-popout" data-placement="top">Confirmation on top</a></li>
              <li><a class="btn" data-toggle="confirmation-popout" data-placement="bottom">Confirmation on bottom</a></li>
              <li><a class="btn" data-toggle="confirmation-popout" data-placement="right">Confirmation on right</a></li>
            </ul>
          </div>
<script src="http://ethaizone.github.io/Bootstrap-Confirmation/assets/js/jquery.js"></script>
<script src="http://ethaizone.github.io/Bootstrap-Confirmation/assets/js/bootstrap-transition.js"></script>
  <script src="http://ethaizone.github.io/Bootstrap-Confirmation/assets/js/bootstrap-tooltip.js"></script>

<script src="http://ethaizone.github.io/Bootstrap-Confirmation/assets/js/holder/holder.js"></script>
    <script src="http://ethaizone.github.io/Bootstrap-Confirmation/assets/js/google-code-prettify/prettify.js"></script>

<script src="http://ethaizone.github.io/Bootstrap-Confirmation/assets/js/application.js"></script>
<script src="http://ethaizone.github.io/Bootstrap-Confirmation/bootstrap-confirmation.js"></script>
</body>
</html>