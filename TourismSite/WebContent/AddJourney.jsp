<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container{

width:1170px;
margin:20px auto;
text-align:center;

}
.container form{
border-raduis:10px;
border: 1px solid #111;
display:inline-block;
padding :10px;
text-align : center;
background-color:#aaa;
}
.container input{
margin-top:60px;

margin-right:20px;

}
.container input[type=text],.container input[type=date]{
width:60%
height:150px;
}
.container input[type=submit]{
width:75px;

}
.foo{
text-align:center;
}
</style>
</head>
<body>
<div class="container">
<form action="JourneyHandler" method="POST">
<div class="foo">${mes}</div>
<input type="text" name="name" required/><label>وجهة الرحلة</label><br/>
<input type="text" name="capacity" required/><label>السعة</label><br/>
<input type="text" name="vacant" required/><label>المقاعد المتوفرة</label><br/>
<input type="text" name="price" required/><label>السعر</label><br/>
<input type="date" name="date" required/><label>التاريخ</label><br/>
<input type="submit" value="submit"/>

</form>
</div>
</body>
</html>