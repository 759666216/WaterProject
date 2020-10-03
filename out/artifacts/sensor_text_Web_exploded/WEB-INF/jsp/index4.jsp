<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/19
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    %>

    <title>淤地坝监测平台</title>
    <link href="../demo4/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="../demo4/css/base.css">
    <link rel="stylesheet" href="../demo4/css/index.css">


<%--    --%>
    <style>
        .t_title{
            width: 100%;
            height: 100%;
            text-align: center;
            font-size: 2.5em;
            line-height: 80px;
            color: #0e1058;
        }
        #chart_map{
            cursor: pointer;
        }
        .t_show{
            position: absolute;
            top: 0;
            right: 0;
            border-radius: 2px;
            background: #2C58A6;
            padding: 2px 5px;
            color: #fff;
            cursor: pointer;
        }
    </style>
    <%--地图显示--%>
    <style>
        #china-map {
            width: 1000px;
            height: 1000px;
            margin: auto;
        }
        #box{
            display:none;
            background-color: goldenrod;
            width: 180px;
            height: 30px;
        }
        #box-title{
            display:block;
        }
    </style>
    <script type="text/javascript" src="../demo4/map/js/jquery.min.js"></script>
    <script type="text/javascript" src="../demo4/map/js/echarts.min.js"></script>
    <script type="text/javascript" src="../demo4/map/js/map/china.js"></script>

    <%--   预警表格显示--%>
    <style>
        #main {
            margin: 0 auto;
            height: 400px;
            padding: 0px;
        }

        #mapContent {
            margin: 0 auto;
            height: 400px;
            padding: 0;
        }

        #map-btu {
            position: absolute;
            z-index: 10;
            right: 7.5px;
            top: 7.5px;
        }

        #BasemapToggle {
            position: absolute;
            top: 65px;
            right: 25px;
            z-index: 50;
        }

        li {
            list-style: none;
        }


        #selector {
            position: relative;
            height: 25px;
            width: 500px;
            margin-left: 10px;
            margin-top: 10px;
            font-size: 13px;
            line-height: 30px;
            text-align: left;
            user-select: none;
        }

        #selector select {
            display: none;
        }

        #selector .arrow {
            position: absolute;
            right: 5px;
            top: 10px;
            display: block;
            height: 0;
            width: 0;
            border-top: 10px solid rgba(209, 40, 32, 0.97);
            border-right: 5px solid transparent;
            border-left: 5px solid transparent;
        }

        #selector .mr-selector {
            display: block;
            height: 25px;
            width: 500px;
            padding-left: 10px;
            border: 1px solid #ccc;
            cursor: default;
            overflow: hidden;
            font-size: 10px;
            font-weight: bold;
            background: whitesmoke;
        }

        #selector .select {
            display: none;
            width: 511px;
            margin-top: -1px;
            /* border: 1px solid #ccc;*/
            background-color: white;
        }

        #selector .select li {
            height: 20px;
            line-height: 20px;
            padding-left: 10px;
            color: black;
            font-weight: bold;

        }



    </style>
    <!---jQuery Files-->
    <script src="../js/jquery-1.7.1.min.js"></script>
    <script src="../js/jquery-ui-1.8.17.min.js"></script>
    <script src="../js/styler.js"></script>
    <script src="../js/jquery.tipTip.js"></script>
    <script src="../js/colorpicker.js"></script>
    <script src="../js/sticky.full.js"></script>
    <script src="../js/velocity.js"></script>
    <script src="../js/jquery-1.7.1.min.js"></script>

<%--地图样式二--%>
    <link rel="stylesheet" type="text/css"
          href="../arcgis_js_v39_api/arcgis_js_api/library/3.9/3.9/js/dojo/dijit/themes/tundra/tundra.css"/>
    <link rel="stylesheet" type="text/css"
          href="../arcgis_js_v39_api/arcgis_js_api/library/3.9/3.9/js/esri/css/esri.css"/>

    <style>
        #main {
            margin: 0 auto;
            height: 400px;
            padding: 0px;
        }

        #mapContent {
            margin: 0 auto;
            height: 400px;
            padding: 0;
        }

        #map-btu {
            position: absolute;
            z-index: 10;
            right: 7.5px;
            top: 7.5px;
        }

        #BasemapToggle {
            position: absolute;
            top: 65px;
            right: 25px;
            z-index: 50;
        }

        li {
            list-style: none;
        }


        #selector {
            position: relative;
            height: 25px;
            width: 500px;
            margin-left: 10px;
            margin-top: 10px;
            font-size: 13px;
            line-height: 30px;
            text-align: left;
            user-select: none;
        }

        #selector select {
            display: none;
        }

        #selector .arrow {
            position: absolute;
            right: 5px;
            top: 10px;
            display: block;
            height: 0;
            width: 0;
            border-top: 10px solid rgba(209, 40, 32, 0.97);
            border-right: 5px solid transparent;
            border-left: 5px solid transparent;
        }

        #selector .mr-selector {
            display: block;
            height: 25px;
            width: 500px;
            padding-left: 10px;
            border: 1px solid #ccc;
            cursor: default;
            overflow: hidden;
            font-size: 10px;
            font-weight: bold;
            background: whitesmoke;
        }

        #selector .select {
            display: none;
            width: 511px;
            margin-top: -1px;
            /* border: 1px solid #ccc;*/
            background-color: white;
        }

        #selector .select li {
            height: 20px;
            line-height: 20px;
            padding-left: 10px;
            color: black;
            font-weight: bold;

        }



    </style>
</head>
<body>
<!--header-->
<div class="header">
    <div class="bg_header">
        <div class="header_nav fl t_title">
            <a style="color: #f8ffff" href="/Search/index"> 淤地坝监测与预警平台</a>
        </div>
    </div>
</div>
<!--main-->
<div class="data_content">
    <%--    <div class="data_time">
            温馨提示: 点击模块后跳转至详情页面。
        </div>--%>
    <div class="data_main">
        <div class="main_left fl">
            <div class="left_1 t_btn6" style="cursor: pointer;">
                <!--左上边框-->
                <div class="t_line_box">
                    <i class="t_l_line"></i>
                    <i class="l_t_line"></i>
                </div>
                <!--右上边框-->
                <div class="t_line_box">
                    <i class="t_r_line"></i>
                    <i class="r_t_line"></i>
                </div>
                <!--左下边框-->
                <div class="t_line_box">
                    <i class="l_b_line"></i>
                    <i class="b_l_line"></i>
                </div>
                <!--右下边框-->
                <div class="t_line_box">
                    <i class="r_b_line"></i>
                    <i class="b_r_line"></i>
                </div>
                <div class="main_title">
                    <img src="../demo4/img/t_1.png" alt="">
                    监测信息总览
                </div>

                <div class="text_sum">
                    <p>
                        <label>监测覆盖面积：</label><span>1560</span>
                    </p>
                    <p>
                        <label>监测涉及水系：</label><span>5</span>
                    </p>

                    <p>
                        <label>监测点个数：</label><span>165</span>
                    </p>
                    <p>
                        <label>监测设备数：</label><span>165（台）</span>
                    </p>

                    <p>
                        <label>监测总时长：</label><span>1515（小时）</span>
                    </p>
                    <p>
                        <label>监测数据量：</label><span>2（GB）</span>
                    </p>


                </div>
            </div>
            <div class="left_2" style="cursor: pointer;">
                <!--左上边框-->
                <div class="t_line_box">
                    <i class="t_l_line"></i>
                    <i class="l_t_line"></i>
                </div>
                <!--右上边框-->
                <div class="t_line_box">
                    <i class="t_r_line"></i>
                    <i class="r_t_line"></i>
                </div>
                <!--左下边框-->
                <div class="t_line_box">
                    <i class="l_b_line"></i>
                    <i class="b_l_line"></i>
                </div>
                <!--右下边框-->
                <div class="t_line_box">
                    <i class="r_b_line"></i>
                    <i class="b_r_line"></i>
                </div>
                <div class="main_title">
                    <img src="../demo4/img/t_1.png" alt="">
                    年份未更新
                </div>
                <div id="container2"  style="width:100%;height: 280px;"></div>
            </div>
        </div>
        <div class="main_center fl">
            <div class="center_text">
        <%--                                <!--左上边框-->
                                <div class="t_line_box">
                                    <i class="t_l_line"></i>
                                    <i class="l_t_line"></i>
                                </div>
                                <!--右上边框-->
                                <div class="t_line_box">
                                    <i class="t_r_line"></i>
                                    <i class="r_t_line"></i>
                                </div>
                                <!--左下边框-->
                                <div class="t_line_box">
                                    <i class="l_b_line"></i>
                                    <i class="b_l_line"></i>
                                </div>
                                <!--右下边框-->
                                <div class="t_line_box">
                                    <i class="r_b_line"></i>
                                    <i class="b_r_line"></i>
                                </div>--%>
                <div class="main_title">
                    <img src="../demo4/img/t_3.png" alt="">
                    淤地坝地区总览
                </div>
                <div class="map_center" style="height: 100%" >
                        <div style="height: 100%" id="main">
                            <div style="width: 100%;height: 100%;" id="mapContent">
                                <div id="BasemapToggle"></div>
                                <div style="width: 160px;height: 150px;background-color: lightgrey;opacity:0.8;position: absolute;z-index: 10;left: 30px;bottom: 40px">
                                    <div style="width: 140px;height: 50px;">
                                        <img style="width: 40px;height: 40px;" src="../img/BluePin1LargeB.png">
                                        <div style="width: 100px;height: 50px;float: right;text-align: center;line-height: 50px">
                                            <span style="font-size: 15px">单个坝点</span></div>
                                    </div>
                                    <div style="width: 140px;height: 50px;">
                                        <img style="width: 40px;height: 40px" src="../img/GreenPin1LargeB.png">
                                        <div style="width: 100px;height: 50px;float: right;text-align: center;line-height: 50px">
                                            <span style="font-size: 15px">小集群坝点</span></div>
                                    </div>
                                    <div style="width: 140px;height: 50px;">
                                        <img style="width: 40px;height: 40px" src="../img/RedPin1LargeB.png">
                                        <div style="width: 100px;height: 50px;float: right;text-align: center;line-height: 50px">
                                            <span style="font-size: 15px">大集群坝点</span></div>
                                    </div>
                                </div>
                                <div style="width: 160px;height: 0px;background-color: whitesmoke;opacity:0.8;position: absolute;z-index: 10;left: 30px;top: 70px">
                                    <div id="selector">
                                        <span class="mr-selector">请选择坝系</span>
                                        <span class="arrow"></span>
                                        <ul class="select" style="">

                                            <table style="width: 511px">

                                                <tr style="width: 500px;">
                                                    <td align="right" style="width: 150px;"><input type="checkbox" id="streetsLyr1" > 韭园沟坝系</td>
                                                    <td style="width: 150px;"><input type="checkbox" id="streetsLyr2" > 海原马营河坝系</td>
                                                    <td style="width: 150px;"><input type="checkbox" id="streetsLyr3" > 海原相桐坝系</td>
                                                    <td style="width: 150px;"><input type="checkbox" id="streetsLyr4" > 灵武水洞沟坝系 </td>
                                                </tr>
                                                <tr style="width: 500px;">
                                                    <td style="width: 150px;"><input type="checkbox" id="streetsLyr5" > 隆德好水川坝系</td>
                                                    <td style="width: 150px;"><input type="checkbox" id="streetsLyr6" > 隆德筛子河坝系</td>
                                                    <td style="width: 150px;"><input type="checkbox" id="streetsLyr7" > 隆德什字河坝系</td>
                                                    <td style="width: 150px;"><input type="checkbox" id="streetsLyr8" > 彭阳罗洼坝系</td>
                                                </tr>
                                                <tr style="width: 500px;">
                                                    <td style="width: 150px;"><input type="checkbox" id="streetsLyr9" > 彭阳庙台坝系</td>
                                                    <td style="width: 150px;"><input type="checkbox" id="streetsLyr10" > 彭阳茹河二期坝系</td>
                                                    <td style="width: 150px;"><input type="checkbox" id="streetsLyr11" > 彭阳茹河一期坝系</td>
                                                    <td style="width: 150px;"><input type="checkbox" id="streetsLyr12" > 沙坡头嵩川坝系</td>
                                                </tr>
                                                <tr style="width: 500px;">
                                                    <td style="width: 150px;"><input type="checkbox" id="streetsLyr13" > 西吉车路沟坝系</td>
                                                    <td style="width: 150px;"><input type="checkbox" id="streetsLyr14" > 西吉葫芦河坝系</td>
                                                    <td style="width: 150px;"><input type="checkbox" id="streetsLyr15" > 西吉滥泥河坝系</td>
                                                    <td style="width: 150px;"><input type="checkbox" id="streetsLyr16" > 西吉马建坝系</td>
                                                </tr>
                                                <tr style="width: 500px;">
                                                    <td style="width: 150px;"><input type="checkbox" id="streetsLyr17" > 西吉聂家河坝系</td>
                                                    <td style="width: 150px;"><input type="checkbox" id="streetsLyr18" > 西吉三合坝系</td>
                                                    <td style="width: 150px;"><input type="checkbox" id="streetsLyr19" > 盐池桑记沟坝系</td>
                                                    <td style="width: 150px;"><input type="checkbox" id="streetsLyr20" > 盐池杏树梁坝系</td>
                                                </tr>
                                                <tr style="width: 500px;">
                                                    <td style="width: 150px;"><input type="checkbox" id="streetsLyr21" > 盐池荫子沟坝系</td>
                                                    <td style="width: 150px;"><input type="checkbox" id="streetsLyr22" > 原州区唐家河坝系</td>
                                                    <td style="width: 150px;"><input type="checkbox" id="streetsLyr23" > 原州西川坝系</td>
                                                    <td style="width: 150px;"><input type="checkbox" id="streetsLyr24" > 原州张易河坝系</td>
                                                </tr>
                                            </table>
                                        </ul>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div id="map-btu">
                            <img id="layerToggle1" src="../img/self/styler-icon.png">
                        </div>
                    </div>
            </div>
        </div>
        <div class="main_right fr">
            <div class="right_2">
                <!--左上边框-->
                <div class="t_line_box">
                    <i class="t_l_line"></i>
                    <i class="l_t_line"></i>
                </div>
                <!--右上边框-->
                <div class="t_line_box">
                    <i class="t_r_line"></i>
                    <i class="r_t_line"></i>
                </div>
                <!--左下边框-->
                <div class="t_line_box">
                    <i class="l_b_line"></i>
                    <i class="b_l_line"></i>
                </div>
                <!--右下边框-->
                <div class="t_line_box">
                    <i class="r_b_line"></i>
                    <i class="b_r_line"></i>
                </div>
                <div class="main_title">
                    <img src="../demo4/img/t_4.png" alt="">
                    天气信息预警
                </div>
<%--监测信息总览--%>
                <%--<div class="text_sum">
                    <!--0501需要更改-->
                    &lt;%&ndash;                    <img src="../demo4/img/t_4.png" alt="">&ndash;%&gt;

                    <p>
                        <label>监测覆盖面积：</label><span>15600</span>
                    </p>
                    <p>
                        <label>监测涉及水系：</label><span>5</span>
                    </p>
                    <!--0501-->
                    <br>
                    <!--0501需要更改-->
                    <p>
                        <label>监测点个数：</label><span>165467</span>
                    </p>
                    <p>
                        <label>监测设备数：</label><span>165467（台）</span>
                    </p>
                    <!--0501-->
                    <br>

                    <!--0501需要更改  43587（座）-->
                    <p>
                        <label>淤地坝总量：</label><span id="damAmount"></span>
                    </p>
                    <p>
                        <label>骨干坝总量：</label><span id="mainDamAmount">11579（座）</span>
                    </p>
                    <!--0501-->
                    <br>
                    <!--0501需要更改-->
                    <p>
                        <label>监测总时长：</label><span>1515（小时）</span>
                    </p>
                    <p>
                        <label>监测数据量：</label><span>2（GB）</span>
                    </p>


                </div>--%>
<%--天气信息--%>
                    <div class="text_weather" style="    background-color:#fbfeff;" >
                        <iframe id="weather-view-he" scrolling="no" src="https://tianqiapi.com/api.php?style=tw&skin=pitaya&" frameborder="0" width="300" height="500"  allowtransparency="true"></iframe>
                    </div>
<%--            <div id="weather" style="width: 100%;margin-top: 50px">
                <iframe width="700" scrolling="no" height="70" frameborder="0" allowtransparency="true" src="//i.tianqi.com/index.php?c=code&id=2&color=%23FFFFFF&icon=1&num=2&site=12"></iframe>

            </div>--%>


            </div>
        </div>
    </div>
    <div class="data_bottom">
        <div class="bottom_1 fl t_btn5" style="cursor: pointer;">
            <!--左上边框-->
            <div class="t_line_box">
                <i class="t_l_line"></i>
                <i class="l_t_line"></i>
            </div>
            <!--右上边框-->
            <div class="t_line_box">
                <i class="t_r_line"></i>
                <i class="r_t_line"></i>
            </div>
            <!--左下边框-->
            <div class="t_line_box">
                <i class="l_b_line"></i>
                <i class="b_l_line"></i>
            </div>
            <!--右下边框-->
            <div class="t_line_box">
                <i class="r_b_line"></i>
                <i class="b_r_line"></i>
            </div>
            <div class="main_title">
                <img src="../demo4/img/t_1.png" alt="">
                库容比例
            </div>
            <div id="container" class="echart fl" style="width:100%;height: 250px;margin-top: 15px;"></div>
            <%--<section class="main">
                <span class="button-label">尺寸:</span>
                <input type="radio" name="resize-graph" id="graph-small" /><label for="graph-small">小</label>
&lt;%&ndash;                <input type="radio" name="resize-graph" id="graph-normal" checked="checked" /><label for="graph-normal">中</label>
                <input type="radio" name="resize-graph" id="graph-large" /><label for="graph-large">大</label>&ndash;%&gt;
                <span class="button-label">颜色:</span>
&lt;%&ndash;                <input type="radio" name="paint-graph" id="graph-blue" checked="checked" /><label for="graph-blue">蓝色</label>
                <input type="radio" name="paint-graph" id="graph-green" /><label for="graph-green">绿色</label>&ndash;%&gt;
                <input type="radio" name="paint-graph" id="graph-rainbow" /><label for="graph-rainbow">彩虹效果</label>
                <span class="button-label">产品:</span>
&lt;%&ndash;                <input type="radio" name="fill-graph" id="f-none" /><label for="f-none">无</label>&ndash;%&gt;
                <input type="radio" name="fill-graph" id="f-product1" checked="checked" /><label for="f-product1">产品1</label>
