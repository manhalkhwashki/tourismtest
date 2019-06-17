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
padding :10dp;
width:1170px;
margin :0px auto;
text-align :right;


}
.container label{
font-size:2em;

}
.container input[type=text],.container input[type=date]{
width:500px;
height:1.8em;
margin-right:30px;
padding:5px;
font-size:1.5em;
text-align:right;
margin-top:8px;
background:#dddddd;
}
.container input[type=submit]{
width:4em;
text-align:center;
height:2em;
font-size:2em;
margin-top:15px;
margin-right:20px;
}
</style>
</style>
</head>
<body>
<div class="container">
${mes}
<form action="AddEmployeeHandler" method="post">
<input type ="text" name="name"/>
<label> اسم الموظف</label><br/>
<input type ="text" name="phone"/>
<label> رقم الهاتف</label><br/>
<input type ="text" name="password"/>
<label> كلمة المرور</label><br/>
<input type ="submit" value="submit"/>
</form>
</div>
</body>
</html>