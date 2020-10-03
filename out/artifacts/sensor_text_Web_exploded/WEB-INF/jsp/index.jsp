<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Home</title>
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

	<style>
		.statistic-block strong {
			font-size: 1.5rem;
		}
	</style>

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
					<div aria-labelledby="languages" class="dropdown-menu"><a rel="nofollow" href="#" class="dropdown-item"> <img src="img/flags/16/DE.png" alt="English" class="mr-2"><span>小峪河</span></a><a rel="nofollow" href="#" class="dropdown-item"> <img src="img/flags/16/FR.png" alt="English" class="mr-2"><span>沣西  </span></a></div>
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
			<li class="active"><a href="index"> <i class="icon-home"></i>首页</a></li>
			<li><a> <i class="icon-writing-whiteboard"></i>实时监控</a></li>
			<li><a> <i class="fa fa-bar-chart"></i>数据统计 </a></li>
			<li><a> <i class="icon-padnote"></i>洪涝预报</a></li>
			<li> <a href="#"> <i class="icon-writing-whiteboard"></i>远程操控</a></li>
			<li> <a href="#"> <i class="icon-user-1"></i>人员管理 </a></li>
			<li> <a href="logManage"> <i class="icon-contract"></i>日志管理 </a></li>
			<li><a href="#"> <i class="icon-logout"></i>登出</a></li>
		</ul>
		<!-- <span class="heading">Extras</span> -->
	</nav>
	<!-- Sidebar Navigation end-->
	<div class="page-content">
		<div class="page-header">
			<div class="container-fluid">
				<h2 class="h5 no-margin-bottom">首页</h2>
			</div>
		</div>

		<section class="no-padding-top no-padding-bottom">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-3 col-sm-6">
						<div class="statistic-block block">
							<div class="progress-details d-flex align-items-end justify-content-between">
								<div>
									<img src="icons-out/temperature.png" height="45px" width="45px">
								</div>
								<div>
									<strong>温度</strong>
								</div>
								<div class="number dashtext-1">-1</div>
							</div>
							<!-- <div class="progress progress-template"> -->
							<!-- <div role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" class="progress-bar progress-bar-template dashbg-1"></div> -->
							<!-- </div> -->
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="statistic-block block">
							<div class="progress-details d-flex align-items-end justify-content-between">
								<div>
									<img src="icons-out/humidity.png" height="45px" width="45px">
								</div>
								<div>
									<strong>湿度</strong>
								</div>
								<div class="number dashtext-2">40%</div>
							</div>
							<!-- <div class="progress progress-template"> -->
							<!-- <div role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" class="progress-bar progress-bar-template dashbg-2"></div> -->
							<!-- </div> -->
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="statistic-block block">
							<div class="progress-details d-flex align-items-end justify-content-between">
								<div class="title">
									<img src="icons-out/windspeed.png" height="45px" width="45px">
								</div>
								<div>
									<strong>南风</strong>
								</div>
								<div class="number dashtext-3">4.0m/s</div>
							</div>
							<!-- <div class="progress progress-template"> -->
							<!-- <div role="progressbar" style="width: 55%" aria-valuenow="55" aria-valuemin="0" aria-valuemax="100" class="progress-bar progress-bar-template dashbg-3"></div> -->
							<!-- </div> -->
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="statistic-block block">
							<div class="progress-details d-flex align-items-end justify-content-between">
								<div class="title">
									<img src="icons-out/pressure.png" height="45px" width="45px">
								</div>
								<div>
									<strong>气压</strong>
								</div>
								<div class="number dashtext-4">1000kpa</div>
							</div>
							<!-- <div class="progress progress-template"> -->
							<!-- <div role="progressbar" style="width: 35%" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100" class="progress-bar progress-bar-template dashbg-4"></div> -->
							<!-- </div> -->
						</div>
					</div>
				</div>
			</div>
		</section>



		<section class="no-padding-bottom">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-4">
						<div class="bar-chart block no-margin-bottom">
							<canvas id="barChartExample1"></canvas>
						</div>
						<div class="bar-chart block">
							<canvas id="barChartExample2"></canvas>
						</div>
					</div>
					<div class="col-lg-8">
						<div class="line-cahrt block">
							<canvas id="lineCahrt"></canvas>
						</div>
					</div>
				</div>
			</div>
		</section>



		<section class="margin-bottom-sm">
			<div class="container-fluid">
				<div class="row d-flex align-items-stretch">
					<div class="col-lg-4">
						<div class="stats-with-chart-1 block">
							<div class="title"> <strong class="d-block">DATA1</strong><span class="d-block">data1</span></div>
							<div class="row d-flex align-items-end justify-content-between">
								<div class="col-5">
									<div class="text"><strong class="d-block dashtext-3">740</strong><span class="d-block">June 2019</span><small class="d-block">Spring</small></div>
								</div>
								<div class="col-7">
									<div class="bar-chart chart">
										<canvas id="salesBarChart1"></canvas>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="stats-with-chart-1 block">
							<div class="title"> <strong class="d-block">DATA2</strong><span class="d-block">data2</span></div>
							<div class="row d-flex align-items-end justify-content-between">
								<div class="col-4">
									<div class="text"><strong class="d-block dashtext-1">457</strong><span class="d-block">July 2019</span><small class="d-block">Summer</small></div>
								</div>
								<div class="col-8">
									<div class="bar-chart chart">
										<canvas id="visitPieChart"></canvas>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="stats-with-chart-1 block">
							<div class="title"> <strong class="d-block">DATA3</strong><span class="d-block">data3</span></div>
							<div class="row d-flex align-items-end justify-content-between">
								<div class="col-5">
									<div class="text"><strong class="d-block dashtext-2">80%</strong><span class="d-block">May 2019</span><small class="d-block">Winter</small></div>
								</div>
								<div class="col-7">
									<div class="bar-chart chart">
										<canvas id="salesBarChart2"></canvas>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section>
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-4">
						<div class="stats-with-chart-2 block">
							<div class="title"><strong class="d-block">DATA4</strong><span class="d-block">data4</span></div>
							<div class="piechart chart">
								<canvas id="pieChartHome1"></canvas>
								<div class="text"><strong class="d-block">2.145</strong><span class="d-block">Accout</span></div>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="stats-with-chart-2 block">
							<div class="title"><strong class="d-block">DATA5</strong><span class="d-block">data5</span></div>
							<div class="piechart chart">
								<canvas id="pieChartHome2"></canvas>
								<div class="text"><strong class="d-block">7.784</strong><span class="d-block">Accout</span></div>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="stats-with-chart-2 block">
							<div class="title"><strong class="d-block">DATA6</strong><span class="d-block">data6</span></div>
							<div class="piechart chart">
								<canvas id="pieChartHome3"></canvas>
								<div class="text"><strong class="d-block">4.957</strong><span class="d-block">Accout</span></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<footer class="footer">
			<div class="footer__block block no-margin-bottom">
				<div class="container-fluid text-center">
					<p class="no-margin-bottom">Copyright &copy; Hou Jingming(E-mail:jingming.hou@xaut.edu.cn)  - Idea from <a href= title="网页模板" >XUAT</a></p>
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
<script src="js/charts-home.js"></script>
<script src="js/front.js"></script>
</body>
</html>