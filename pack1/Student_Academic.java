package pack1;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
 * Servlet implementation class Student_Academic
 */
@WebServlet("/Student_Academic")
public class Student_Academic extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//------------------------------------------------------------
				HttpSession session=request.getSession();
				String email=(String)session.getAttribute("email");
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
				
				
				String lid=request.getParameter("lid");
				String pass=request.getParameter("pass");
				String dept=request.getParameter("dept");
				String year=request.getParameter("year");
				String sem=request.getParameter("sem");
				String sub="NotStored";   //request.getParameter("sub");
				String rno=request.getParameter("rno");
				String uno=request.getParameter("uno");
				
				String utmark="NotStored"; //request.getParameter("utmark");
				String umark="NotStored";  //request.getParameter("umark");
				String attend="NotStored"; //request.getParameter("attend");
				
				String fees=request.getParameter("fees");
				String marks10=request.getParameter("10marks");
				String marks12=request.getParameter("12marks");
				String pdetails="NotStored";   //request.getParameter("pdetails");
				String paper_details="NotStored"; //request.getParameter("paper_details");
				String extra="NotStored";  //request.getParameter("extra");
				String spons_detail="NotStored";  //request.getParameter("spons_detail");
				
				
				PreparedStatement stmt;
				
					stmt = cn.prepareStatement("INSERT INTO `detection`.`student_academic` (`sid`, `login_id`, `pass`, `dept`, `year`, `sem`, `subjects`, `rno`, `uni_seat_no`, `unit_test_marks`, `uni_marks`, `attendance`, `fees`, `10th_marks`, `12th_marks`, `place_detail`, `paper_pub_detail`, `extra_cirr`, `spons_detail`) "
							+ "VALUES ('"+sid+"', '"+lid+"', '"+pass+"', '"+dept+"', '"+year+"', '"+sem+"', '"+sub+"','"+rno+"', '"+uno+"', '"+utmark+"', '"+umark+"', '"+attend+"', '"+fees+"', '"+marks10+"', '"+marks12+"', '"+pdetails+"', '"+paper_details+"', '"+extra+"', '"+spons_detail+"')");
					stmt.executeUpdate();
					RequestDispatcher rd=request.getRequestDispatcher("index.jsp?p=p");
					rd.forward(request,response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println(e);
				}

	}

}
