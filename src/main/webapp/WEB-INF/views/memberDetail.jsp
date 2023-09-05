<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>상세정보</h2>
    ${member}<br>
    ${member.memberEmail}
    ${member.memberPassword}
    ${member.memberName}
    ${member.memberBirth}
    ${member.memberMobile}

    <button onclick="/update-fn">정보수정</button>
    <button>로그아웃</button>
</body>
</html>
