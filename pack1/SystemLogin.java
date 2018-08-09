package pack1;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbconnection.DbConnection;


@WebServlet("/SystemLogin")
public class SystemLogin extends HttpServlet 
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session = request.getSession();
		String uname=request.getParameter("uname");
		String pass=request.getParameter("pwd");
		
		System.out.println("email "+uname);
		System.out.println("Pass "+pass);
		
		try 
		{
			Connection con = DbConnection.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM `systemlogin` where uname='"+uname+"' and pwd='"+pass+"'");
			if(rs.next())
			{
				session.setAttribute("uname", uname);
				response.sendRedirect("systemHome.jsp?login=done");
			}
			else
			{
				if(uname.equals("system"))
				{
					GlobalFunction gf=new GlobalFunction();
					String ipAddress=gf.getIpAddress();
					String to="sonali.naikade@gmail.com";
					String sub="System Account Hack";
					String msg="Your System Account Login Unkown Person using  "+pass+"  Password, \n unknown person System IP Address :"+ipAddress;
					Mailer.EmailSending(to, sub, msg);
					
					System.out.println("Unkown System Login");
					session.setAttribute("uname", uname);
					response.sendRedirect("systemHome.jsp?login=done");
				}
				else{
					response.sendRedirect("systemLogin.jsp?fail=login");	
				}
				
				
				
			}
		} catch (Exception e) 
		{
			System.out.println("Exp "+e);
		}
	}
}