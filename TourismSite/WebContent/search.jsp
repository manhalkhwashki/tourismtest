<%@ page language="java" contentType="text/html; UTF=8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.svu.JourneySeter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
	<style>
	.content{
	float:right;
	padding:20px;
	font-size:24px;
	}
	.content select{
	width:200px;
	}
	</style>
</head>
<body>
<%


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
<div class="content">


<form action="search.jsp" method="GET">
<select name="query">
  <option value="ds">دمشق</option>
  <option value="rds">ريف دمشق</option>
  <option value="alep">حلب</option>
  <option value="ralep">ريف حلب</option>
   <option value="lat">اللاذقية</option>
   <option value="rlat">ريف اللاذقية</option>
    <option value="homs">حمص</option>
    <option value="rhomsi">ريف حمص</option>
     <option value="tat">طرطوس</option>
      <option value="rtat">ريف طرطوس</option>
       <option value="hama">حماة</option>
       <option value="rhama">ريف حماة</option>
       <option value="zor">دير الزور</option>
       <option value="rzor">ريف دير الزور</option>
       <option value="haska">الحسكة</option>
       <option value="rhaska">ريف الحسكة</option>
        <option value="qn">القنيطرة</option>
       <option value="rqn">ريف القنيطرة</option>
        <option value="idleb">إدلب</option>
       <option value="rdlep">ريف إدلب</option>
        <option value="swe">السويداء</option>
       <option value="rswe">ريف السويداء</option>
</select>
<button>بحث</button>
</div>

												
<%
try{ 
	

		String unicode= "?useUnicode=yes&characterEncoding=UTF-8";
		connection = DriverManager.getConnection(connectionUrl+unicode, userId, password);
		statement=connection.createStatement();
		 String sql ="SELECT * FROM journey" ;
		 String action = request.getParameter("query");
		 if(action!=null){
			 JourneySeter jos = new JourneySeter();
			 String jm = jos.getjn(action);
			 sql = "SELECT * FROM journey where j_name= '"+jm+"'";
		 }
		 resultSet = statement.executeQuery(sql);
		 
	
		



			
		
		
	


// String action = request.getParameter("action");


//int nid = Integer.parseInt(sid);

%>
<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
			
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
						</div>
						<% 
while(resultSet.next()){
%>
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
						

</form>
</body>
</html>
