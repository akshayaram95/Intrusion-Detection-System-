package pack1;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbconnection.DbConnection;

/**
 * Servlet implementation class UpdatePersonalDept
 */
@WebServlet("/UpdateParentSystem")
public class UpdateParentSystem extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String sid=request.getParameter("sid");
		String fullname=request.getParameter("fname");
		String femail=request.getParameter("femail");
		String fpno=request.getParameter("fpno");
		String focc=request.getParameter("focc");
		
		String mname=request.getParameter("mname");
		String memail=request.getParameter("memail");
		String mpno=request.getParameter("mpno");
		String mocc=request.getParameter("mocc");
		Connection cn=DbConnection.getConnection();
		HttpSession session=request.getSession();
		//session.setAttribute("email",email);
		PreparedStatement stmt;
		try 
		{
			stmt = cn.prepareStatement("UPDATE `student_parent` SET `father_name`='"+fullname+"',`email_father`='"+femail+"',`pno_father`='"+fpno+"',`occupation_father`='"+focc+"',`mother_name`='"+mname+"',`email_mother`='"+memail+"',`pno_mother`='"+mpno+"',`occupation_mother`='"+mocc+"' WHERE sid='"+sid+"'");
			int rs=stmt.executeUpdate();
			if(rs>0)
			{
				response.sendRedirect("studentRecord.jsp?prsnl=update");
			}
			else{
				response.sendRedirect("studentRecord.jsp?update1=fail");
			}
		} catch (SQLException e) 
		{
			System.out.println("Exc "+e);
		}
	}

}

		
