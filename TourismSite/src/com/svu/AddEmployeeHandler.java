package com.svu;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddEmployeeHandler
 */
@WebServlet("/AddEmployeeHandler")
public class AddEmployeeHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddEmployeeHandler() {
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
		String url = "/DisplayInfo.jsp";
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String pass = request.getParameter("password");
		insert(name,phone,pass,request,response);

		
	}
	public void insert(String name,String phone,String pass,HttpServletRequest request,HttpServletResponse response) {
		String mes ="";
		Connection con;
		try {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				String url="jdbc:mysql://localhost/tourism";
				String user ="root";
				con = DriverManager.getConnection(url,user,"");
				Statement s = con.createStatement();
				String query = "insert into users "+
				"(name,phone,is_admin,id,is_emp,password) "+
				"values ('"+
				name+
				"', '"+
				phone+
				"','"+
				0+
				"',Null"+
				",'"+
				1+
				"','"+
				pass+
				"')"
				;
				
				int i = s.executeUpdate(query);
				if(i>0) {
					mes = " „ ≈œŒ«· «·„ÊŸ› »‰Ã«Õ";
					
				}
				else {				
					mes = "›‘·  «·⁄„·Ì…";

					
					
				}
				request.setAttribute("mes", mes);
				getServletContext()
				.getRequestDispatcher("/AddEmployee.jsp")
				.forward(request, response);

			} catch (ClassNotFoundException | SQLException e) {
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
		finally {
			
		}
	}


}
