package pack1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbconnection.DbConnection;

/**
 * Servlet implementation class StudentLogin
 */
@WebServlet("/StudentLogin")
public class StudentLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int n1,n2;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session = request.getSession();
		String uname=request.getParameter("uname");
		String pass=request.getParameter("pass");
		NaiveBayes n=new NaiveBayes();
		uname.concat(pass);
		n1=n.naivePredictor(uname);
		if(n1==1)
		{
		n.sent_Mail(0,"");
		}
		
		// Call Naive Bayes Classifier here.
		
				Connection con = DbConnection.getConnection();
		try {
			//con.setAutoCommit(false);

			Statement st = con.createStatement();
			String str="SELECT * FROM `student_academic` where login_id='"+uname+"' and pass='"+pass+"'";
			ResultSet rs = st.executeQuery(str);
			if(rs.next())
			{
				
				session.setAttribute("uname", uname);
				String id=rs.getString(1);
				session.setAttribute("id", id);
				if(n1==1)
				{
				Sign_Compare sig=new Sign_Compare();
				sig.sig_Compare(uname);
				}
				response.sendRedirect("studentHome.jsp?login=done");
				
			}
			else
			{
				response.sendRedirect("index.jsp?fail=login");
			}
		} catch (SQLException e) 
		{
			response.sendRedirect("index.jsp?fail=login");
			e.printStackTrace();
		}
	}
}
