package com.svu;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EditHandler
 */
@WebServlet("/EditHandler")
public class EditHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String mes = "";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditHandler() {
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
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String sid = request.getParameter("id");
		int id = Integer.parseInt(sid);
		String name = request.getParameter("name");
		String sprice = request.getParameter("price");
		int price = Integer.parseInt(sprice);
		String sdater = request.getParameter("date");
		Date date = Date.valueOf(sdater);
		String sc = request.getParameter("capacity");
		int capacity = Integer.valueOf(sc);
		String sv = request.getParameter("vacant");
		int vacant = Integer.parseInt(sv);
		// TODO Auto-generated method stub
	
		
	
		Connection con;
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url="jdbc:mysql://localhost/tourism";
		String unicode= "?useUnicode=yes&characterEncoding=UTF-8";
		String user ="root";
		con = DriverManager.getConnection(url+unicode,user,"");
		Statement s = con.createStatement();
		String query = "update journey set"
				+ " j_name = '"+name+"',"
				+" j_price = '"+price+"',"
				+" date = '"+date+"',"
				+" capacty ='"+capacity+"',"
				+" vacant ='"+vacant+"' where j_id = "
				+"'"+id+"'";
				
				
	    int count =   s.executeUpdate(query);
	 
	    if(count == 1) {
	    	
	    	String turl="/journies.jsp";
			request.setAttribute("id", id);
			mes =" „ «· ⁄œÌ· »‰Ã«Õ";
			request.setAttribute("mes", mes);

			getServletContext()
			.getRequestDispatcher(turl)
			.forward(request, response);
	    	
	    	

	    	
	    }
	    else {
			mes ="›‘·  ⁄„·Ì… «· ⁄œÌ·";
	     	String turl="/journies.jsp";
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
