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
@WebServlet("/UpdateFacultySystem")
public class UpdateFacultySystem extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String fid=request.getParameter("fid");
		String fullname=request.getParameter("fname");
		String add=request.getParameter("add");
		String gender=request.getParameter("gender");
		String pno=request.getParameter("pno");
		String email=request.getParameter("email");
		String bdate=request.getParameter("bdate");
		String bno=request.getParameter("bno");
		String ano=request.getParameter("ano");
		String pan_no=request.getParameter("pan_no");
		String desg=request.getParameter("desg");
		
		Connection cn=DbConnection.getConnection();
		HttpSession session=request.getSession();
	//	session.setAttribute("email",email);
		PreparedStatement stmt;
		try 
		{
			stmt = cn.prepareStatement("UPDATE `fac_personal` SET `full_name`='"+fullname+"',`add`='"+add+"',`gender`='"+gender+"',`pno`='"+pno+"',`mailid`='"+email+"',`bdate`='"+bdate+"',`bno`='"+bno+"',`ano`='"+ano+"',`pan_no`='"+pan_no+"',`designation`='"+desg+"' WHERE fid='"+fid+"'");
			int rs=stmt.executeUpdate();
			if(rs>0)
			{
				response.sendRedirect("facultyRecord.jsp?prsnl=update");
			}
			else{
				response.sendRedirect("facultyRecord.jsp?update1=fail");
			}
		} catch (SQLException e) 
		{
			System.out.println("Exc "+e);
		}
	}

}

		
