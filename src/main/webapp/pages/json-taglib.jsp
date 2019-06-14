<%@ taglib prefix="json" uri="http://www.atg.com/taglibs/json" %>
<json:object>
    <%--@elvariable id="studentList" type="java.util.List"--%>
    <json:array name="Student" var="student" items="${selectStudent}">
        <%--<json:object>--%>
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
        <%--</json:object>--%>
    </json:array>
</json:object>