&lt;%&ndash;                <input type="radio" name="fill-graph" id="f-product2" /><label for="f-product2">产品2</label>
                <input type="radio" name="fill-graph" id="f-product3" /><label for="f-product3">产品3</label>&ndash;%&gt;
                <ul class="graph-container">
                    <li>
                        <span>2008</span>
                        <div class="bar-wrapper">
                            <div class="bar-container">
                                <div class="bar-background"></div>
                                <div class="bar-inner">25</div>
                                <div class="bar-foreground"></div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <span>2009</span>
                        <div class="bar-wrapper">
                            <div class="bar-container">
                                <div class="bar-background"></div>
                                <div class="bar-inner">50</div>
                                <div class="bar-foreground"></div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <span>2010</span>
                        <div class="bar-wrapper">
                            <div class="bar-container">
                                <div class="bar-background"></div>
                                <div class="bar-inner">75</div>
                                <div class="bar-foreground"></div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <span>2011</span>
                        <div class="bar-wrapper">
                            <div class="bar-container">
                                <div class="bar-background"></div>
                                <div class="bar-inner">100</div>
                                <div class="bar-foreground"></div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <span>2012</span>
                        <div class="bar-wrapper">
                            <div class="bar-container">
                                <div class="bar-background"></div>
                                <div class="bar-inner">50</div>
                                <div class="bar-foreground"></div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <ul class="graph-marker-container">
                            <li style="bottom:25%;"><span>25%</span></li>
                            <li style="bottom:50%;"><span>50%</span></li>
                            <li style="bottom:75%;"><span>75%</span></li>
                            <li style="bottom:100%;"><span>100%</span></li>
                        </ul>
                    </li>
                </ul>
            </section>--%>

        </div>
        <div class="bottom_center fl">
            <div class="bottom_2 fl">
                <!--左上边框-->
                <div class="t_line_box">
                    <i class="t_l_line"></i>
                    <i class="l_t_line"></i>
                </div>
                <!--右上边框-->
                <div class="t_line_box">
                    <i class="t_r_line"></i>
                    <i class="r_t_line"></i>
                </div>
                <!--左下边框-->
                <div class="t_line_box">
                    <i class="l_b_line"></i>
                    <i class="b_l_line"></i>
                </div>
                <!--右下边框-->
                <div class="t_line_box">
                    <i class="r_b_line"></i>
                    <i class="b_r_line"></i>
                </div>
                <div class="main_title">
                    <img src="../demo4/img/t_7.png" alt="">
                    监测预警
                </div>
                <div class="main_table t_btn8">
                    <%--<table>
                        <thead>
                        <tr>
                            <th>运营数(辆)</th>
                            <th>线路总长度(公里)</th>
                            <th>客运总量(万人次)</th>
                            <th>日期</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>21059</td>
                            <td>26497</td>
                            <td>184448</td>
                            <td>2018年</td>
                        </tr>
                        <tr>
                            <td>18777</td>
                            <td>21140</td>
                            <td>188808</td>
                            <td>2017年</td>
                        </tr>
                        <tr>
                            <td>15757</td>
                            <td>20225</td>
                            <td>201143</td>
                            <td>2016年</td>
                        </tr>
                        <tr>
                            <td>17458</td>
                            <td>19567</td>
                            <td>202446</td>
                            <td>2015年</td>
                        </tr>
                        <tr>
                            <td>11323</td>
                            <td>14562</td>
                            <td>279854</td>
                            <td>2014年</td>
                        </tr>
                        </tbody>
                    </table>--%>
                    <table  id="example">
                        <thead>
                        <tr>
                            <th style="text-align:center; vertical-align:middle;">坝名</th>
                            <th style="text-align:center; vertical-align:middle;">坐标</th>
                            <th style="text-align:center; vertical-align:middle;">所属水系</th>
                            <th style="text-align:center; vertical-align:middle;">最大库容</th>
                            <th style="text-align:center; vertical-align:middle;">淤积库容</th>
                            <th style="text-align:center; vertical-align:middle;">剩余库容</th>
                            <th style="text-align:center; vertical-align:middle;">泥面高程</th>
                            <th style="text-align:center; vertical-align:middle;">损坏情况</th>
                        </tr>
                        </thead>
                        <tbody id="DamHistoryCapacity">
                        </tbody>
                    </table>
                    <div class="fg-toolbar ui-toolbar ui-widget-header ui-corner-bl ui-corner-br ui-helper-clearfix">
                        <div class="dataTables_info" id="example_info" style="font-size: 15px">险情较高淤地坝</div>
                        <div id="pageInfo" style="width: 200px;height: 20px;float: right;margin-top: 9px;"></div>
                        <div id="tiaoZhuan" style="width: 180px;height: 20px;float: right;margin-top: 5px;font-size: 11px">
                            跳转至<input id="pageJumpNum" style="width: 50px;height:10px;margin-left: 10px;">
                            <button type="button" onclick="pageJump()">跳转</button>
                        </div>
                        <div class="dataTables_paginate fg-buttonset ui-buttonset fg-buttonset-multi ui-buttonset-multi paging_two_button"
                             id="example_paginate">
                            <a class="fg-button ui-button ui-state-default ui-corner-left " tabindex="0"
                               role="button" id="example_previous_first" aria-controls="example" onclick="firstPages()">首页
                                <%--<span class="ui-icon ui-icon-circle-arrow-w"></span>--%></a>
                            <a class="fg-button ui-button ui-state-default ui-corner-left " tabindex="0"
                               role="button" id="example_previous" aria-controls="example" onclick="lastPages()">上一页
                                <%--<span class="ui-icon ui-icon-circle-arrow-w"></span>--%></a>
                            <a class="fg-button ui-button ui-state-default ui-corner-right " tabindex="0"
                               role="button" id="example_next" aria-controls="example" onclick="nextPages()">下一页
                                <%--<span class="ui-icon ui-icon-circle-arrow-e"></span>--%></a>
                            <a class="fg-button ui-button ui-state-default ui-corner-right " tabindex="0"
                               role="button" id="example_next_final" aria-controls="example" onclick="finalPages()">尾页
                                <%--<span class="ui-icon ui-icon-circle-arrow-e"></span>--%></a>
                        </div>
                    </div>

                </div>
            </div>
            <%--<div class="bottom_3 fl">
                <!--左上边框-->
                <div class="t_line_box">
                    <i class="t_l_line"></i>
                    <i class="l_t_line"></i>
                </div>
                <!--右上边框-->
                <div class="t_line_box">
                    <i class="t_r_line"></i>
                    <i class="r_t_line"></i>
                </div>
                <!--左下边框-->
                <div class="t_line_box">
                    <i class="l_b_line"></i>
                    <i class="b_l_line"></i>
                </div>
                <!--右下边框-->
                <div class="t_line_box">
                    <i class="r_b_line"></i>
                    <i class="b_r_line"></i>
                </div>
                <div class="main_title">
                    <img src="../demo4/img/t_7.png" alt="">
                   监测预警
                </div>
                <div class="main_table t_btn2">
                    <table>
                        <thead>
                        <tr>
                            <th>省内(万件)</th>
                            <th>省外(万件)</th>
                            <th>国际(万件)</th>
                            <th>总业务量(万件)</th>
                            <th>日期</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>21352.36</td>
                            <td>68575.6</td>
                            <td>464.43</td>
                            <td>90392.39</td>
                            <td>2018年</td>
                        </tr>
                        <tr>
                            <td>17522.41</td>
                            <td>37111.03</td>
                            <td>278.5</td>
                            <td>54911.94</td>
                            <td>2017年</td>
                        </tr>
                        <tr>
                            <td>7014.14</td>
                            <td>26841.29</td>
                            <td>163.72</td>
                            <td>34019.15</td>
                            <td>2016年</td>
                        </tr>
                        <tr>
                            <td>2553.55</td>
                            <td>18072.54</td>
                            <td>129.65</td>
                            <td>20755.74</td>
                            <td>2015年</td>
                        </tr>
                        <tr>
                            <td>1427.04</td>
                            <td>10859.54</td>
                            <td>182.54</td>
                            <td>12469.11</td>
                            <td>2014年</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>--%>
        </div>
        <div class="bottom_4 fr">
            <!--左上边框-->
            <div class="t_line_box">
                <i class="t_l_line"></i>
                <i class="l_t_line"></i>
            </div>
            <!--右上边框-->
            <div class="t_line_box">
                <i class="t_r_line"></i>
                <i class="r_t_line"></i>
            </div>
            <!--左下边框-->
            <div class="t_line_box">
                <i class="l_b_line"></i>
                <i class="b_l_line"></i>
            </div>
            <!--右下边框-->
            <div class="t_line_box">
                <i class="r_b_line"></i>
                <i class="b_r_line"></i>
            </div>
            <div class="main_title">
                <img src="../demo4/img/t_7.png" alt="">
                坝类型占比
            </div>
            <%--            <div class="main_table t_btn3">
                            <table>
                                <thead>
                                <tr>
                                    <th>载客汽车(万辆)</th>
                                    <th>载货汽车(万辆)</th>
                                    <th>汽车拥有量(万辆)</th>
                                    <th>日期</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>2.53</td>
                                    <td>142.65</td>
                                    <td>145.18</td>
                                    <td>2018年</td>
                                </tr>
                                <tr>
                                    <td>2.52</td>
                                    <td>139.95</td>
                                    <td>142.47</td>
                                    <td>2017年</td>
                                </tr>
                                <tr>
                                    <td>2.65</td>
                                    <td>137.96</td>
                                    <td>140.61</td>
                                    <td>2016年</td>
                                </tr>
                                <tr>
                                    <td>2.97</td>
                                    <td>131.48</td>
                                    <td>134.45</td>
                                    <td>2015年</td>
                                </tr>
                                <tr>
                                    <td>3.23</td>
                                    <td>99.99</td>
                                    <td>103.22</td>
                                    <td>2014年</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>--%>
            <div id="container3" class="echart fl" style="width:100%;height: 100%;margin-top: 5px;"></div>
        </div>
    </div>
</div>
<div style="text-align:center;">
    <p>西安理工大学</p>
</div>

</body>

<%--<script src="../demo4/js/jquery-2.2.1.min.js"></script>--%>
<script src="../demo4/js/bootstrap.min.js"></script>
<script src="../demo4/js/common.js"></script>
<script src="../demo4/js/dataTool.js"></script>
<script src="../demo4/js/china.js"></script>
<script src="../demo4/js/hunan.js"></script>

<%--地图样式一--%>
<%--<script>
    var myChart = echarts.init(document.getElementById('china-map'));
    var oBack = document.getElementById("back");

    var provinces = ['shanghai', 'hebei', 'shanxi', 'neimenggu', 'liaoning', 'jilin', 'heilongjiang', 'jiangsu', 'zhejiang', 'anhui', 'fujian', 'jiangxi', 'shandong', 'henan', 'hubei', 'hunan', 'guangdong', 'guangxi', 'hainan', 'sichuan', 'guizhou', 'yunnan', 'xizang', 'shanxi1', 'gansu', 'qinghai', 'ningxia', 'xinjiang', 'beijing', 'tianjin', 'chongqing', 'xianggang', 'aomen'];

    var provincesText = ['上海', '河北', '山西', '内蒙古', '辽宁', '吉林', '黑龙江', '江苏', '浙江', '安徽', '福建', '江西', '山东', '河南', '湖北', '湖南', '广东', '广西', '海南', '四川', '贵州', '云南', '西藏', '陕西', '甘肃', '青海', '宁夏', '新疆', '北京', '天津', '重庆', '香港', '澳门'];

    var seriesData = [{
        name: '北京',
        value: 100
    }, {
        name: '天津',
        value: 0
    }, {
        name: '上海',
        value: 60
    }, {
        name: '重庆',
        value: 0
    }, {
        name: '河北',
        value: 60
    }, {
        name: '河南',
        value: 60
    }, {
        name: '云南',
        value: 0
    }, {
        name: '辽宁',
        value: 0
    }, {
        name: '黑龙江',
        value: 0
    }, {
        name: '湖南',
        value: 60
    }, {
        name: '安徽',
        value: 0
    }, {
        name: '山东',
        value: 60
    }, {
        name: '新疆',
        value: 0
    }, {
        name: '江苏',
        value: 0
    }, {
        name: '浙江',
        value: 0
    }, {
        name: '江西',
        value: 0
    }, {
        name: '湖北',
        value: 60
    }, {
        name: '广西',
        value: 60
    }, {
        name: '甘肃',
        value: 0
    }, {
        name: '山西',
        value: 60
    }, {
        name: '内蒙古',
        value: 0
    }, {
        name: '陕西',
        value: 0
    }, {
        name: '吉林',
        value: 0
    }, {
        name: '福建',
        value: 0
    }, {
        name: '贵州',
        value: 0
    }, {
        name: '广东',
        value: 597
    }, {
        name: '青海',
        value: 0
    }, {
        name: '西藏',
        value: 0
    }, {
        name: '四川',
        value: 60
    }, {
        name: '宁夏',
        value: 0
    }, {
        name: '海南',
        value: 60
    }, {
        name: '台湾',
        value: 0
    }, {
        name: '香港',
        value: 0
    }, {
        name: '澳门',
        value: 0
    }];

    oBack.onclick = function () {
        initEcharts("china", "中国");
    };

    initEcharts("china", "中国");

    // 初始化echarts
    function initEcharts(pName, Chinese_) {
        var tmpSeriesData = pName === "china" ? seriesData : [];

        var option = {
            title: {
                text: Chinese_ || pName,
                left: 'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: '{b}<br/>{c} (p / km2)'
            },
            series: [
                {
                    name: Chinese_ || pName,
                    type: 'map',
                    mapType: pName,
                    roam: false,//是否开启鼠标缩放和平移漫游
                    data: tmpSeriesData,
                    top: "3%",//组件距离容器的距离
                    zoom:1.1,
                    selectedMode : 'single',

                    label: {
                        normal: {
                            show: true,//显示省份标签
                            textStyle:{color:"#fbfdfe"}//省份标签字体颜色
                        },
                        emphasis: {//对应的鼠标悬浮效果
                            show: true,
                            textStyle:{color:"#323232"}
                        }
                    },
                    itemStyle: {
                        normal: {
                            borderWidth: .5,//区域边框宽度
                            borderColor: '#0550c3',//区域边框颜色
                            areaColor:"#4ea397",//区域颜色

                        },

                        emphasis: {
                            borderWidth: .5,
                            borderColor: '#4b0082',
                            areaColor:"#ece39e",
                        }
                    },
                }
            ]

        };

        myChart.setOption(option);

        myChart.off("click");

        if (pName === "china") { // 全国时，添加click 进入省级
            myChart.on('click', function (param) {
                console.log(param.name);
                // 遍历取到provincesText 中的下标  去拿到对应的省js
                for (var i = 0; i < provincesText.length; i++) {
                    if (param.name === provincesText[i]) {
                        //显示对应省份的方法
                        showProvince(provinces[i], provincesText[i]);
                        break;
                    }
                }
                if (param.componentType === 'series') {
                    var provinceName =param.name;
                    $('#box').css('display','block');
                    $("#box-title").html(provinceName);

                }
            });
        } else { // 省份，添加双击 回退到全国
            myChart.on("dblclick", function () {
                initEcharts("china", "中国");
            });
        }
    }

    // 展示对应的省
    function showProvince(pName, Chinese_) {
        //这写省份的js都是通过在线构建工具生成的，保存在本地，需要时加载使用即可，最好不要一开始全部直接引入。
        loadBdScript('$' + pName + 'JS', '../demo4/map/js/map/province/' + pName + '.js', function () {
            initEcharts(Chinese_);
        });
    }

    // 加载对应的JS
    function loadBdScript(scriptId, url, callback) {
        var script = document.createElement("script");
        script.type = "text/javascript";
        if (script.readyState) {  //IE
            script.onreadystatechange = function () {
                if (script.readyState === "loaded" || script.readyState === "complete") {
                    script.onreadystatechange = null;
                    callback();
                }
            };
        } else {  // Others
            script.onload = function () {
                callback();
            };
        }
        script.src = url;
        script.id = scriptId;
        document.getElementsByTagName("head")[0].appendChild(script);
    };
</script>--%>
<%--地图样式二--%>
<script>
    (function () {
        var selector = $("#selector");
        var select = $("#selector .select");  //模拟select的ul选项
        var mrSelector = $("#selector .mr-selector");
        var li = $("#selector .select li"); //li选项

        selector.click(function (eve) {
            eve.stopPropagation();   //阻止冒泡避免点击后消失
        });
        mrSelector.click(function () {
            select.toggle();
        });
        li.click(function (eve) {
            var ttt = $(mrSelector).text();
            var index = $(this).index();
            eee = $(this).find('i').attr("class");
            if (eee == "icon iconfont icon-duoxuankuang") {
                $(this).find('i').attr("class", "icon iconfont icon-duoxuankuang2");
                if (index == 0) {
                    var text = $(this).text();
                    mrSelector.text(ttt);
                } else if (index != 0) {
                    var text = ttt + $(this).text();
                    mrSelector.text(text);
                }
            } else if (eee == "icon iconfont icon-duoxuankuang2") {
                $(this).find('i').attr("class", "icon iconfont icon-duoxuankuang");
            }
        });

        $("body").click(function () {
            select.hide();
        });
    }());
</script>
<script>

    var href = window.document.location.href;
    var pathName = window.document.location.pathname;
    var index = href.indexOf(pathName);
    //  var localhost = href.substring(0, index) + '/Dam/data/extras';  // 部署的时候用
    var localhost = href.substring(0, index) + '/data/extras';   //  本地时候用
    console.log(localhost);

    //   http://localhost:8080/data/extras

    var dojoConfig = {
        parseOnLoad: true,
        packages: [{
            "name": "extras",
            // "location": location.pathname.replace(/\/[^/]*$/, '') + '/extras'  //location.pathname.replace(/\/[^/]+$/, '') + "/extras"
            "location": localhost
        }]
    };
</script>

