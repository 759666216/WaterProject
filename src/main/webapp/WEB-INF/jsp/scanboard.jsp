<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<title>汇总看板</title>
<%--	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css" />--%>
<link rel="stylesheet" type="text/css" href="css/reset.css" />
<link rel="stylesheet" type="text/css" href="css/scanboard.css" />
<link rel="stylesheet" type="text/css" href="css/animsition.css" />
<link rel="stylesheet" type="text/css" href="css/jquery.shCircleLoader.css" />
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.css" />

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.shCircleLoader-min.js"></script>
</head>
<body>
	<div id="loader"></div>
	<script type="text/javascript">
		$('#loader').shCircleLoader({color: "#00deff"});
	</script>
	<!--Top Start!-->
	<div class="scanboardWp animsition">
		<div id="top">
			<div class="wp clearfix">
				<div class="left pageTit">
<%--					<a class="summaryBtn" href="javascript:;">监测基地总览</a>--%>
				</div>
				<div class="center topLogo">
					<a href="#"><img src="images/20191203002.png"></a>
				</div>
				<div class="right topBar">
					<div class="topTime">时间加载中...</div>
					<div class="clearfix">
						<a href="login_page" class="signOut fr">进入后台</a>
						<div class="company fr">
						<h3>小峪河站点一</h3>
						<div class="dropdown">
							<a href="#">理工大站点二</a>
						</div>
					</div>
					</div>
				</div>
			</div>
		</div>
		<!--Top End!-->
		
		<!--Main Start!-->
		<div id="main" class="wp clearfix">
			<div class="cont left">
				<!--累计降雨统计-->
				<div class="item waybill" style="height: 30%">
					<div class="itemTit">
						<span class="border-yellow">累计降雨统计</span>
					</div>
					<div class="itemCon itembg">
			    	<div class="progress" progress="100%">
						<div >
							<h3 class="clearfix"><span>年降雨总量</span><i>1360mm</i></h3>
							<div class="progressBar">
								<span></span>
							</div>
							<h4>0%</h4>
						</div>
					</div>
						<div class="progress" progress="60%">
							<h3 class="clearfix"><span>降雨天数</span><i>80天</i></h3>
							<div class="progressBar">
								<span></span>
							</div>
							<h4>0%</h4>
						</div>
						<div class="progress" progress="60%">
							<h3 class="clearfix"><span>最大降雨场次</span><i>50mm</i></h3>
							<div class="progressBar">
								<span></span>
							</div>
							<h4>0%</h4>
						</div>
					</div>
				</div>

				<!--各阶段平均用时统计-->
				<div class="item" style="height: 30%">
					<div class="itemTit">
						<span class="border-green">监测统计</span>
					</div>
					<div class="itemCon">
						<ul class="listStyle">
							<li class="clearfix">
								<span>传感器个数</span>
								<span><strong>4</strong>个</span>
							</li>
							<li class="clearfix">
								<span>设备总数</span>
								<span><strong>7</strong>个</span>
							</li>
							<li class="clearfix">
								<span>监测时长</span>
								<span><strong>14</strong>天</span>
							</li>
							<li class="clearfix">
								<span>监测面积</span>
								<span><strong>756</strong>km2</span>
							</li>
							<li class="clearfix">
								<span>数据总量</span>
								<span><strong>5</strong>GB</span>
							</li>
						</ul>
					</div>
				</div>

				<!--人员信息-->
				<div class="item" style="height: 30%">
					<div class="itemTit">
						<span class="border-blue">月降雨量</span>
					</div>
					<div class="itemCon itembg">
						<ul class="listStyle">
							<li class="clearfix">
								<span>一月： <strong>50</strong>mm</span>
								<span>二月： <strong>36</strong>mm</span>
								<span>三月： <strong>6</strong>mm</span>
								<span>四月： <strong>15</strong>mm</span>
								<span>五月： <strong>20</strong>mm</span>
								<span>六月： <strong>29</strong>mm</span>
								<span>七月： <strong>3</strong>mm</span>
								<span>八月： <strong>102</strong>mm</span>
								<span>九月： <strong>84</strong>mm</span>
								<span>十月： <strong>70</strong>mm</span>
								<span>十一月：<strong>10</strong>mm</span>
								<span>十二月：<strong>10</strong>mm</span>
							</li>
						</ul>
					</div>
				</div>
			</div>

			<div class="cont center">
				<div class="centerWp" >
					<!--中间大地图-->
					<div class="mapContainer" style="height: 60%; width: 100%">
						<div class="btnLayer">
							<div class="search">
								<div class="searchInner">
									<a href="javascript:;" class="searchBtn"><span class="icoSearch"></span></a>
									<form class="searchForm">
										<button class="icoSearch"></button>
										<input type="text" name="" placeholder="请搜索传感器">
									</form>
								</div>
							</div>
					    	</div>
						<div id="myMap" class="item" style="height: 100%; width: 100%"></div>
					</div>
					
					<!--月运单量统计图-->
					<div class="billChart item" style="margin-top: 25px">
						<div class="itemTit">
							<span class="border-blue">月液位计变化图<small>(2020年9月)</small></span>
						</div>
						<div id="myChart1"></div>
					</div>
				</div>
			</div>

			<div class="cont right">
				<div class="item basicInfo" style="height: 30%">
					<div class="itemTit">
						<span class="border-green">土壤信息</span>
					</div>
					<div class="itemCon itembg">
						<div class="infoPie">
							<ul class="clearfix">
