<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" ></script>
</head>
<body>
<button onclick="ajax11()">함수호출</button>
<div id="result-area">

</div>
</body>
<script>
    const ajax11 = () => {
        const email = "member@member.com";
        const pass = "1234";
        const name = "회원1";
        const birth = "19990505";
        const mobile = "010-1111-1111";
        $.ajax({
           type:"post",
           url:"/ajax11",
           data: {
               memberEmail:email,
               memberPassword: pass,
               memberName : name,
               memberBrith : birth,
               memberMobile : mobile
           },
           success:function (res){
               console.log("성공", res);
               const resultArea = document.getElementById("result-area");
               let result = "<table>";
               for(let i in res){
                   result += "<tr>";
                   result += "<td>" + res[i].memberEmail + "</td>";
                   result += "<td>" + res[i].memberName + "</td>";
                   result += "<td>" + res[i].memberBrith + "</td>";
                   result += "<td>" + res[i].memberMobile + "</td>";
                   result += "</tr>";
               }
               result += "</table>";
               resultArea.innerHTML = result;
           },
           error: function (err){
               console.log("실패");
               alert("이메일이 중복되었습니다.");
           }
        });
    }
</script>
</html>
