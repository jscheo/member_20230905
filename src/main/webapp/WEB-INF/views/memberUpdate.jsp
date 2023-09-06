<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>회원정보 수정</h2>

    <form name ="frm" action="/update" method="post">
        <input type="hidden" name="id" value="${member.id}">
        이메일 : <input type="text" name = "memberEmail" value="${member.memberEmail}" readonly><br>
        비밀번호: <input type="text" name = "memberPassword" id="passChk"><br>
        이름: <input type="text" name = "memberName" value="${member.memberName}"><br>
        생년원일: <input type="text" name = "memberBirth" value="${member.memberBirth}"><br>
        전화번호: <input type="text" name = "memberMobile" value="${member.memberMobile}"><br>
            <input type="submit" value="등록">
    </form>
</body>
<script>
    <%--$(frm).on("submit", function (e){--%>
    <%--    e.preventDefault();--%>
    <%--    const inputPass = document.getElementById('passChk').value;--%>
    <%--    if(${member.memberPassword} == inputPass){--%>
    <%--        frm.submit();--%>
    <%--        location.href="/update";--%>
    <%--    }else{--%>
    <%--        alert("비밀번호가 틀립니다.")--%>
    <%--    }--%>
    <%--})--%>
</script>
</html>
