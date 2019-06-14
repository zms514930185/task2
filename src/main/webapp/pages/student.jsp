<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 70455
  Date: 2019/5/20
  Time: 0:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" isErrorPage="true" %>
<html>
<head>
    <title>student表操作</title>
</head>
<body>
<a href="${pageContext.request.contextPath}/">主页</a>


<%--form表单
action：要把这个数据传到哪里去,
name:对应的实体类
method:要传输表单里数据的方式，这里是get--%>
<form action="${pageContext.request.contextPath}/student" name="Student" method="get">

    <%--type="text"要输入的类型，name是对应实体类里的属性，调对象的时候是使用set方法传入参数
    如:name="id" 他会把你在web页面里输入的内容，通过对象.set的方法赋值，
    我这里相当于student.setName的方法给属性符值
    style="width:100px"是表单输入框的大小。--%>
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
</form>
<form action="student" name="Student" method="post">
    <p>
        学号：<input type="text" name="studentId" style="width:50px">
        姓名：<input type="text" name="name" style="width:70px">
        QQ：<input type="text" name="qq" style="width:100px">
        职业：<input type="text" name="career" style="width:100px">
        入学日期：<input type="text" name="data" style="width:100px">
        毕业院校：<input type="text" name="school" style="width:100px">
        日报链接：<input type="text" name="link" style="width:100px">
        立愿：<input type="text" name="declaration" style="width:100px">
        师兄：<input type="text" name="brother" style="width:50px">
        <input type="submit" value="增加">
    </p>
</form>
<hr/>
<table border="0" cellspacing="0" cellpadding="3">
    <tr>
        <%--获取首页--%>
        <form action="${pageContext.request.contextPath}/student" method="get">
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
        <form action="${pageContext.request.contextPath}/student" method="get">
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
        <form action="${pageContext.request.contextPath}/student" method="get">
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
        <form action="${pageContext.request.contextPath}/student" method="get">
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
<%--border：设置边框粗细，默认为0，就是没有，值越大框越粗，不过应该没必要。
cellspacing：单元格间距，默认是1，设置为0，不然显示出来单元格间有距离，好难看。
cellpadding：单元格边距，默认是1，如果觉得太挤了可以设置,--%>
<table border="1" cellspacing="0" cellpadding="3">
    <%--tr标签里的是一行的内容，th是表头，下面的td是一格内容，表头改成td也行，但那样样式不好看--%>
    <tr>
        <%--<th>编号</th>--%>
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
        <th>删除</th>
    </tr>
    <%--输出的数据，c:forEach代表了JAVA里的for方法，
    在这里就是把controller层里的StudentController中selectStudent为健的值循环取出
    student.studentId相当于studetn.getStudenId 不知道对不对。
    contentEditable="true" 为表格可编辑，目前我还不会用
    那就全部改成表单……--%>
    <c:forEach items="${select}" var="student">
        <tr>
            <form action="/student" name="Student" method="post">
                <input type="hidden" name="_method" value="PUT">
                <input type="hidden" name="id" value="${student.id}">
                <td><input type="text" name="studentId" style="width:50px" value="${student.studentId}"></td>
                <td><input type="text" name="name" style="width:80px" value="${student.name}"></td>
                <td><input type="text" name="qq" style="width:80px" value="${student.qq}"></td>
                <td><input type="text" name="career" style="width:80px" value="${student.career}"></td>
                <td><input type="text" name="data" style="width:100px" value="${student.data}"></td>
                <td><input type="text" name="school" style="width:100px" value="${student.school}"></td>
                <td><input type="text" name="link" style="width:150px" value="${student.link}"></td>
                <td><input type="text" name="declaration" style="width:100px" value="${student.declaration}"></td>
                <td><input type="text" name="brother" style="width:50px" value="${student.brother}"></td>
                <td contentEditable="true">${student.createAt}</td>
                <td contentEditable="true">${student.updateAt}</td>
                <td><input type="submit" value="修改"></td>
            </form>
                <%--<td contentEditable="true">${student.studentId}</td>
                <td contentEditable="true">${student.name}</td>
                <td contentEditable="true">${student.qq}</td>
                <td contentEditable="true">${student.career}</td>
                <td contentEditable="true">${student.data}</td>
                <td contentEditable="true">${student.school}</td>
                <td contentEditable="true">${student.link}</td>
                <td contentEditable="true">${student.declaration}</td>
                <td contentEditable="true">${student.brother}</td>
                <td contentEditable="true">${student.createAt}</td>
                <td contentEditable="true">${student.updateAt}</td>--%>
            <td>
                <form action="${pageContext.request.contextPath}/student" name="Student" method="post">
                    <input type="hidden" name="id" value="${student.id}">
                    <input type="hidden" name="_method" value="DELETE">
                    <input type="submit" value="删除">
                </form>
            </td>
                <%--<td>
                    <form action="/student" name="Student" method="post">
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
                </td>--%>
        </tr>
    </c:forEach>
</table>
</body>
</html>