<%--<script src="../arcgis_js_v39_api/arcgis_js_api/library/3.9/3.9/js/dojo/dojo/dojo.js"></script>--%>
<script src="../arcgis_js_apiv414/library/4.14/init.js"></script>
<%--<script type="text/javascript">

    var renderer;
    var test;
    initJson();
    var map;
    var clusterLayer;
    var pointA;
    var featureLayer;
    // 韭园沟坝系
    var featureLayerGiuYuanGouBundary;
    var featureLayerGiuYuangouRiver;
    var featureLayerGiuYuanGouDam;
    ///  海原马营河坝系
    var featureLayerMaYingHeBundary;
    var featureLayerMaYingHeRiver;
    var featureLayerMaYingHeDam;
    ///  海原相桐坝系
    var featureLayerXiangTongBundary;
    var featureLayerXiangTongRiver;
    var featureLayerXiangTongDam;
    //  灵武水洞沟坝系
    var featureLayerShuiDongGouBundary;
    var featureLayerShuiDongGouRiver;
    var featureLayerShuiDongGouDam;
    //  隆德好水川坝系
    var featureLayerHaoShuiChuanBundary;
    var featureLayerHaoShuiChuanRiver;
    var featureLayerHaoShuiChuanDam;
    //  隆德筛子河坝系
    var featureLayerShaiZiHeBundary;
    var featureLayerShaiZiHeRiver;
    var featureLayerShaiZiHeDam;
    //  隆德什字河坝系
    var featureLayerShiZiHeBundary;
    var featureLayerShiZiHeRiver;
    var featureLayerShiZiHeDam;
    //  彭阳罗洼坝系
    var featureLayerLuoWaBaBundary;
    var featureLayerLuoWaBaRiver;
    var featureLayerLuoWaBaDam;
    //  彭阳庙台坝系
    var featureLayerMiaoTaiBaBundary;
    var featureLayerMiaoTaiBaRiver;
    var featureLayerMiaoTaiBaDam;
    //  彭阳茹河二期坝系
    var featureLayerRuHeErQiBaBundary;
    var featureLayerRuHeErQiBaRiver;
    var featureLayerRuHeErQiBaDam;
    //  彭阳茹河一期坝系
    var featureLayerRuHeYiQiBaBundary;
    var featureLayerRuHeYiQiBaRiver;
    var featureLayerRuHeYiQiBaDam;
    //  沙坡头嵩川坝系
    var featureLayerGaoChuanBaBundary;
    var featureLayerGaoChuanBaRiver;
    var featureLayerGaoChuanBaDam;
    //  西吉车路沟坝系
    var featureLayerCheLuBaBundary;
    var featureLayerCheLuBaRiver;
    var featureLayerCheLuBaDam;
    //  西吉葫芦河坝系
    var featureLayerHuLuHeBaBundary;
    var featureLayerHuLuHeBaRiver;
    var featureLayerHuLuHeBaDam;
    //  西吉滥泥河坝系
    var featureLayerLanNiHeBaBundary;
    var featureLayerLanNiHeBaRiver;
    var featureLayerLanNiHeBADam;
    //  西吉马建坝系
    var featureLayerMaJianBaBundary;
    var featureLayerMaJianBaRiver;
    var featureLayerMaJianBaDam;
    //  西吉聂家河坝系
    var featureLayerNieHeBaBundary;
    var featureLayerNieHeBaRiver;
    var featureLayerNieHeBaDam;
    //  西吉三合坝系
    var featureLayerSanHeBaBundary;
    var featureLayerSanHeBaRiver;
    var featureLayerSanHeBaDam;
    //  盐池桑记沟坝系
    var featureLayerSangJiGouBaBundary;
    var featureLayerSangJiGouBaRiver;
    var featureLayerSangJiGouBaDam;
    //  盐池杏树梁坝系
    var featureLayerXingShuNiangBaBundary;
    var featureLayerXingShuNiangBaRiver;
    var featureLayerXingShuNiangBaDam;
    //  盐池荫子沟坝系
    var featureLayerYinZiGouBaBundary;
    var featureLayerYinZiGouBaRiver;
    var featureLayerYinZiGouBaDam;
    //  原州区唐家河坝系
    var featureLayerTangJiaHeBaBundary;
    var featureLayerTangJiaHeBaRiver;
    var featureLayerTangJiaHeBaDam;
    //  原州西川坝系
    var featureLayerXiChuanBaBundary;
    var featureLayerXiChuanBaRiver;
    var featureLayerXiChuanBaDam;
    //  原州张易河坝系
    var featureLayerZhangYiHeBaBundary;
    var featureLayerZhangYiHeRiver;
    var featureLayerZhangYiHeDam;

    //  将所有的图层装到一个数据里面去
    var allLayerArray = new Array();


    function initJson() {
        require([
            "esri/map",
            "esri/layers/FeatureLayer",
            "esri/InfoTemplate",
            "esri/symbols/SimpleLineSymbol",
            "esri/symbols/SimpleFillSymbol",
            "esri/renderers/UniqueValueRenderer",
            "esri/Color",
            "esri/dijit/BasemapToggle",
            "extras/ClusterLayer",
            "esri/geometry/Point",
            "esri/dijit/OverviewMap",
            "dojo/domReady!"
        ], function (Map, FeatureLayer, InfoTemplate,
                     SimpleLineSymbol, SimpleFillSymbol,
                     UniqueValueRenderer, Color, BasemapToggle, ClusterLayer, OverviewMap, Point) {

            // parser.parse();
            map = new Map("mapContent", {
                center: [106.258055544, 37.613923758],
                zoom: 5,
                /* center: [110.328607,37.587625],   //110.30775,37.5546944444444
                 zoom: 13,*/
                basemap: "osm",    //地图样式的类型
                logo: false,
                slider: false
            });
            //切换卫星地图
            var toggle = new BasemapToggle({
                map: map,
                basemap: "satellite"    //地图样式的类型
            }, "BasemapToggle");
            toggle.startup();


            map.on("load", addFeatureLayer);

            //  这个方法里面添加FeatureLayer层
            function addFeatureLayer() {

                //////////////////韭园沟数据/////////////////////////////////////////////////
                var defaultSymbol = new SimpleFillSymbol().setStyle(SimpleFillSymbol.STYLE_NULL);
                defaultSymbol.outline.setStyle(SimpleLineSymbol.STYLE_NULL);
                //create renderer
                var renderer = new UniqueValueRenderer(defaultSymbol, "FID");
                //唯一值染色
                renderer.addValue("0", new SimpleFillSymbol().setColor(new Color([100, 78, 50, 0.2])));
                var template1 = new InfoTemplate(${NAME});

                //  边界
                featureLayerGiuYuanGouBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/jiuYuanGou/MapServer/2", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerGiuYuanGouBundary.setRenderer(renderer);
                featureLayerGiuYuangouRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/jiuYuanGou/MapServer/1", {
                    visible: false
                });
                var template3 = new InfoTemplate(${NAME});
                featureLayerGiuYuanGouDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/jiuYuanGou/MapServer/0", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });

                /////////////////////////海原马营河坝系/////////////////////////////////////////////////////////
                var rendererMaYingHe = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererMaYingHe.addValue("0", new SimpleFillSymbol().setColor(new Color([255, 50, 50, 0.2])));
                featureLayerMaYingHeBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/48", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerMaYingHeBundary.setRenderer(rendererMaYingHe);
                featureLayerMaYingHeRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/24", {
                    visible: false
                });
                featureLayerMaYingHeDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/2", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                ////////////////////海原相桐坝系//////////////////////////////////////////////////////////////////
                var rendererXiangTong = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererXiangTong.addValue("0", new SimpleFillSymbol().setColor(new Color([240, 100, 50, 0.2])));
                featureLayerXiangTongBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/47", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerXiangTongBundary.setRenderer(rendererXiangTong);
                featureLayerXiangTongRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/23", {
                    visible: false
                });
                featureLayerXiangTongDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/1", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                ////////////////  灵武水洞沟坝系////////////////////////////////////////////////////////////////
                var rendererShuiDongGou = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererShuiDongGou.addValue("0", new SimpleFillSymbol().setColor(new Color([255, 40, 255, 0.2])));
                featureLayerShuiDongGouBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/46", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerShuiDongGouBundary.setRenderer(rendererShuiDongGou);
                featureLayerShuiDongGouRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/43", {
                    visible: false
                });
                featureLayerShuiDongGouDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/0", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                ////////////////  隆德好水川坝系////////////////////////////////////////////////////////////////
                var rendererHaoShuiChuan = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererHaoShuiChuan.addValue("0", new SimpleFillSymbol().setColor(new Color([80, 255, 10, 0.2])));
                featureLayerHaoShuiChuanBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/66", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerHaoShuiChuanBundary.setRenderer(rendererHaoShuiChuan);
                featureLayerHaoShuiChuanRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/44", {
                    visible: false
                });
                featureLayerHaoShuiChuanDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/20", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                ////////////////  隆德筛子河坝系////////////////////////////////////////////////////////////////
                var rendererShaiZiHe = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererShaiZiHe.addValue("0", new SimpleFillSymbol().setColor(new Color([70, 70, 50, 0.2])));
                featureLayerShaiZiHeBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/67", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerShaiZiHeBundary.setRenderer(rendererShaiZiHe);
                featureLayerShaiZiHeRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/45", {
                    visible: false
                });
                featureLayerShaiZiHeDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/21", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                ////////////////  隆德什字河坝系////////////////////////////////////////////////////////////////
                var rendererShiZiHe = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererShiZiHe.addValue("0", new SimpleFillSymbol().setColor(new Color([250, 70, 10, 0.2])));
                featureLayerShiZiHeBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/68", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerShiZiHeBundary.setRenderer(rendererShiZiHe);
                featureLayerShiZiHeRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/40", {
                    visible: false
                });
                featureLayerShiZiHeDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/22", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                ////////////////  彭阳罗洼坝系////////////////////////////////////////////////////////////////
                var rendererLuoWaBa = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererLuoWaBa.addValue("0", new SimpleFillSymbol().setColor(new Color([10, 60, 100, 0.2])));
                featureLayerLuoWaBaBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/63", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerLuoWaBaBundary.setRenderer(rendererLuoWaBa);
                featureLayerLuoWaBaRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/41", {
                    visible: false
                });
                featureLayerLuoWaBaDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/17", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                //////////////////////////////  彭阳庙台坝系////////////////////////////////////////
                var rendererMiaoTaiBa = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererMiaoTaiBa.addValue("0", new SimpleFillSymbol().setColor(new Color([200, 10, 10, 0.2])));
                featureLayerMiaoTaiBaBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/64", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerMiaoTaiBaBundary.setRenderer(rendererMiaoTaiBa);
                featureLayerMiaoTaiBaRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/42", {
                    visible: false
                });
                featureLayerMiaoTaiBaDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/18", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                //////////////////////////////    彭阳茹河二期坝系////////////////////////////////////////
                var rendererRuHeErQiBa = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererRuHeErQiBa.addValue("0", new SimpleFillSymbol().setColor(new Color([100, 50, 20, 0.2])));
                featureLayerRuHeErQiBaBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/65", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerRuHeErQiBaBundary.setRenderer(rendererRuHeErQiBa);
                featureLayerRuHeErQiBaRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/34", {
                    visible: false
                });
                featureLayerRuHeErQiBaDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/19", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                // ////////////////////////////  彭阳茹河一期坝系////////////////////////////////////////
                var rendererRuHeYiQiBa = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererRuHeYiQiBa.addValue("0", new SimpleFillSymbol().setColor(new Color([0, 100, 255, 0.2])));
                featureLayerRuHeYiQiBaBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/57", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerRuHeYiQiBaBundary.setRenderer(rendererRuHeYiQiBa);
                featureLayerRuHeYiQiBaRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/35", {
                    visible: false
                });
                featureLayerRuHeYiQiBaDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/11", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                //////////////////////////////  沙坡头嵩川坝系////////////////////////////////////////
                var rendererGaoChuanBa = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererGaoChuanBa.addValue("0", new SimpleFillSymbol().setColor(new Color([130, 0, 255, 0.2])));
                featureLayerGaoChuanBaBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/58", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerGaoChuanBaBundary.setRenderer(rendererGaoChuanBa);
                featureLayerGaoChuanBaRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/36", {
                    visible: false
                });
                featureLayerGaoChuanBaDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/12", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                //////////////////////////////    西吉车路沟坝系////////////////////////////////////////
                var rendererCheLuBa = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererCheLuBa.addValue("0", new SimpleFillSymbol().setColor(new Color([120, 120, 255, 0.2])));
                featureLayerCheLuBaBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/59", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerCheLuBaBundary.setRenderer(rendererCheLuBa);
                featureLayerCheLuBaRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/37", {
                    visible: false
                });
                featureLayerCheLuBaDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/13", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                //////////////////////////////   西吉葫芦河坝系////////////////////////////////////////
                var rendererHuLuHeBa = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererHuLuHeBa.addValue("0", new SimpleFillSymbol().setColor(new Color([110, 110, 255, 0.2])));
                featureLayerHuLuHeBaBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/60", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerHuLuHeBaBundary.setRenderer(rendererHuLuHeBa);
                featureLayerHuLuHeBaRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/38", {
                    visible: false
                });
                featureLayerHuLuHeBaDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/14", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                //////////////////////////////   西吉滥泥河坝系////////////////////////////////////////
                var rendererLanNiHeBa = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererLanNiHeBa.addValue("0", new SimpleFillSymbol().setColor(new Color([100, 100, 255, 0.2])));
                featureLayerLanNiHeBaBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/61", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerLanNiHeBaBundary.setRenderer(rendererLanNiHeBa);
                featureLayerLanNiHeBaRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/39", {
                    visible: false
                });
                featureLayerLanNiHeBADam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/15", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                //////////////////////////////  西吉马建坝系////////////////////////////////////////
                var rendererMaJianBa = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererMaJianBa.addValue("0", new SimpleFillSymbol().setColor(new Color([90, 90, 255, 0.2])));
                featureLayerMaJianBaBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/62", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerMaJianBaBundary.setRenderer(rendererMaJianBa);
                featureLayerMaJianBaRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/31", {
                    visible: false
                });
                featureLayerMaJianBaDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/16", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                //////////////////////////////  西吉聂家河坝系////////////////////////////////////////
                var rendererNieHeBa = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererNieHeBa.addValue("0", new SimpleFillSymbol().setColor(new Color([80, 80, 255, 0.2])));
                featureLayerNieHeBaBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/54", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerNieHeBaBundary.setRenderer(rendererNieHeBa);
                featureLayerNieHeBaRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/29", {
                    visible: false
                });
                featureLayerNieHeBaDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/8", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                //////////////////////////////  西吉三合坝系////////////////////////////////////////
                var rendererSanHeBa = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererSanHeBa.addValue("0", new SimpleFillSymbol().setColor(new Color([70, 70, 255, 0.2])));
                featureLayerSanHeBaBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/55", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerSanHeBaBundary.setRenderer(rendererSanHeBa);
                featureLayerSanHeBaRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/30", {
                    visible: false
                });
                featureLayerSanHeBaDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/9", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                //////////////////////////////  盐池桑记沟坝系////////////////////////////////////////
                var rendererSangJiGouBa = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererSangJiGouBa.addValue("0", new SimpleFillSymbol().setColor(new Color([60, 60, 255, 0.2])));
                featureLayerSangJiGouBaBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/56", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerSangJiGouBaBundary.setRenderer(rendererSangJiGouBa);
                featureLayerSangJiGouBaRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/32", {
                    visible: false
                });
                featureLayerSangJiGouBaDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/10", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                // ////////////////////////////  盐池杏树梁坝系////////////////////////////////////////
                var rendererXingShuNiangBa = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererXingShuNiangBa.addValue("0", new SimpleFillSymbol().setColor(new Color([50, 50, 255, 0.2])));
                featureLayerXingShuNiangBaBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/52", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerXingShuNiangBaBundary.setRenderer(rendererXingShuNiangBa);
                featureLayerXingShuNiangBaRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/27", {
                    visible: false
                });
                featureLayerXingShuNiangBaDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/6", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                //////////////////////////////   盐池荫子沟坝系////////////////////////////////////////
                var rendererYinZiGouBa = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererYinZiGouBa.addValue("0", new SimpleFillSymbol().setColor(new Color([40, 40, 255, 0.2])));
                featureLayerYinZiGouBaBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/50", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerYinZiGouBaBundary.setRenderer(rendererYinZiGouBa);
                featureLayerYinZiGouBaRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/25", {
                    visible: false
                });
                featureLayerYinZiGouBaDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/4", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                //////////////////////////////  原州区唐家河坝系////////////////////////////////////////
                var rendererTangJiaHeBa = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererTangJiaHeBa.addValue("0", new SimpleFillSymbol().setColor(new Color([30, 30, 255, 0.2])));
                featureLayerTangJiaHeBaBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/49", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerTangJiaHeBaBundary.setRenderer(rendererTangJiaHeBa);
                featureLayerTangJiaHeBaRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/33", {
                    visible: false
                });
                featureLayerTangJiaHeBaDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/3", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                //////////////////////////////  原州西川坝系////////////////////////////////////////
                var rendererXiChuanBa = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererXiChuanBa.addValue("0", new SimpleFillSymbol().setColor(new Color([20, 20, 255, 0.2])));
                featureLayerXiChuanBaBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/53", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerXiChuanBaBundary.setRenderer(rendererXiChuanBa);
                featureLayerXiChuanBaRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/28", {
                    visible: false
                });
                featureLayerXiChuanBaDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/7", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                //////////////////////////////   原州张易河坝系////////////////////////////////////////
                var rendererZhangYiHeBa = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererZhangYiHeBa.addValue("0", new SimpleFillSymbol().setColor(new Color([10, 10, 255, 0.2])));
                featureLayerZhangYiHeBaBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/51", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerZhangYiHeBaBundary.setRenderer(rendererZhangYiHeBa);
                featureLayerZhangYiHeRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/26", {
                    visible: false
                });
                featureLayerZhangYiHeDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/5", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                /////////////省区域///////////////////////////////////////////////////////////
                var defaultSymbol2 = new SimpleFillSymbol().setStyle(SimpleFillSymbol.STYLE_NULL);
                defaultSymbol2.outline.setStyle(SimpleLineSymbol.STYLE_NULL);
                //  defaultSymbol.setOutline(new SimpleLineSymbol(esri.symbol.SimpleLineSymbol.STYLE_SOLID, new Color([0,0,0,0]), 2));
                //create renderer
                var renderer2 = new UniqueValueRenderer(defaultSymbol2, "NAME");
                //唯一值染色
                renderer2.addValue("陕西", new SimpleFillSymbol().setColor(new Color([255, 255, 0, 0.1])));
                renderer2.addValue("宁夏", new SimpleFillSymbol().setColor(new Color([255, 0, 0, 0.1])));
                renderer2.addValue("甘肃", new SimpleFillSymbol().setColor(new Color([255, 0, 255, 0.1])));
                renderer2.addValue("青海", new SimpleFillSymbol().setColor(new Color([200, 20, 90, 0.1])));
                renderer2.addValue("山西", new SimpleFillSymbol().setColor(new Color([10, 0, 255, 0.1])));
                renderer2.addValue("河南", new SimpleFillSymbol().setColor(new Color([255, 100, 255, 0.1])));
                renderer2.addValue("内蒙古", new SimpleFillSymbol().setColor(new Color([50, 0, 50, 0.1])));
                var template = new InfoTemplate(${NAME});
                /*省区域*/
                featureLayer = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/China/ChinaProvince/MapServer/0", {
                    //infoTemplate: template,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    id: "provinceLayer"
                });
                featureLayer.setRenderer(renderer2);
                //  将图层添加到map中去
                map.addLayers([featureLayer,
                    featureLayerGiuYuanGouBundary, featureLayerGiuYuangouRiver, featureLayerGiuYuanGouDam,
                    featureLayerMaYingHeBundary, featureLayerMaYingHeRiver, featureLayerMaYingHeDam,

                    featureLayerXiangTongBundary, featureLayerXiangTongRiver, featureLayerXiangTongDam,
                    featureLayerShuiDongGouBundary, featureLayerShuiDongGouRiver, featureLayerShuiDongGouDam,
                    featureLayerHaoShuiChuanBundary, featureLayerHaoShuiChuanRiver, featureLayerHaoShuiChuanDam,
                    featureLayerShaiZiHeBundary, featureLayerShaiZiHeRiver, featureLayerShaiZiHeDam,
                    featureLayerShiZiHeBundary, featureLayerShiZiHeRiver, featureLayerShiZiHeDam,
                    featureLayerLuoWaBaBundary, featureLayerLuoWaBaRiver, featureLayerLuoWaBaDam,
                    featureLayerMiaoTaiBaBundary, featureLayerMiaoTaiBaRiver, featureLayerMiaoTaiBaDam,
                    featureLayerRuHeErQiBaBundary, featureLayerRuHeErQiBaRiver, featureLayerRuHeErQiBaDam,
                    featureLayerRuHeYiQiBaBundary, featureLayerRuHeYiQiBaRiver, featureLayerRuHeYiQiBaDam,
                    featureLayerGaoChuanBaBundary, featureLayerGaoChuanBaRiver, featureLayerGaoChuanBaDam,
                    featureLayerCheLuBaBundary, featureLayerCheLuBaRiver, featureLayerCheLuBaDam,
                    featureLayerHuLuHeBaBundary, featureLayerHuLuHeBaRiver, featureLayerHuLuHeBaDam,
                    featureLayerLanNiHeBaBundary, featureLayerLanNiHeBaRiver, featureLayerLanNiHeBADam,
                    featureLayerMaJianBaBundary, featureLayerMaJianBaRiver, featureLayerMaJianBaDam,
                    featureLayerNieHeBaBundary, featureLayerNieHeBaRiver, featureLayerNieHeBaDam,
                    featureLayerSanHeBaBundary, featureLayerSanHeBaRiver, featureLayerSanHeBaDam,
                    featureLayerSangJiGouBaBundary, featureLayerSangJiGouBaRiver, featureLayerSangJiGouBaDam,
                    featureLayerXingShuNiangBaBundary, featureLayerXingShuNiangBaRiver, featureLayerXingShuNiangBaDam,
                    featureLayerYinZiGouBaBundary, featureLayerYinZiGouBaRiver, featureLayerYinZiGouBaRiver,
                    featureLayerTangJiaHeBaBundary, featureLayerTangJiaHeBaRiver, featureLayerTangJiaHeBaDam,
                    featureLayerXiChuanBaBundary, featureLayerXiChuanBaRiver, featureLayerXiChuanBaDam,
                    featureLayerZhangYiHeBaBundary, featureLayerZhangYiHeRiver, featureLayerZhangYiHeDam

                ]);
                // map.addLayer(featureLayer);
                // 调用点聚合的方法
                clusterLayerFun();
            }

            function clusterLayerFun() {
                //alert("hhahahah");
                //  从json文件中获取最新的1000张照片
                var photos = esri.request({
                    "url": "../data/data.json"
                });
                // 这里调用了方法  添加点集成
                photos.then(addClusters, error);

            }

            function addClusters(resp) {
                var photoInfo = {};
                var wgs = new esri.SpatialReference({
                    "wkid": 4326
                });
                photoInfo.data = dojo.map(resp, function (p) {
                    //点的经纬度
                    // var latlng = new esri.geometry.Point(parseFloat(p.lng), parseFloat(p.lat), wgs);
                    var latlng = new esri.geometry.Point(parseFloat(p.longitude), parseFloat(p.latitude), wgs);
                    var webMercator = esri.geometry.geographicToWebMercator(latlng);    //经纬度
                    //  将这个属性添加点的弹框显示中去
                    var attributes = {
                        //  这里面的  p.key   key为json中字段名称
                        "damname": p.damName,
                        "smallriverordamname": p.riverName,
                        "longitude": p.longitude,
                        "latitude": p.latitude,
                        "damSort": p.damSort
                    };
                    return {
                        "x": webMercator.x,
                        "y": webMercator.y,
                        "attributes": attributes
                    };
                });
                var popupTemplate = esri.dijit.PopupTemplate({
                    "title": "",
                    "fieldInfos": [{
                        "fieldName": "damname",   //   上面定义的名称
                        "label": "淤地坝名",
                        visible: true
                    }, {
                        "fieldName": "smallriverordamname",
                        "label": "小河流域",
                        visible: true
                    }, {
                        "fieldName": "longitude",
                        "label": "经度",
                        visible: true
                    }, {
                        "fieldName": "latitude",
                        "label": "纬度",
                        visible: true
                    }, {
                        "fieldName": "damSort",
                        "label": "淤地坝类型",
                        visible: true
                    }]
                });


                // cluster layer that uses OpenLayers style clustering
                clusterLayer = new ClusterLayer({
                    "data": photoInfo.data,
                    "distance": 100,
                    "id": "clusters",
                    "labelColor": "black",//"#fff",
                    "labelOffset": 10,
                    "resolution": map.extent.getWidth() / map.width,
                    "singleColor": "#888",
                    "singleTemplate": popupTemplate
                });

                //  这是对于点的渲染
                var defaultSym = new esri.symbol.SimpleMarkerSymbol().setSize(4);
                renderer = new esri.renderer.ClassBreaksRenderer(defaultSym, "clusterCount");
                //  三种颜色的图标来分别表示  三种聚合的不同状态
                var blue = new esri.symbol.PictureMarkerSymbol("../img/BluePin1LargeB.png", 32, 32).setOffset(0, 15);
                var green = new esri.symbol.PictureMarkerSymbol("../img/GreenPin1LargeB.png", 64, 64).setOffset(0, 15);
                var red = new esri.symbol.PictureMarkerSymbol("../img/RedPin1LargeB.png", 72, 72).setOffset(0, 15);
                //test = new esri.symbol.PictureMarkerSymbol("http://10.102.2.244:8080/img/damTypePic/small.png", 32, 32).setOffset(0, 15);
                //  换成自己的图片
                renderer.addBreak(0, 2, blue);
                renderer.addBreak(2, 3000, green);
                renderer.addBreak(3000, 6000, red);
                clusterLayer.setRenderer(renderer);

                // 将聚合成的效果添加到map中去
                map.addLayer(clusterLayer);

                map.on("key-down", function (e) {
                    if (e.keyCode == 27) {
                        cleanUp();
                    }
                });
            }

            function cleanUp() {
                map.infoWindow.hide();
                clusterLayer.clearSingles();
            }

            function error(err) {
                console.log("something failed: ", err);
            }


            //  图层的显示和隐藏
            var hiddenToggle1 = document.getElementById("streetsLyr1");
            hiddenToggle1.addEventListener("change", function () {
                featureLayerGiuYuanGouBundary.setVisibility(hiddenToggle1.checked);
                featureLayerGiuYuangouRiver.setVisibility(hiddenToggle1.checked);
                featureLayerGiuYuanGouDam.setVisibility(hiddenToggle1.checked);
                map.centerAndZoom([110.266337, 37.578248], 11);
            });

            var hiddenToggle2 = document.getElementById("streetsLyr2");
            hiddenToggle2.addEventListener("change", function () {
                featureLayerMaYingHeBundary.setVisibility(hiddenToggle2.checked);
                featureLayerMaYingHeRiver.setVisibility(hiddenToggle2.checked);
                featureLayerMaYingHeDam.setVisibility(hiddenToggle2.checked);
                map.centerAndZoom([105.795556, 36.548333], 11);
            });

            var hiddenToggle3 = document.getElementById("streetsLyr3");
            hiddenToggle3.addEventListener("change", function () {
                featureLayerXiangTongBundary.setVisibility(hiddenToggle3.checked);
                featureLayerXiangTongRiver.setVisibility(hiddenToggle3.checked);
                featureLayerXiangTongDam.setVisibility(hiddenToggle3.checked);
                map.centerAndZoom([105.373611, 36.486944], 11);
            });

            var hiddenToggle4 = document.getElementById("streetsLyr4");
            hiddenToggle4.addEventListener("change", function () {
                featureLayerShuiDongGouBundary.setVisibility(hiddenToggle4.checked);
                featureLayerShuiDongGouRiver.setVisibility(hiddenToggle4.checked);
                featureLayerShuiDongGouDam.setVisibility(hiddenToggle4.checked);
                map.centerAndZoom([106.533889, 38.270556], 11);
            });

            var hiddenToggle5 = document.getElementById("streetsLyr5");
            hiddenToggle5.addEventListener("change", function () {
                featureLayerHaoShuiChuanBundary.setVisibility(hiddenToggle5.checked);
                featureLayerHaoShuiChuanRiver.setVisibility(hiddenToggle5.checked);
                featureLayerHaoShuiChuanDam.setVisibility(hiddenToggle5.checked);
                map.centerAndZoom([105.9425, 35.658611], 11);
            });

            var hiddenToggle6 = document.getElementById("streetsLyr6");
            hiddenToggle6.addEventListener("change", function () {
                featureLayerShaiZiHeBundary.setVisibility(hiddenToggle6.checked);
                featureLayerShaiZiHeRiver.setVisibility(hiddenToggle6.checked);
                featureLayerShaiZiHeDam.setVisibility(hiddenToggle6.checked);
                map.centerAndZoom([105.920833, 35.604167], 11);
            });

            var hiddenToggle7 = document.getElementById("streetsLyr7");
            hiddenToggle7.addEventListener("change", function () {
                featureLayerShiZiHeBundary.setVisibility(hiddenToggle7.checked);
                featureLayerShiZiHeRiver.setVisibility(hiddenToggle7.checked);
                featureLayerShiZiHeDam.setVisibility(hiddenToggle7.checked);
                map.centerAndZoom([106.12, 35.741389], 11);
            });

            var hiddenToggle8 = document.getElementById("streetsLyr8");
            hiddenToggle8.addEventListener("change", function () {
                featureLayerLuoWaBaBundary.setVisibility(hiddenToggle8.checked);
                featureLayerLuoWaBaRiver.setVisibility(hiddenToggle8.checked);
                featureLayerLuoWaBaDam.setVisibility(hiddenToggle8.checked);
                map.centerAndZoom([106.600278, 36.224722], 11);
            });

            var hiddenToggle9 = document.getElementById("streetsLyr9");
            hiddenToggle9.addEventListener("change", function () {
                featureLayerMiaoTaiBaBundary.setVisibility(hiddenToggle9.checked);
                featureLayerMiaoTaiBaRiver.setVisibility(hiddenToggle9.checked);
                featureLayerMiaoTaiBaDam.setVisibility(hiddenToggle9.checked);
                map.centerAndZoom([106.585278, 36.166667], 11);
            });

            var hiddenToggle10 = document.getElementById("streetsLyr10");
            hiddenToggle10.addEventListener("change", function () {
                featureLayerRuHeErQiBaBundary.setVisibility(hiddenToggle10.checked);
                featureLayerRuHeErQiBaRiver.setVisibility(hiddenToggle10.checked);
                featureLayerRuHeErQiBaDam.setVisibility(hiddenToggle10.checked);
                map.centerAndZoom([106.454444, 36.242778], 11);
            });

            ////////////////////////////////////////////////////////////////////////////
            var hiddenToggle11 = document.getElementById("streetsLyr11");
            hiddenToggle11.addEventListener("change", function () {
                featureLayerRuHeYiQiBaBundary.setVisibility(hiddenToggle11.checked);
                featureLayerRuHeYiQiBaRiver.setVisibility(hiddenToggle11.checked);
                featureLayerRuHeYiQiBaDam.setVisibility(hiddenToggle11.checked);
                map.centerAndZoom([106.428333, 35.983889], 11);
            });

            var hiddenToggle12 = document.getElementById("streetsLyr12");
            hiddenToggle12.addEventListener("change", function () {
                featureLayerGaoChuanBaBundary.setVisibility(hiddenToggle12.checked);
                featureLayerGaoChuanBaRiver.setVisibility(hiddenToggle12.checked);
                featureLayerGaoChuanBaDam.setVisibility(hiddenToggle12.checked);
                map.centerAndZoom([105.539444, 36.7775], 11);
            });

            var hiddenToggle13 = document.getElementById("streetsLyr13");
            hiddenToggle13.addEventListener("change", function () {
                featureLayerCheLuBaBundary.setVisibility(hiddenToggle13.checked);
                featureLayerCheLuBaRiver.setVisibility(hiddenToggle13.checked);
                featureLayerCheLuBaDam.setVisibility(hiddenToggle13.checked);
                map.centerAndZoom([105.815, 36.022778], 11);
            });

            var hiddenToggle14 = document.getElementById("streetsLyr14");
            hiddenToggle14.addEventListener("change", function () {
                featureLayerHuLuHeBaBundary.setVisibility(hiddenToggle14.checked);
                featureLayerHuLuHeBaRiver.setVisibility(hiddenToggle14.checked);
                featureLayerHuLuHeBaDam.setVisibility(hiddenToggle14.checked);
                map.centerAndZoom([105.688611, 36.025], 11);
            });

            var hiddenToggle15 = document.getElementById("streetsLyr15");
            hiddenToggle15.addEventListener("change", function () {
                featureLayerLanNiHeBaBundary.setVisibility(hiddenToggle15.checked);
                featureLayerLanNiHeBaRiver.setVisibility(hiddenToggle15.checked);
                featureLayerLanNiHeBADam.setVisibility(hiddenToggle15.checked);
                map.centerAndZoom([105.591111, 35.7575], 11);
            });

            var hiddenToggle16 = document.getElementById("streetsLyr16");
            hiddenToggle16.addEventListener("change", function () {
                featureLayerMaJianBaBundary.setVisibility(hiddenToggle16.checked);
                featureLayerMaJianBaRiver.setVisibility(hiddenToggle16.checked);
                featureLayerMaJianBaDam.setVisibility(hiddenToggle16.checked);
                map.centerAndZoom([105.530278, 35.969722], 11);
            });

            var hiddenToggle17 = document.getElementById("streetsLyr17");
            hiddenToggle17.addEventListener("change", function () {
                featureLayerNieHeBaBundary.setVisibility(hiddenToggle17.checked);
                featureLayerNieHeBaRiver.setVisibility(hiddenToggle17.checked);
                featureLayerNieHeBaDam.setVisibility(hiddenToggle17.checked);
                map.centerAndZoom([105.654167, 35.799167], 11);
            });

            var hiddenToggle18 = document.getElementById("streetsLyr18");
            hiddenToggle18.addEventListener("change", function () {
                featureLayerSanHeBaBundary.setVisibility(hiddenToggle18.checked);
                featureLayerSanHeBaRiver.setVisibility(hiddenToggle18.checked);
                featureLayerSanHeBaDam.setVisibility(hiddenToggle18.checked);
                map.centerAndZoom([105.5475, 35.771389], 11);
            });

            var hiddenToggle19 = document.getElementById("streetsLyr19");
            hiddenToggle19.addEventListener("change", function () {
                featureLayerSangJiGouBaBundary.setVisibility(hiddenToggle19.checked);
                featureLayerSangJiGouBaRiver.setVisibility(hiddenToggle19.checked);
                featureLayerSangJiGouBaDam.setVisibility(hiddenToggle19.checked);
                map.centerAndZoom([107.071667, 37.193333], 11);
            });

            var hiddenToggle20 = document.getElementById("streetsLyr20");
            hiddenToggle20.addEventListener("change", function () {
                featureLayerXingShuNiangBaBundary.setVisibility(hiddenToggle20.checked);
                featureLayerXingShuNiangBaRiver.setVisibility(hiddenToggle20.checked);
                featureLayerXingShuNiangBaDam.setVisibility(hiddenToggle20.checked);
                map.centerAndZoom([106.913333, 37.193333], 11);
            });

            var hiddenToggle21 = document.getElementById("streetsLyr21");
            hiddenToggle21.addEventListener("change", function () {
                featureLayerYinZiGouBaBundary.setVisibility(hiddenToggle21.checked);
                featureLayerYinZiGouBaRiver.setVisibility(hiddenToggle21.checked);
                featureLayerYinZiGouBaDam.setVisibility(hiddenToggle21.checked);
                map.centerAndZoom([107.023333, 37.246667], 11);
            });

            var hiddenToggle22 = document.getElementById("streetsLyr22");
            hiddenToggle22.addEventListener("change", function () {
                featureLayerTangJiaHeBaBundary.setVisibility(hiddenToggle22.checked);
                featureLayerTangJiaHeBaRiver.setVisibility(hiddenToggle22.checked);
                featureLayerTangJiaHeBaDam.setVisibility(hiddenToggle22.checked);
                map.centerAndZoom([105.941111, 35.7525], 11);
            });

            var hiddenToggle23 = document.getElementById("streetsLyr23");
            hiddenToggle23.addEventListener("change", function () {
                featureLayerXiChuanBaBundary.setVisibility(hiddenToggle23.checked);
                featureLayerXiChuanBaRiver.setVisibility(hiddenToggle23.checked);
                featureLayerXiChuanBaDam.setVisibility(hiddenToggle23.checked);
                map.centerAndZoom([106.411667, 36.351944], 11);
            });

            var hiddenToggle24 = document.getElementById("streetsLyr24");
            hiddenToggle24.addEventListener("change", function () {
                featureLayerZhangYiHeBaBundary.setVisibility(hiddenToggle24.checked);
                featureLayerZhangYiHeRiver.setVisibility(hiddenToggle24.checked);
                featureLayerZhangYiHeDam.setVisibility(hiddenToggle24.checked);
                map.centerAndZoom([106.033611, 35.866944], 11);
            });

        });
    }



    /**全屏显示以及全屏退出*/
    document.getElementById("layerToggle1").onclick = function () {
        //  在这里改变地图显示的中心和zoom

        if (document.getElementById("mapContent").RequestFullScreen) {
            document.getElementById("mapContent").RequestFullScreen();
        }
        //兼容火狐
        console.log(document.documentElement.msRequestFullscreen);

        if (document.getElementById("mapContent").mozRequestFullScreen) {
            // console.log("火狐")
            document.getElementById("mapContent").mozRequestFullScreen();
        }
        //兼容谷歌等可以webkitRequestFullScreen也可以webkitRequestFullscreen
        if (document.getElementById("mapContent").webkitRequestFullScreen) {
            // console.log("谷歌");
            document.getElementById("mapContent").webkitRequestFullScreen();
        }
        //兼容IE,只能写msRequestFullscreen
        if (document.getElementById("mapContent").msRequestFullscreen) {
            // console.log("ie");
            document.getElementById("mapContent").msRequestFullscreen();
        }

        map.centerAndZoom([105.258055544, 38.613923758], 8);
    };

    function requestFullScreen(element) {
        var requestMethod = element.msRequestFullscreen() || element.webkitRequestFullScreen || element.mozRequestFullScreen || element.msRequestFullScreen;
        if (requestMethod) {
            requestMethod.call(element);
        } else if (typeof window.ActiveXObject !== "undefined") {
            var wscript = new ActiveXObject("WScript.Shell");
            if (wscript !== null) {
                wscript.SendKeys("{F11}");
            }
        }
    }


