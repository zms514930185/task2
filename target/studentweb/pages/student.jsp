<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 70455
  Date: 2019/5/20
  Time: 0:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" isErrorPage="true" language="java" %>
<html>
<head>
    <title>student表操作</title>
</head>
<body>
<a href="/">主页</a>
<p>表格记录总数：${selectCountId}</p>

<%--form表单
action：要把这个数据传到哪里去,
name:对应的实体类
method:要传输表单里数据的方式，这里是get--%>
<form action="/student" name="Student" method="get">

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
<p>总页数${totalPage}</p>
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
        <th>删除</th>
        <th>修改</th>
    </tr>
    </tr>
    <%--输出的数据，c:forEach代表了JAVA里的for方法，
    在这里就是把controller层里的StudentController中selectStudent为健的值循环取出
    student.studentId相当于studetn.getStudenId 不知道对不对。
    contentEditable="true" 为表格可编辑，目前我还不会用--%>
    <c:forEach items="${selectStudent}" var="student">
        <tr>
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
                <form action="/student" name="Student" method="post">
                    <input type="hidden" name="id" value="${student.id}">
                    <input type="hidden" name="_method" value="DELETE">
                    <input type="submit" value="删除">
                </form>
            </td>
            <td>
                <form action="/student" name="Student" method="post">
                    <input type="hidden" name="_method" value="PUT">
                    <%--<input type="hidden" name="id" value="${student.id}">
                    学号：<input type="text" name="studentId" value="${student.studentId}">
                    姓名：<input type="text" name="name" style="width:50px" value="${student.name}">
                    QQ：<input type="text" name="qq" style="width:100px" value="${student.qq}">
                    职业：<input type="text" name="career" style="width:50px" value="${student.career}">
                    入学日期：<input type="text" name="data" style="width:100px" value="${student.data}">
                    毕业院校：<input type="text" name="school" style="width:100px" value="${student.school}">
                    日报：<input type="text" name="link" style="width:100px" value="${student.link}">
                    立愿：<input type="text" name="declaration" style="width:100px" value="${student.declaration}">
                    师兄：<input type="text" name="brother" style="width:100px" value="${student.brother}">--%>
                    <input type="submit" value="修改">
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
