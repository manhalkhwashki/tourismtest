<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
         <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function editRecord(id){
    var f=document.form;
    f.method="post";
    f.action='edit.jsp?id='+id;
    f.submit();
}
function delteR(id){
	alert('hi');

    var f=document.form;
    f.method="post";
    f.action='journies.jsp?id='+id+'&action=delete';
    f.submit();
}
</script>
<style>
body{
}
</style>
</head>
<body>
<div class="message">
${mes }
</div>
<%

String id = request.getParameter("userId");
String driverName = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost/tourism";
String dbName = "tourism";
String userId = "root";
String password = "";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<h2 align="center"><font><strong>الرحلات المتوفرة</strong></font></h2>
<form  method="post" name="form">
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#A52A2A">

<td><b>رقم الرحلة</b></td>
<td><b>الوجهة</b></td>
<td><b>التاريخ</b></td>
<td><b>السعر</b></td>
<td><b>المقاعد المتوفرة</b></td>
<td><b>تعديل</b></td>
<td><b>حذف</b></td>





</tr>
<%
try{ 
	
	String unicode= "?useUnicode=yes&characterEncoding=UTF-8";
connection = DriverManager.getConnection(connectionUrl+unicode, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM journey";
String action = request.getParameter("action");
String sid = request.getParameter("id");
//int nid = Integer.parseInt(sid);
if(action!=null){

if(action.equals("delete")){
	String sql2 = "delete from Journey where j_id = "+"'"+sid+"'";
	int i = statement.executeUpdate(sql2);
	
	
}
}

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">

<td> <%=resultSet.getString("j_id")%></td>
<td><%=resultSet.getString("j_name") %></td>
<td><%=resultSet.getString("date") %></td>
<td><%=resultSet.getString("j_price") %></td>
<td><%=resultSet.getString("vacant") %></td>
<td><input type="button" value ="تعديل" onclick="editRecord(<%=resultSet.getString("j_id")%>);"/></td>
<td><input type="button" value ="حذف" onclick="delteR(<%=resultSet.getString("j_id")%>);"/></td>





</tr>

<% 

}
statement.close();

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</form>
</body>
</html>