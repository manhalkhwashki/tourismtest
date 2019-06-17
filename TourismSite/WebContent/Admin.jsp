<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="windows-1256">
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
<script>
function add(){
	window.location="AddEmployee.jsp"
}
function addj(){
	window.location="AddJourney.jsp"

	
}
function viewe(){
	window.location="Emps.jsp"

	
}
function view(){
	window.location="journies.jsp"

	
}
</script>
</head>
<body>
<div class="container">
<button onclick="view()">عرض الرحلات</button>
<button onclick="addj()">إضافة رحلة</button>
<button onclick="viewe()">عرض الموظفين</button>
<button onclick="add()">إضافة موظف</button>

</div>

</body>
</html>