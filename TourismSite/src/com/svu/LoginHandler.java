package com.svu;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class LoginHandler
 */
@WebServlet("/LoginHandler")
public class LoginHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginHandler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		getUser(phone,password,request,response);

		
	}
	public void getUser(String phone,String password,HttpServletRequest request,HttpServletResponse response) {
		Connection con;
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url="jdbc:mysql://localhost/tourism";
		String user ="root";
		con = DriverManager.getConnection(url,user,"");
		Statement s = con.createStatement();
		String query = "select * from users  where phone = "+phone+" && "+
		"password = '"+password+"'";
	    ResultSet result =  s.executeQuery(query);
	    int count = 0;
	    String name="",number="",pass="";
	    int id = 0,is_emp=0,is_admin = 0;
	    while(result.next()) {
	    	 name = result.getString(1);
	    	 number = result.getString(2);
	    	  id = result.getInt(3);
	    	 pass = result.getString(4);
	    	 is_emp = result.getInt(5);
	    	 is_admin = result.getInt(6);
	    	 count ++;
	    	 request.setAttribute("name", name);
	    	 request.setAttribute("uid", id);


	    }
	    if(count == 1) {
	    	User cuser = new User();
	    	cuser.setId(id);
	    	cuser.setName(name);
	    	cuser.setId(id);
	    	cuser.setis_admin(is_admin);
	    	cuser.setis_emp(is_emp);
	    	request.setAttribute("cuser", cuser);
	    	request.setAttribute("id", id);
	

	    	String turl="";
	    	if(is_admin >0) {
				 turl ="/Admin.jsp";

	    		
	    	}
	    	else if (is_emp>0) {
	    		turl ="/EmpPanel.jsp";
	    		
	    	}
	    	else {
				 turl ="/AddBook.jsp?id="+id;

	    		
	    	}
			getServletContext()
			.getRequestDispatcher(turl)
			.forward(request, response);
	    	
	    	

	    	
	    }
	    else {
	    	response.getWriter().print("User not found");
	    	
	    }
		}
		catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage()+"bnb");
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
