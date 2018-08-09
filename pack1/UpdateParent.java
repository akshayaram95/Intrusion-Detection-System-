package pack1;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbconnection.DbConnection;

/**
 * Servlet implementation class UpdateParent
 */
@WebServlet("/UpdateParent")
public class UpdateParent extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

		String fathername = request.getParameter("fathername");
		String email_father = request.getParameter("email");
		String pno = request.getParameter("pno");
		String occ = request.getParameter("occ");
		String mname = request.getParameter("mname");
		String email1 = request.getParameter("email1");
		String pno1 = request.getParameter("pno1");
		String occ1 = request.getParameter("occ1");
		String sid = request.getParameter("sid");
		
		try 
		{
			Connection cn = DbConnection.getConnection();
			Statement st = cn.createStatement();
			PreparedStatement stmt;
			stmt = cn.prepareStatement("UPDATE `student_parent` SET `father_name`='"+fathername+"',`email_father`='"+email_father+"',`pno_father`='"+pno+"',`occupation_father`='"+occ+"',`mother_name`='"+mname+"',`email_mother`='"+email1+"',`pno_mother`='"+pno1+"',`occupation_mother`='"+occ1+"' WHERE sid='"+sid+"'");
			int rs1=stmt.executeUpdate();
			if(rs1>0)
			{
				response.sendRedirect("hodHome.jsp?parent=update");
			}
			else
			{
				response.sendRedirect("hodHome.jsp?update1=fail");
			}
			
		} catch (Exception e) 
		{
		System.out.println("Exc "+e);
		}
	}

}
