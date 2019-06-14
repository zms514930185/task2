
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" isErrorPage="true" %>
<html>
<head>
    <title>student删除表操作</title>
</head>
<body>
<a href="/select">查询</a>
<hr/>
<form action="${pageContext.request.contextPath}/delete"  method="post">
    <input type="hidden" name="_method" value="DELETE">
    编号：<input type="text" name="id" style="width:50px">
    <input type="submit" value="删除">
</form>

</body>
</html>
