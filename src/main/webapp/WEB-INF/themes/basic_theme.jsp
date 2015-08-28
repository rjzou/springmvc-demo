<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/tag.jsp"%>
<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie ie9" lang="en" class="no-js"> <![endif]-->
<!--[if !(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->

<head>
	<title>出租房智能管理系统</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="description" content="KingAdmin - Bootstrap Admin Dashboard Theme">
	<meta name="author" content="The Develovers">

	<!-- CSS -->
	 <!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css?Ver=20150821">
	<link href="${ctx}/resources/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="${ctx}/resources/css/main.css" rel="stylesheet" type="text/css">
	<link href="${ctx}/resources/css/my-custom-styles.css" rel="stylesheet" type="text/css">

	<!--[if lte IE 9]>
		<link href="assets/css/main-ie.css" rel="stylesheet" type="text/css"/>
		<link href="assets/css/main-ie-part2.css" rel="stylesheet" type="text/css"/>
	<![endif]-->

	<!-- CSS for demo style switcher. you can remove this -->
	<link href="${ctx}/resources/css/style-switcher.css" rel="stylesheet" type="text/css">
	<!-- Fav and touch icons -->
	<link rel="apple-touch-icon-precomposed" sizes="144x144" href="${ctx}/resources/images/kingadmin-favicon144x144.png">
	<link rel="apple-touch-icon-precomposed" sizes="114x114" href="${ctx}/resources/images/kingadmin-favicon114x114.png">
	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="${ctx}/resources/images/kingadmin-favicon72x72.png">
	<link rel="apple-touch-icon-precomposed" sizes="57x57" href="${ctx}/resources/images/kingadmin-favicon57x57.png">
	<script type="text/javascript" src="//cdn.bootcss.com/jquery/2.1.4/jquery.min.js?Ver=20150821"></script>
	<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js?Ver=20150821"></script>
	<link rel="icon" href="${ctx_cdn}/resources/favicon.ico">
	 <sitemesh:head/>
</head>

<body class="dashboard">
	<!-- WRAPPER -->
	<div class="wrapper">
		<!-- TOP BAR -->
		<div class="top-bar">
			<div class="container">
				<div class="row">
					<!-- logo -->
					<div class="col-md-2 logo"> 
						<a href="${ctx}/main"><img src="${ctx}/resources/images/kingadmin-logo-white.png" alt="出租房智能管理系统" /></a>
						<h1 class="sr-only">出租房智能管理系统</h1>
					</div>
					<!-- end logo -->
					<div class="col-md-10">
						<div class="row">
							<div class="col-md-3">
								<!-- search box -->
								<form class="navbar-form navbar-right" action="https://www.baidu.com/baidu" method="get" target="_blank">
									<div id="tour-searchbox" class="input-group searchbox">
											<input type="search" class="form-control" name="word" placeholder="enter keyword here...">
											<span class="input-group-btn">
												<button class="btn btn-default" type="button"><i class="fa fa-search"></i></button>
											</span>
									</div>
								 </form>
								<!-- end search box -->
							</div>
							<div class="col-md-9">
								<div class="top-bar-right">
									<!-- responsive menu bar icon -->
									<a href="#" class="hidden-md hidden-lg main-nav-toggle"><i class="fa fa-bars"></i></a>
									<!-- end responsive menu bar icon -->
									<button type="button" id="start-tour" class="btn btn-link"><i class="fa fa-refresh"></i>刷新</button>
									<button type="button" id="global-volume" class="btn btn-link btn-global-volume"><i class="fa"></i></button>
									<div class="notifications">
										<ul>
											<!-- notification: inbox -->
											<li class="notification-item inbox">
												<div class="btn-group">
													<a href="#" class="dropdown-toggle" data-toggle="dropdown">
														<i class="fa fa-envelope"></i><span class="count">2</span>
														<span class="circle"></span>
													</a>
													<ul class="dropdown-menu" role="menu">
														<li class="notification-header">
															<em>You have 2 unread messages</em>
														</li>
														<li class="inbox-item clearfix">
															<a href="#">
																<div class="media">
																	<div class="media-left">
																		<img class="media-object" src="${ctx}/resources/images/user1.png" alt="Antonio">
																	</div>
																	<div class="media-body">
																		<h5 class="media-heading name">Antonius</h5>
																		<p class="text">The problem just happened this morning. I can't see ...</p>
																		<span class="timestamp">4 minutes ago</span>
																	</div>
																</div>
															</a>
														</li>
														<li class="inbox-item unread clearfix">
															<a href="#">
																<div class="media">
																	<div class="media-left">
																		<img class="media-object" src="${ctx}/resources/images/user2.png" alt="Antonio">
																	</div>
																	<div class="media-body">
																		<h5 class="media-heading name">Michael</h5>
																		<p class="text">Hey dude, cool theme!</p>
																		<span class="timestamp">2 hours ago</span>
																	</div>
																</div>
															</a>
														</li>
														<li class="inbox-item unread clearfix">
															<a href="#">
																<div class="media">
																	<div class="media-left">
																		<img class="media-object" src="${ctx}/resources/images/user3.png" alt="Antonio">
																	</div>
																	<div class="media-body">
																		<h5 class="media-heading name">Stella</h5>
																		<p class="text">Ok now I can see the status for each item. Thanks! :D</p>
																		<span class="timestamp">Oct 6</span>
																	</div>
																</div>
															</a>
														</li>
														<li class="inbox-item clearfix">
															<a href="#">
																<div class="media">
																	<div class="media-left">
																		<img class="media-object" src="${ctx}/resources/images/user4.png" alt="Antonio">
																	</div>
																	<div class="media-body">
																		<h5 class="media-heading name">Jane Doe</h5>
																		<p class="text"><i class="fa fa-reply"></i> Please check the status of your ...</p>
																		<span class="timestamp">Oct 2</span>
																	</div>
																</div>
															</a>
														</li>
														<li class="inbox-item clearfix">
															<a href="#">
																<div class="media">
																	<div class="media-left">
																		<img class="media-object" src="${ctx}/resources/images/user5.png" alt="Antonio">
																	</div>
																	<div class="media-body">
																		<h5 class="media-heading name">John Simmons</h5>
																		<p class="text"><i class="fa fa-reply"></i> I've fixed the problem :)</p>
																		<span class="timestamp">Sep 12</span>
																	</div>
																</div>
															</a>
														</li>
														<li class="notification-footer">
															<a href="#">View All Messages</a>
														</li>
													</ul>
												</div>
											</li>
											<!-- end notification: inbox -->
											<!-- notification: general -->
											<li class="notification-item general">
												<div class="btn-group">
													<a href="#" class="dropdown-toggle" data-toggle="dropdown">
														<i class="fa fa-bell"></i><span class="count">8</span>
														<span class="circle"></span>
													</a>
													<ul class="dropdown-menu" role="menu">
														<li class="notification-header">
															<em>You have 8 notifications</em>
														</li>
														<li>
															<a href="#">
																<i class="fa fa-comment green-font"></i>
																<span class="text">New comment on the blog post</span>
																<span class="timestamp">1 minute ago</span>
															</a>
														</li>
														<li>
															<a href="#">
																<i class="fa fa-user green-font"></i>
																<span class="text">New registered user</span>
																<span class="timestamp">12 minutes ago</span>
															</a>
														</li>
														<li>
															<a href="#">
																<i class="fa fa-comment green-font"></i>
																<span class="text">New comment on the blog post</span>
																<span class="timestamp">18 minutes ago</span>
															</a>
														</li>
														<li>
															<a href="#">
																<i class="fa fa-shopping-cart red-font"></i>
																<span class="text">4 new sales order</span>
																<span class="timestamp">4 hours ago</span>
															</a>
														</li>
														<li>
															<a href="#">
																<i class="fa fa-edit yellow-font"></i>
																<span class="text">3 product reviews awaiting moderation</span>
																<span class="timestamp">1 day ago</span>
															</a>
														</li>
														<li>
															<a href="#">
																<i class="fa fa-comment green-font"></i>
																<span class="text">New comment on the blog post</span>
																<span class="timestamp">3 days ago</span>
															</a>
														</li>
														<li>
															<a href="#">
																<i class="fa fa-comment green-font"></i>
																<span class="text">New comment on the blog post</span>
																<span class="timestamp">Oct 15</span>
															</a>
														</li>
														<li>
															<a href="#">
																<i class="fa fa-warning red-font"></i>
																<span class="text red-font">Low disk space!</span>
																<span class="timestamp">Oct 11</span>
															</a>
														</li>
														<li class="notification-footer">
															<a href="#">View All Notifications</a>
														</li>
													</ul>
												</div>
											</li>
											<!-- end notification: general -->
										</ul>
									</div>
									<!-- logged user and the menu -->
									<div class="logged-user">
										<div class="btn-group">
											<a href="#" class="btn btn-link dropdown-toggle" data-toggle="dropdown">
												<img src="${ctx}/resources/images/user-avatar.png" alt="User Avatar" />
												<span class="name">${pageContext.request.userPrincipal.name}</span> <span class="caret"></span>
											</a>
											<ul class="dropdown-menu" role="menu">
												<li>
													<a href="#">
														<i class="fa fa-user"></i>
														<span class="text">Profile</span>
													</a>
												</li>
												<li>
													<a href="${ctx}/user_password">
														<i class="fa fa-cog"></i>
														<span class="text">修改密码</span>
													</a>
												</li>
												<li>
													<sec:authorize access="hasRole('ROLE_USER')">
													<!-- For login user -->
													<c:url value="/j_spring_security_logout" var="logoutUrl" />
													<form action="${logoutUrl}" method="post" id="logoutForm">
														<input type="hidden" name="${_csrf.parameterName}"
															value="${_csrf.token}" />
													</form>
													<script>
														function formSubmit() {
															document.getElementById("logoutForm").submit();
														}
													</script>
											
													<c:if test="${pageContext.request.userPrincipal.name != null}">
															<a href="javascript:formSubmit()"> 
																<i class="fa fa-power-off"></i>
																<span class="text">退出</span>
															</a>
													</c:if>
									
													</sec:authorize>
												</li>
											</ul>
										</div>
									</div>
									<!-- end logged user and the menu -->
								</div>
								<!-- /top-bar-right -->
							</div>
						</div>
						<!-- /row -->
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /top -->
		<!-- BOTTOM: LEFT NAV AND RIGHT MAIN CONTENT -->
		<div class="bottom">
			<div class="container">
				<div class="row">
					<!-- left sidebar -->
					<div class="col-md-2 left-sidebar">
						<!-- main-nav -->
						<nav class="main-nav">
							<ul class="main-menu">
								<li <c:if test="${params.page_group == 'mytask_group'}">class="active"</c:if>>
									<a href="#" class="js-sub-menu-toggle">
										<i class="fa fa-dashboard fa-fw"></i><span class="text">我的任务</span>
										<i class="toggle-icon fa fa-angle-down"></i>
									</a>
									<ul class="sub-menu
									<c:if test="${params.page_group == 'mytask_group'}">open</c:if>
									">
										<li <c:if test="${params.page_id == 'main'}">class="active" </c:if>><a href="${ctx}/main"><span class="text">我的待办</span></a></li>
										<li><a href="#"><span class="text">我的通知</span></a></li>
										<li><a href="#"><span class="text">我的邮件</span></a></li>
									</ul>
								</li>
								<li <c:if test="${params.page_group == 'common_group'}">class="active"</c:if>>
									<a href="#" class="js-sub-menu-toggle">
										<i class="fa fa-list-alt fw"></i><span class="text">常用功能</span>
										<i class="toggle-icon fa fa-angle-left"></i>
									</a>
									<ul class="sub-menu 
									<c:if test="${params.page_group == 'common_group'}">open</c:if>
									">
										<li <c:if test="${params.page_id == 'room_checkin'}">class="active" </c:if>><a href="${ctx}/room_checkin"><span class="text">开始入住</span></a></li>
										<li <c:if test="${params.page_id == 'room_money'}">class="active" </c:if>><a href="${ctx}/room_money"><span class="text">收房租</span></a></li>
										<li <c:if test="${params.page_id == 'room_checkout'}">class="active" </c:if>><a href="${ctx}/room_checkout"><span class="text">现在退房</span></a></li>
										<li <c:if test="${params.page_id == 'room_waterelect'}">class="active" </c:if>><a href="${ctx}/room_waterelect"><span class="text">抄水表 </a></li>
									</ul>
								</li>
								
								<li <c:if test="${params.page_group == 'sysquery_group'}">class="active"</c:if>>
									<a href="#" class="js-sub-menu-toggle">
										<i class="fa fa-bar-chart-o fw"></i><span class="text">系统查询</span>
										<i class="toggle-icon fa fa-angle-left"></i>
									</a>
									<ul class="sub-menu 
									<c:if test="${params.page_group == 'sys_query_group'}">open</c:if>
									">
										<li <c:if test="${params.page_id == 'room_checkin_query'}">class="active" </c:if>><a href="${ctx}/room_checkin_query"><span class="text">入住查询</span></a></li>
										<li <c:if test="${params.page_id == 'room_money_query'}">class="active" </c:if>><a href="${ctx}/room_money_query"><span class="text">收租查询</span></a></li>
										<li <c:if test="${params.page_id == 'room_checkout_query'}">class="active" </c:if>><a href="${ctx}/room_checkout_query"><span class="text">退房查询</span></a></li>
										<li <c:if test="${params.page_id == 'custom_query'}">class="active" </c:if>><a href="${ctx}/custom_query"><span class="text">客户查询</span></a></li>
									</ul>
								</li>
								
								<li <c:if test="${params.page_group == 'sys_config_group'}">class="active"</c:if>>
									<a href="#" class="js-sub-menu-toggle">
										<i class="fa fa-gears fw"></i><span class="text">系统配置</span>
										<i class="toggle-icon fa fa-angle-left"></i>
									</a>
									<ul class="sub-menu 
									<c:if test="${params.page_group == 'sys_config_group'}">open</c:if>
									">
										<li <c:if test="${params.page_id == 'house'}">class="active" </c:if>><a href="${ctx}/house"><span class="text">楼房配置</span></a></li>
										<li <c:if test="${params.page_id == 'room'}">class="active" </c:if>><a href="${ctx}/room"><span class="text">房间配置</span></a></li>
										<li <c:if test="${params.page_id == 'waterelectcfg'}">class="active" </c:if>><a href="${ctx}/waterelectcfg"><span class="text">水电价配置</span></a></li>
									</ul>
								</li>
								
								
							</ul>
						</nav>
						<!-- /main-nav -->
						<div class="sidebar-minified js-toggle-minified">
							<i class="fa fa-angle-left"></i>
						</div>
					</div>
					<!-- end left sidebar -->
					<!-- top general alert -->
					<div class="alert alert-danger top-general-alert">
						<span>出租房智能管理系统已经上线了新的样式，功能也更加强大.</span>
						<button type="button" class="close">&times;</button>
					</div>
					<!-- end top general alert -->
					<!-- content-wrapper -->
					<sitemesh:body/>
					<!-- /content-wrapper -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- END BOTTOM: LEFT NAV AND RIGHT MAIN CONTENT -->
	</div>
	<!-- /wrapper -->

	<!-- FOOTER -->
	<footer class="footer">
		&copy; 2014-2015 跳跳集团科技有限公司
	</footer>
	<!-- END FOOTER -->

	<!-- STYLE SWITCHER -->
	<div class="del-style-switcher">
		<div class="del-switcher-toggle toggle-hide"></div>
		<form>
			<section class="del-section del-section-skin">
				<h5 class="del-switcher-header">Choose Skins:</h5>
				<ul>
					<li><a href="#" title="Slate Gray" class="switch-skin slategray" data-skin="${ctx}/resources/css/skins/slategray.css">Slate Gray</a></li>
					<li><a href="#" title="Dark Blue" class="switch-skin darkblue" data-skin="${ctx}/resources/css/skins/darkblue.css">Dark Blue</a></li>
					<li><a href="#" title="Dark Brown" class="switch-skin darkbrown" data-skin="${ctx}/resources/css/skins/darkbrown.css">Dark Brown</a></li>
					<li><a href="#" title="Light Green" class="switch-skin lightgreen" data-skin="${ctx}/resources/css/skins/lightgreen.css">Light Green</a></li>
					<li><a href="#" title="Orange" class="switch-skin orange" data-skin="${ctx}/resources/css/skins/orange.css">Orange</a></li>
					<li><a href="#" title="Red" class="switch-skin red" data-skin="${ctx}/resources/css/skins/red.css">Red</a></li>
					<li><a href="#" title="Teal" class="switch-skin teal" data-skin="${ctx}/resources/css/skins/teal.css">Teal</a></li>
					<li><a href="#" title="Yellow" class="switch-skin yellow" data-skin="${ctx}/resources/css/skins/yellow.css">Yellow</a></li>
				</ul>
				<button type="button" class="switch-skin-full fulldark" data-skin="${ctx}/resources/css/skins/fulldark.css">Full Dark</button>
				<button type="button" class="switch-skin-full fullbright" data-skin="${ctx}/resources/css/skins/fullbright.css">Full Bright</button>
			</section>
			<label class="fancy-checkbox">
				<input type="checkbox" id="fixed-top-nav"><span>Fixed Top Navigation</span>
			</label>
			<p><a href="#" title="Reset Style" class="del-reset-style">Reset Style</a></p>
		</form>
	</div>
	<!-- END STYLE SWITCHER -->

	<!-- Javascript -->
	<script src="${ctx}/resources/js/modernizr.js"></script>
	<script src="//cdn.bootcss.com/bootstrap-tour/0.10.1/js/bootstrap-tour.js"></script>
	<script src="${ctx}/resources/js/king-common.js"></script>
	<script src="${ctx}/resources/js/deliswitch.js"></script>
	<script src="${ctx}/resources/js/jquery.easypiechart.min.js"></script>
	<script src="${ctx}/resources/js/raphael-2.1.0.min.js"></script>
	<script src="//cdn.bootcss.com/flot/0.8.3/jquery.flot.min.js"></script>
	<script src="//cdn.bootcss.com/flot/0.8.3/jquery.flot.resize.min.js"></script>
	<script src="//cdn.bootcss.com/flot/0.8.3/jquery.flot.time.min.js"></script>
	<script src="//cdn.bootcss.com/flot/0.8.3/jquery.flot.pie.min.js"></script>
	<script src="//cdn.bootcss.com/flot.tooltip/0.8.5/jquery.flot.tooltip.min.js"></script>
	<script src="http://libs.cncdn.cn/jquery-sparklines/2.1.2/jquery.sparkline.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.8/js/jquery.dataTables.min.js"></script>
	<script src="${ctx}/resources/js/dataTables.bootstrap.js"></script>
	<script src="${ctx}/resources/js/jquery.mapael.js"></script>
	<script src="${ctx}/resources/js/usa_states.js"></script>
	<script src="${ctx}/resources/js/king-chart-stat.js"></script>
	<script src="${ctx}/resources/js/king-table.js"></script>
	<script src="${ctx}/resources/js/king-components.js"></script>
</body>

</html>
