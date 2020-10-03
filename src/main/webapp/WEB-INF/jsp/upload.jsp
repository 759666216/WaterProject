<%--
  Created by IntelliJ IDEA.
  User: IdoitSaver
  Date: 2019/11/26
  Time: 20:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!-- 实现文件的上传 -->
<!-- 1.要上传文件 表单提交请求的方式必须为post请求 -->
<!-- 2.要上传文件 需要设置form表单的enctype
	application/x-www-form-urlencoded是form表单enctype的默认值
	需要将enctype的值设置为 multipart/form-data
-->
<form action="/file/upload" enctype="multipart/form-data" method="post">
    上传用户：<input type="text" name="username"><br/>
    上传文件：<input type="file" name="myfile"><br/>
    上传文件：<input type="file" name="file2"><br/>
    <input type="submit" value="提交">
</form>
</body>
</html>
