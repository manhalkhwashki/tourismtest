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
    f.action='edite.jsp?id='+id;
    f.submit();
}
function delteR(id){
	alert('هل انت متأكد ؟');

    var f=document.form;
    f.method="post";
    f.action='Emps.jsp?id='+id+'&action=delete';
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

//String id = request.getParameter("userId");
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
<h2 align="center"><font><strong>موظفي الشركة</strong></font></h2>
<form  method="post" name="form">
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#A52A2A">

<td><b>الاسم</b></td>
<td><b>الهاتف</b></td>
<td><b>المعرف</b></td>
<td><b>تعديل</b></td>
<td><b>حذف</b></td>





</tr>
<%
try{ 
	
	String unicode= "?useUnicode=yes&characterEncoding=UTF-8";
connection = DriverManager.getConnection(connectionUrl+unicode, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM users where is_emp=1";
String action = request.getParameter("action");
String sid = request.getParameter("id");
//int nid = Integer.parseInt(sid);
if(action!=null){

if(action.equals("edit")){
	String sql2 = "delete from users where id = "+"'"+sid+"'";
	int i = statement.executeUpdate(sql2);
	statement.close();
	
	
}
}

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">

<td> <%=resultSet.getString("name")%></td>
<td><%=resultSet.getString("phone") %></td>
<td><%=resultSet.getString("id") %></td>
<td><input type="button" value ="تعديل" onclick="editRecord(<%=resultSet.getString("id")%>);"/></td>
<td><input type="button" value ="حذف" onclick="delteR(<%=resultSet.getString("id")%>);"/></td>





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