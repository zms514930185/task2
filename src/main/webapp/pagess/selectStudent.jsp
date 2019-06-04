<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" isErrorPage="true" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<html>
<head>
    <title>Student表格查询操作</title>
</head>
<body>
<a href="/">主页</a>
<p>表格记录总数：${selectCountId}</p>
<form action="/selectStudent">
    <%--form表单，type="text"要输入的类型，name是对应实体类里的属性，调对象的时候是使用set方法传入参数
    如:name="id" 他会把你在web页面里输入的内容，通过对象.set的方法赋值，
    我这里相当于student.setName的方法给属性符值
    style="width:100px"是表单输入框的大小，之前太大了，一行放不下所有的表单。--%>
    <p><%--编号：<input type="text" name="id" style="width:100px">--%>
        学号：<input type="text" name="studentId" style="width:100px">
        姓名：<input type="text" name="name" style="width:100px">
        QQ：<input type="text" name="qq" style="width:100px">
        职业：<input type="text" name="career" style="width:100px">
        入学日期：<input type="text" name="data" style="width:100px">
        毕业院校：<input type="text" name="school" style="width:100px">
        师兄：<input type="text" name="brother" style="width:100px">
        <input type="submit" value="查询"></p>
</form>
<%--border：设置边框粗细，默认为0，就是没有，值越大框越粗，不过应该没必要。
cellspacing：单元格间距，默认是1，设置为0，不然显示出来单元格间有距离，好难看。
cellpadding：单元格边距，默认是1，如果觉得太挤了可以设置,--%>
<table border="1" cellspacing="0" cellpadding="2">
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
    <%--输出的数据--%>
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
                <form action="/selectStudent/delete${student.id}" method="post">
                    <input type="hidden" name="_method" value="DELETE">
                        <%--<input type="hidden" name="id" value="${student.id}">--%>
                    <input type="submit" value="删除">
                </form>
            </td>
            <td>
                <form action="/selectStudent/update" method="post" accept-charset="UTF-8">
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
            </td>
        </tr>
    </c:forEach>
    <%--   <p>
           &lt;%&ndash;传入参数为i=0*10，10&ndash;%&gt;
           <a href="selectStudent">首页</a>
           &lt;%&ndash;传入参数为i=(i-1)*10，10&ndash;%&gt;
           <a href="selectStudent">上一页</a>
           &lt;%&ndash;传入参数为i=(i+1)*10，10&ndash;%&gt;
           <a href="selectStudent" &page=${page}+1 name="next">下一页</a>
           &lt;%&ndash;传入参数为i=${selectCountId}-${selectCountId}%10,${selectCountId}%10&ndash;%&gt;
           <a href="selectStudent">尾页</a>
       <form>
           第<input type="text" name="page" value="${page}" style="width:30px">页
       </form>
       共${totalPage}页
       </p>--%>
</table>
</body>
</html>
