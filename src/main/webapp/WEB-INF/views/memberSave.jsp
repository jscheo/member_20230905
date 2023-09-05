<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
    <h2>회원가입</h2>
    <form action="/save" method="post">
        이메일 : <input class="form-control" type="text" name = "memberEmail"><br>
        비밀번호: <input type="text" name = "memberPassword"><br>
        이름: <input type="text" name = "memberName"><br>
        생년원일: <input type="text" name = "memberBirth"><br>
        전화번호: <input type="text" name = "memberMobile"><br>
        <input type="submit" value="등록">
    </form>
</body>
</html>
