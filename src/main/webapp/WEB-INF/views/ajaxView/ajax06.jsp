<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" ></script>
</head>
<body>
<button onclick="ajax06()">함수호출</button>
</body>
<script>
    const ajax06=()=>{
        const email = "member1@memeber.com";
        const password = "1234";
        const name = "이름";
        $.ajax({
           type:"post",
           url:"/ajax06",
           data: {
               //dto필드이름과 같게 key값을 주면 담을 수 있음
               memberEmail : email,
               memberPassword: password,
               memberName: name
           },
           success:function (res){
               console.log("성공", res);
           },
           error: function (){
               console.log("실패");
           }
        });
    }
</script>
</html>
