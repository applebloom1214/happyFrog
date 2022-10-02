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
     .then((response) => response.text())
     .then((data) => {
         person2 = JSON.parse(data);
         console.log(data);
         document.getElementById("data").innerText= "name : "+person2.name + "age : "+person2.age ;
     })
 }
</script>

</body>
</html>
