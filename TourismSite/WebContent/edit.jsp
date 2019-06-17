<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page language="java"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
</head>
<body>
<%
String name = "";
int price = 0;
int vacant = 0;
int capacity = 0;
String date = "";




String id=request.getParameter("id");
int no=Integer.parseInt(id);
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
String driverName = "com.mysql.cj.jdbc.Driver";
Class.forName(driverName);
String connectionUrl = "jdbc:mysql://localhost/tourism";
String dbName = "tourism";
String userId = "root";
String password = "";

try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM journey where j_id ="+"'"+no+"'";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	resultSet.getString("j_id");
	 name =resultSet.getString("j_name"); 
	date = resultSet.getString("date");
	price = resultSet.getInt("j_price"); 
	vacant = resultSet.getInt("vacant");
	capacity = resultSet.getInt("capacty");
	
}



}catch (Exception e) {
e.printStackTrace();
}
    %>
    
    
<div class="container">
<form method="POST" action="EditHandler">
<input type="hidden" value ="<%=no%>" name="id"/></br>
<input type="text" name="name" value="<%=name%>"/><label>اسم الرحلة</label><br/>
<input type="text" name="price" value="<%=price%>"/><label>االسعر</label><br/>
<input type="date" name="date" value="<%=date%>"/><label>التاريخ</label><br/>
<input type="text" name="capacity" value="<%=capacity%>"/><label>السعة</label><br/>
<input type="text" name="vacant" value="<%=vacant%>" /><label>المقاعد المتوفرة</label><br/>
<input type="submit" value="حفظ"/>
</form>
</div>
</body>
</html>