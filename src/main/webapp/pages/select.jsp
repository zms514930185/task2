<%@ taglib prefix="json" uri="http://www.atg.com/taglibs/json" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<html>
<head>
    <title>查询</title>
</head>
<body>
<%--提交查询信息--%>
<form action="${pageContext.request.contextPath}/select?page=1&size=10" method="get">
    <fieldset>
        <legend>查询</legend>
        <p>
            学号：<input type="text" name="studentId" style="width:50px">
            姓名：<input type="text" name="name" style="width:70px">
            QQ：<input type="text" name="qq" style="width:100px">
            职业：<input type="text" name="career" style="width:100px">
            入学日期：<input type="text" name="data" style="width:100px">
            毕业院校：<input type="text" name="school" style="width:100px">
            师兄：<input type="text" name="brother" style="width:50px">
            <input type="submit" value="查询">
        </p>
    </fieldset>
</form>
<table border="0" cellspacing="0" cellpadding="3">
    <tr>
        <%--获取首页--%>
        <form action="${pageContext.request.contextPath}/select" method="get">
            <input type="hidden" name="studentId" value="${student.studentId}">
            <input type="hidden" name="name" value="${student.name}">
            <input type="hidden" name="qq" value="${student.qq}">
            <input type="hidden" name="career" value="${student.career}">
            <input type="hidden" name="data" value="${student.data}">
            <input type="hidden" name="school" value="${student.school}">
            <input type="hidden" name="brother" value="${student.brother}">
            <input type="submit" value="首页">
        </form>
        <%--获取上一页--%>
        <form action="${pageContext.request.contextPath}/select" method="get">
            <input type="hidden" name="studentId" value="${student.studentId}">
            <input type="hidden" name="name" value="${student.name}">
            <input type="hidden" name="qq" value="${student.qq}">
            <input type="hidden" name="career" value="${student.career}">
            <input type="hidden" name="data" value="${student.data}">
            <input type="hidden" name="school" value="${student.school}">
            <input type="hidden" name="brother" value="${student.brother}">
            <input type="hidden" name="page" value="${pageMinus}">
            <input type="hidden" name="size" value="${size}">
            <input type="submit" value="上一页">
        </form>
        <%--获取下一页--%>
        <form action="${pageContext.request.contextPath}/select" method="get">
            <input type="hidden" name="studentId" value="${student.studentId}">
            <input type="hidden" name="name" value="${student.name}">
            <input type="hidden" name="qq" value="${student.qq}">
            <input type="hidden" name="career" value="${student.career}">
            <input type="hidden" name="data" value="${student.data}">
            <input type="hidden" name="school" value="${student.school}">
            <input type="hidden" name="brother" value="${student.brother}">
            <input type="hidden" name="page" value="${pageAdd}">
            <input type="hidden" name="size" value="${size}">
            <input type="submit" value="下一页">
        </form>
        <%--获取尾页--%>
        <form action="${pageContext.request.contextPath}/select" method="get">
            <input type="hidden" name="studentId" value="${student.studentId}">
            <input type="hidden" name="name" value="${student.name}">
            <input type="hidden" name="qq" value="${student.qq}">
            <input type="hidden" name="career" value="${student.career}">
            <input type="hidden" name="data" value="${student.data}">
            <input type="hidden" name="school" value="${student.school}">
            <input type="hidden" name="brother" value="${student.brother}">
            <input type="hidden" name="page" value="${totalPage}">
            <input type="hidden" name="size" value="${size}">
            <input type="submit" value="尾页">
        </form>
            <td>共${count}条记录</td>
            <td>共${totalPage}页</td>
            <td>当前第${page}页</td>
    </tr>
</table>
<table border="1" cellspacing="0" cellpadding="3">
    <tr>
        <th>ID</th>
        <th>学号</th>
        <th>姓名</th>
        <th>QQ</th>
        <th>职业</th>
        <th>入学日期</th>
        <th>毕业院校</th>
        <th>日报</th>
        <th>立愿</th>
        <th>师兄</th>
        <th>创建日期</th>
        <th>更新日期</th>
        <th>修改</th>
    </tr>
    <c:forEach items="${select}" var="student">
        <tr>
            <td contentEditable="true">${student.id}</td>
            <td contentEditable="true">${student.studentId}</td>
            <td contentEditable="true">${student.name}</td>
            <td contentEditable="true">${student.qq}</td>
            <td contentEditable="true">${student.career}</td>
            <td contentEditable="true">${student.data}</td>
            <td contentEditable="true">${student.school}</td>
            <td contentEditable="true">${student.link}</td>
            <td contentEditable="true">${student.declaration}</td>
            <td contentEditable="true">${student.brother}</td>
            <td contentEditable="true">${student.createAt}</td>
            <td contentEditable="true">${student.updateAt}</td>
            <td>
                <form action="${pageContext.request.contextPath}/update" method="post">
                    <input type="hidden" name="id" value="${student.id}">
                    <input type="hidden" name="studentId" value="${student.studentId}">
                    <input type="hidden" name="name" style="width:50px" value="${student.name}">
                    <input type="hidden" name="qq" style="width:100px" value="${student.qq}">
                    <input type="hidden" name="career" style="width:50px" value="${student.career}">
                    <input type="hidden" name="data" style="width:100px" value="${student.data}">
                    <input type="hidden" name="school" style="width:100px" value="${student.school}">
                    <input type="hidden" name="link" style="width:100px" value="${student.link}">
                    <input type="hidden" name="declaration" style="width:100px" value="${student.declaration}">
                    <input type="hidden" name="brother" style="width:100px" value="${student.brother}">
                    <input type="submit" value="修改">
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
<%--<a href="/select?${selectStudent}&page=1&size=10">首页</a>
<a href="/select?${selectStudent}&page=page-1&size=10">上一页</a>
<a href="/select?${selectStudent}&page=page+1&size=10">下一页</a>
<a href="/select?${selectStudent}&page=${totalPage}&size=10">尾页</a>--%>
<%--<json:object>
    <json:array name="Student" var="student" items="${select}">
        <json:object>
            <json:property name="id" value="${student.id}"/>
            <json:property name="studentId" value="${student.studentId}"/>
            <json:property name="name" value="${student.name}"/>
            <json:property name="qq" value="${student.qq}"/>
            <json:property name="career" value="${student.career}"/>
            <json:property name="data" value="${student.data}"/>
            <json:property name="school" value="${student.school}"/>
            <json:property name="link" value="${student.link}"/>
            <json:property name="declaration" value="${student.declaration}"/>
            <json:property name="brother" value="${student.brother}"/>
            <json:property name="createAt" value="${student.createAt}"/>
            <json:property name="updateAt" value="${student.updateAt}"/>
        </json:object>
    </json:array>
</json:object>--%>

</body>
</html>