</script>--%>

<script type="text/javascript">

    var renderer;
    var test;
    //initJson();
    var map;
    var clusterLayer;
    var pointA;
    var featureLayer;
    // 韭园沟坝系
    var featureLayerGiuYuanGouBundary;
    var featureLayerGiuYuangouRiver;
    var featureLayerGiuYuanGouDam;
   /* ///  海原马营河坝系
    var featureLayerMaYingHeBundary;
    var featureLayerMaYingHeRiver;
    var featureLayerMaYingHeDam;
    ///  海原相桐坝系
    var featureLayerXiangTongBundary;
    var featureLayerXiangTongRiver;
    var featureLayerXiangTongDam;
    //  灵武水洞沟坝系
    var featureLayerShuiDongGouBundary;
    var featureLayerShuiDongGouRiver;
    var featureLayerShuiDongGouDam;
    //  隆德好水川坝系
    var featureLayerHaoShuiChuanBundary;
    var featureLayerHaoShuiChuanRiver;
    var featureLayerHaoShuiChuanDam;
    //  隆德筛子河坝系
    var featureLayerShaiZiHeBundary;
    var featureLayerShaiZiHeRiver;
    var featureLayerShaiZiHeDam;
    //  隆德什字河坝系
    var featureLayerShiZiHeBundary;
    var featureLayerShiZiHeRiver;
    var featureLayerShiZiHeDam;
    //  彭阳罗洼坝系
    var featureLayerLuoWaBaBundary;
    var featureLayerLuoWaBaRiver;
    var featureLayerLuoWaBaDam;
    //  彭阳庙台坝系
    var featureLayerMiaoTaiBaBundary;
    var featureLayerMiaoTaiBaRiver;
    var featureLayerMiaoTaiBaDam;
    //  彭阳茹河二期坝系
    var featureLayerRuHeErQiBaBundary;
    var featureLayerRuHeErQiBaRiver;
    var featureLayerRuHeErQiBaDam;
    //  彭阳茹河一期坝系
    var featureLayerRuHeYiQiBaBundary;
    var featureLayerRuHeYiQiBaRiver;
    var featureLayerRuHeYiQiBaDam;
    //  沙坡头嵩川坝系
    var featureLayerGaoChuanBaBundary;
    var featureLayerGaoChuanBaRiver;
    var featureLayerGaoChuanBaDam;
    //  西吉车路沟坝系
    var featureLayerCheLuBaBundary;
    var featureLayerCheLuBaRiver;
    var featureLayerCheLuBaDam;
    //  西吉葫芦河坝系
    var featureLayerHuLuHeBaBundary;
    var featureLayerHuLuHeBaRiver;
    var featureLayerHuLuHeBaDam;
    //  西吉滥泥河坝系
    var featureLayerLanNiHeBaBundary;
    var featureLayerLanNiHeBaRiver;
    var featureLayerLanNiHeBADam;
    //  西吉马建坝系
    var featureLayerMaJianBaBundary;
    var featureLayerMaJianBaRiver;
    var featureLayerMaJianBaDam;
    //  西吉聂家河坝系
    var featureLayerNieHeBaBundary;
    var featureLayerNieHeBaRiver;
    var featureLayerNieHeBaDam;
    //  西吉三合坝系
    var featureLayerSanHeBaBundary;
    var featureLayerSanHeBaRiver;
    var featureLayerSanHeBaDam;
    //  盐池桑记沟坝系
    var featureLayerSangJiGouBaBundary;
    var featureLayerSangJiGouBaRiver;
    var featureLayerSangJiGouBaDam;
    //  盐池杏树梁坝系
    var featureLayerXingShuNiangBaBundary;
    var featureLayerXingShuNiangBaRiver;
    var featureLayerXingShuNiangBaDam;
    //  盐池荫子沟坝系
    var featureLayerYinZiGouBaBundary;
    var featureLayerYinZiGouBaRiver;
    var featureLayerYinZiGouBaDam;
    //  原州区唐家河坝系
    var featureLayerTangJiaHeBaBundary;
    var featureLayerTangJiaHeBaRiver;
    var featureLayerTangJiaHeBaDam;
    //  原州西川坝系
    var featureLayerXiChuanBaBundary;
    var featureLayerXiChuanBaRiver;
    var featureLayerXiChuanBaDam;
    //  原州张易河坝系
    var featureLayerZhangYiHeBaBundary;
    var featureLayerZhangYiHeRiver;
    var featureLayerZhangYiHeDam;*/

    //  将所有的图层装到一个数据里面去
    var allLayerArray = new Array();

    

    function initJson() {
        require([
            "esri/map",
            "esri/layers/FeatureLayer",
            "esri/InfoTemplate",
            "esri/symbols/SimpleLineSymbol",
            "esri/symbols/SimpleFillSymbol",
            "esri/renderers/UniqueValueRenderer",
            "esri/Color",
            "esri/dijit/BasemapToggle",
            "extras/ClusterLayer",
            "esri/geometry/Point",
            "esri/dijit/OverviewMap",
            "dojo/domReady!"
        ], function (Map, FeatureLayer, InfoTemplate,
                     SimpleLineSymbol, SimpleFillSymbol,
                     UniqueValueRenderer, Color, BasemapToggle, ClusterLayer, OverviewMap, Point) {

            // parser.parse();
            map = new Map("mapContent", {
                center: [106.258055544, 37.613923758],
                zoom: 5,
                /* center: [110.328607,37.587625],   //110.30775,37.5546944444444
                 zoom: 13,*/
                basemap: "osm",    //地图样式的类型
                logo: false,
                slider: false
            });
            //切换卫星地图
            var toggle = new BasemapToggle({
                map: map,
                basemap: "satellite"    //地图样式的类型
            }, "BasemapToggle");
            toggle.startup();


            map.on("load", addFeatureLayer);

            //  这个方法里面添加FeatureLayer层
            function addFeatureLayer() {

                //////////////////韭园沟数据/////////////////////////////////////////////////
                var defaultSymbol = new SimpleFillSymbol().setStyle(SimpleFillSymbol.STYLE_NULL);
                defaultSymbol.outline.setStyle(SimpleLineSymbol.STYLE_NULL);
                //create renderer
                var renderer = new UniqueValueRenderer(defaultSymbol, "FID");
                //唯一值染色
                renderer.addValue("0", new SimpleFillSymbol().setColor(new Color([100, 78, 50, 0.2])));
                var template1 = new InfoTemplate(${NAME});

                //  边界
                featureLayerGiuYuanGouBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/jiuYuanGou/MapServer/2", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerGiuYuanGouBundary.setRenderer(renderer);
                featureLayerGiuYuangouRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/jiuYuanGou/MapServer/1", {
                    visible: false
                });
                var template3 = new InfoTemplate(${NAME});
                featureLayerGiuYuanGouDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/jiuYuanGou/MapServer/0", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });

                /////////////////////////海原马营河坝系/////////////////////////////////////////////////////////
                var rendererMaYingHe = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererMaYingHe.addValue("0", new SimpleFillSymbol().setColor(new Color([255, 50, 50, 0.2])));
                featureLayerMaYingHeBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/48", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerMaYingHeBundary.setRenderer(rendererMaYingHe);
                featureLayerMaYingHeRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/24", {
                    visible: false
                });
                featureLayerMaYingHeDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/2", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                ////////////////////海原相桐坝系//////////////////////////////////////////////////////////////////
                var rendererXiangTong = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererXiangTong.addValue("0", new SimpleFillSymbol().setColor(new Color([240, 100, 50, 0.2])));
                featureLayerXiangTongBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/47", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerXiangTongBundary.setRenderer(rendererXiangTong);
                featureLayerXiangTongRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/23", {
                    visible: false
                });
                featureLayerXiangTongDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/1", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                ////////////////  灵武水洞沟坝系////////////////////////////////////////////////////////////////
                var rendererShuiDongGou = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererShuiDongGou.addValue("0", new SimpleFillSymbol().setColor(new Color([255, 40, 255, 0.2])));
                featureLayerShuiDongGouBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/46", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerShuiDongGouBundary.setRenderer(rendererShuiDongGou);
                featureLayerShuiDongGouRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/43", {
                    visible: false
                });
                featureLayerShuiDongGouDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/0", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                ////////////////  隆德好水川坝系////////////////////////////////////////////////////////////////
                var rendererHaoShuiChuan = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererHaoShuiChuan.addValue("0", new SimpleFillSymbol().setColor(new Color([80, 255, 10, 0.2])));
                featureLayerHaoShuiChuanBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/66", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerHaoShuiChuanBundary.setRenderer(rendererHaoShuiChuan);
                featureLayerHaoShuiChuanRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/44", {
                    visible: false
                });
                featureLayerHaoShuiChuanDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/20", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                ////////////////  隆德筛子河坝系////////////////////////////////////////////////////////////////
                var rendererShaiZiHe = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererShaiZiHe.addValue("0", new SimpleFillSymbol().setColor(new Color([70, 70, 50, 0.2])));
                featureLayerShaiZiHeBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/67", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerShaiZiHeBundary.setRenderer(rendererShaiZiHe);
                featureLayerShaiZiHeRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/45", {
                    visible: false
                });
                featureLayerShaiZiHeDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/21", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                ////////////////  隆德什字河坝系////////////////////////////////////////////////////////////////
                var rendererShiZiHe = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererShiZiHe.addValue("0", new SimpleFillSymbol().setColor(new Color([250, 70, 10, 0.2])));
                featureLayerShiZiHeBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/68", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerShiZiHeBundary.setRenderer(rendererShiZiHe);
                featureLayerShiZiHeRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/40", {
                    visible: false
                });
                featureLayerShiZiHeDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/22", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                ////////////////  彭阳罗洼坝系////////////////////////////////////////////////////////////////
                var rendererLuoWaBa = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererLuoWaBa.addValue("0", new SimpleFillSymbol().setColor(new Color([10, 60, 100, 0.2])));
                featureLayerLuoWaBaBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/63", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerLuoWaBaBundary.setRenderer(rendererLuoWaBa);
                featureLayerLuoWaBaRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/41", {
                    visible: false
                });
                featureLayerLuoWaBaDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/17", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                //////////////////////////////  彭阳庙台坝系////////////////////////////////////////
                var rendererMiaoTaiBa = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererMiaoTaiBa.addValue("0", new SimpleFillSymbol().setColor(new Color([200, 10, 10, 0.2])));
                featureLayerMiaoTaiBaBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/64", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerMiaoTaiBaBundary.setRenderer(rendererMiaoTaiBa);
                featureLayerMiaoTaiBaRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/42", {
                    visible: false
                });
                featureLayerMiaoTaiBaDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/18", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                //////////////////////////////    彭阳茹河二期坝系////////////////////////////////////////
                var rendererRuHeErQiBa = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererRuHeErQiBa.addValue("0", new SimpleFillSymbol().setColor(new Color([100, 50, 20, 0.2])));
                featureLayerRuHeErQiBaBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/65", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerRuHeErQiBaBundary.setRenderer(rendererRuHeErQiBa);
                featureLayerRuHeErQiBaRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/34", {
                    visible: false
                });
                featureLayerRuHeErQiBaDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/19", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                // ////////////////////////////  彭阳茹河一期坝系////////////////////////////////////////
                var rendererRuHeYiQiBa = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererRuHeYiQiBa.addValue("0", new SimpleFillSymbol().setColor(new Color([0, 100, 255, 0.2])));
                featureLayerRuHeYiQiBaBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/57", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerRuHeYiQiBaBundary.setRenderer(rendererRuHeYiQiBa);
                featureLayerRuHeYiQiBaRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/35", {
                    visible: false
                });
                featureLayerRuHeYiQiBaDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/11", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                //////////////////////////////  沙坡头嵩川坝系////////////////////////////////////////
                var rendererGaoChuanBa = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererGaoChuanBa.addValue("0", new SimpleFillSymbol().setColor(new Color([130, 0, 255, 0.2])));
                featureLayerGaoChuanBaBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/58", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerGaoChuanBaBundary.setRenderer(rendererGaoChuanBa);
                featureLayerGaoChuanBaRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/36", {
                    visible: false
                });
                featureLayerGaoChuanBaDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/12", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                //////////////////////////////    西吉车路沟坝系////////////////////////////////////////
                var rendererCheLuBa = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererCheLuBa.addValue("0", new SimpleFillSymbol().setColor(new Color([120, 120, 255, 0.2])));
                featureLayerCheLuBaBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/59", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerCheLuBaBundary.setRenderer(rendererCheLuBa);
                featureLayerCheLuBaRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/37", {
                    visible: false
                });
                featureLayerCheLuBaDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/13", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                //////////////////////////////   西吉葫芦河坝系////////////////////////////////////////
                var rendererHuLuHeBa = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererHuLuHeBa.addValue("0", new SimpleFillSymbol().setColor(new Color([110, 110, 255, 0.2])));
                featureLayerHuLuHeBaBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/60", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerHuLuHeBaBundary.setRenderer(rendererHuLuHeBa);
                featureLayerHuLuHeBaRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/38", {
                    visible: false
                });
                featureLayerHuLuHeBaDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/14", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                //////////////////////////////   西吉滥泥河坝系////////////////////////////////////////
                var rendererLanNiHeBa = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererLanNiHeBa.addValue("0", new SimpleFillSymbol().setColor(new Color([100, 100, 255, 0.2])));
                featureLayerLanNiHeBaBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/61", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerLanNiHeBaBundary.setRenderer(rendererLanNiHeBa);
                featureLayerLanNiHeBaRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/39", {
                    visible: false
                });
                featureLayerLanNiHeBADam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/15", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                //////////////////////////////  西吉马建坝系////////////////////////////////////////
                var rendererMaJianBa = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererMaJianBa.addValue("0", new SimpleFillSymbol().setColor(new Color([90, 90, 255, 0.2])));
                featureLayerMaJianBaBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/62", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerMaJianBaBundary.setRenderer(rendererMaJianBa);
                featureLayerMaJianBaRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/31", {
                    visible: false
                });
                featureLayerMaJianBaDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/16", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                //////////////////////////////  西吉聂家河坝系////////////////////////////////////////
                var rendererNieHeBa = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererNieHeBa.addValue("0", new SimpleFillSymbol().setColor(new Color([80, 80, 255, 0.2])));
                featureLayerNieHeBaBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/54", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerNieHeBaBundary.setRenderer(rendererNieHeBa);
                featureLayerNieHeBaRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/29", {
                    visible: false
                });
                featureLayerNieHeBaDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/8", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                //////////////////////////////  西吉三合坝系////////////////////////////////////////
                var rendererSanHeBa = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererSanHeBa.addValue("0", new SimpleFillSymbol().setColor(new Color([70, 70, 255, 0.2])));
                featureLayerSanHeBaBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/55", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerSanHeBaBundary.setRenderer(rendererSanHeBa);
                featureLayerSanHeBaRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/30", {
                    visible: false
                });
                featureLayerSanHeBaDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/9", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                //////////////////////////////  盐池桑记沟坝系////////////////////////////////////////
                var rendererSangJiGouBa = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererSangJiGouBa.addValue("0", new SimpleFillSymbol().setColor(new Color([60, 60, 255, 0.2])));
                featureLayerSangJiGouBaBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/56", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerSangJiGouBaBundary.setRenderer(rendererSangJiGouBa);
                featureLayerSangJiGouBaRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/32", {
                    visible: false
                });
                featureLayerSangJiGouBaDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/10", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                // ////////////////////////////  盐池杏树梁坝系////////////////////////////////////////
                var rendererXingShuNiangBa = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererXingShuNiangBa.addValue("0", new SimpleFillSymbol().setColor(new Color([50, 50, 255, 0.2])));
                featureLayerXingShuNiangBaBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/52", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerXingShuNiangBaBundary.setRenderer(rendererXingShuNiangBa);
                featureLayerXingShuNiangBaRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/27", {
                    visible: false
                });
                featureLayerXingShuNiangBaDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/6", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                //////////////////////////////   盐池荫子沟坝系////////////////////////////////////////
                var rendererYinZiGouBa = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererYinZiGouBa.addValue("0", new SimpleFillSymbol().setColor(new Color([40, 40, 255, 0.2])));
                featureLayerYinZiGouBaBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/50", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerYinZiGouBaBundary.setRenderer(rendererYinZiGouBa);
                featureLayerYinZiGouBaRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/25", {
                    visible: false
                });
                featureLayerYinZiGouBaDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/4", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                //////////////////////////////  原州区唐家河坝系////////////////////////////////////////
                var rendererTangJiaHeBa = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererTangJiaHeBa.addValue("0", new SimpleFillSymbol().setColor(new Color([30, 30, 255, 0.2])));
                featureLayerTangJiaHeBaBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/49", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerTangJiaHeBaBundary.setRenderer(rendererTangJiaHeBa);
                featureLayerTangJiaHeBaRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/33", {
                    visible: false
                });
                featureLayerTangJiaHeBaDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/3", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                //////////////////////////////  原州西川坝系////////////////////////////////////////
                var rendererXiChuanBa = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererXiChuanBa.addValue("0", new SimpleFillSymbol().setColor(new Color([20, 20, 255, 0.2])));
                featureLayerXiChuanBaBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/53", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerXiChuanBaBundary.setRenderer(rendererXiChuanBa);
                featureLayerXiChuanBaRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/28", {
                    visible: false
                });
                featureLayerXiChuanBaDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/7", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                //////////////////////////////   原州张易河坝系////////////////////////////////////////
                var rendererZhangYiHeBa = new UniqueValueRenderer(defaultSymbol, "FID");
                rendererZhangYiHeBa.addValue("0", new SimpleFillSymbol().setColor(new Color([10, 10, 255, 0.2])));
                featureLayerZhangYiHeBaBundary = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/51", {
                    infoTemplate: template1,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                featureLayerZhangYiHeBaBundary.setRenderer(rendererZhangYiHeBa);
                featureLayerZhangYiHeRiver = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/26", {
                    visible: false
                });
                featureLayerZhangYiHeDam = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/DamSeries/NingxiaDamSeries/MapServer/5", {
                    infoTemplate: template3,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    visible: false
                });
                /////////////省区域///////////////////////////////////////////////////////////
                var defaultSymbol2 = new SimpleFillSymbol().setStyle(SimpleFillSymbol.STYLE_NULL);
                defaultSymbol2.outline.setStyle(SimpleLineSymbol.STYLE_NULL);
                //  defaultSymbol.setOutline(new SimpleLineSymbol(esri.symbol.SimpleLineSymbol.STYLE_SOLID, new Color([0,0,0,0]), 2));
                //create renderer
                var renderer2 = new UniqueValueRenderer(defaultSymbol2, "NAME");
                //唯一值染色
                renderer2.addValue("陕西", new SimpleFillSymbol().setColor(new Color([255, 255, 0, 0.1])));
                renderer2.addValue("宁夏", new SimpleFillSymbol().setColor(new Color([255, 0, 0, 0.1])));
                renderer2.addValue("甘肃", new SimpleFillSymbol().setColor(new Color([255, 0, 255, 0.1])));
                renderer2.addValue("青海", new SimpleFillSymbol().setColor(new Color([200, 20, 90, 0.1])));
                renderer2.addValue("山西", new SimpleFillSymbol().setColor(new Color([10, 0, 255, 0.1])));
                renderer2.addValue("河南", new SimpleFillSymbol().setColor(new Color([255, 100, 255, 0.1])));
                renderer2.addValue("内蒙古", new SimpleFillSymbol().setColor(new Color([50, 0, 50, 0.1])));
                var template = new InfoTemplate(${NAME});
                /*省区域*/
                featureLayer = new FeatureLayer("http://202.200.126.180:90/arcgis/rest/services/China/ChinaProvince/MapServer/0", {
                    //infoTemplate: template,
                    mode: FeatureLayer.MODE_ONDEMAND,
                    outFields: ["*"],
                    id: "provinceLayer"
                });
                featureLayer.setRenderer(renderer2);
                //  将图层添加到map中去
                map.addLayers([featureLayer,
                    featureLayerGiuYuanGouBundary, featureLayerGiuYuangouRiver, featureLayerGiuYuanGouDam,
                    featureLayerMaYingHeBundary, featureLayerMaYingHeRiver, featureLayerMaYingHeDam,

                    featureLayerXiangTongBundary, featureLayerXiangTongRiver, featureLayerXiangTongDam,
                    featureLayerShuiDongGouBundary, featureLayerShuiDongGouRiver, featureLayerShuiDongGouDam,
                    featureLayerHaoShuiChuanBundary, featureLayerHaoShuiChuanRiver, featureLayerHaoShuiChuanDam,
                    featureLayerShaiZiHeBundary, featureLayerShaiZiHeRiver, featureLayerShaiZiHeDam,
                    featureLayerShiZiHeBundary, featureLayerShiZiHeRiver, featureLayerShiZiHeDam,
                    featureLayerLuoWaBaBundary, featureLayerLuoWaBaRiver, featureLayerLuoWaBaDam,
                    featureLayerMiaoTaiBaBundary, featureLayerMiaoTaiBaRiver, featureLayerMiaoTaiBaDam,
                    featureLayerRuHeErQiBaBundary, featureLayerRuHeErQiBaRiver, featureLayerRuHeErQiBaDam,
                    featureLayerRuHeYiQiBaBundary, featureLayerRuHeYiQiBaRiver, featureLayerRuHeYiQiBaDam,
                    featureLayerGaoChuanBaBundary, featureLayerGaoChuanBaRiver, featureLayerGaoChuanBaDam,
                    featureLayerCheLuBaBundary, featureLayerCheLuBaRiver, featureLayerCheLuBaDam,
                    featureLayerHuLuHeBaBundary, featureLayerHuLuHeBaRiver, featureLayerHuLuHeBaDam,
                    featureLayerLanNiHeBaBundary, featureLayerLanNiHeBaRiver, featureLayerLanNiHeBADam,
                    featureLayerMaJianBaBundary, featureLayerMaJianBaRiver, featureLayerMaJianBaDam,
                    featureLayerNieHeBaBundary, featureLayerNieHeBaRiver, featureLayerNieHeBaDam,
                    featureLayerSanHeBaBundary, featureLayerSanHeBaRiver, featureLayerSanHeBaDam,
                    featureLayerSangJiGouBaBundary, featureLayerSangJiGouBaRiver, featureLayerSangJiGouBaDam,
                    featureLayerXingShuNiangBaBundary, featureLayerXingShuNiangBaRiver, featureLayerXingShuNiangBaDam,
                    featureLayerYinZiGouBaBundary, featureLayerYinZiGouBaRiver, featureLayerYinZiGouBaRiver,
                    featureLayerTangJiaHeBaBundary, featureLayerTangJiaHeBaRiver, featureLayerTangJiaHeBaDam,
                    featureLayerXiChuanBaBundary, featureLayerXiChuanBaRiver, featureLayerXiChuanBaDam,
                    featureLayerZhangYiHeBaBundary, featureLayerZhangYiHeRiver, featureLayerZhangYiHeDam

                ]);
                // map.addLayer(featureLayer);
                // 调用点聚合的方法
                clusterLayerFun();
            }

            function clusterLayerFun() {
                //alert("hhahahah");
                //  从json文件中获取最新的1000张照片
                var photos = esri.request({
                    "url": "../data/data.json"
                });
                // 这里调用了方法  添加点集成
                photos.then(addClusters, error);

            }

            function addClusters(resp) {
                var photoInfo = {};
                var wgs = new esri.SpatialReference({
                    "wkid": 4326
                });
                photoInfo.data = dojo.map(resp, function (p) {
                    //点的经纬度
                    // var latlng = new esri.geometry.Point(parseFloat(p.lng), parseFloat(p.lat), wgs);
                    var latlng = new esri.geometry.Point(parseFloat(p.longitude), parseFloat(p.latitude), wgs);
                    var webMercator = esri.geometry.geographicToWebMercator(latlng);    //经纬度
                    //  将这个属性添加点的弹框显示中去
                    var attributes = {
                        //  这里面的  p.key   key为json中字段名称
                        "damname": p.damName,
                        "smallriverordamname": p.riverName,
                        "longitude": p.longitude,
                        "latitude": p.latitude,
                        "damSort": p.damSort
                    };
                    return {
                        "x": webMercator.x,
                        "y": webMercator.y,
                        "attributes": attributes
                    };
                });
                var popupTemplate = esri.dijit.PopupTemplate({
                    "title": "",
                    "fieldInfos": [{
                        "fieldName": "damname",   //   上面定义的名称
                        "label": "淤地坝名",
                        visible: true
                    }, {
                        "fieldName": "smallriverordamname",
                        "label": "小河流域",
                        visible: true
                    }, {
                        "fieldName": "longitude",
                        "label": "经度",
                        visible: true
                    }, {
                        "fieldName": "latitude",
                        "label": "纬度",
                        visible: true
                    }, {
                        "fieldName": "damSort",
                        "label": "淤地坝类型",
                        visible: true
                    }]
                });


                // cluster layer that uses OpenLayers style clustering
                clusterLayer = new ClusterLayer({
                    "data": photoInfo.data,
                    "distance": 100,
                    "id": "clusters",
                    "labelColor": "black",//"#fff",
                    "labelOffset": 10,
                    "resolution": map.extent.getWidth() / map.width,
                    "singleColor": "#888",
                    "singleTemplate": popupTemplate
                });

                //  这是对于点的渲染
                var defaultSym = new esri.symbol.SimpleMarkerSymbol().setSize(4);
                renderer = new esri.renderer.ClassBreaksRenderer(defaultSym, "clusterCount");
                //  三种颜色的图标来分别表示  三种聚合的不同状态
                var blue = new esri.symbol.PictureMarkerSymbol("../img/BluePin1LargeB.png", 32, 32).setOffset(0, 15);
                var green = new esri.symbol.PictureMarkerSymbol("../img/GreenPin1LargeB.png", 64, 64).setOffset(0, 15);
                var red = new esri.symbol.PictureMarkerSymbol("../img/RedPin1LargeB.png", 72, 72).setOffset(0, 15);
                //test = new esri.symbol.PictureMarkerSymbol("http://10.102.2.244:8080/img/damTypePic/small.png", 32, 32).setOffset(0, 15);
                //  换成自己的图片
                renderer.addBreak(0, 2, blue);
                renderer.addBreak(2, 3000, green);
                renderer.addBreak(3000, 6000, red);
                clusterLayer.setRenderer(renderer);

                // 将聚合成的效果添加到map中去
                map.addLayer(clusterLayer);

                map.on("key-down", function (e) {
                    if (e.keyCode == 27) {
                        cleanUp();
                    }
                });
            }

            function cleanUp() {
                map.infoWindow.hide();
                clusterLayer.clearSingles();
            }

            function error(err) {
                console.log("something failed: ", err);
            }


            //  图层的显示和隐藏
            var hiddenToggle1 = document.getElementById("streetsLyr1");
            hiddenToggle1.addEventListener("change", function () {
                featureLayerGiuYuanGouBundary.setVisibility(hiddenToggle1.checked);
                featureLayerGiuYuangouRiver.setVisibility(hiddenToggle1.checked);
                featureLayerGiuYuanGouDam.setVisibility(hiddenToggle1.checked);
                map.centerAndZoom([110.266337, 37.578248], 11);
            });

            var hiddenToggle2 = document.getElementById("streetsLyr2");
            hiddenToggle2.addEventListener("change", function () {
                featureLayerMaYingHeBundary.setVisibility(hiddenToggle2.checked);
                featureLayerMaYingHeRiver.setVisibility(hiddenToggle2.checked);
                featureLayerMaYingHeDam.setVisibility(hiddenToggle2.checked);
                map.centerAndZoom([105.795556, 36.548333], 11);
            });

            var hiddenToggle3 = document.getElementById("streetsLyr3");
            hiddenToggle3.addEventListener("change", function () {
                featureLayerXiangTongBundary.setVisibility(hiddenToggle3.checked);
                featureLayerXiangTongRiver.setVisibility(hiddenToggle3.checked);
                featureLayerXiangTongDam.setVisibility(hiddenToggle3.checked);
                map.centerAndZoom([105.373611, 36.486944], 11);
            });

            var hiddenToggle4 = document.getElementById("streetsLyr4");
            hiddenToggle4.addEventListener("change", function () {
                featureLayerShuiDongGouBundary.setVisibility(hiddenToggle4.checked);
                featureLayerShuiDongGouRiver.setVisibility(hiddenToggle4.checked);
                featureLayerShuiDongGouDam.setVisibility(hiddenToggle4.checked);
                map.centerAndZoom([106.533889, 38.270556], 11);
            });

            var hiddenToggle5 = document.getElementById("streetsLyr5");
            hiddenToggle5.addEventListener("change", function () {
                featureLayerHaoShuiChuanBundary.setVisibility(hiddenToggle5.checked);
                featureLayerHaoShuiChuanRiver.setVisibility(hiddenToggle5.checked);
                featureLayerHaoShuiChuanDam.setVisibility(hiddenToggle5.checked);
                map.centerAndZoom([105.9425, 35.658611], 11);
            });

            var hiddenToggle6 = document.getElementById("streetsLyr6");
            hiddenToggle6.addEventListener("change", function () {
                featureLayerShaiZiHeBundary.setVisibility(hiddenToggle6.checked);
                featureLayerShaiZiHeRiver.setVisibility(hiddenToggle6.checked);
                featureLayerShaiZiHeDam.setVisibility(hiddenToggle6.checked);
                map.centerAndZoom([105.920833, 35.604167], 11);
            });

            var hiddenToggle7 = document.getElementById("streetsLyr7");
            hiddenToggle7.addEventListener("change", function () {
                featureLayerShiZiHeBundary.setVisibility(hiddenToggle7.checked);
                featureLayerShiZiHeRiver.setVisibility(hiddenToggle7.checked);
                featureLayerShiZiHeDam.setVisibility(hiddenToggle7.checked);
                map.centerAndZoom([106.12, 35.741389], 11);
            });

            var hiddenToggle8 = document.getElementById("streetsLyr8");
            hiddenToggle8.addEventListener("change", function () {
                featureLayerLuoWaBaBundary.setVisibility(hiddenToggle8.checked);
                featureLayerLuoWaBaRiver.setVisibility(hiddenToggle8.checked);
                featureLayerLuoWaBaDam.setVisibility(hiddenToggle8.checked);
                map.centerAndZoom([106.600278, 36.224722], 11);
            });

            var hiddenToggle9 = document.getElementById("streetsLyr9");
            hiddenToggle9.addEventListener("change", function () {
                featureLayerMiaoTaiBaBundary.setVisibility(hiddenToggle9.checked);
                featureLayerMiaoTaiBaRiver.setVisibility(hiddenToggle9.checked);
                featureLayerMiaoTaiBaDam.setVisibility(hiddenToggle9.checked);
                map.centerAndZoom([106.585278, 36.166667], 11);
            });

            var hiddenToggle10 = document.getElementById("streetsLyr10");
            hiddenToggle10.addEventListener("change", function () {
                featureLayerRuHeErQiBaBundary.setVisibility(hiddenToggle10.checked);
                featureLayerRuHeErQiBaRiver.setVisibility(hiddenToggle10.checked);
                featureLayerRuHeErQiBaDam.setVisibility(hiddenToggle10.checked);
                map.centerAndZoom([106.454444, 36.242778], 11);
            });

            ////////////////////////////////////////////////////////////////////////////
            var hiddenToggle11 = document.getElementById("streetsLyr11");
            hiddenToggle11.addEventListener("change", function () {
                featureLayerRuHeYiQiBaBundary.setVisibility(hiddenToggle11.checked);
                featureLayerRuHeYiQiBaRiver.setVisibility(hiddenToggle11.checked);
                featureLayerRuHeYiQiBaDam.setVisibility(hiddenToggle11.checked);
                map.centerAndZoom([106.428333, 35.983889], 11);
            });

            var hiddenToggle12 = document.getElementById("streetsLyr12");
            hiddenToggle12.addEventListener("change", function () {
                featureLayerGaoChuanBaBundary.setVisibility(hiddenToggle12.checked);
                featureLayerGaoChuanBaRiver.setVisibility(hiddenToggle12.checked);
                featureLayerGaoChuanBaDam.setVisibility(hiddenToggle12.checked);
                map.centerAndZoom([105.539444, 36.7775], 11);
            });

            var hiddenToggle13 = document.getElementById("streetsLyr13");
            hiddenToggle13.addEventListener("change", function () {
                featureLayerCheLuBaBundary.setVisibility(hiddenToggle13.checked);
                featureLayerCheLuBaRiver.setVisibility(hiddenToggle13.checked);
                featureLayerCheLuBaDam.setVisibility(hiddenToggle13.checked);
                map.centerAndZoom([105.815, 36.022778], 11);
            });

            var hiddenToggle14 = document.getElementById("streetsLyr14");
            hiddenToggle14.addEventListener("change", function () {
                featureLayerHuLuHeBaBundary.setVisibility(hiddenToggle14.checked);
                featureLayerHuLuHeBaRiver.setVisibility(hiddenToggle14.checked);
                featureLayerHuLuHeBaDam.setVisibility(hiddenToggle14.checked);
                map.centerAndZoom([105.688611, 36.025], 11);
            });

            var hiddenToggle15 = document.getElementById("streetsLyr15");
            hiddenToggle15.addEventListener("change", function () {
                featureLayerLanNiHeBaBundary.setVisibility(hiddenToggle15.checked);
                featureLayerLanNiHeBaRiver.setVisibility(hiddenToggle15.checked);
                featureLayerLanNiHeBADam.setVisibility(hiddenToggle15.checked);
                map.centerAndZoom([105.591111, 35.7575], 11);
            });

            var hiddenToggle16 = document.getElementById("streetsLyr16");
            hiddenToggle16.addEventListener("change", function () {
                featureLayerMaJianBaBundary.setVisibility(hiddenToggle16.checked);
                featureLayerMaJianBaRiver.setVisibility(hiddenToggle16.checked);
                featureLayerMaJianBaDam.setVisibility(hiddenToggle16.checked);
                map.centerAndZoom([105.530278, 35.969722], 11);
            });

            var hiddenToggle17 = document.getElementById("streetsLyr17");
            hiddenToggle17.addEventListener("change", function () {
                featureLayerNieHeBaBundary.setVisibility(hiddenToggle17.checked);
                featureLayerNieHeBaRiver.setVisibility(hiddenToggle17.checked);
                featureLayerNieHeBaDam.setVisibility(hiddenToggle17.checked);
                map.centerAndZoom([105.654167, 35.799167], 11);
            });

            var hiddenToggle18 = document.getElementById("streetsLyr18");
            hiddenToggle18.addEventListener("change", function () {
                featureLayerSanHeBaBundary.setVisibility(hiddenToggle18.checked);
                featureLayerSanHeBaRiver.setVisibility(hiddenToggle18.checked);
                featureLayerSanHeBaDam.setVisibility(hiddenToggle18.checked);
                map.centerAndZoom([105.5475, 35.771389], 11);
            });

            var hiddenToggle19 = document.getElementById("streetsLyr19");
            hiddenToggle19.addEventListener("change", function () {
                featureLayerSangJiGouBaBundary.setVisibility(hiddenToggle19.checked);
                featureLayerSangJiGouBaRiver.setVisibility(hiddenToggle19.checked);
                featureLayerSangJiGouBaDam.setVisibility(hiddenToggle19.checked);
                map.centerAndZoom([107.071667, 37.193333], 11);
            });

            var hiddenToggle20 = document.getElementById("streetsLyr20");
            hiddenToggle20.addEventListener("change", function () {
                featureLayerXingShuNiangBaBundary.setVisibility(hiddenToggle20.checked);
                featureLayerXingShuNiangBaRiver.setVisibility(hiddenToggle20.checked);
                featureLayerXingShuNiangBaDam.setVisibility(hiddenToggle20.checked);
                map.centerAndZoom([106.913333, 37.193333], 11);
            });

            var hiddenToggle21 = document.getElementById("streetsLyr21");
            hiddenToggle21.addEventListener("change", function () {
                featureLayerYinZiGouBaBundary.setVisibility(hiddenToggle21.checked);
                featureLayerYinZiGouBaRiver.setVisibility(hiddenToggle21.checked);
                featureLayerYinZiGouBaDam.setVisibility(hiddenToggle21.checked);
                map.centerAndZoom([107.023333, 37.246667], 11);
            });

            var hiddenToggle22 = document.getElementById("streetsLyr22");
            hiddenToggle22.addEventListener("change", function () {
                featureLayerTangJiaHeBaBundary.setVisibility(hiddenToggle22.checked);
                featureLayerTangJiaHeBaRiver.setVisibility(hiddenToggle22.checked);
                featureLayerTangJiaHeBaDam.setVisibility(hiddenToggle22.checked);
                map.centerAndZoom([105.941111, 35.7525], 11);
            });

            var hiddenToggle23 = document.getElementById("streetsLyr23");
            hiddenToggle23.addEventListener("change", function () {
                featureLayerXiChuanBaBundary.setVisibility(hiddenToggle23.checked);
                featureLayerXiChuanBaRiver.setVisibility(hiddenToggle23.checked);
                featureLayerXiChuanBaDam.setVisibility(hiddenToggle23.checked);
                map.centerAndZoom([106.411667, 36.351944], 11);
            });

            var hiddenToggle24 = document.getElementById("streetsLyr24");
            hiddenToggle24.addEventListener("change", function () {
                featureLayerZhangYiHeBaBundary.setVisibility(hiddenToggle24.checked);
                featureLayerZhangYiHeRiver.setVisibility(hiddenToggle24.checked);
                featureLayerZhangYiHeDam.setVisibility(hiddenToggle24.checked);
                map.centerAndZoom([106.033611, 35.866944], 11);
            });

        });
    }



    /**全屏显示以及全屏退出*/
    document.getElementById("layerToggle1").onclick = function () {
        //  在这里改变地图显示的中心和zoom

        if (document.getElementById("mapContent").RequestFullScreen) {
            document.getElementById("mapContent").RequestFullScreen();
        }
        //兼容火狐
        console.log(document.documentElement.msRequestFullscreen);

        if (document.getElementById("mapContent").mozRequestFullScreen) {
            // console.log("火狐")
            document.getElementById("mapContent").mozRequestFullScreen();
        }
        //兼容谷歌等可以webkitRequestFullScreen也可以webkitRequestFullscreen
        if (document.getElementById("mapContent").webkitRequestFullScreen) {
            // console.log("谷歌");
            document.getElementById("mapContent").webkitRequestFullScreen();
        }
        //兼容IE,只能写msRequestFullscreen
        if (document.getElementById("mapContent").msRequestFullscreen) {
            // console.log("ie");
            document.getElementById("mapContent").msRequestFullscreen();
        }

        map.centerAndZoom([105.258055544, 38.613923758], 8);
    };

    function requestFullScreen(element) {
        var requestMethod = element.msRequestFullscreen() || element.webkitRequestFullScreen || element.mozRequestFullScreen || element.msRequestFullScreen;
        if (requestMethod) {
            requestMethod.call(element);
        } else if (typeof window.ActiveXObject !== "undefined") {
            var wscript = new ActiveXObject("WScript.Shell");
            if (wscript !== null) {
                wscript.SendKeys("{F11}");
            }
        }
    }


