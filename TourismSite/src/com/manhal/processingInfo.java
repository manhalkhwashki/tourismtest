package com.manhal;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.svu.User;

import java.sql.*;

/**
 * Servlet implementation class processingInfo
 */
@WebServlet("/processingInfo")
public class processingInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public processingInfo() {
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
		String url = "/DisplayInfo.jsp";
		String username = request.getParameter("name");
		String phone = request.getParameter("phone");
		String admin = request.getParameter("admin");
		updateDB(username,phone,admin);
		User user = new User(username,phone,1);

		request.setAttribute("user", user);
		getServletContext()
		.getRequestDispatcher(url)
		.forward(request, response);
	}
	public void updateDB(String name,String phone,String isadmin) {

		Connection con;
		try {
			try {
				int ad = Integer.parseInt(isadmin);
				Class.forName("com.mysql.cj.jdbc.Driver");
				String url="jdbc:mysql://localhost/tourism";
				String user ="root";
				con = DriverManager.getConnection(url,user,"");
				Statement s = con.createStatement();
				String query = "insert into users "+"(name,phone,is_admin,id) "+
				"values ('"+name+"', '"+phone+"','"+ad+"',Null)";
				s.executeUpdate(query);

			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				System.out.println(e.getMessage()+"bnb");
			}
		}
		finally {
			
		}
	}

}
