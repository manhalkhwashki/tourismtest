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
String phone = "";




String id=request.getParameter("id");
int no=Integer.parseInt(id);
Connection connection = null;
Statement statement = null;
Statement s = null;

ResultSet resultSet = null;
String driverName = "com.mysql.cj.jdbc.Driver";
Class.forName(driverName);
String connectionUrl = "jdbc:mysql://localhost/tourism";
String dbName = "tourism";
String userId = "root";
String password = "";
String eq ="";
String mess ="";

try{ 
	connection = DriverManager.getConnection(connectionUrl, userId, password);
	statement=connection.createStatement();

	if(request.getParameter("action")!=null){
		name = request.getParameter("name");
		phone = request.getParameter("phone");
		String qu = "update users set"
				+ " name = '"+name+"',"
				+" phone = '"+phone+"'"
		        + " where id = "
				  +id;
				
				
	    int count =   s.executeUpdate(qu);
	 
	    if(count == 1) {
	    	
	    	String turl="/edite.jsp";
			request.setAttribute("id", id);
			mess ="تم التعديل بنجاح";

			getServletContext()
			.getRequestDispatcher(turl)
			.forward(request, response);
	    	
	    	

	    	
	    }
	    else {
			mess ="فشلت عملية التعديل";
	     	String turl="/journies.jsp";
			request.setAttribute("id", id);
			getServletContext()
			.getRequestDispatcher(turl)
			.forward(request, response);
	    	
	    }
	  
	}
	
String sql ="SELECT * FROM users where id ="+"'"+no+"'";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	 name =resultSet.getString("name"); 
	phone = resultSet.getString("phone");
	
	
}
statement.close();
	




}catch (Exception e) {
	System.out.println(e.getMessage());
e.printStackTrace();
}
    %>
    
    
<div class="container">
${mes }
<form method="POST" action="EditEHandler">
<input type="hidden" value ="<%=no%>" name="id" />
<input type="text" name="name" value="<%=name%>"/><label>الاسم</label><br/>
<input type="text" name="phone" value="<%=phone%>"/><label>الهاتف</label><br/>
<input type="hidden"  name="action" value="edit"/><label></label><br/>

<input type="submit" value="حفظ"/>
</form>
</div>
</body>
</html>