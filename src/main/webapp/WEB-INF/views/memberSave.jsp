<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/main.css">
</head>
<body>
<%@include file="component/header.jsp"%>
<%@include file="component/nav.jsp"%>
    <h2>회원가입</h2>
    <form action="/save" method="post">
        이메일 : <input type="text" id="inputMail" name = "memberEmail" placeholder="이메일" onkeyup="emailCheck()"><br>
        <p id="check-result"></p>
        비밀번호: <input type="text" name = "memberPassword" placeholder="비밀번호" ><br>
        이름: <input type="text" name = "memberName" placeholder="이름"><br>
        생년원일: <input type="text" name = "memberBirth" placeholder="생년월일"><br>
        전화번호: <input type="text" name = "memberMobile" placeholder="전화번호"><br>
        <input type="submit" value="등록">
    </form>
<%@include file="component/footer.jsp"%>
</body>
<script>
    const emailCheck=()=>{
        const inputEmail = document.getElementById("inputMail").value;
        const result = document.getElementById("check-result");
        $.ajax({
            type: "post",
            url: "/duplicate-check",
            data: {memberEmail : inputEmail},
            success : function (res){
                if(res == "yes" ){
                    result.innerHTML = "사용 가능한이메일입니다.";
                }else{
                    result.innerHTML = "중복된 이메일입니다.";
                }
            },
            error: function (){

            }
        })
    }
</script>
</html>
