<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" isErrorPage="true"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>insert</title>
</head>
<body>
<a href="/select">查询页</a>
<hr/>
<form action="${pageContext.request.contextPath}/insert" method="post">
    学号：<input type="text" name="studentId">
    姓名：<input type="text" name="name" style="width:50px">
    QQ：<input type="text" name="qq" style="width:100px">
    职业：<input type="text" name="career" style="width:50px">
    入学日期：<input type="text" name="data" style="width:100px">
    毕业院校：<input type="text" name="school" style="width:100px">
    日报：<input type="text" name="link" style="width:100px">
    立愿：<input type="text" name="declaration" style="width:100px">
    师兄：<input type="text" name="brother" style="width:100px">
    <input type="submit" value="增加">
</form>

</body>
</html>
