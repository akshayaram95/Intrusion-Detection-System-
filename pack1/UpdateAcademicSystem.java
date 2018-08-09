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
@WebServlet("/UpdateAcademicSystem")
public class UpdateAcademicSystem extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String sid=request.getParameter("sid");
		String lid=request.getParameter("lid");
		String pass=request.getParameter("pass");
		String dept=request.getParameter("dept");
		String year=request.getParameter("year");
		
		String rno=request.getParameter("rno");
		String uni_seat_no=request.getParameter("uni_seat_no");
		String unit_test_marks=request.getParameter("unit_test_marks");
		String uni_marks=request.getParameter("uni_marks");
		String attendance=request.getParameter("attendance");
		String fees=request.getParameter("fees");
		
		String tenth_marks=request.getParameter("10th_marks");
		String twelveth_marks=request.getParameter("12th_marks");		
		String place_detail=request.getParameter("place_detail");
		String paper_pub_detail=request.getParameter("paper_pub_detail");
		String extra_cirr=request.getParameter("extra_cirr");
		String spons_detail=request.getParameter("spons_detail");
		
		
		
		Connection cn=DbConnection.getConnection();
		HttpSession session=request.getSession();
		//session.setAttribute("email",email);
		PreparedStatement stmt;
		try 
		{
			stmt = cn.prepareStatement("UPDATE `student_academic` SET `login_id`='"+lid+"',`pass`='"+pass+"',`dept`='"+dept+"',`year`='"+year+"',`rno`='"+rno+"',`uni_seat_no`='"+uni_seat_no+"',`unit_test_marks`='"+unit_test_marks+"',`uni_marks`='"+uni_marks+"',`attendance`='"+attendance+"',`fees`='"+fees+"',`10th_marks`='"+tenth_marks+"',`12th_marks`='"+twelveth_marks+"',`place_detail`='"+place_detail+"',`paper_pub_detail`='"+paper_pub_detail+"',`extra_cirr`='"+extra_cirr+"',`spons_detail`='"+spons_detail+"' WHERE sid='"+sid+"'");
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

		
