<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<%--
  Created by IntelliJ IDEA.
  User: 70455
  Date: 2019/6/9
  Time: 20:23
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>修改操作</title>
</head>
<body>
<a href="/select">查询</a>
<hr/>
<form action="/update"  method="post">
    <input type="hidden" name="_method" value="PUT">
    <input type="hidden" name="id" value="${student.id}">
    学号：<input type="text" name="studentId" value="${student.studentId}">
    姓名：<input type="text" name="name" style="width:50px" value="${student.name}">
    QQ：<input type="text" name="qq" style="width:100px" value="${student.qq}">
    职业：<input type="text" name="career" style="width:50px" value="${student.career}">
    入学日期：<input type="text" name="data" style="width:100px" value="${student.data}">
    毕业院校：<input type="text" name="school" style="width:100px" value="${student.school}">
    日报：<input type="text" name="link" style="width:100px" value="${student.link}">
    立愿：<input type="text" name="declaration" style="width:100px" value="${student.declaration}">
    师兄：<input type="text" name="brother" style="width:100px" value="${student.brother}">
    <input type="submit" value="修改">
</form>
</body>
</html>
