package pack1;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbconnection.DbConnection;

/**
 * Servlet implementation class Student_Parent
 */
@WebServlet("/Student_Parent")
public class Student_Parent extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		/*
		//------------------------------------------------------------
		HttpSession session=request.getSession();
		String email=(String)session.getAttribute("email");
		System.out.println(email);
		try {
		Connection cn=DbConnection.getConnection();
		Statement st=cn.createStatement();
		ResultSet rs=st.executeQuery("select * from student_personal where email='"+email+"'");
		String sid=null;
		if(rs.next())
		{
			int sid_i=rs.getInt(1);
			sid=String.valueOf(sid_i);
		}
		//------------------------------------------------------------
		*/
		
		
		//------------------------------------------------------------
		HttpSession session=request.getSession();
		String email=(String)session.getAttribute("email");
		//System.out.println(email);
		try {
		Connection cn=DbConnection.getConnection();
		Statement st=cn.createStatement();
		ResultSet rs=st.executeQuery("select * from student_personal where email='"+email+"'");
		String sid=null;
		if(rs.next())
		{
			int sid_i=rs.getInt(1);
			sid=String.valueOf(sid_i);
		}
		//------------------------------------------------------------
		
		
		
		
		
		
		String fathername=request.getParameter("fathername");
		String email_father=request.getParameter("email");
		String pno=request.getParameter("pno");
		String occ=request.getParameter("occ");
		String mname=request.getParameter("mname");
		String email1=request.getParameter("email1");
		String pno1=request.getParameter("pno1");
		String occ1=request.getParameter("occ1");
		
		
		
		PreparedStatement stmt;
		
			stmt = cn.prepareStatement("INSERT INTO `detection`.`student_parent` (`sid`, `father_name`, `email_father`, `pno_father`, `occupation_father`, `mother_name`, `email_mother`, `pno_mother`, `occupation_mother`) "
					+ "VALUES ('"+sid+"', '"+fathername+"', '"+email_father+"', '"+pno+"', '"+occ+"', '"+mname+"', '"+email1+"', '"+pno1+"', '"+occ1+"')");
			stmt.executeUpdate();
			RequestDispatcher rd=request.getRequestDispatcher("student_academic.jsp?p=p");
			rd.forward(request,response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
