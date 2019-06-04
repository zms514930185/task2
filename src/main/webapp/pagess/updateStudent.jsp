<%--
  Created by IntelliJ IDEA.
  User: 70455
  Date: 2019/5/16
  Time: 1:27
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" isErrorPage="true" %>

<html>
<head>
    <title>修改</title>
</head>
<body>

<form action="/updateStudent" method="post">
    <input type="hidden" name="_method" value="PUT"/>
    <p><input type="hidden" name="id"  value="${student.id}">
        学号：<input type="text" name="studentId" style="width:50px" value="${student.studentId}">
        姓名：<input type="text" name="name" style="width:50px"  value="${student.name}">
        QQ：<input type="text" name="qq" style="width:100px" value="${student.qq}">
        职业：<input type="text" name="career" style="width:50px" value="${student.career}">
        入学日期：<input type="text" name="data" style="width:100px" value="${student.data}">
        毕业院校：<input type="text" name="school" style="width:100px" value="${student.school}">
        日报：<input type="text" name="link" style="width:100px" value="${student.link}">
        立愿：<input type="text" name="declaration" style="width:100px"value="${student.declaration}">
        师兄：<input type="text" name="brother" style="width:100px" value="${student.brother}">
        <input type="hidden" name="createAt" value="${student.createAt}">
        <input type="submit" value="修改" /></p>
</form>
</body>
</html>
