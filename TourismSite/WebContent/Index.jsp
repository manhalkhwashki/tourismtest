<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="windows-1256">
<title>Insert title here</title>
</head>

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
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#A52A2A">

<td><b>رقم الرحلة</b></td>
<td><b>الوجهة</b></td>
<td><b>التاريخ</b></td>
<td><b>السعر</b></td>
<td><b>المقاعد المتوفرة</b></td>




</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM journey";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">

<td> <%=resultSet.getString("j_id")%></td>
<td><%=resultSet.getString("j_name") %></td>
<td><%=resultSet.getString("date") %></td>
<td><%=resultSet.getString("j_price") %></td>
<td><%=resultSet.getString("vacant") %></td>





</tr>

<% 

}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>

<script type="text/javascript">

</script>

</body>
</html>