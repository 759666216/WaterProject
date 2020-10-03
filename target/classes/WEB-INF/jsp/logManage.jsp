<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title></title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="robots" content="all,follow">
	<!-- Bootstrap CSS-->
	<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
	<!-- Font Awesome CSS-->
	<link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
	<!-- Custom Font Icons CSS-->
	<link rel="stylesheet" href="css/font.css">
	<!-- Google fonts - Muli-->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Muli:300,400,700">
	<!-- theme stylesheet-->
	<link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
	<!-- Custom stylesheet - for your changes-->
	<link rel="stylesheet" href="css/custom.css">
	<!-- Favicon-->
	<link rel="shortcut icon" href="img/favicon.ico">
	<!-- Tweaks for older IEs--><!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>
<body>
<header class="header">
	<nav class="navbar navbar-expand-lg">
		<div class="search-panel">
			<div class="search-inner d-flex align-items-center justify-content-center">
				<div class="close-btn">Close <i class="fa fa-close"></i></div>
				<form id="searchForm" action="#">
					<div class="form-group">
						<input type="search" name="search" placeholder="What are you searching for...">
						<button type="submit" class="submit">Search</button>
					</div>
				</form>
			</div>
		</div>
		<div class="container-fluid d-flex align-items-center justify-content-between"  style="height:50px">
			<div class="navbar-header"  >
				<!-- Navbar Header-->
				<a  class="navbar-brand">
					<div class="brand-text brand-big visible text-uppercase" ><strong class="text-primary">水模拟及灾害管理团队</strong><strong>综合管控平台</strong></div>

					<!-- Sidebar Toggle Btn-->
					<!-- <button class="sidebar-toggle"><i class="fa fa-long-arrow-left"></i></button> -->
			</div>
			<div class="right-menu list-inline no-margin-bottom">
				<!-- Languages dropdown    -->
				<div class="list-inline-item dropdown"><a id="languages" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link language dropdown-toggle"><img src="img/flags/16/GB.png" alt="English"><span class="d-none d-sm-inline-block">校内</span></a>
					<div aria-labelledby="languages" class="dropdown-menu"><a rel="nofollow" href="#" class="dropdown-item"> <img src="img/flags/16/DE.png" alt="English" class="mr-2"><span>小于河</span></a><a rel="nofollow" href="#" class="dropdown-item"> <img src="img/flags/16/FR.png" alt="English" class="mr-2"><span>沣西  </span></a></div>
				</div>
				<!-- Log out               -->
				<div class="list-inline-item logout">                   <a id="logout" href="login.html" class="nav-link"> <span class="d-none d-sm-inline">登出 </span><i class="icon-logout"></i></a></div>
			</div>
		</div>
	</nav>
