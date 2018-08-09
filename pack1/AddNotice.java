package pack1;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbconnection.DbConnection;

/**
 * Servlet implementation class AddNotice
 */
@WebServlet("/AddNotice")
public class AddNotice extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		String sendto=request.getParameter("sendto");
		String msg=request.getParameter("msg");
		
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		Date dateobj = new Date();
		String c_date = df.format(dateobj);
		System.out.println("C Date " + c_date);
		
		try 
		{
			Connection con=DbConnection.getConnection();
			PreparedStatement ps=con.prepareStatement("INSERT INTO `detection`.`notice` (`id`, `nfrom`, `nto`, `msg`, `sts`, `attack_by`, `atack_ip`,`ndate`) VALUES (NULL, 'Principle','"+sendto+"' , '"+msg+"', 'Waitting', 'No', 'No','"+c_date+"')");
			int i=ps.executeUpdate();
			if(i>0)
			{
				response.sendRedirect("principleSendNts.jsp?notice=sent");
			}
		} catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
	}
}
