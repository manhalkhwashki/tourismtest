package com.svu;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EditEHandler
 */
@WebServlet("/EditEHandler")
public class EditEHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String mes = "";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditEHandler() {
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
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String sid = request.getParameter("id");
		int id = Integer.parseInt(sid);
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");

		// TODO Auto-generated method stub
	
		
	
		Connection con;
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url="jdbc:mysql://localhost/tourism";
		String unicode= "?useUnicode=yes&characterEncoding=UTF-8";
		String user ="root";
		con = DriverManager.getConnection(url+unicode,user,"");
		Statement s = con.createStatement();
		String query = "update users set"
				+ " name = '"+name+"',"
				+" phone = '"+phone+"' where id = "
				+"'"+id+"'";
				
				
	    int count =   s.executeUpdate(query);
	 
	    if(count == 1) {
	    	
	    	String turl="/edite.jsp";
			request.setAttribute("id", id);
			mes =" „ «· ⁄œÌ· »‰Ã«Õ";
			request.setAttribute("mes", mes);

			getServletContext()
			.getRequestDispatcher(turl)
			.forward(request, response);
	    	
	    	

	    	
	    }
	    else {
			mes ="›‘·  ⁄„·Ì… «· ⁄œÌ·";
	     	String turl="/edite.jsp";
			request.setAttribute("id", id);
			request.setAttribute("mes", mes);
			getServletContext()
			.getRequestDispatcher(turl)
			.forward(request, response);
	    	
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
