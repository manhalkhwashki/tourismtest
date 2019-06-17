package com.svu;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterHandler
 */
@WebServlet("/RegisterHandler")
public class RegisterHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String mes ="";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterHandler() {
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
		Connection con;
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");

		try {
			int count = 0;
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url="jdbc:mysql://localhost/tourism";
			String user ="root";
			con = DriverManager.getConnection(url,user,"");
			Statement s = con.createStatement();
			String query = "select * from users  where phone = "+phone;
		    ResultSet result =  s.executeQuery(query);
	

		    
		    while(result.next()) {
		    	count++;
		    	
		    }
		    if(count>0) {
		    	mes ="«·„” Œœ„ „ÊÃÊœ „”»ﬁ« ";
		    	String turl="/Register.jsp";
		    	request.setAttribute("mes", mes);
				getServletContext()
				.getRequestDispatcher(turl)
				.forward(request, response);
		    	
		    	
		    }
		    else {
		    	String q ="insert into users(name,phone,id,password) values "+
		    			"('"+name+"',"+"'"+phone+"',Null"+",'"+password+"')";
		    	Statement s2 = con.createStatement();
		    	int res = s2.executeUpdate(q);
		    	if(res>0) {
		    		mes = " „ «· ”ÃÌ· »‰Ã«Õ ";
		    		
		    		String turl="/Register.jsp?mess="+mes;
					getServletContext()
					.getRequestDispatcher(turl)
					.forward(request, response);
			    	request.setAttribute("mes", mes);

		    		
		    	}
		    	else {
		    		mes = "›‘·  ⁄„·Ì… «· ”ÃÌ·";
		    		String turl="/Register.jsp?mess="+mes;
					getServletContext()
					.getRequestDispatcher(turl)
					.forward(request, response);
			    	request.setAttribute("mes", mes);

		    		
		    	}
		    	
		    	
		    }
		}
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
