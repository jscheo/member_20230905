<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/main.css">
</head>
<body>
<%@include file="component/header.jsp"%>
<%@include file="component/nav.jsp"%>
    <h2>상세정보</h2>
    ${member}<br>
    ${member.memberEmail}
    ${member.memberPassword}
    ${member.memberName}
    ${member.memberBirth}
    ${member.memberMobile}



<%@include file="component/footer.jsp"%>
</body>
</html>