<%--								<li id="mypopover" class="color-yellow" data-toggle="popover">--%>
								<li class="color-yellow pieData" data-toggle="modal" data-target="#myModal">
									<span class="border-yellow" id="indicator11">0</span>
									<p>土壤温度</p>
								</li>
<%--								<li class="color-green" data-toggle="popover">--%>
									<li class="color-green pieData" data-toggle="modal" data-target="#myModal">
									<span class="border-green" id="indicator21" >0</span>
									<p>土壤湿度</p>
								</li>
<%--								<li class="color-blue" data-toggle="popover">--%>
								<li class="color-yellow pieData" data-toggle="modal" data-target="#myModal">
									<span class="border-blue" id="indicator31" >0</span>
									<p>阳光辐射</p>
								</li>
							</ul>
							<div id="indicatorContainer1"></div>
						</div>
					</div>
				</div>

				<!--基本信息-->
				<div class="item basicInfo" style="height: 30%">
					<div class="itemTit">
						<span class="border-green">降雨相关信息</span>
					</div>
					<div class="itemCon itembg">
						<div class="infoPie">
							<ul class="clearfix">
<%--								<li class="color-yellow" data-toggle="popover">--%>
									<li class="color-yellow pieData" data-toggle="modal" data-target="#myModal">
									<span class="border-yellow" id="indicator12" total="60">0</span>
									<p>当前降雨</p>
								</li>
<%--								<li class="color-green" data-toggle="popover">--%>
									<li class="color-green pieData" data-toggle="modal" data-target="#myModal">
									<span class="border-green" id="indicator22" total="65">0</span>
									<p>平均风速</p>
								</li>
<%--								<li class="color-blue" data-toggle="popover">--%>
									<li class="color-blue pieData" data-toggle="modal" data-target="#myModal">
									<span class="border-blue" id="indicator32" total="100">0</span>
									<p>空气湿度</p>
								</li>
							</ul>
							<div id="indicatorContainer2"></div>
						</div>
					</div>
				</div>

				<!--运单状态-->
				<div class="item billState" style="height: 30%">
					<div class="itemTit">
						<span class="border-green">运行状态</span>
					</div>
					<div class="itemCon">
						<div class="StateBox">
							<div class="StateTit">
								<span>传感器编号</span>
								<span>传感器类型</span>
								<span>电池电量</span>
							</div>
							<%--<div id="FontScroll">--%>
							<div id=""> <%--去除此ID取消字体轮滚--%>
								<ul>
									<li>
<%--										这里class加上fontInner下面出来横线--%>
										<div class="clearfix">
											<span>16110900049544</span>
											<span>温湿度</span>
											<span>
												<div class="progress" progress="80%">
													<div class="progressBar">
														<span></span>
													</div>
													<h3><i><h4></h4></i></h3>
												</div>
											</span>
										</div>
									</li>
									<li>
										<div class="clearfix">
											<span>18012200073711</span>
											<span>温湿度</span>
											<span>
												<div class="progress" progress="49%">
													<div class="progressBar">
														<span></span>
													</div>
													<h3><i><h4></h4></i></h3>
												</div>
											</span>
										</div>
									</li>
									<li>
										<div class="clearfix">
											<span>18012200073713</span>
											<span>降雨</span>
											<span>
												<div class="progress" progress="80%">
													<div class="progressBar">
														<span></span>
													</div>
													<h3><i><h4></h4></i></h3>
												</div>
											</span>
										</div>
									</li>
									<li>
										<div class="clearfix">
											<span>ZC1712120023</span>
											<span>未服役</span>
											<span>
												<div class="progress" progress="67%">
													<div class="progressBar">
														<span></span>
													</div>
													<h3><i><h4></h4></i></h3>
												</div>
											</span>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--Main End!-->
	</div>

	<div class="filterbg"></div>
	<div class="popup">
		<a href="javascript:;" class="popupClose"></a>
		<div class="summary">
			<div class="summaryTop">
				<div id="summaryPie1" class="summaryPie"></div>
				<div id="summaryPie2" class="summaryPie"></div>
				<div id="summaryPie3" class="summaryPie"></div>
			</div>
			<div class="summaryBottom">
				<div class="summaryBar">
					<div class="summaryTit">
						<img src="images/tit12.png">
					</div>
					<div id="summaryBar"></div>
				</div>
				
				<div class="summaryLine">
					<div class="summaryTit">
						<img src="images/tit22.png">
					</div>
					<div id="summaryLine"></div>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="myModalLabel">详情</h4>
				</div>
				<div class="modal-body">
					<div id="trwd" style="height:400px;"></div>
				</div>
				<div class="modal-footer">
