package com.svu;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
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
 * Servlet implementation class JourneyHandler
 */
@WebServlet("/JourneyHandler")
public class JourneyHandler extends HttpServlet {
	String name = "";
	int capacity = 0;
	int price = 0;
	int vacant = 0;
	Date date;
	String mes ="";
	 int  count = 0;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JourneyHandler() {
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
		name =  request.getParameter("name");
		capacity =Integer.parseInt(request.getParameter("capacity"));
		price =	Integer.parseInt(request.getParameter("price"));
		vacant = Integer.parseInt(request.getParameter("vacant"));
		String sdate = request.getParameter("date");
		Date date = Date.valueOf(sdate);
		Connection con;
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url="jdbc:mysql://localhost/tourism";
		String unicode= "?useUnicode=yes&characterEncoding=UTF-8";
		String user ="root";
		con = DriverManager.getConnection(url+unicode,user,"");
		Statement s = con.createStatement();
		String query = "insert into journey(j_id,j_name,capacty,j_price,vacant,date) values "+
		"("+"Null,"+"'"
		+name+"',"+		
		"'"+capacity+"',"+
		"'"+price+"',"+
		"'"+vacant+"',"+
		"'"+date+"')";


			
				
	   count = s.executeUpdate(query);
	 
	    if(count == 1) {
	    	
	    	String turl="/AddJourney.jsp";
			mes =" „ «·≈÷«›… »‰Ã«Õ";
			request.setAttribute("mes", mes);

			getServletContext()
			.getRequestDispatcher(turl)
			.forward(request, response);
	    	
	    	

	    	
	    }
	    else {
			mes ="›‘·  ⁄„·Ì… «·≈÷«›…";
	     	String turl="/AddJourney.jsp";
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
