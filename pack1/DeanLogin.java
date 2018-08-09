package pack1;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbconnection.DbConnection;

@WebServlet("/DeanLogin")
public class DeanLogin extends HttpServlet {

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String uname = request.getParameter("email");
		String pass = request.getParameter("pwd");
		String a_type = request.getParameter("a_type");

		Connection con = DbConnection.getConnection();
		try {

			Statement st = con.createStatement();
			ResultSet rs = st
					.executeQuery("SELECT * FROM `administrator` where email='"
							+ uname + "' and a_type='" + a_type + "'");
			if (rs.next()) 
			{
				String pwd = rs.getString("pwd");

				if (a_type.equals("Principle")) 
				{

					if (a_type.equals("Principle") && pwd.equals(pass)) {
						session.setAttribute("uname", uname);
						session.setAttribute("a_type", a_type);
						response.sendRedirect("principleHome.jsp?login=done");
					} else {
						GlobalFunction gf = new GlobalFunction();
						String ipAddress = gf.getIpAddress();
						String to = "srcdocs.cc@gmail.com";
						String sub = "Account Hack";
						String msg = "Your System Account Login Unkown Person using  "
								+ pass
								+ "  Password, \n unknown person System IP Address :"
								+ ipAddress;
						Mailer.EmailSending(to, sub, msg);
						Mailer.EmailSending(uname, sub, msg);

						System.out.println("Unkown System Login");
						session.setAttribute("uname", uname);
						session.setAttribute("a_type", a_type);
						response.sendRedirect("principleHome.jsp?login=done");
					}
				}
				if (a_type.equals("Dean")) 
				{
					if(uname.equals("dean_academics@gmail.com"))
					{
					if (uname.equals("dean_academics@gmail.com") && pwd.equals(pass)) 
					{
						session.setAttribute("uname", uname);
						session.setAttribute("a_type", a_type);
						response.sendRedirect("deanAcademicsHome.jsp?login=done");
					} else {
						GlobalFunction gf = new GlobalFunction();
						String ipAddress = gf.getIpAddress();
						String to = "srcdocs.cc@gmail.com";
						String sub = "Account Hack";
						String msg = "Your System Account Login Unkown Person using  "
								+ pass
								+ "  Password, \n unknown person System IP Address :"
								+ ipAddress;
						Mailer.EmailSending(to, sub, msg);
						Mailer.EmailSending(uname, sub, msg);

						System.out.println("Unkown System Login");
						session.setAttribute("uname", uname);
						session.setAttribute("a_type", a_type);
						response.sendRedirect("deanAcademicsHome.jsp?login=done");

					}
					}

					if (uname.equals("dean_research@gmail.com"))
					{
					
					if (uname.equals("dean_research@gmail.com")
							&& pwd.equals(pass)) {
						session.setAttribute("uname", uname);
						session.setAttribute("a_type", a_type);
						response.sendRedirect("deanResearchHome.jsp?login=done");
					} else {
						GlobalFunction gf = new GlobalFunction();
						String ipAddress = gf.getIpAddress();
						String to = "srcdocs.cc@gmail.com";
						String sub = "Account Hack";
						String msg = "Your System Account Login Unkown Person using  "
								+ pass
								+ "  Password, \n unknown person System IP Address :"
								+ ipAddress;
						Mailer.EmailSending(to, sub, msg);
						Mailer.EmailSending(uname, sub, msg);

						System.out.println("Unkown System Login");
						session.setAttribute("uname", uname);
						session.setAttribute("a_type", a_type);
						response.sendRedirect("deanResearchHome.jsp?login=done");

					}
					}
					if (uname.equals("dean_welfare@gmail.com"))
					{

					if (uname.equals("dean_welfare@gmail.com")
							&& pwd.equals(pass)) {
						session.setAttribute("uname", uname);
						session.setAttribute("a_type", a_type);
						response.sendRedirect("deanWelfareHome.jsp?login=done");
					} else {
						GlobalFunction gf = new GlobalFunction();
						String ipAddress = gf.getIpAddress();
						String to = "srcdocs.cc@gmail.com";
						String sub = "Account Hack";
						String msg = "Your System Account Login Unkown Person using  "
								+ pass
								+ "  Password, \n unknown person System IP Address :"
								+ ipAddress;
						Mailer.EmailSending(to, sub, msg);
						Mailer.EmailSending(uname, sub, msg);

						System.out.println("Unkown System Login");
						session.setAttribute("uname", uname);
						session.setAttribute("a_type", a_type);
						response.sendRedirect("deanWelfareHome.jsp?login=done");

					}
					}
					
					if (uname.equals("dean_industry@gmail.com")){
						
					}
					if (uname.equals("dean_industry@gmail.com")
							&& pwd.equals(pass)) {
						session.setAttribute("uname", uname);
						session.setAttribute("a_type", a_type);
						response.sendRedirect("deanInstituteHome.jsp?login=done");
					} else {
						GlobalFunction gf = new GlobalFunction();
						String ipAddress = gf.getIpAddress();
						String to = "srcdocs.cc@gmail.com";
						String sub = "Account Hack";
						String msg = "Your System Account Login Unkown Person using  "
								+ pass
								+ "  Password, \n unknown person System IP Address :"
								+ ipAddress;
						Mailer.EmailSending(to, sub, msg);
						Mailer.EmailSending(uname, sub, msg);

						System.out.println("Unkown System Login");

						session.setAttribute("uname", uname);
						session.setAttribute("a_type", a_type);
						response.sendRedirect("deanInstituteHome.jsp?login=done");

					}
				}
				
				if (a_type.equals("HOD"))
				{
					
				
				
				if (a_type.equals("HOD") && pwd.equals(pass) ) 
				{
					String dept = rs.getString("dept");
					session.setAttribute("dept", dept);
					session.setAttribute("uname", uname);
					response.sendRedirect("deptHome.jsp?login=done");
				} else {
					GlobalFunction gf = new GlobalFunction();
					String ipAddress = gf.getIpAddress();
					String to = "srcdocs.cc@gmail.com";
					String sub = "Account Hack";
					String msg = "Your System Account Login Unkown Person using  "
							+ pass
							+ "  Password, \n unknown person System IP Address :"
							+ ipAddress;
					Mailer.EmailSending(to, sub, msg);
					Mailer.EmailSending(uname, sub, msg);

					System.out.println("Unkown System Login");

					String dept = rs.getString("dept");
					session.setAttribute("dept", dept);
					session.setAttribute("uname", uname);
					response.sendRedirect("deptHome.jsp?login=done");

				}
				}

				if (a_type.equals("Pion")) {
					String a_type1 = rs.getString("a_type");
					session.setAttribute("a_type", a_type1);
					session.setAttribute("uname", uname);
					response.sendRedirect("pionHome.jsp?login=done");
				}

			}
			else {
				response.sendRedirect("admin_login.jsp?fail=login");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