</script>

<%--淤地坝预警显示表格--%>
<script>

    // 定义几个变量用于控制分页
    var pageSize = 7;   // 每页显示5条数据
    var pageIndex = 1;  //  初始化从第一页显示开始
    var pageTotal;   //  总的页数
    var totalRecord;  //总的记录数
    /*实现分页功能*/
    $(document).ready(function () {
        //  初始化加载分页数据
        // alert("hahhahhaa");
        Pagination(pageIndex);
        loadJsonFile();
    });

    function Pagination(pageIndex) {
        $.ajax({
            url: "<%=basePath%>BasicAndDrainageStcController/findBasicTablePage?page="+pageIndex+"&rows="+pageSize+"",
            datatype: "json",
            type: "GET",
            success: function (data) {
                // console.log("hahhahahaha");
                // 获取总的页数
                pageTotal = data.totalPage;
                //  总的记录数
                totalRecord = data.totalRecord;
                //  获取当前页数
                currentPage = data.page;
                var basicData = data.data;
                initDamInfoTable(basicData);
                //  将页数等各种信息加载到页面上去
                var info = "<font style='font-size:15px;'>共</font>" +
                    "<font style='font-size:15px;'>" + totalRecord + "</font>" +
                    "<font style='font-size:15px;'>条,</font>" /* 用字符串的形式将分页信息拼接出来，显示到下方的pageInfo上去 */
                    + "<font style='font-size:15px;'>共</font>" +
                    "<font style='font-size:15px;'>" + pageTotal + "</font>" +
                    "<font style='font-size:15px;'>页,</font>" +
                    "<font style='font-size:15px;'>第</font>" +
                    "<font style='font-size:15px;'>" + pageIndex + "</font>"
                    + "<font style='font-size:15px;'>页</font>";
                document.getElementById("pageInfo").innerHTML = info; //将拼接的分页信息显示到这个div中去

            }

        });

    }

    //  初始化将数据加载到表格中去
    function initDamInfoTable(DangerDamInfo) {

        $("#DamHistoryCapacity tr").remove();
        if (null != DangerDamInfo) {
            $.each(DangerDamInfo, function (index, item) {
                var restCapacity = (item.totalstorage - item.usedstorage);
                var tr = $("<tr></tr>");
                var td1 = $('<td style="text-align:center; display:none;">' + item.id + '</td>');
                var td2 = $('<td style="text-align:center; vertical-align:middle;">' + item.damname + '</td>');
                var td3 = $('<td style="text-align:center; vertical-align:middle;">' + item.longitude + "," + item.latitude + '</td>');
                var td4 = $('<td style="text-align:center; vertical-align:middle;">' + item.rivername + '</td>');
                var td5 = $('<td style="text-align:center; vertical-align:middle;">' + item.totalstorage + '</td>');
                var td6 = $('<td style="text-align:center; vertical-align:middle;">' + item.usedstorage + '</td>');
                var td7 = $('<td style="text-align:center; vertical-align:middle;">' + restCapacity + '</td>');
                var td8 = $('<td style="text-align:center; vertical-align:middle;">' + item.damtoplength + '</td>');
                var td9 = $('<td style="text-align:center; vertical-align:middle;">' + item.currentArea + '</td>');
                tr.append(td1).append(td2)
                    .append(td3).append(td4).append(td5)
                    .append(td6).append(td7).append(td8)
                    .append(td9);
                $("#DamHistoryCapacity").append(tr);
            });
        }
    }

    //下一页  得判断已经到最后一页的时候  提示  点击一次就要调用重新加载数据一次
    function nextPages() {
        if (pageIndex >= pageTotal) {
            alert("已经是最后一页了");
        } else {
            pageIndex++;
            Pagination(pageIndex);
        }
    }

    //上一页  得判断已经到了第一页的时候 提示
    function lastPages() {
        if (pageIndex > 1) {
            pageIndex--;
            Pagination(pageIndex);
        } else {
            alert("已经是第一页了");
        }
    }

    //首页
    function firstPages() {
        //alert("hahaha");
        pageIndex = 1;
        Pagination(pageIndex);
    }

    //尾页
    function finalPages() {
        pageIndex = pageTotal;
        Pagination(pageIndex);
    }

    //页面跳转
    function pageJump() {
        var jumpPageNumber = document.getElementById("pageJumpNum").value;
        pageIndex = jumpPageNumber;
        if (pageIndex > pageTotal || pageIndex < 0) {
            alert("您输入的页码数不符合要求。");
        } else {
            Pagination(pageIndex);
        }
    }

    function loadJsonFile() {
        $.ajax({
            url: "<%=basePath%>BasicAndDrainageStcController/JsonFile",
            datatype: "json",
            type: "GET",
            success: function () { //mainDamAmount

                // console.log("测试一")

            }
        });
    }

