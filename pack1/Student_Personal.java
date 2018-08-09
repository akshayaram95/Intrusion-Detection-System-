package pack1;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbconnection.DbConnection;

/**
 * Servlet implementation class Student_Personal
 */
@WebServlet("/Student_Personal")
public class Student_Personal extends HttpServlet {
	private static final long serialVersionUID = 1L;
     	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
     	{
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
		try {
			stmt = cn.prepareStatement("INSERT INTO `detection`.`student_personal` (`sid`, `full_name`, `address`, `gender`, `pno`, `email`, `bdate`, `bank_no`, `adhar_no`) "
					+ "VALUES (NULL, '"+fullname+"', '"+add+"', '"+gender+"', '"+pno+"', '"+email+"', '"+bdate+"', '"+bno+"', '"+ano+"')");
			stmt.executeUpdate();
			RequestDispatcher rd=request.getRequestDispatcher("student_parent_detail.jsp?p=p");
			rd.forward(request,response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
