<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
         <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<style>
.show{

text-align:right;
background:#2222ff;
height:35px;
padding:5px;


}
.show a{
margin-right:30px;
color:#ffffff;
font-size:20px;

}
.show button {
margin-top:8px;
background:blue;
border-radius:8px;
height:50px;
}
</style>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/tutil.css">
	<link rel="stylesheet" type="text/css" href="css/tmain.css">
<title>Insert title here</title>
<script>
function book(jid){
	var uid = document.getElementById("userid").value;
	var name = document.getElementById("name").value; 
	window.location='BookerResult.jsp?uid='+uid+'&jid='+jid+"&name="+name;


   /* var f=document.form;
    f.method="post";
    f.action='AddBook.jsp?jid='+jid+'&uid='+uid+'&name='+name+'&action=book';
    f.submit();
    */
}
</script>
<style>
background-color:#ff1111;
</style>
</head>
<body>
<%
String jid ="0";
String id = request.getParameter("uid");

String name = request.getParameter("name");
if(request.getParameter("jid")!=null){
 jid = request.getParameter("jid");

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
String vid = request.getParameter("id");
int did = Integer.parseInt(vid);
%>
<!--  <h2 align="center"><font><strong>الرحلات المتوفرة</strong></font></h2>
<div>
</div>
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
<td><b>حجز</b></td>





</tr>
--->
                      
	<div class="limiter">
						<div class="show">
						<a href="MyJournies.jsp?uid=<%=did%>">رحلاتي</a>
						<a href="search.jsp">البحث عن رحلات</a>
						<a href="Company.jsp">تعرف على الشركة</a>
						<a href="Login.jsp">تسجيل الخروج</a>
						
						</div>
		<div class="container-table100">
			<div class="wrap-table100">
				<p style="text-align:right;font-size:28px;background-color:none">اختر احد الرحلات للحجز</p>
			
					<div class="table">
						
						<div class="row header">
							<div class="cell">
								رقم الرحلة
							</div>
							<div class="cell">
								الوجهة
							</div>
							<div class="cell">
								التاريخ
							</div>
							<div class="cell">
								السعر
							</div>
								<div class="cell">
								المقاعد الشاغرة
							</div>
					
							
						</div>

					

					

					

						<!--  <div class="row">
							<div class="cell" data-title="Full Name">
								Sean Guzman
							</div>
							<div class="cell" data-title="Age">
								25
							</div>
							<div class="cell" data-title="Job Title">
								Web Designer
							</div>
							<div class="cell" data-title="Location">
								San Francisco
							</div>
							<div class="cell" data-title="Location">
								San kijij
							</div>
						</div>
						-->
<%
try{ 
	
	String unicode= "?useUnicode=yes&characterEncoding=UTF-8";
connection = DriverManager.getConnection(connectionUrl+unicode, userId, password);
statement=connection.createStatement();
String sid = request.getParameter("id");
int pid = Integer.parseInt(sid);

String sql ="select * from journey where j_id not in (select j_id from passengers where p_id = "+pid+") && vacant > 0";
String action = request.getParameter("action");
if(action!=null){

if(action.equals("book")){
	String sql2 = "insert into passengers(p_id,p_name,j_id) values "
			+"('"+id+"','"+name+"','"+jid+"')";
	int i = statement.executeUpdate(sql2);
	
	
	
}
}

//int nid = Integer.parseInt(sid);


resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

<!--  <tr bgcolor="#DEB887">

<td> <%=resultSet.getString("j_id")%></td>
<td><%=resultSet.getString("j_name") %></td>
<td><%=resultSet.getString("date") %></td>
<td><%=resultSet.getString("j_price") %></td>
<td><%=resultSet.getString("vacant") %></td>
 <td><input type="button" value ="حجز" onclick="book(<%=resultSet.getString("j_id")%>);"/></td>






</tr>
-->		
		<div class="row" onclick="book(<%=resultSet.getString("j_id")%>);">
		
							<div class="cell" data-title="Full Name">
								<%=resultSet.getString("j_id")%>
							</div>
							<div class="cell" data-title="Age">
								<%=resultSet.getString("j_name") %>
							</div>
							<div class="cell" data-title="Job Title">
								<%=resultSet.getString("date") %>
							</div>
							<div class="cell" data-title="Location">
								<%=resultSet.getString("j_price") %>
							</div>
							<div class="cell" data-title="Location">
								<%=resultSet.getString("vacant") %>
							</div>
													
							
						</div>

<% 

}

} catch (Exception e) {
e.printStackTrace();
}
%>
<!--  </table>
</form>
 
-->
<input type="hidden"  id="userid" value="${uid}" /> 
<input type="hidden" id="name"  value="${name }"/>


</body>
</html>