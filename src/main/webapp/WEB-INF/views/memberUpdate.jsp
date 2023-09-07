<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/main.css">
</head>
<body>
<%@include file="component/header.jsp" %>
<%@include file="component/nav.jsp" %>
    <h2>회원정보 수정</h2>

    <form name ="updateForm" action="/update" method="post">
        <input type="hidden" name="id" value="${member.id}">
        이메일 : <input type="text" name = "memberEmail" value="${member.memberEmail}"  readonly><br>
        비밀번호: <input type="text" name = "memberPassword" id="member-password" placeholder="비밀번호"><br>
        이름: <input type="text" name = "memberName" value="${member.memberName}" placeholder="이름"><br>
        생년원일: <input type="text" name = "memberBirth" value="${member.memberBirth}"  readonly><br>
        전화번호: <input type="text" name = "memberMobile" value="${member.memberMobile}" placeholder="전화번호"><br>
            <input type="button" value="등록" onclick="update_fn()">
        <%-- 폼테그 안에 button을 추가해서 클릭하면 정보가 바로 넘어간다.
        input태그에 타입이 서밋인데 함수까지 호출시키면 정보가 넘어가고 실행된다.
        prevent로 막을순있지만 좋은 방법은 타입을 button으로 바꾸고 함수를 호출시키게하면된다.--%>
    </form>
<%@include file="component/footer.jsp" %>
</body>
<script>
    const update_fn = () =>{
        const inputValue = document.getElementById("member-password").value;
        console.log(inputValue);
        if(inputValue == ${member.memberPassword}){
            document.updateForm.submit();
        }else{
            alert("비밀번호가 틀립니다.");
        }
    }
</script>
</html>
