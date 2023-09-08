<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <style>
        table {
            margin: auto;
        }
    </style>
</head>
<body>
<%@include file="component/header.jsp" %>
<%@include file="component/nav.jsp" %>
<div class="container">
    <div id="member-list">
        <table class="table table-bordered">
            <tr>
                <td>id</td>
                <td>email</td>
                <td>name</td>
                <td>birth</td>
                <td>mobile</td>
                <td>조회</td>
                <td>삭제</td>
            </tr>
            <c:forEach items="${memberList}" var="member">
                <tr>
                    <td>${member.id}</td>
                    <td id="detail-member" value="${member.memberEmail}" onclick="detail_member('${member.memberEmail}')"></td>
                    <td>${member.memberName}</td>
                    <td>${member.memberBirth}</td>
                    <td>${member.memberMobile}</td>
                    <td>
                        <button class="btn btn-info" onclick="detail_fn('${member.id}')">조회</button>
                    </td>
                    <td>
                        <button class="btn btn-danger" onclick="delete_fn('${member.id}')">삭제</button>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<div id="detailMember">
</div>
<%@include file="component/footer.jsp" %>
</body>
<script>
    const detail_member = (memberEmail) => {
        // const detailMember = document.getElementById("detail-member").value;
        $.ajax({
            type: "post",
            url: "/detail-member",
            data: {memberEmail: memberEmail},
            success: function (res) {
                const sectorDetail = document.getElementById("detailMember");
                let result = "<table>";
                result += "<tr>";
                result += "<td>" + res.memberName + "</td>";
                result += "<td>" + res.memberBirth + "</td>";
                result += "<td>" + res.memberMobile + "</td>";
                result += "</tr>";
                result += "</table>";
                sectorDetail.innerHTML = result;
            }
        });
    }
    const detail_fn = (id) => {
        location.href = "/member?id=" + id;
    }

    const delete_fn = (id) => {
        location.href = "/delete?id=" + id;
    }
</script>
</html>