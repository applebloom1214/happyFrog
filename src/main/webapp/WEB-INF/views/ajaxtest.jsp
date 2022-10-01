<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<button id="sendbtn" type="button" onclick="fetchTest('http://localhost/happyfrog/send')">SEND</button>
<div id="data"></div>

<script>
    let person = {name:'kim',age:10}
    let person2 = {};
 function fetchTest(url){
     fetch(url,{
         method : "POST",
         headers: {
             "Content-Type": "application/json",
         },
         body : JSON.stringify(person)
     })
     .then((response) => response.json())
     .then((data) => {
         console.log(data);
         document.getElementById("data").innerText= person2;
     })
 }
</script>

</body>
</html>