</header>
<div class="d-flex align-items-stretch">
	<!-- Sidebar Navigation-->
	<nav id="sidebar">
		<!-- Sidebar Header-->
		<div class="sidebar-header d-flex align-items-center">
			<div class="avatar"><img src="img/avatar-6.jpg" alt="..." class="img-fluid rounded-circle"></div>
			<div class="title">
				<h1 class="h5">陈光照</h1>
				<p>团队学生用户</p>
			</div>
		</div>
		<!-- Sidebar Navidation Menus-->
		<!-- <span class="heading">Main</span> -->
		<ul class="list-unstyled">
			<li><a href="index"> <i class="icon-home"></i>首页</a></li>
			<li><a> <i class="icon-writing-whiteboard"></i>实时监控</a></li>
			<li><a> <i class="fa fa-bar-chart"></i>数据统计 </a></li>
			<li><a> <i class="icon-padnote"></i>洪涝预报</a></li>
			<li> <a href="#"> <i class="icon-writing-whiteboard"></i>远程操控</a></li>
			<li> <a href="#"> <i class="icon-user-1"></i>人员管理 </a></li>
			<li class="active"> <a href="logManage"> <i class="icon-contract"></i>日志管理 </a></li>
			<li><a href="#"> <i class="icon-logout"></i>登出</a></li>
		</ul>
		<!-- <span class="heading">Extras</span> -->
	</nav>
	<!-- Sidebar Navigation end-->
	<div class="page-content">
		<!-- Page Header-->
		<div class="page-header no-margin-bottom">
			<div class="container-fluid">
				<h2 class="h5 no-margin-bottom">日志管理</h2>
			</div>
		</div>
		<!-- Breadcrumb-->
		<div class="container-fluid">
			<ul class="breadcrumb">
				<li class="breadcrumb-item"><a href="index.html">管控平台</a></li>
				<li class="breadcrumb-item active">日志管理        </li>
			</ul>
		</div>
		<section class="no-padding-top">
			<div class="container-fluid">
				<div class="row">

					<div class="col-lg-12">
						<div class="block margin-bottom-sm">
							<div class="title"><strong>记录日志</strong></div>
							<div class="table-responsive">
								<table class="table">
									<thead>
									<tr>
										<th>序号</th>
										<th>用户账号</th>
										<th>用户IP</th>
										<th>操作</th>
										<th>时间</th>
									</tr>
									</thead>
									<tbody>
									<tr>
										<th scope="row">1</th>
										<td>admin</td>
										<td>10.102.11.213</td>
										<td>下载-《2018年各月份降雨》文件</td>
										<td>2019-11-29 10:08:06</td>
									</tr>
									<tr>
										<th scope="row">2</th>
										<td>admin</td>
										<td>10.102.11.213</td>
										<td>上传-《2018年各月份降雨》文件</td>
										<td>2019-11-29 10:08:01</td>
									</tr>
									<tr>
										<th scope="row">3</th>
										<td>admin</td>
										<td>10.102.11.213</td>
										<td>登录</td>
										<td>2019-11-29 10:07:01</td>
									</tr>
									<tr>
										<th scope="row">4</th>
										<td>expert</td>
										<td>10.102.11.11</td>
										<td>登录</td>
										<td>2019-11-29 10:07:01</td>
									</tr>
									<tr>
										<th scope="row">5</th>
										<td>cgz</td>
										<td>10.102.11.19</td>
										<td>上传-《西安理工大学检测设备管理》文件</td>
										<td>2019-11-29 10:05:33</td>
									</tr>
									<tr>
										<th scope="row">6</th>
										<td>cgz</td>
										<td>10.102.11.19</td>
										<td>登录</td>
										<td>2019-11-29 10:05:01</td>
									</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<%--<div class="col-lg-6">
						<div class="block margin-bottom-sm">
							<div class="title"><strong>Striped Table</strong></div>
							<div class="table-responsive">
								<table class="table table-striped">
									<thead>
									<tr>
										<th>#</th>
										<th>First Name</th>
										<th>Last Name</th>
										<th>Username</th>
									</tr>
									</thead>
									<tbody>
									<tr>
										<th scope="row">1</th>
										<td>Mark</td>
										<td>Otto</td>
										<td>@mdo</td>
									</tr>
									<tr>
										<th scope="row">2</th>
										<td>Jacob</td>
										<td>Thornton</td>
										<td>@fat</td>
									</tr>
									<tr>
										<th scope="row">3</th>
										<td>Larry</td>
										<td>the Bird</td>
										<td>@twitter  </td>
									</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>--%>


					<%--<div class="col-lg-6">
						<div class="block">
							<div class="title"><strong>Striped table with hover effect</strong></div>
							<div class="table-responsive">
								<table class="table table-striped table-hover">
									<thead>
									<tr>
										<th>#</th>
										<th>First Name</th>
										<th>Last Name</th>
										<th>Username</th>
									</tr>
									</thead>
									<tbody>
									<tr>
										<th scope="row">1</th>
										<td>Mark</td>
										<td>Otto</td>
										<td>@mdo</td>
									</tr>
									<tr>
										<th scope="row">2</th>
										<td>Jacob</td>
										<td>Thornton</td>
										<td>@fat</td>
									</tr>
									<tr>
										<th scope="row">3</th>
										<td>Larry</td>
										<td>the Bird</td>
										<td>@twitter       </td>
									</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>--%>


					<%--<div class="col-lg-6">
						<div class="block">
							<div class="title"><strong>Compact Table</strong></div>
							<div class="table-responsive">
								<table class="table table-striped table-sm">
									<thead>
									<tr>
										<th>#</th>
										<th>First Name</th>
										<th>Last Name</th>
										<th>Username</th>
									</tr>
									</thead>
									<tbody>
									<tr>
										<th scope="row">1</th>
										<td>Mark</td>
										<td>Otto</td>
										<td>@mdo</td>
									</tr>
									<tr>
										<th scope="row">2</th>
										<td>Jacob</td>
										<td>Thornton</td>
										<td>@fat</td>
									</tr>
									<tr>
										<th scope="row">3</th>
										<td>Larry</td>
										<td>the Bird</td>
										<td>@twitter      </td>
									</tr>
									<tr>
										<th scope="row">4</th>
										<td>Mark</td>
										<td>Otto</td>
										<td>@mdo</td>
									</tr>
									<tr>
										<th scope="row">5</th>
										<td>Jacob</td>
										<td>Thornton</td>
										<td>@fat</td>
									</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>--%>


				</div>
			</div>
		</section>
		<footer class="footer">
			<div class="footer__block block no-margin-bottom">
				<div class="container-fluid text-center">
					<!-- Please do not remove the backlink to us unless you support us at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
					<p class="no-margin-bottom">Copyright &copy; 2019.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
				</div>
			</div>
		</footer>
	</div>
</div>
<!-- JavaScript files-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/popper.js/umd/popper.min.js"> </script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
<script src="vendor/chart.js/Chart.min.js"></script>
<script src="vendor/jquery-validation/jquery.validate.min.js"></script>
<script src="js/front.js"></script>
</body>
</html>