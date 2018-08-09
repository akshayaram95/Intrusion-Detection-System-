package pack1;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbconnection.DbConnection;

/**
 * Servlet implementation class NoticeUpdate
 */
@WebServlet("/NoticeUpdate")
public class NoticeUpdate extends HttpServlet {
	Connection con = null;
	PreparedStatement ps = null;

	public void init(ServletConfig config) throws ServletException 
	{
		try 
		{
			con = DbConnection.getConnection();
		} catch (Exception e) 
		{
			System.out.println("Exception in con " + e);
		}
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String user_id = request.getParameter("ids");
		String user_id1 = request.getParameter("idd");
		int i=-1;
		try 
		{
			if (user_id != null) 
			{
				ps = con.prepareStatement("update `notice` SET sts='Send' where id='" + user_id + "'");
				i = ps.executeUpdate();
			}
			else if (user_id1 != null) 
			{
				GlobalFunction gf=new GlobalFunction();
				String ip=gf.getIpAddress();
				ps = con.prepareStatement("update `notice` SET sts='Drop',atack_ip='"+ip+"',attack_by='Pion' where id='" + user_id1 + "'");
				i = ps.executeUpdate();
			}
			if (i > 0) 
			{
				System.out.println("Data Update Done");
				response.sendRedirect("pionNotice.jsp");
			} else {
				System.out.println("Data Update Fails");
			}

		} catch (Exception e) {
			System.out.println("EXp " + e);
		}

	}


}