</script>
<%--库容--%>
<%--<script type="text/javascript">
    var dom = document.getElementById("container");
    var myChart = echarts.init(dom);
    var app = {};
    option = null;
    var dataAxis = ['20%','40%', '60%', '80%','100%'];
    var data = [300, 182, 450,100,20];
    var yMax = 300;
    var dataShadow = [];

    for (var i = 0; i < data.length; i++) {
        dataShadow.push(yMax);
    }

    option = {
        /*title: {
            text: '特性示例：渐变色 阴影 点击缩放',
            subtext: 'Feature Sample: Gradient Color, Shadow, Click Zoom'
        },*/
        xAxis: {
            show:true,
            data: dataAxis,
            axisLabel: {
                inside: true,
                textStyle: {
                    color: '#fff'
                },
            },
            name:'剩余库容/总库容',
            nameLocation:'center',
            nameTextStyle:{
                color:'#fff'
            },
            axisTick: {
                show: false
            },
            axisLine: {
                show: false
            },
            z: 10
        },
        yAxis: {
            name:'坝的数量',
            nameTextStyle:{
                color:'#fff'
            },
            axisLine: {
                show: true
            },
            axisTick: {
                show: false
            },
            axisLabel: {
                textStyle: {
                    color: '#999'
                }
            }
        },
        dataZoom: [
            {
                type: 'inside'
            }
        ],
        series: [
            { // For shadow
                type: 'bar',
                itemStyle: {
                    normal: {color: 'rgba(0,0,0,0.05)'}
                },
                barGap:'-100%',
                barCategoryGap:'40%',
                data: dataShadow,
                animation: false
            },
            {
                type: 'bar',
                itemStyle: {
                    normal: {
                        color: new echarts.graphic.LinearGradient(
                            0, 0, 0, 1,
                            [
                                {offset: 0, color: '#83bff6'},
                                {offset: 0.5, color: '#188df0'},
                                {offset: 1, color: '#188df0'}
                            ]
                        )
                    },
                    emphasis: {
                        color: new echarts.graphic.LinearGradient(
                            0, 0, 0, 1,
                            [
                                {offset: 0, color: '#2378f7'},
                                {offset: 0.7, color: '#2378f7'},
                                {offset: 1, color: '#83bff6'}
                            ]
                        )
                    }
                },
                data: data
            }
        ]
    };

    // Enable data zoom when user click bar.
    var zoomSize = 6;
    myChart.on('click', function (params) {
        console.log(dataAxis[Math.max(params.dataIndex - zoomSize / 2, 0)]);
        myChart.dispatchAction({
            type: 'dataZoom',
            startValue: dataAxis[Math.max(params.dataIndex - zoomSize / 2, 0)],
            endValue: dataAxis[Math.min(params.dataIndex + zoomSize / 2, data.length - 1)]
        });
    });;
    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }
</script>--%>
<script type="text/javascript">
    var dom = document.getElementById("container");
    var myChart = echarts.init(dom,'light');
    var app = {};
    option = null;
    app.title = '剩余库容';

    option = {

        legend: {
            x:'center',
            y:'10',
            data: ['低于10%','低于20%', '低于50%','低于100%'],
            textStyle:{
                color:'#fff',
            }
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis:  {
            type: 'value',
            'axisLabel':{
                'interval':0,
                textStyle: {
                    color: '#fefbff'
                }
            },
        },
        yAxis: {
            type: 'category',
            nameTextStyle:{
                color:'#fefbff'
            },
            'axisLabel':{
                textStyle: {
                    color: '#fefbff'
                }
            },

            data: ['山西','内蒙古','河南','陕西','甘肃','青海','宁夏']
        },
        series: [
            {
                name: '低于10%',
                type: 'bar',
                stack: '总量',
                label: {
                    normal: {
                        show: true,
                        position: 'insideRight'
                    }
                },
                data: [320, 302, 301, 334, 390, 330, 320]
            },
            {
                name: '低于20%',
                type: 'bar',
                stack: '总量',
                label: {
                    normal: {
                        show: true,
                        position: 'insideRight'
                    }
                },
                data: [120, 132, 101, 134, 90, 230, 210]
            },
            {
                name: '低于50%',
                type: 'bar',
                stack: '总量',
                label: {
                    normal: {
                        show: true,
                        position: 'insideRight'
                    }
                },
                data: [220, 182, 191, 234, 290, 330, 310]
            },
            {
                name: '低于100%',
                type: 'bar',
                stack: '总量',
                label: {
                    normal: {
                        show: true,
                        position: 'insideRight'
                    }
                },
                data: [150, 212, 201, 154, 190, 330, 410]
            },
        ]
    };
    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }
</script>


