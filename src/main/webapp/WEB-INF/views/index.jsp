<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/main.css">
</head>
<body>
<%@include file="component/header.jsp"%>
<%@include file="component/nav.jsp"%>


<%--    <a href="/save">회원가입페이지 이동</a>--%>
<%--    <a href="/login">로그인페이지 이동</a>--%>
<%--    <a href="/members">회원목록페이지 이동</a><br>--%>

    로그인이메일: ${sessionScope.loginEmail}<br>

<%@include file="component/footer.jsp"%>


</body>
</html>
