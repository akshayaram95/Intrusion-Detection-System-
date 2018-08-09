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
 * Servlet implementation class UpdateAcademicDept
 */
@WebServlet("/UpdateAcademicDept")
public class UpdateAcademicDept extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//------------------------------------------------------------
		HttpSession session=request.getSession();
		String email=(String)session.getAttribute("email");
		try 
		{
		Connection cn=DbConnection.getConnection();
		String sid=request.getParameter("sid");
		String lid=request.getParameter("lid");
		String pass=request.getParameter("pass");
		String dept=request.getParameter("dept");
		String year=request.getParameter("year");
		String sem=request.getParameter("sem");
		String sub=request.getParameter("sub");
		String rno=request.getParameter("rno");
		String uno=request.getParameter("uno");
		String utmark=request.getParameter("utmark");
		String umark=request.getParameter("umark");
		String attend=request.getParameter("attend");
		String fees=request.getParameter("fees");
		String marks10=request.getParameter("10marks");
		String marks12=request.getParameter("12marks");
		String pdetails=request.getParameter("pdetails");
		String paper_details=request.getParameter("paper_details");
		String extra=request.getParameter("extra");
		String spons_detail=request.getParameter("spons_detail");
		
		PreparedStatement stmt;
		stmt = cn.prepareStatement("UPDATE `student_academic` SET `dept`='"+dept+"',`year`='"+year+"',`sem`='"+sem+"',`subjects`='"+sub+"',`rno`='"+rno+"',`uni_seat_no`='"+uno+"',`unit_test_marks`='"+utmark+"',`uni_marks`='"+umark+"',`attendance`='"+attend+"',`fees`='"+fees+"',`10th_marks`='"+marks10+"',`12th_marks`='"+marks12+"',`place_detail`='"+pdetails+"',`paper_pub_detail`='"+paper_details+"',`extra_cirr`='"+extra+"',`spons_detail`='"+spons_detail+"' WHERE sid='"+sid+"'");
		int rs=stmt.executeUpdate();
		if(rs>0)
		{
			System.out.println("Update Done ");
			response.sendRedirect("deptModify.jsp?acdm=update");
		}
		else
		{
			System.out.println("Update Done");
			response.sendRedirect("deptModify.jsp?update1=fail");
		}
		
		
		} catch (SQLException e) 
		{
		
			System.out.println("Exception "+e);
			
		}

}

}
