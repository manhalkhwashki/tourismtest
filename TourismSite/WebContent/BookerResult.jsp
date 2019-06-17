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
</head>
<body>
<%
int jid =0;
String sid = request.getParameter("uid");
int id = Integer.parseInt(sid);
String name = request.getParameter("name");
if(request.getParameter("jid")!=null){
 sid = request.getParameter("jid");
 jid = Integer.parseInt(sid);

}

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
Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost/tourism";
String user ="root";
connection = DriverManager.getConnection(url,user,"");

Statement s = connection.createStatement();

	String sql2 = "insert into passengers(p_id,p_name,j_id) values "
			+"('"+id+"','"+name+"',"+jid+")";
	String sql3 = "update journey set vacant = vacant - 1 where j_id="+
			jid+" && vacant > 0";
	
	int j = s.executeUpdate(sql3);
	if(j>0){
		int i = s.executeUpdate(sql2);
	if(i>0 && j>0){
		%>
		<p style="color:green;text-align:center;margin-top:100px;font-size:32px">تم الحجز بنجاح</p>
		 
	<% }
	}
	else{
		%>
	
		<p style="color:red;text-align:center;margin-top:100px;font-size:32px">فشلت عملية الحجز لا توجد مقاعد شاغرة</p>

		<%
			}
	%>
	
</body>
</html>