<%--					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>--%>
					<button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>
<%--<canvas id="canvas" style="position: absolute;top: 0;left: 0;height: 1400px"></canvas>--%>
</body>
<%--<script type="text/javascript" src="js/bg.js"></script>--%>
<script type="text/javascript" src="js/scanboard.js"></script>
<script type="text/javascript" src="js/fontscroll.js"></script>
<script type="text/javascript" src="js/jquery.animsition.js"></script>
<script type="text/javascript" src="js/jquery.nicescroll.js"></script>
<script type="text/javascript" src="js/echarts.min.js"></script>
<%--<script type="text/javascript" src="vendor/bootstrap/js/bootstrap3.js"></script>--%>
<script type="text/javascript" src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.15&key=ce3b1a3a7e67fc75810ce1ba1f83c01a&plugin=AMap.MapType"></script>

<script>

	getTemperature();
	getMoisture();
	getAverageWindSpeed();
	getRainfall();
	getSolarRadiationIntensity();
	getRelativeHumidity();


	function getTemperature(){
		var TemperatureData = 0;
		$.ajax({
			url: "<%=basePath%>get10NewTemperature",
			type: "GET",
			datatype:"json",
			success: function (data) {
				TemperatureData=data.Temperature;
				document.getElementById("indicator11")
				console.log("data>>",data)
				// alert(TemperatureData);
				var span =document.getElementById("indicator11");
				span.innerHTML = TemperatureData;
			}
		});

	}

	function getMoisture(){
		var MoistureData = 0;
		$.ajax({
			url: "<%=basePath%>get20moisture",
			type: "GET",
			datatype:"json",
			success: function (data) {
				MoistureData=data.Moisture;
				// alert(MoistureData);
				var span =document.getElementById("indicator21");
				span.innerHTML = MoistureData;
			}
		});
	}

	function getSolarRadiationIntensity(){
		var SolarRadiationIntensityData = 0;
		$.ajax({
			url: "<%=basePath%>getSolarRadiationIntensity",
			type: "GET",
			datatype:"json",
			success: function (data) {
				SolarRadiationIntensityData=data.SolarRadiationIntensity;
				var span =document.getElementById("indicator31");
				span.innerHTML = SolarRadiationIntensityData;
			}
		});
	}


	function getRainfall(){
		var RainfallData = 0;
		$.ajax({
			url: "<%=basePath%>getRainfall",
			type: "GET",
			datatype:"json",
			success: function (data) {
				RainfallData=data.Rainfall;
				var span =document.getElementById("indicator12");
				span.innerHTML = RainfallData;
			}
		});
	}

	function getAverageWindSpeed(){
		var AverageWindSpeedData = 0;
		$.ajax({
			url: "<%=basePath%>getAverageWindSpeed",
			type: "GET",
			datatype:"json",
			success: function (data) {
				AverageWindSpeedData=data.AverageWindSpeed;
				// alert(AverageWindSpeedData);
				var span =document.getElementById("indicator22");
				span.innerHTML = AverageWindSpeedData;
			}
		});
	}


	function getRelativeHumidity(){
		var RelativeHumidityData = 0;
		$.ajax({
			url: "<%=basePath%>getRelativeHumidity",
			type: "GET",
			datatype:"json",
			success: function (data) {
				RelativeHumidityData=data.RelativeHumidity;
				var span =document.getElementById("indicator32");
				span.innerHTML = RelativeHumidityData;
			}
		});
	}



</script>
</html>
