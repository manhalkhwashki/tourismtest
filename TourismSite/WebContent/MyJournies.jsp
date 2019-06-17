<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>

<title>Insert title here</title>
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
	<script>
	
	
function cancel(jd){
	alert("? هل أنت متأكد");

	var uid = document.getElementById("userid").value;
	window.location='MyJournies.jsp?action=delete&jd='+jd+'&uid='+uid;

	

	
	
}
function conf(jd){
	alert("? هل أنت متأكد");
	var uid = document.getElementById("userid").value;
	window.location='MyJournies.jsp?action=conf&jd='+jd+'&uid='+uid;

	

	
	
}
</script>
</head>
<body style="background:none">
<%
String jid ="0";
String id = request.getParameter("uid");
/*String name = request.getParameter("name");
if(request.getParameter("jid")!=null){
 jid = request.getParameter("jid");

}
*/


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

try{ 
	
String unicode= "?useUnicode=yes&characterEncoding=UTF-8";
connection = DriverManager.getConnection(connectionUrl+unicode, userId, password);
statement=connection.createStatement();
String action = request.getParameter("action");
String sid = request.getParameter("id");
if(action!=null){

if(action.equals("delete")){
	String uid = request.getParameter("uid");
	String jd = request.getParameter("jd");
	int j_id = Integer.parseInt(jd);
	int u_id = Integer.parseInt(uid);
	String ss = "delete from passengers where j_id = "+j_id+"&& p_id="+u_id;
	int k = statement.executeUpdate(ss);
	if(k>0){
		String za ="update journey set vacant = vacant+1 where j_id="+j_id;
		statement.executeUpdate(za);
	}

}
else{
	String uid = request.getParameter("uid");
	String jd = request.getParameter("jd");
	int j_id = Integer.parseInt(jd);
	int u_id = Integer.parseInt(uid);
	String st = "update  passengers set status = 1"+" where j_id="+j_id+
			"&& p_id="+u_id;
	statement.executeUpdate(st);
	
}
}
	String sql ="SELECT * FROM `journey` WHERE j_id in (select j_id from passengers where p_id =" 
			+id+"&& status=0)";
%>
<div class="limiter">
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
							
								<div class="cell" style="text-align:center">
								تثبيت
							</div>
					      <div class="cell" style="text-align:center">
					        إلغاء الحجز	
							</div>
							
						</div>
						</div>
					
<% 
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
	<div class="row" >
		
							<div class="cell" data-title="Full Name">
								<%=resultSet.getString("j_id")%>
							</div>
							<div class="cell" data-title="Age">
								<%=resultSet.getString("j_name") %>
							</div>
							<div class="cell" data-title="Job Title">
								<%=resultSet.getString("date") %>
							</div>
							<div onclick="conf(<%=resultSet.getString("j_id") %>)"  class="cell" data-title="Job Title" style=" background:green;color:white;text-align:center">
								تثبيت
							</div>
							<div id="cancel" onclick="cancel(<%=resultSet.getString("j_id")%>)" class="cell" data-title="Job Title" style=" background:red;color:white;text-align:center;width:160px">
								إلغاء الحجز
							</div>
						
							
													
							
						</div>
						
<% 

}

} catch (Exception e) {
e.printStackTrace();
}
%>
<input type="hidden"  id="userid" value="<%=id %>" /> 
<input type="hidden" id="name"  value="${name }"/>

</body>
</html>