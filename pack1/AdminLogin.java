package pack1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbconnection.DbConnection;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		String uname=request.getParameter("uname");
		String pass=request.getParameter("pass");
		String a_type=request.getParameter("a_type");
		
		Connection con = DbConnection.getConnection();
		try 
		{
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM `administrator` where uname='"+uname+"' and pass='"+pass+"'");
			if(rs.next())
			{
				
				
			}
			else
			{
				
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}

	}

}
