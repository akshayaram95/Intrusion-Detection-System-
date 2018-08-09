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
@WebServlet("/UpdatePersonalDept")
public class UpdatePersonalDept extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String sid=request.getParameter("sid");
		String fullname=request.getParameter("fname");
		String add=request.getParameter("add");
		String gender=request.getParameter("gender");
		String pno=request.getParameter("pno");
		String email=request.getParameter("email");
		String bdate=request.getParameter("bdate");
		String bno=request.getParameter("bno");
		String ano=request.getParameter("ano");
		
		Connection cn=DbConnection.getConnection();
		HttpSession session=request.getSession();
		session.setAttribute("email",email);
		PreparedStatement stmt;
		try 
		{
			stmt = cn.prepareStatement("UPDATE `student_personal` SET `full_name`='"+fullname+"',`address`='"+add+"',`gender`='"+gender+"',`pno`='"+pno+"',`email`='"+email+"',`bdate`='"+bdate+"',`bank_no`='"+bno+"',`adhar_no`='"+ano+"' WHERE sid='"+sid+"'");
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

		
