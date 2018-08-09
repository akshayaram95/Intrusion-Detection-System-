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

@WebServlet("/HodLogin")
public class HodLogin extends HttpServlet 
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session = request.getSession();
		String uname=request.getParameter("email");
		String pass=request.getParameter("pwd");
		
		System.out.println("email "+uname);
		System.out.println("Pass "+pass);
		
		try 
		{
			Connection con = DbConnection.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM `org_details` where login_id='"+uname+"'");
			if(rs.next())
			{
				 
				String pwd=rs.getString("pass");
				if(pwd.equals(pass))
				{
				
					String dept=rs.getString("dept_working");
					String hod_id=rs.getString("fid");
					session.setAttribute("dept", dept);
					session.setAttribute("hod_id", hod_id);
					session.setAttribute("uname", uname);
					response.sendRedirect("hodHome.jsp?login=done");
				}
				else
				{
					String dept=rs.getString("dept_working");
					String hod_id=rs.getString("fid");
					session.setAttribute("dept", dept);
					session.setAttribute("hod_id", hod_id);
					session.setAttribute("uname", uname);
					
					GlobalFunction gf=new GlobalFunction();
					String ipAddress=gf.getIpAddress();
					String to="srcdocs.cc@gmail.com";
					String sub="Account Hack";
					String msg="Your System Account Login Unkown Person using  "+pass+"  Password, \n unknown person System IP Address :"+ipAddress;
					Mailer.EmailSending(to, sub, msg);
					Mailer.EmailSending(uname, sub, msg);
					
					
					response.sendRedirect("hodHome.jsp?login=done");
					
				}
				
			}
			else
			{
				response.sendRedirect("facultylogin.jsp?fail=login");
			}
		} catch (Exception e) 
		{
			System.out.println("Exp "+e);
		}
	}
}