<%--<script type="text/javascript">
    var dataMap = {};
    function dataFormatter(obj) {
        var pList = ['北京','天津','河北','山西','内蒙古','辽宁','吉林','黑龙江','上海','江苏','浙江','安徽','福建','江西','山东','河南','湖北','湖南','广东','广西','海南','重庆','四川','贵州','云南','西藏','陕西','甘肃','青海','宁夏','新疆'];
        var temp;
        for (var year = 2002; year <= 2011; year++) {
            var max = 0;
            var sum = 0;
            temp = obj[year];
            for (var i = 0, l = temp.length; i < l; i++) {
                max = Math.max(max, temp[i]);
                sum += temp[i];
                obj[year][i] = {
                    name: pList[i],
                    value: temp[i]
                };
            }
            obj[year + 'max'] = Math.floor(max / 100) * 100;
            obj[year + 'sum'] = sum;
        }
        return obj;
    }

    dataMap.dataGDP = dataFormatter({
        //max : 60000,
        2011:[16251.93,11307.28,24515.76,11237.55,14359.88,22226.7,10568.83,12582,19195.69,49110.27,32318.85,15300.65,17560.18,11702.82,45361.85,26931.03,19632.26,19669.56,53210.28,11720.87,2522.66,10011.37,21026.68,5701.84,8893.12,605.83,12512.3,5020.37,1670.44,2102.21,6610.05],
        2010:[14113.58,9224.46,20394.26,9200.86,11672,18457.27,8667.58,10368.6,17165.98,41425.48,27722.31,12359.33,14737.12,9451.26,39169.92,23092.36,15967.61,16037.96,46013.06,9569.85,2064.5,7925.58,17185.48,4602.16,7224.18,507.46,10123.48,4120.75,1350.43,1689.65,5437.47],
        2009:[12153.03,7521.85,17235.48,7358.31,9740.25,15212.49,7278.75,8587,15046.45,34457.3,22990.35,10062.82,12236.53,7655.18,33896.65,19480.46,12961.1,13059.69,39482.56,7759.16,1654.21,6530.01,14151.28,3912.68,6169.75,441.36,8169.8,3387.56,1081.27,1353.31,4277.05],
        2008:[11115,6719.01,16011.97,7315.4,8496.2,13668.58,6426.1,8314.37,14069.87,30981.98,21462.69,8851.66,10823.01,6971.05,30933.28,18018.53,11328.92,11555,36796.71,7021,1503.06,5793.66,12601.23,3561.56,5692.12,394.85,7314.58,3166.82,1018.62,1203.92,4183.21],
        2007:[9846.81,5252.76,13607.32,6024.45,6423.18,11164.3,5284.69,7104,12494.01,26018.48,18753.73,7360.92,9248.53,5800.25,25776.91,15012.46,9333.4,9439.6,31777.01,5823.41,1254.17,4676.13,10562.39,2884.11,4772.52,341.43,5757.29,2703.98,797.35,919.11,3523.16],
        2006:[8117.78,4462.74,11467.6,4878.61,4944.25,9304.52,4275.12,6211.8,10572.24,21742.05,15718.47,6112.5,7583.85,4820.53,21900.19,12362.79,7617.47,7688.67,26587.76,4746.16,1065.67,3907.23,8690.24,2338.98,3988.14,290.76,4743.61,2277.35,648.5,725.9,3045.26],
        2005:[6969.52,3905.64,10012.11,4230.53,3905.03,8047.26,3620.27,5513.7,9247.66,18598.69,13417.68,5350.17,6554.69,4056.76,18366.87,10587.42,6590.19,6596.1,22557.37,3984.1,918.75,3467.72,7385.1,2005.42,3462.73,248.8,3933.72,1933.98,543.32,612.61,2604.19],
        2004:[6033.21,3110.97,8477.63,3571.37,3041.07,6672,3122.01,4750.6,8072.83,15003.6,11648.7,4759.3,5763.35,3456.7,15021.84,8553.79,5633.24,5641.94,18864.62,3433.5,819.66,3034.58,6379.63,1677.8,3081.91,220.34,3175.58,1688.49,466.1,537.11,2209.09],
        2003:[5007.21,2578.03,6921.29,2855.23,2388.38,6002.54,2662.08,4057.4,6694.23,12442.87,9705.02,3923.11,4983.67,2807.41,12078.15,6867.7,4757.45,4659.99,15844.64,2821.11,713.96,2555.72,5333.09,1426.34,2556.02,185.09,2587.72,1399.83,390.2,445.36,1886.35],
        2002:[4315,2150.76,6018.28,2324.8,1940.94,5458.22,2348.54,3637.2,5741.03,10606.85,8003.67,3519.72,4467.55,2450.48,10275.5,6035.48,4212.82,4151.54,13502.42,2523.73,642.73,2232.86,4725.01,1243.43,2312.82,162.04,2253.39,1232.03,340.65,377.16,1612.6]
    });

    dataMap.dataPI = dataFormatter({
        //max : 4000,
        2011:[136.27,159.72,2905.73,641.42,1306.3,1915.57,1277.44,1701.5,124.94,3064.78,1583.04,2015.31,1612.24,1391.07,3973.85,3512.24,2569.3,2768.03,2665.2,2047.23,659.23,844.52,2983.51,726.22,1411.01,74.47,1220.9,678.75,155.08,184.14,1139.03],
        2010:[124.36,145.58,2562.81,554.48,1095.28,1631.08,1050.15,1302.9,114.15,2540.1,1360.56,1729.02,1363.67,1206.98,3588.28,3258.09,2147,2325.5,2286.98,1675.06,539.83,685.38,2482.89,625.03,1108.38,68.72,988.45,599.28,134.92,159.29,1078.63],
        2009:[118.29,128.85,2207.34,477.59,929.6,1414.9,980.57,1154.33,113.82,2261.86,1163.08,1495.45,1182.74,1098.66,3226.64,2769.05,1795.9,1969.69,2010.27,1458.49,462.19,606.8,2240.61,550.27,1067.6,63.88,789.64,497.05,107.4,127.25,759.74],
        2008:[112.83,122.58,2034.59,313.58,907.95,1302.02,916.72,1088.94,111.8,2100.11,1095.96,1418.09,1158.17,1060.38,3002.65,2658.78,1780,1892.4,1973.05,1453.75,436.04,575.4,2216.15,539.19,1020.56,60.62,753.72,462.27,105.57,118.94,691.07],
        2007:[101.26,110.19,1804.72,311.97,762.1,1133.42,783.8,915.38,101.84,1816.31,986.02,1200.18,1002.11,905.77,2509.14,2217.66,1378,1626.48,1695.57,1241.35,361.07,482.39,2032,446.38,837.35,54.89,592.63,387.55,83.41,97.89,628.72],
        2006:[88.8,103.35,1461.81,276.77,634.94,939.43,672.76,750.14,93.81,1545.05,925.1,1011.03,865.98,786.14,2138.9,1916.74,1140.41,1272.2,1532.17,1032.47,323.48,386.38,1595.48,382.06,724.4,50.9,484.81,334,67.55,79.54,527.8],
        2005:[88.68,112.38,1400,262.42,589.56,882.41,625.61,684.6,90.26,1461.51,892.83,966.5,827.36,727.37,1963.51,1892.01,1082.13,1100.65,1428.27,912.5,300.75,463.4,1481.14,368.94,661.69,48.04,435.77,308.06,65.34,72.07,509.99],
        2004:[87.36,105.28,1370.43,276.3,522.8,798.43,568.69,605.79,83.45,1367.58,814.1,950.5,786.84,664.5,1778.45,1649.29,1020.09,1022.45,1248.59,817.88,278.76,428.05,1379.93,334.5,607.75,44.3,387.88,286.78,60.7,65.33,461.26],
        2003:[84.11,89.91,1064.05,215.19,420.1,615.8,488.23,504.8,81.02,1162.45,717.85,749.4,692.94,560,1480.67,1198.7,798.35,886.47,1072.91,658.78,244.29,339.06,1128.61,298.69,494.6,40.7,302.66,237.91,48.47,55.63,412.9],
        2002:[82.44,84.21,956.84,197.8,374.69,590.2,446.17,474.2,79.68,1110.44,685.2,783.66,664.78,535.98,1390,1288.36,707,847.25,1015.08,601.99,222.89,317.87,1047.95,281.1,463.44,39.75,282.21,215.51,47.31,52.95,305]
    });

    dataMap.dataSI = dataFormatter({
        //max : 26600,
        2011:[3752.48,5928.32,13126.86,6635.26,8037.69,12152.15,5611.48,5962.41,7927.89,25203.28,16555.58,8309.38,9069.2,6390.55,24017.11,15427.08,9815.94,9361.99,26447.38,5675.32,714.5,5543.04,11029.13,2194.33,3780.32,208.79,6935.59,2377.83,975.18,1056.15,3225.9],
        2010:[3388.38,4840.23,10707.68,5234,6367.69,9976.82,4506.31,5025.15,7218.32,21753.93,14297.93,6436.62,7522.83,5122.88,21238.49,13226.38,7767.24,7343.19,23014.53,4511.68,571,4359.12,8672.18,1800.06,3223.49,163.92,5446.1,1984.97,744.63,827.91,2592.15],
        2009:[2855.55,3987.84,8959.83,3993.8,5114,7906.34,3541.92,4060.72,6001.78,18566.37,11908.49,4905.22,6005.3,3919.45,18901.83,11010.5,6038.08,5687.19,19419.7,3381.54,443.43,3448.77,6711.87,1476.62,2582.53,136.63,4236.42,1527.24,575.33,662.32,1929.59],
        2008:[2626.41,3709.78,8701.34,4242.36,4376.19,7158.84,3097.12,4319.75,6085.84,16993.34,11567.42,4198.93,5318.44,3554.81,17571.98,10259.99,5082.07,5028.93,18502.2,3037.74,423.55,3057.78,5823.39,1370.03,2452.75,115.56,3861.12,1470.34,557.12,609.98,2070.76],
        2007:[2509.4,2892.53,7201.88,3454.49,3193.67,5544.14,2475.45,3695.58,5571.06,14471.26,10154.25,3370.96,4476.42,2975.53,14647.53,8282.83,4143.06,3977.72,16004.61,2425.29,364.26,2368.53,4648.79,1124.79,2038.39,98.48,2986.46,1279.32,419.03,455.04,1647.55],
        2006:[2191.43,2457.08,6110.43,2755.66,2374.96,4566.83,1915.29,3365.31,4969.95,12282.89,8511.51,2711.18,3695.04,2419.74,12574.03,6724.61,3365.08,3187.05,13469.77,1878.56,308.62,1871.65,3775.14,967.54,1705.83,80.1,2452.44,1043.19,331.91,351.58,1459.3],
        2005:[2026.51,2135.07,5271.57,2357.04,1773.21,3869.4,1580.83,2971.68,4381.2,10524.96,7164.75,2245.9,3175.92,1917.47,10478.62,5514.14,2852.12,2612.57,11356.6,1510.68,240.83,1564,3067.23,821.16,1426.42,63.52,1951.36,838.56,264.61,281.05,1164.79],
        2004:[1853.58,1685.93,4301.73,1919.4,1248.27,3061.62,1329.68,2487.04,3892.12,8437.99,6250.38,1844.9,2770.49,1566.4,8478.69,4182.1,2320.6,2190.54,9280.73,1253.7,205.6,1376.91,2489.4,681.5,1281.63,52.74,1553.1,713.3,211.7,244.05,914.47],
        2003:[1487.15,1337.31,3417.56,1463.38,967.49,2898.89,1098.37,2084.7,3209.02,6787.11,5096.38,1535.29,2340.82,1204.33,6485.05,3310.14,1956.02,1777.74,7592.78,984.08,175.82,1135.31,2014.8,569.37,1047.66,47.64,1221.17,572.02,171.92,194.27,719.54],
        2002:[1249.99,1069.08,2911.69,1134.31,754.78,2609.85,943.49,1843.6,2622.45,5604.49,4090.48,1337.04,2036.97,941.77,5184.98,2768.75,1709.89,1523.5,6143.4,846.89,148.88,958.87,1733.38,481.96,934.88,32.72,1007.56,501.69,144.51,153.06,603.15]
    });

    dataMap.dataTI = dataFormatter({
        //max : 25000,
        2011:[12363.18,5219.24,8483.17,3960.87,5015.89,8158.98,3679.91,4918.09,11142.86,20842.21,14180.23,4975.96,6878.74,3921.2,17370.89,7991.72,7247.02,7539.54,24097.7,3998.33,1148.93,3623.81,7014.04,2781.29,3701.79,322.57,4355.81,1963.79,540.18,861.92,2245.12],
        2010:[10600.84,4238.65,7123.77,3412.38,4209.03,6849.37,3111.12,4040.55,9833.51,17131.45,12063.82,4193.69,5850.62,3121.4,14343.14,6607.89,6053.37,6369.27,20711.55,3383.11,953.67,2881.08,6030.41,2177.07,2892.31,274.82,3688.93,1536.5,470.88,702.45,1766.69],
        2009:[9179.19,3405.16,6068.31,2886.92,3696.65,5891.25,2756.26,3371.95,8930.85,13629.07,9918.78,3662.15,5048.49,2637.07,11768.18,5700.91,5127.12,5402.81,18052.59,2919.13,748.59,2474.44,5198.8,1885.79,2519.62,240.85,3143.74,1363.27,398.54,563.74,1587.72],
        2008:[8375.76,2886.65,5276.04,2759.46,3212.06,5207.72,2412.26,2905.68,7872.23,11888.53,8799.31,3234.64,4346.4,2355.86,10358.64,5099.76,4466.85,4633.67,16321.46,2529.51,643.47,2160.48,4561.69,1652.34,2218.81,218.67,2699.74,1234.21,355.93,475,1421.38],
        2007:[7236.15,2250.04,4600.72,2257.99,2467.41,4486.74,2025.44,2493.04,6821.11,9730.91,7613.46,2789.78,3770,1918.95,8620.24,4511.97,3812.34,3835.4,14076.83,2156.76,528.84,1825.21,3881.6,1312.94,1896.78,188.06,2178.2,1037.11,294.91,366.18,1246.89],
        2006:[5837.55,1902.31,3895.36,1846.18,1934.35,3798.26,1687.07,2096.35,5508.48,7914.11,6281.86,2390.29,3022.83,1614.65,7187.26,3721.44,3111.98,3229.42,11585.82,1835.12,433.57,1649.2,3319.62,989.38,1557.91,159.76,1806.36,900.16,249.04,294.78,1058.16],
        2005:[4854.33,1658.19,3340.54,1611.07,1542.26,3295.45,1413.83,1857.42,4776.2,6612.22,5360.1,2137.77,2551.41,1411.92,5924.74,3181.27,2655.94,2882.88,9772.5,1560.92,377.17,1440.32,2836.73,815.32,1374.62,137.24,1546.59,787.36,213.37,259.49,929.41],
        2004:[4092.27,1319.76,2805.47,1375.67,1270,2811.95,1223.64,1657.77,4097.26,5198.03,4584.22,1963.9,2206.02,1225.8,4764.7,2722.4,2292.55,2428.95,8335.3,1361.92,335.3,1229.62,2510.3,661.8,1192.53,123.3,1234.6,688.41,193.7,227.73,833.36],
        2003:[3435.95,1150.81,2439.68,1176.65,1000.79,2487.85,1075.48,1467.9,3404.19,4493.31,3890.79,1638.42,1949.91,1043.08,4112.43,2358.86,2003.08,1995.78,7178.94,1178.25,293.85,1081.35,2189.68,558.28,1013.76,96.76,1063.89,589.91,169.81,195.46,753.91],
        2002:[2982.57,997.47,2149.75,992.69,811.47,2258.17,958.88,1319.4,3038.9,3891.92,3227.99,1399.02,1765.8,972.73,3700.52,1978.37,1795.93,1780.79,6343.94,1074.85,270.96,956.12,1943.68,480.37,914.5,89.56,963.62,514.83,148.83,171.14,704.5]
    });

    dataMap.dataEstate = dataFormatter({
        //max : 3600,
        2011:[1074.93,411.46,918.02,224.91,384.76,876.12,238.61,492.1,1019.68,2747.89,1677.13,634.92,911.16,402.51,1838.14,987,634.67,518.04,3321.31,465.68,208.71,396.28,620.62,160.3,222.31,17.44,398.03,134.25,29.05,79.01,176.22],
        2010:[1006.52,377.59,697.79,192,309.25,733.37,212.32,391.89,1002.5,2600.95,1618.17,532.17,679.03,340.56,1622.15,773.23,564.41,464.21,2813.95,405.79,188.33,266.38,558.56,139.64,223.45,14.54,315.95,110.02,25.41,60.53,143.44],
        2009:[1062.47,308.73,612.4,173.31,286.65,605.27,200.14,301.18,1237.56,2025.39,1316.84,497.94,656.61,305.9,1329.59,622.98,546.11,400.11,2470.63,348.98,121.76,229.09,548.14,136.15,205.14,13.28,239.92,101.37,23.05,47.56,115.23],
        2008:[844.59,227.88,513.81,166.04,273.3,500.81,182.7,244.47,939.34,1626.13,1052.03,431.27,506.98,281.96,1104.95,512.42,526.88,340.07,2057.45,282.96,95.6,191.21,453.63,104.81,195.48,15.08,193.27,93.8,19.96,38.85,89.79],
        2007:[821.5,183.44,467.97,134.12,191.01,410.43,153.03,225.81,958.06,1365.71,981.42,366.57,511.5,225.96,953.69,447.44,409.65,301.8,2029.77,239.45,67.19,196.06,376.84,93.19,193.59,13.24,153.98,83.52,16.98,29.49,91.28],
        2006:[658.3,156.64,397.14,117.01,136.5,318.54,131.01,194.7,773.61,1017.91,794.41,281.98,435.22,184.67,786.51,348.7,294.73,254.81,1722.07,192.2,44.45,158.2,336.2,80.24,165.92,11.92,125.2,73.21,15.17,25.53,68.9],
        2005:[493.73,122.67,330.87,106,98.75,256.77,112.29,163.34,715.97,799.73,688.86,231.66,331.8,171.88,664.9,298.19,217.17,215.63,1430.37,165.05,38.2,143.88,286.23,76.38,148.69,10.02,108.62,63.78,14.1,22.97,55.79],
        2004:[436.11,106.14,231.08,95.1,73.81,203.1,97.93,137.74,666.3,534.17,587.83,188.28,248.44,167.2,473.27,236.44,204.8,191.5,1103.75,122.52,30.64,129.12,264.3,68.3,116.54,5.8,95.9,56.84,13,20.78,53.55],
        2003:[341.88,92.31,185.19,78.73,61.05,188.49,91.99,127.2,487.82,447.47,473.16,162.63,215.84,138.02,418.21,217.58,176.8,186.49,955.66,100.93,25.14,113.69,231.72,59.86,103.79,4.35,83.9,48.09,11.41,16.85,47.84],
        2002:[298.02,73.04,140.89,65.83,51.48,130.94,76.11,118.7,384.86,371.09,360.63,139.18,188.09,125.27,371.13,199.31,145.17,165.29,808.16,82.83,21.45,90.48,210.82,53.49,95.68,3.42,77.68,41.52,9.74,13.46,43.04]
    });

    dataMap.dataFinancial = dataFormatter({
        //max : 3200,
        2011:[2215.41,756.5,746.01,519.32,447.46,755.57,207.65,370.78,2277.4,2600.11,2730.29,503.85,862.41,357.44,1640.41,868.2,674.57,501.09,2916.13,445.37,105.24,704.66,868.15,297.27,456.23,31.7,432.11,145.05,62.56,134.18,288.77],
        2010:[1863.61,572.99,615.42,448.3,346.44,639.27,190.12,304.59,1950.96,2105.92,2326.58,396.17,767.58,241.49,1361.45,697.68,561.27,463.16,2658.76,384.53,78.12,496.56,654.7,231.51,375.08,27.08,384.75,100.54,54.53,97.87,225.2],
        2009:[1603.63,461.2,525.67,361.64,291.1,560.2,180.83,227.54,1804.28,1596.98,1899.33,359.6,612.2,165.1,1044.9,499.92,479.11,402.57,2283.29,336.82,65.73,389.97,524.63,194.44,351.74,23.17,336.21,88.27,45.63,75.54,198.87],
        2008:[1519.19,368.1,420.74,290.91,219.09,455.07,147.24,177.43,1414.21,1298.48,1653.45,313.81,497.65,130.57,880.28,413.83,393.05,334.32,1972.4,249.01,47.33,303.01,411.14,151.55,277.66,22.42,287.16,72.49,36.54,64.8,171.97],
        2007:[1302.77,288.17,347.65,218.73,148.3,386.34,126.03,155.48,1209.08,1054.25,1251.43,223.85,385.84,101.34,734.9,302.31,337.27,260.14,1705.08,190.73,34.43,247.46,359.11,122.25,168.55,11.51,231.03,61.6,27.67,51.05,149.22],
        2006:[982.37,186.87,284.04,169.63,108.21,303.41,100.75,74.17,825.2,653.25,906.37,166.01,243.9,79.75,524.94,219.72,174.99,204.72,899.91,129.14,16.37,213.7,299.5,89.43,143.62,6.44,152.25,50.51,23.69,36.99,99.25],
        2005:[840.2,147.4,213.47,135.07,72.52,232.85,83.63,35.03,675.12,492.4,686.32,127.05,186.12,69.55,448.36,181.74,127.32,162.37,661.81,91.93,13.16,185.18,262.26,73.67,130.5,7.57,127.58,44.73,20.36,32.25,80.34],
        2004:[713.79,136.97,209.1,110.29,55.89,188.04,77.17,32.2,612.45,440.5,523.49,94.1,171,65.1,343.37,170.82,118.85,118.64,602.68,74,11.56,162.38,236.5,60.3,118.4,5.4,90.1,42.99,19,27.92,70.3],
        2003:[635.56,112.79,199.87,118.48,55.89,145.38,73.15,32.2,517.97,392.11,451.54,87.45,150.09,64.31,329.71,165.11,107.31,99.35,534.28,61.59,10.68,147.04,206.24,48.01,105.48,4.74,77.87,42.31,17.98,24.8,64.92],
        2002:[561.91,76.86,179.6,124.1,48.39,137.18,75.45,31.6,485.25,368.86,347.53,81.85,138.28,76.51,310.07,158.77,96.95,92.43,454.65,35.86,10.08,134.52,183.13,41.45,102.39,2.81,67.3,42.08,16.75,21.45,52.18]
    });


    option = {
        baseOption: {
            timeline: {
                axisType: 'category',
                // realtime: false,
                // loop: false,
                autoPlay: true,
                // currentIndex: 2,
                playInterval: 1000,
                // controlStyle: {
                //     position: 'left'
                // },
                data: [
                    '2002-01-01','2003-01-01','2004-01-01',
                    {
                        value: '2005-01-01',
                        tooltip: {
                            formatter: '{b} GDP达到一个高度'
                        },
                        symbol: 'diamond',
                        symbolSize: 16
                    },
                    '2006-01-01', '2007-01-01','2008-01-01','2009-01-01','2010-01-01',
                    {
                        value: '2011-01-01',
                        tooltip: {
                            formatter: function (params) {
                                return params.name + 'GDP达到又一个高度';
                            }
                        },
                        symbol: 'diamond',
                        symbolSize: 18
                    },
                ],
                label: {
                    formatter : function(s) {
                        return (new Date(s)).getFullYear();
                    }
                }
            },
            title: {
                subtext: '数据来自国家统计局'
            },
            tooltip: {
            },
            legend: {
                left: 'right',
                data: ['第一产业', '第二产业', '第三产业', 'GDP', '金融', '房地产'],
                selected: {
                    'GDP': false, '金融': false, '房地产': false
                }
            },
            calculable : true,
            grid: {
                top: 80,
                bottom: 100,
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'shadow',
                        label: {
                            show: true,
                            formatter: function (params) {
                                return params.value.replace('\n', '');
                            }
                        }
                    }
                }
            },
            xAxis: [
                {
                    'type':'category',
                    'axisLabel':{'interval':0},
                    'data':[
                        '北京','\n天津','河北','\n山西','内蒙古','\n辽宁','吉林','\n黑龙江',
                        '上海','\n江苏','浙江','\n安徽','福建','\n江西','山东','\n河南',
                        '湖北','\n湖南','广东','\n广西','海南','\n重庆','四川','\n贵州',
                        '云南','\n西藏','陕西','\n甘肃','青海','\n宁夏','新疆'
                    ],
                    splitLine: {show: false}
                }
            ],
            yAxis: [
                {
                    type: 'value',
                    name: 'GDP（亿元）'
                }
            ],
            series: [
                {name: 'GDP', type: 'bar'},
                {name: '金融', type: 'bar'},
                {name: '房地产', type: 'bar'},
                {name: '第一产业', type: 'bar'},
                {name: '第二产业', type: 'bar'},
                {name: '第三产业', type: 'bar'},
                {
                    name: 'GDP占比',
                    type: 'pie',
                    center: ['75%', '35%'],
                    radius: '28%',
                    z: 100
                }
            ]
        },
        options: [
            {
                title: {text: '2002全国宏观经济指标'},
                series: [
                    {data: dataMap.dataGDP['2002']},
                    {data: dataMap.dataFinancial['2002']},
                    {data: dataMap.dataEstate['2002']},
                    {data: dataMap.dataPI['2002']},
                    {data: dataMap.dataSI['2002']},
                    {data: dataMap.dataTI['2002']},
                    {data: [
                            {name: '第一产业', value: dataMap.dataPI['2002sum']},
                            {name: '第二产业', value: dataMap.dataSI['2002sum']},
                            {name: '第三产业', value: dataMap.dataTI['2002sum']}
                        ]}
                ]
            },
            {
                title : {text: '2003全国宏观经济指标'},
                series : [
                    {data: dataMap.dataGDP['2003']},
                    {data: dataMap.dataFinancial['2003']},
                    {data: dataMap.dataEstate['2003']},
                    {data: dataMap.dataPI['2003']},
                    {data: dataMap.dataSI['2003']},
                    {data: dataMap.dataTI['2003']},
                    {data: [
                            {name: '第一产业', value: dataMap.dataPI['2003sum']},
                            {name: '第二产业', value: dataMap.dataSI['2003sum']},
                            {name: '第三产业', value: dataMap.dataTI['2003sum']}
                        ]}
                ]
            },
            {
                title : {text: '2004全国宏观经济指标'},
                series : [
                    {data: dataMap.dataGDP['2004']},
                    {data: dataMap.dataFinancial['2004']},
                    {data: dataMap.dataEstate['2004']},
                    {data: dataMap.dataPI['2004']},
                    {data: dataMap.dataSI['2004']},
                    {data: dataMap.dataTI['2004']},
                    {data: [
                            {name: '第一产业', value: dataMap.dataPI['2004sum']},
                            {name: '第二产业', value: dataMap.dataSI['2004sum']},
                            {name: '第三产业', value: dataMap.dataTI['2004sum']}
                        ]}
                ]
            },
            {
                title : {text: '2005全国宏观经济指标'},
                series : [
                    {data: dataMap.dataGDP['2005']},
                    {data: dataMap.dataFinancial['2005']},
                    {data: dataMap.dataEstate['2005']},
                    {data: dataMap.dataPI['2005']},
                    {data: dataMap.dataSI['2005']},
                    {data: dataMap.dataTI['2005']},
                    {data: [
                            {name: '第一产业', value: dataMap.dataPI['2005sum']},
                            {name: '第二产业', value: dataMap.dataSI['2005sum']},
                            {name: '第三产业', value: dataMap.dataTI['2005sum']}
                        ]}
                ]
            },
            {
                title : {text: '2006全国宏观经济指标'},
                series : [
                    {data: dataMap.dataGDP['2006']},
                    {data: dataMap.dataFinancial['2006']},
                    {data: dataMap.dataEstate['2006']},
                    {data: dataMap.dataPI['2006']},
                    {data: dataMap.dataSI['2006']},
                    {data: dataMap.dataTI['2006']},
                    {data: [
                            {name: '第一产业', value: dataMap.dataPI['2006sum']},
                            {name: '第二产业', value: dataMap.dataSI['2006sum']},
                            {name: '第三产业', value: dataMap.dataTI['2006sum']}
                        ]}
                ]
            },
            {
                title : {text: '2007全国宏观经济指标'},
                series : [
                    {data: dataMap.dataGDP['2007']},
                    {data: dataMap.dataFinancial['2007']},
                    {data: dataMap.dataEstate['2007']},
                    {data: dataMap.dataPI['2007']},
                    {data: dataMap.dataSI['2007']},
                    {data: dataMap.dataTI['2007']},
                    {data: [
                            {name: '第一产业', value: dataMap.dataPI['2007sum']},
                            {name: '第二产业', value: dataMap.dataSI['2007sum']},
                            {name: '第三产业', value: dataMap.dataTI['2007sum']}
                        ]}
                ]
            },
            {
                title : {text: '2008全国宏观经济指标'},
                series : [
                    {data: dataMap.dataGDP['2008']},
                    {data: dataMap.dataFinancial['2008']},
                    {data: dataMap.dataEstate['2008']},
                    {data: dataMap.dataPI['2008']},
                    {data: dataMap.dataSI['2008']},
                    {data: dataMap.dataTI['2008']},
                    {data: [
                            {name: '第一产业', value: dataMap.dataPI['2008sum']},
                            {name: '第二产业', value: dataMap.dataSI['2008sum']},
                            {name: '第三产业', value: dataMap.dataTI['2008sum']}
                        ]}
                ]
            },
            {
                title : {text: '2009全国宏观经济指标'},
                series : [
                    {data: dataMap.dataGDP['2009']},
                    {data: dataMap.dataFinancial['2009']},
                    {data: dataMap.dataEstate['2009']},
                    {data: dataMap.dataPI['2009']},
                    {data: dataMap.dataSI['2009']},
                    {data: dataMap.dataTI['2009']},
                    {data: [
                            {name: '第一产业', value: dataMap.dataPI['2009sum']},
                            {name: '第二产业', value: dataMap.dataSI['2009sum']},
                            {name: '第三产业', value: dataMap.dataTI['2009sum']}
                        ]}
                ]
            },
            {
                title : {text: '2010全国宏观经济指标'},
                series : [
                    {data: dataMap.dataGDP['2010']},
                    {data: dataMap.dataFinancial['2010']},
                    {data: dataMap.dataEstate['2010']},
                    {data: dataMap.dataPI['2010']},
                    {data: dataMap.dataSI['2010']},
                    {data: dataMap.dataTI['2010']},
                    {data: [
                            {name: '第一产业', value: dataMap.dataPI['2010sum']},
                            {name: '第二产业', value: dataMap.dataSI['2010sum']},
                            {name: '第三产业', value: dataMap.dataTI['2010sum']}
                        ]}
                ]
            },
            {
                title : {text: '2011全国宏观经济指标'},
                series : [
                    {data: dataMap.dataGDP['2011']},
                    {data: dataMap.dataFinancial['2011']},
                    {data: dataMap.dataEstate['2011']},
                    {data: dataMap.dataPI['2011']},
                    {data: dataMap.dataSI['2011']},
                    {data: dataMap.dataTI['2011']},
                    {data: [
                            {name: '第一产业', value: dataMap.dataPI['2011sum']},
                            {name: '第二产业', value: dataMap.dataSI['2011sum']},
                            {name: '第三产业', value: dataMap.dataTI['2011sum']}
                        ]}
                ]
            }
        ]
    };
