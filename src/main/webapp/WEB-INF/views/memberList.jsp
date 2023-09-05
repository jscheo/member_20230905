<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>회원목록</h2>
    <table class="mt-5">
        <tr>
            <td>이메일</td>
            <td>이름</td>
            <td>생년월일</td>
            <td>전화번호</td>
        </tr>
        <c:forEach items="${memberList}" var="member">
        <tr>
            <td>
                <a href="/member?id=${member.id}">${member.id}</a>
            </td>
            <td name="find_fn">${member.memberEmail}</td><br>
            <td>${member.memberName}</td><br>
            <td>${member.memberBirth}</td><br>
            <td>${member.memberMobile}</td><br>

        </tr>

    </c:forEach>
    </table>
</body>
<script>
    function findById(){
        $.ajax({
            type:"get",
            url:"/views/memberDetail",
            data:{id:id},
            success:function (data){

            }
        })
    }
</script>
</html>
