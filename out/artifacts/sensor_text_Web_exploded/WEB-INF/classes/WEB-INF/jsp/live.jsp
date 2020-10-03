<!DOCTYPE html>
<html>

<head>
  <%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>

  <%@ page contentType="text/html;charset=utf-8" %>
  <title>EZOPEN播放协议</title>
  <style>
    body {
      margin: 0;
    }
    .hint {
      font-size: 14px;
      line-height: 3em;
      color: gray;
    }

    #url {
      width: 100%;
    }

    .btn-container {
      margin: 10px;
    }

    #myPlayer {
      max-width: 600px;
      width: 100%;
    }
  </style>
  <script src="/js/ezuikit.js"></script>
  <script src="/js/jquery.min.js"></script>
</head>

<body>
 
<video id="myPlayer" poster="[这里可以填入封面图片URL]" controls playsInline webkit-playsinline [autoplay]>
    <source src="ezopen://open.ys7.com/78b5ab781c92481da965fe2a61773624.hd.live" type="" />
</video>
 

<script>
    var player = new EZUIPlayer('myPlayer');
</script>   
</body>

</html>