<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
background-color:#aaaaff;
}
.container{
width:1170px;
margin:100px auto;
text-align:center;


}
.container button{
margin:20px auto;
background-color:yellow;
color:black;
display:radius;
display:block;
width:50%;
height:70px;
font-size:22px;

}
</style>
</head>
<body>
<div class="container">
<button onclick="view()">عرض الرحلات</button>
<button onclick="add()">إضافة رحلة</button>
<button onclick="addf()">تعديل الرحلات</button>



</div>
<script>
function view(){
	window.location="ViewJournies.jsp"
	
	
}
function add(){
	window.location="AddJourney.jsp";
	
	
}
function addf(){
	window.location="journies.jsp";
	
}
</script>
</body>
</html>