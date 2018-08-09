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

import java.sql.*;
import dbconnection.*;;

/**
 * Servlet implementation class Org_Detail_Action
 */
@WebServlet("/Org_Detail_Action")
public class Org_Detail_Action extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Org_Detail_Action() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
HttpSession session = request.getSession();
		
		int fid =(Integer)session.getAttribute("fid");
		String fid_s=String.valueOf(fid);
		String email = (String)session.getAttribute("staffemail");
		
		String lid=request.getParameter("lid");
		String pass=request.getParameter("pass");
		String empno=request.getParameter("empno");
		String joining_date=request.getParameter("joining_date");
		String sal=request.getParameter("sal");
		String tax_detail=request.getParameter("tax_detail");
		String post=request.getParameter("post");
		String dept_working=request.getParameter("dept_working");
		String spec=request.getParameter("spec");
		String leave=request.getParameter("leave");
		
		Connection con = DbConnection.getConnection();
		try {
			System.out.println("in try");
			PreparedStatement ps = con.prepareStatement("INSERT INTO `org_details`(`fid`, `login_id`, `pass`, `emp_no`, `date_joining`,"
					+ "`sal`,`tax_details`,`post`,`dept_working`,`specialization`,`leave_record`"
					+ ") VALUES ('"+fid_s+"','"+lid+"','"+pass+"','"+empno+"','"+joining_date+"','"+sal+"','"+tax_detail+"','"+post+"','"+dept_working+"',"
							+ "'"+spec+"','"+leave+"')");
			int result = ps.executeUpdate();
			if(result>0)
			{
				System.out.println("insertion done");
			}
			PreparedStatement ps1 = con.prepareStatement("UPDATE `fac_personal` SET `status`='1' WHERE mailid='"+email+"'");
			int r = ps1.executeUpdate();
			if(r>0)
			{
				System.out.println("Update Done");
			}
			//Mailer.EmailSending(oemail,"Regarding to testing","job is running");
			//Mailer.EmailSending(memail,"Regarding to testing","job is running");
			Mailer.EmailSending(email,"Userid and Password","Login Id="+lid+" Password="+pass);
			response.sendRedirect("org_details.jsp?p=p");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e);
		}

	}

}
