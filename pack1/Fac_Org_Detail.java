
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
 * Servlet implementation class 
 */
@WebServlet("/Fac_Org_Detail")
public class Fac_Org_Detail extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		//------------------------------------------------------------
		HttpSession session=request.getSession();
		String email=(String)session.getAttribute("email");
		try {
		Connection cn=DbConnection.getConnection();
		Statement st=cn.createStatement();
		ResultSet rs=st.executeQuery("select * from fac_personal where mailid='"+email+"'");
		String fid=null;
		if(rs.next())
		{
			int fid_i=rs.getInt(1);
			fid=String.valueOf(fid_i);
		}
		//------------------------------------------------------------
		
		
		String lid=request.getParameter("lid");
		String pass=request.getParameter("pass");
		String eno=request.getParameter("eno");
		String date=request.getParameter("date");
		String sal=request.getParameter("sal");
		String dept=request.getParameter("dept");
		String spec=request.getParameter("spec");
		
		
		
		
		
		PreparedStatement stmt;
		
			stmt = cn.prepareStatement("INSERT INTO `detection`.`org_details` (`fid`, `login_id`, `pass`, `emp_no`, `date_joining`, `sal`, `tax_details`, `post`, `dept_working`, `specialization`, `leave_record`) "
					+ "VALUES ('"+fid+"', '"+lid+"', '"+pass+"', '"+eno+"', '"+date+"', '"+sal+"', '', '', '"+dept+"', '"+spec+"', '')");
			stmt.executeUpdate();
			RequestDispatcher rd=request.getRequestDispatcher("systemHome.jsp?p=p");
			rd.forward(request,response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
