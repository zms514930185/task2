<%--
  Created by IntelliJ IDEA.
  User: 70455
  Date: 2019/5/16
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student表格增加操作</title>
</head>
<body>
<a href="/">主页</a>
<form action="insertStudent" method="post">
    <p>学号：<input type="text" name="studentId" style="width:50px">
        姓名：<input type="text" name="name" style="width:50px">
        QQ：<input type="text" name="qq" style="width:100px">
        职业：<input type="text" name="career" style="width:50px">
        入学日期：<input type="text" name="data" style="width:100px">
        毕业院校：<input type="text" name="school" style="width:100px">
        日报：<input type="text" name="link" style="width:100px">
        立愿：<input type="text" name="declaration" style="width:100px">
        师兄：<input type="text" name="brother" style="width:100px">
        <input type="submit" value="增加"></p>
</form>
</body>
</html>
