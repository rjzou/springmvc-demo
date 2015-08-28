<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/tag.jsp"%>
<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie ie9" lang="en" class="no-js"> <![endif]-->
<!--[if !(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->

<head>
	<title>出租房智能管理系统V1.0</title>
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
	<link rel="shortcut icon" href="${ctx}/resources/images/favicon.png">
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
						<a href="index.html"><img src="${ctx}/resources/images/kingadmin-logo-white.png" alt="KingAdmin - Admin Dashboard" /></a>
						<h1 class="sr-only">KingAdmin Admin Dashboard</h1>
					</div>
					<!-- end logo -->
					<div class="col-md-10">
						<div class="row">
							<div class="col-md-3">
								<!-- search box -->
								<div id="tour-searchbox" class="input-group searchbox">
									<input type="search" class="form-control" placeholder="enter keyword here...">
									<span class="input-group-btn">
										<button class="btn btn-default" type="button"><i class="fa fa-search"></i></button>
									</span>
								</div>
								<!-- end search box -->
							</div>
							<div class="col-md-9">
								<div class="top-bar-right">
									<!-- responsive menu bar icon -->
									<a href="#" class="hidden-md hidden-lg main-nav-toggle"><i class="fa fa-bars"></i></a>
									<!-- end responsive menu bar icon -->
									<button type="button" id="start-tour" class="btn btn-link"><i class="fa fa-refresh"></i> Start Tour</button>
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
												<span class="name">Stacy Rose</span> <span class="caret"></span>
											</a>
											<ul class="dropdown-menu" role="menu">
												<li>
													<a href="#">
														<i class="fa fa-user"></i>
														<span class="text">Profile</span>
													</a>
												</li>
												<li>
													<a href="#">
														<i class="fa fa-cog"></i>
														<span class="text">Settings</span>
													</a>
												</li>
												<li>
													<a href="#">
														<i class="fa fa-power-off"></i>
														<span class="text">Logout</span>
													</a>
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
								<li class="active">
									<a href="#" class="js-sub-menu-toggle">
										<i class="fa fa-dashboard fa-fw"></i><span class="text">Dashboard</span>
										<i class="toggle-icon fa fa-angle-down"></i>
									</a>
									<ul class="sub-menu open">
										<li class="active"><a href="index.html"><span class="text">Dashboard v1</span></a></li>
										<li><a href="index-dashboard-v2.html"><span class="text">Dashboard v2 <span class="badge element-bg-color-blue">New</span></span></a></li>
									</ul>
								</li>
								<li>
									<a href="#" class="js-sub-menu-toggle">
										<i class="fa fa-clipboard fa-fw"></i><span class="text">Pages</span>
										<i class="toggle-icon fa fa-angle-left"></i>
									</a>
									<ul class="sub-menu ">
										<li><a href="page-profile.html"><span class="text">Profile</span></a></li>
										<li><a href="page-invoice.html"><span class="text">Invoice</span></a></li>
										<li><a href="page-knowledgebase.html"><span class="text">Knowledge Base</span></a></li>
										<li><a href="page-inbox.html"><span class="text">Inbox</span></a></li>
										<li><a href="page-new-message.html"><span class="text">New Message</span></a></li>
										<li><a href="page-view-message.html"><span class="text">View Message</span></a></li>
										<li><a href="page-search-result.html"><span class="text">Search Result</span></a></li>
										<li><a href="page-submit-ticket.html"><span class="text">Submit Ticket</span></a></li>
										<li><a href="page-file-manager.html"><span class="text">File Manager <span class="badge element-bg-color-blue">New</span></span></a></li>
										<li><a href="page-projects.html"><span class="text">Projects <span class="badge element-bg-color-blue">New</span></span></a></li>
										<li><a href="page-project-detail.html"><span class="text">Project Detail <span class="badge element-bg-color-blue">New</span></span></a></li>
										<li><a href="page-faq.html"><span class="text">FAQ <span class="badge element-bg-color-blue">New</span></span></a></li>
										<li><a href="page-register.html"><span class="text">Register</span></a></li>
										<li><a href="page-login.html"><span class="text">Login</span></a></li>
										<li><a href="page-404.html"><span class="text">404</span></a></li>
										<li><a href="page-blank.html"><span class="text">Blank Page</span></a></li>
									</ul>
								</li>
								<li>
									<a href="#" class="js-sub-menu-toggle">
										<i class="fa fa-bar-chart-o fw"></i><span class="text">Charts &amp; Statistics</span>
										<i class="toggle-icon fa fa-angle-left"></i>
									</a>
									<ul class="sub-menu ">
										<li><a href="charts-statistics.html"><span class="text">Charts</span></a></li>
										<li><a href="charts-statistics-interactive.html"><span class="text">Interactive Charts</span></a></li>
										<li><a href="charts-statistics-real-time.html"><span class="text">Realtime Charts</span></a></li>
										<li><a href="charts-d3charts.html"><span class="text">D3 Charts</span></a></li>
									</ul>
								</li>
								<li>
									<a href="#" class="js-sub-menu-toggle">
										<i class="fa fa-edit fw"></i><span class="text">Forms</span>
										<i class="toggle-icon fa fa-angle-left"></i>
									</a>
									<ul class="sub-menu ">
										<li><a href="form-inplace-editing.html"><span class="text">In-place Editing</span></a></li>
										<li><a href="form-elements.html"><span class="text">Form Elements</span></a></li>
										<li><a href="form-layouts.html"><span class="text">Form Layouts</span></a></li>
										<li><a href="form-bootstrap-elements.html"><span class="text">Bootstrap Elements</span></a></li>
										<li><a href="form-validations.html"><span class="text">Validation</span></a></li>
										<li><a href="form-file-upload.html"><span class="text">File Upload</span></a></li>
										<li><a href="form-text-editor.html"><span class="text">Text Editor</span></a></li>
									</ul>
								</li>
								<li>
									<a href="#" class="js-sub-menu-toggle">
										<i class="fa fa-list-alt fw"></i><span class="text">UI Elements</span>
										<i class="toggle-icon fa fa-angle-left"></i>
									</a>
									<ul class="sub-menu ">
										<li><a href="ui-elements-general.html"><span class="text">General Elements</span></a></li>
										<li><a href="ui-elements-tabs.html"><span class="text">Tabs</span></a></li>
										<li><a href="ui-elements-buttons.html"><span class="text">Buttons</span></a></li>
										<li><a href="ui-elements-icons.html"><span class="text">Icons <span class="badge element-bg-color-blue">Updated</span></span></a></li>
										<li><a href="ui-elements-flash-message.html"><span class="text">Flash Message</span></a></li>
									</ul>
								</li>
								<li>
									<a href="widgets.html">
										<i class="fa fa-puzzle-piece fa-fw"></i><span class="text">Widgets <span class="badge element-bg-color-blue">Updated</span></span>
									</a>
								</li>
								<li>
									<a href="#" class="js-sub-menu-toggle">
										<i class="fa fa-gears fw"></i><span class="text">Components</span>
										<i class="toggle-icon fa fa-angle-left"></i>
									</a>
									<ul class="sub-menu ">
										<li><a href="components-wizard.html"><span class="text">Wizard (with validation)</span></a></li>
										<li><a href="components-calendar.html"><span class="text">Calendar</span></a></li>
										<li><a href="components-maps.html"><span class="text">Maps</span></a></li>
										<li><a href="components-gallery.html"><span class="text">Gallery</span></a></li>
										<li><a href="components-tree-view.html"><span class="text">Tree View <span class="badge element-bg-color-blue">New</span></span></a></li>
									</ul>
								</li>
								<li>
									<a href="#" class="js-sub-menu-toggle">
										<i class="fa fa-table fw"></i><span class="text">Tables</span>
										<i class="toggle-icon fa fa-angle-left"></i>
									</a>
									<ul class="sub-menu ">
										<li><a href="tables-static-table.html"><span class="text">Static Table</span></a></li>
										<li><a href="tables-dynamic-table.html"><span class="text">Dynamic Table</span></a></li>
									</ul>
								</li>
								<li><a href="typography.html"><i class="fa fa-font fa-fw"></i><span class="text">Typography</span></a></li>
								<li>
									<a href="#" class="js-sub-menu-toggle"><i class="fa fa-bars"></i>
										<span class="text">Menu Lvl 1 <span class="badge element-bg-color-blue">New</span></span>
										<i class="toggle-icon fa fa-angle-left"></i>
									</a>
									<ul class="sub-menu">
										<li class="">
											<a href="#" class="js-sub-menu-toggle">
												<span class="text">Menu Lvl 2</span>
												<i class="toggle-icon fa fa-angle-left"></i>
											</a>
											<ul class="sub-menu">
												<li><a href="#">Menu Lvl 3</a></li>
												<li><a href="#">Menu Lvl 3</a></li>
												<li><a href="#">Menu Lvl 3</a></li>
											</ul>
										</li>
										<li>
											<a href="#">
												<span class="text">Menu Lvl 2</span>
											</a>
										</li>
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
						<span>If you <strong>can't see the logo</strong> on the top left, please reset the style on right style switcher (for upgraded theme only).</span>
						<button type="button" class="close">&times;</button>
					</div>
					<!-- end top general alert -->
					<!-- content-wrapper -->
					<div class="col-md-10 content-wrapper">
						<div class="row">
							<div class="col-md-4 ">
								<ul class="breadcrumb">
									<li><i class="fa fa-home"></i><a href="#">Home</a></li>
									<li class="active">Dashboard</li>
								</ul>
							</div>
						</div>
						<!-- main -->
						<div class="content">
							<div class="main-content">
								<!-- WIDGET TICKET TABLE -->
								<div class="widget widget-table">
									<div class="widget-header">
										<h3><i class="fa fa-group"></i> Support Tickets</h3> <em>- List of Support Tickets</em>
										<div class="btn-group widget-header-toolbar">
											<a href="#" title="Focus" class="btn-borderless btn-focus"><i class="fa fa-eye"></i></a>
											<a href="#" title="Expand/Collapse" class="btn-borderless btn-toggle-expand"><i class="fa fa-chevron-up"></i></a>
											<a href="#" title="Remove" class="btn-borderless btn-remove"><i class="fa fa-times"></i></a>
										</div>
									</div>
									<div class="widget-content">
										<!-- Table -->
			  <div class="table-responsive">
				  <table class="table table-striped  table-condensed">
	              <thead>
	                <tr>
	                  <th>#</th>
	                  <th>楼栋/房间号/房型</th>
	                  <th>客户姓名</th>
	                  <th>上月收租时间</th>
	                  <th>上月实收费用</th>
	                  <th>本月应收租日</th>
	                  <th>操作</th>
	                </tr>
	              </thead>
	              <tbody>
	              <tr>
								<td>1</td>
								<td>新房/401/单间</td>
								<td>401租客</td>
								<td>2015-7-15</td>
								<td>340.00</td>
								<td>26</td>
								<td>
									<a class="btn btn-primary btn-sm" href="/myboss/room_tomoney?houseid=b8dadd82-44c7-11e5-b983-e3f00749665c&roomno=401" role="button">收房租</a>
								</td>
							</tr>
						<tr>
								<td>2</td>
								<td>新房/305/单间</td>
								<td>305租客</td>
								<td>2015-7-24</td>
								<td>653.70</td>
								<td>24</td>
								<td>
									<a class="btn btn-primary btn-sm" href="/myboss/room_tomoney?houseid=b8dadd82-44c7-11e5-b983-e3f00749665c&roomno=305" role="button">收房租</a>
								</td>
							</tr>
						<tr>
								<td>3</td>
								<td>新房/605/单间</td>
								<td>605租客</td>
								<td>2015-7-30</td>
								<td>465.00</td>
								<td>30</td>
								<td>
									<a class="btn btn-primary btn-sm" href="/myboss/room_tomoney?houseid=b8dadd82-44c7-11e5-b983-e3f00749665c&roomno=605" role="button">收房租</a>
								</td>
							</tr>
						</tbody>
	            </table>
            </div>
									</div>
								</div>
								<!-- END WIDGET TICKET TABLE -->
							</div>
							<!-- /main-content -->
						</div>
						<!-- /main -->
					</div>
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
		&copy; 2014-2015 The Develovers
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
	<script src="${ctx}/resources/js/jquery-2.1.0.min.js"></script>
	<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js?Ver=20150821"></script>
	<script src="${ctx}/resources/js/modernizr.js"></script>
	<script src="${ctx}/resources/js/bootstrap-tour.custom.js"></script>
	<script src="${ctx}/resources/js/king-common.js"></script>
	<script src="${ctx}/resources/js/deliswitch.js"></script>
	<script src="${ctx}/resources/js/jquery.easypiechart.min.js"></script>
	<script src="${ctx}/resources/js/raphael-2.1.0.min.js"></script>
	<script src="${ctx}/resources/js/jquery.flot.min.js"></script>
	<script src="${ctx}/resources/js/jquery.flot.resize.min.js"></script>
	<script src="${ctx}/resources/js/jquery.flot.time.min.js"></script>
	<script src="${ctx}/resources/js/jquery.flot.pie.min.js"></script>
	<script src="${ctx}/resources/js/jquery.flot.tooltip.min.js"></script>
	<script src="${ctx}/resources/js/jquery.sparkline.min.js"></script>
	<script src="${ctx}/resources/js/jquery.dataTables.min.js"></script>
	<script src="${ctx}/resources/js/dataTables.bootstrap.js"></script>
	<script src="${ctx}/resources/js/jquery.mapael.js"></script>
	<script src="${ctx}/resources/js/usa_states.js"></script>
	<script src="${ctx}/resources/js/king-chart-stat.js"></script>
	<script src="${ctx}/resources/js/king-table.js"></script>
	<script src="${ctx}/resources/js/king-components.js"></script>
</body>

</html>