</script>--%>

<%--坝类型占比--%>
<script type="text/javascript">
    var dom = document.getElementById("container3");
    var myChart = echarts.init(dom ,"light");
    var app = {};
    option = null;
    var dataMap = {};
    function dataFormatter(obj) {
        var pList = ['山西','内蒙古','陕西','甘肃','青海','宁夏','新疆'];
        var temp;
        for (var year = 2010; year <= 2019; year++) {
            var max = 0;
            var sum = 0;
            temp = obj[year];
            for (var i = 0, l = temp.length; i < l; i++) {
                max = Math.max(max, temp[i]);
                sum += temp[i];
                obj[year][i] = {
                    name : pList[i],
                    value : temp[i]
                }
            }
            obj[year + 'max'] = Math.floor(max / 100) * 100;
            obj[year + 'sum'] = sum;
        }
        return obj;
    }



    dataMap.dataPI = dataFormatter({
        //max : 4000,
        2019:[136,159,200,600,306,191,127],
        2018:[124,145,256,55,10,16,10],
        2017:[136,159,200,600,306,191,127],
        2016:[124,145,26,55,10,16,20],
        2015:[136,159,20,600,306,191,127],
        2014:[124,145,256,55,18,10,20],
        2013:[136,159,20,600,306,191,127],
        2012:[14,145,256,55,16,10,20],
        2011:[136,159,200,600,306,191,127],
        2010:[136,159,200,600,306,191,127]
    });

    dataMap.dataSI = dataFormatter({
        //max : 26600,

        2019:[136,159,50,600,306,191,127],
        2018:[124,145,26,55,10,16,10],
        2017:[16,159,20,600,36,191,17],
        2016:[124,145,256,55,10,16,20],
        2015:[136,159,20,60,306,191,127],
        2014:[24,145,26,55,16,10,20],
        2013:[136,15,200,60,306,191,17],
        2012:[124,15,256,55,16,10,20],
        2011:[13,15,20,60,306,11,127],
        2010:[136,159,20,600,36,191,127]
    });

    dataMap.dataTI = dataFormatter({
        //max : 25000,

        2019:[36,15,200,600,36,191,17],
        2018:[24,14,256,55,10,16,10],
        2017:[36,15,20,60,36,191,17],
        2016:[24,14,256,55,10,16,20],
        2015:[36,15,200,600,306,191,27],
        2014:[24,14,256,55,16,10,20],
        2013:[36,19,200,600,36,91,127],
        2012:[24,15,256,55,16,10,20],
        2011:[36,15,20,600,306,11,127],
        2010:[36,159,200,600,36,191,127]
    });

    option = {
        baseOption: {
            timeline: {
                // y: 0,
                axisType: 'category',
                // realtime: false,
                // loop: false,
                autoPlay: true,
                // currentIndex: 2,
                playInterval: 2000,
                // controlStyle: {
                //     position: 'left'
                // },
                top:'auto',  //离上侧容器的距离
                right:'2px',
                left:'2px',
                textStyle:{
                    color:'#fff'
                },
                lable:{
                    color:'#fff'
                },

                data: [
                    '2010-01-01','2011-01-01','2012-01-01',
                    {
                        value: '2013-01-01',
                        tooltip: {
                            formatter: '{b} 达到一个高度'
                        },
                        symbol: 'diamond',
                        symbolSize: 16
                    },
                    '2014-01-01', '2015-01-01','2016-01-01','2017-01-01','2018-01-01',
                    {
                        value: '2019-01-01',
                        tooltip: {
                            formatter: function (params) {
                                return params.name + '达到一个高度';
                            }
                        },
                        symbol: 'diamond',
                        symbolSize: 18
                    },
                ],
                label:  {
                    formatter : function(s) {
                        return (new Date(s)).getFullYear();
                    }
                }
            },
            title: {
                // subtext: '数据来自国家统计局'
            },
            tooltip: {},
            legend: {
                x: 'right',
                y:'20',
                data: ['骨干坝', '中型坝', '小型坝'],
                textStyle:{
                    color:'#fff',
                }

            },
            calculable : true,
            grid: {
                top: 70,
                bottom: 70,
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'shadow',
                        label: {
                            show: true,
                            formatter: function (params) {
                                return params.value.replace('\n', '');
                            }
                        }
                    }
                }
            },
            xAxis: [
                {
                    'type':'category',
                    'axisLabel':{
                        'interval':0,
                         textStyle: {
                            color: '#fefbff'
                        }
                    },
                    'data':[
                        '山西','内蒙古','河南','陕西','甘肃','青海','宁夏'
                    ],
                    splitLine: {show: false},

                }
            ],
            yAxis: [
                {
                    type: 'value',
                    name: '数量',
                    nameTextStyle:{
                        color:'#fefbff'
                    },
                    'axisLabel':{
                        textStyle: {
                            color: '#fefbff'
                        }
                    },
                }
            ],
            series: [

                {name: '骨干坝', type: 'bar'},
                {name: '中型坝', type: 'bar'},
                {name: '小型坝', type: 'bar'},
                {
                    name: '数量占比',
                    type: 'pie',
                    center: ['75%', '35%'],
                    radius: '28%',
                    z: 100
                }
            ]
        },
        options: [
            {
                title: {
                    text: '2010年',
                    textStyle:{
                        color:'#fefbff',
                        fontsize:'10'
    }
                },
                series: [

                    {data: dataMap.dataPI['2010']},
                    {data: dataMap.dataSI['2010']},
                    {data: dataMap.dataTI['2010']},
                    {data: [
                            {name: '骨干坝', value: dataMap.dataPI['2010sum']},
                            {name: '中型坝', value: dataMap.dataSI['2010sum']},
                            {name: '小型坝', value: dataMap.dataTI['2010sum']}
                        ]}
                ]
            },
            {
                title : {
                    text: '2011年',
                    textStyle:{
                        color:'#fefbff',
                        fontsize:'10'
                    }},
                series : [

                    {data: dataMap.dataPI['2011']},
                    {data: dataMap.dataSI['2011']},
                    {data: dataMap.dataTI['2011']},
                    {data: [
                            {name: '骨干坝', value: dataMap.dataPI['2011sum']},
                            {name: '中型坝', value: dataMap.dataSI['2011sum']},
                            {name: '小型坝', value: dataMap.dataTI['2011sum']}
                        ]}
                ]
            },
            {
                title : {
                    text: '2012年',
                    textStyle:{
                        color:'#fefbff',
                        fontsize:'10'
                    }},
                series : [

                    {data: dataMap.dataPI['2012']},
                    {data: dataMap.dataSI['2012']},
                    {data: dataMap.dataTI['2012']},
                    {data: [
                            {name: '骨干坝', value: dataMap.dataPI['2012sum']},
                            {name: '中型坝', value: dataMap.dataSI['2012sum']},
                            {name: '小型坝', value: dataMap.dataTI['2012sum']}
                        ]}
                ]
            },
            {
                title : {text: '2013年',
                    textStyle:{
                        color:'#fefbff',
                        fontsize:'10'
                    }},
                series : [

                    {data: dataMap.dataPI['2013']},
                    {data: dataMap.dataSI['2013']},
                    {data: dataMap.dataTI['2013']},
                    {data: [
                            {name: '骨干坝', value: dataMap.dataPI['2013sum']},
                            {name: '中型坝', value: dataMap.dataSI['2013sum']},
                            {name: '小型坝', value: dataMap.dataTI['2013sum']}
                        ]}
                ]
            },
            {
                title : {
                    text: '2014年',
                    textStyle:{
                        color:'#fefbff',
                        fontsize:'10'
                    }},
                series : [

                    {data: dataMap.dataPI['2014']},
                    {data: dataMap.dataSI['2014']},
                    {data: dataMap.dataTI['2014']},
                    {data: [
                            {name: '骨干坝', value: dataMap.dataPI['2014sum']},
                            {name: '中型坝', value: dataMap.dataSI['2014sum']},
                            {name: '小型坝', value: dataMap.dataTI['2014sum']}
                        ]}
                ]
            },
            {
                title : {
                    text: '2015年',
                    textStyle:{
                        color:'#fefbff',
                        fontsize:'10'
                    }},
                series : [

                    {data: dataMap.dataPI['2015']},
                    {data: dataMap.dataSI['2015']},
                    {data: dataMap.dataTI['2015']},
                    {data: [
                            {name: '骨干坝', value: dataMap.dataPI['2015sum']},
                            {name: '中型坝', value: dataMap.dataSI['2015sum']},
                            {name: '小型坝', value: dataMap.dataTI['2015sum']}
                        ]}
                ]
            },
            {
                title : {
                    text: '2016年',
                    textStyle:{
                        color:'#fefbff',
                        fontsize:'10'
                    }},
                series : [

                    {data: dataMap.dataPI['2016']},
                    {data: dataMap.dataSI['2016']},
                    {data: dataMap.dataTI['2016']},
                    {data: [
                            {name: '骨干坝', value: dataMap.dataPI['2016sum']},
                            {name: '中型坝', value: dataMap.dataSI['2016sum']},
                            {name: '小型坝', value: dataMap.dataTI['2016sum']}
                        ]}
                ]
            },
            {
                title : {
                    text: '2017年',
                    textStyle:{
                        color:'#fefbff',
                        fontsize:'10'
                    }
                },
                series : [

                    {data: dataMap.dataPI['2017']},
                    {data: dataMap.dataSI['2017']},
                    {data: dataMap.dataTI['2017']},
                    {data: [
                            {name: '骨干坝', value: dataMap.dataPI['2017sum']},
                            {name: '中型坝', value: dataMap.dataSI['2017sum']},
                            {name: '小型坝', value: dataMap.dataTI['2017sum']}
                        ]}
                ]
            },
            {
                title : {
                    text: '2018年',
                    textStyle:{
                        color:'#fefbff',
                        fontsize:'10'
                    }},
                series : [

                    {data: dataMap.dataPI['2018']},
                    {data: dataMap.dataSI['2018']},
                    {data: dataMap.dataTI['2018']},
                    {data: [
                            {name: '骨干坝', value: dataMap.dataPI['2018sum']},
                            {name: '中型坝', value: dataMap.dataSI['2018sum']},
                            {name: '小型坝', value: dataMap.dataTI['2018sum']}
                        ]}
                ]
            },
            {
                title : {
                    text: '2019年',
                    textStyle:{
                        color:'#fefbff',
                        fontsize:'10'
                    }},
                series : [

                    {data: dataMap.dataPI['2019']},
                    {data: dataMap.dataSI['2019']},
                    {data: dataMap.dataTI['2019']},
                    {data: [
                            {name: '骨干坝', value: dataMap.dataPI['2019sum']},
                            {name: '中型坝', value: dataMap.dataSI['2019sum']},
                            {name: '小型坝', value: dataMap.dataTI['2019sum']}
                        ]}
                ]
            }
        ]
    };
    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }
</script>

<%--饼图--%>

<script type="text/javascript">


    var dom = document.getElementById("container2");
    var myChart = echarts.init(dom,'light');
    var app = {};
    option = null;
    option = {
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            x : 'center',
            y : 'bottom',
            textStyle:{
                color:'#fff',
            },
            data:['5年未更新','10年未更新','15年未更新','20年未更新','25年未更新','30年未更新']
        },
       /* toolbox: {
            show : true,
           feature : {
                mark : {show: true},
                dataView : {show: true, readOnly: false},
                magicType : {
                    show: false,
                    type: ['pie', 'funnel']
                },
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },*/
        calculable : true,
        series : [
            {
                name:'坝的数量',
                type:'pie',
                radius : [30, 90],
                center : ['50%', '45%'],
                // roseType : 'area',
                roseType:'radius',
                data:[
                    {value:10, name:'5年未更新'},
                    {value:5, name:'10年未更新'},
                    {value:15, name:'15年未更新'},
                    {value:25, name:'20年未更新'},
                    {value:20, name:'25年未更新'},
                    {value:35, name:'30年未更新'},
                ]
            }
        ]
    };

    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }
</script>
<%--观测数据总览--%>
<script type="text/javascript">
    var dom = document.getElementById("container4");
    var myChart = echarts.init(dom);
    var app = {};
    app.title = '环形图';
    var dataStyle = {
        normal: {
            label: {
                show: false
            },
            labelLine: {
                show: false
            },
            shadowBlur: 0,
            shadowColor: '#203665'
        }
    };
    option = {
        backgroundColor: "#20263f",
        series: [{
            name: '第一个圆环',
            type: 'pie',
            clockWise: false,
            radius: [70, 80],
            itemStyle: dataStyle,
            hoverAnimation: false,
            center: ['15%', '50%'],
            data: [{
                value: 25,
                label: {
                    normal: {
                        rich: {
                            a: {
                                color: '#3a7ad5',
                                align: 'center',
                                fontSize: 20,
                                fontWeight: "bold"
                            },
                            b: {
                                color: '#fff',
                                align: 'center',
                                fontSize: 16
                            }
                        },
                        formatter: function(params){
                            return "{b|在线统计}\n\n"+"{a|"+params.value+"个}"+"\n\n{b|增长2%}";
                        },
                        position: 'center',
                        show: true,
                        textStyle: {
                            fontSize: '14',
                            fontWeight: 'normal',
                            color: '#fff'
                        }
                    }
                },
                itemStyle: {
                    normal: {
                        color: '#2c6cc4',
                        shadowColor: '#2c6cc4',
                        shadowBlur: 0
                    }
                }
            }, {
                value: 75,
                name: 'invisible',
                itemStyle: {
                    normal: {
                        color: '#24375c'
                    },
                    emphasis: {
                        color: '#24375c'
                    }
                }
            }]
        }, {
            name: '第二个圆环',
            type: 'pie',
            clockWise: false,
            radius: [70, 80],
            itemStyle: dataStyle,
            hoverAnimation: false,
            center: ['50%', '50%'],
            data: [{
                value: 50,
                label: {
                    normal: {
                        rich: {
                            a: {
                                color: '#d03e93',
                                align: 'center',
                                fontSize: 20,
                                fontWeight: "bold"
                            },
                            b: {
                                color: '#fff',
                                align: 'center',
                                fontSize: 16
                            }
                        },
                        formatter: function(params){
                            return "{b|离线统计}\n\n"+"{a|"+params.value+"个}"+"\n\n{b|增长2%}";
                        },
                        position: 'center',
                        show: true,
                        textStyle: {
                            fontSize: '14',
                            fontWeight: 'normal',
                            color: '#fff'
                        }
                    }
                },
                itemStyle: {
                    normal: {
                        color: '#ef45ac',
                        shadowColor: '#ef45ac',
                        shadowBlur: 0
                    }
                }
            }, {
                value: 50,
                name: 'invisible',
                itemStyle: {
                    normal: {
                        color: '#412a4e'
                    },
                    emphasis: {
                        color: '#412a4e'
                    }
                }
            }]
        }, {
            name: '第三个圆环',
            type: 'pie',
            clockWise: false,
            radius: [70, 80],
            itemStyle: dataStyle,
            hoverAnimation: false,
            center: ['85%', '50%'],
            data: [{
                value: 75,
                label: {
                    normal: {
                        rich: {
                            a: {
                                color: '#603dd0',
                                align: 'center',
                                fontSize: 20,
                                fontWeight: "bold"
                            },
                            b: {
                                color: '#fff',
                                align: 'center',
                                fontSize: 16
                            }
                        },
                        formatter: function(params){
                            return "{b|缺报统计}\n\n"+"{a|"+params.value+"个}"+"\n\n{b|增长2%}";
                        },
                        position: 'center',
                        show: true,
                        textStyle: {
                            fontSize: '14',
                            fontWeight: 'normal',
                            color: '#fff'
                        }
                    }
                },
                itemStyle: {
                    normal: {
                        color: '#613fd1',
                        shadowColor: '#613fd1',
                        shadowBlur: 0
                    }
                }
            }, {
                value: 25,
                name: 'invisible',
                itemStyle: {
                    normal: {
                        color: '#453284'
                    },
                    emphasis: {
                        color: '#453284'
                    }
                }
            }]
        }]
    }
</script>



</html>
