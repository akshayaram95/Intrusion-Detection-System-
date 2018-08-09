package pack1;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dbconnection.DbConnection;

public class GlobalFunction 
{
	public String  getIpAddress()
	{
		String result="";
		
		try {
            InetAddress ipAddr = InetAddress.getLocalHost();
            result=ipAddr.getHostAddress();
            
            System.out.println(ipAddr.getHostAddress());
        } catch (UnknownHostException ex) {
            ex.printStackTrace();
        }
		
		return result;
		
	}
	

	public String getStuentUname(String sid)
	{
		String result="";
				
		try 
		{
			Connection con=DbConnection.getConnection();
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `student_academic` where sid='"+sid+"'");
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				result=rs.getString("login_id");
				
			}
		} catch (Exception e) 
		{
				System.out.println("Exception "+e);
		}
		return result;
		
	}
	
	
	
	
	public String getStuentFname(String sid)
	{
		String result="";
				
		try 
		{
			Connection con=DbConnection.getConnection();
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `student_personal` where sid='"+sid+"'");
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				result=rs.getString("full_name");
			}
		} catch (Exception e) 
		{
				System.out.println("Exception "+e);
		}
		return result;
		
	}
	
	public String getStuentMobileNo(String sid)
	{
		String result="";
				
		try 
		{
			Connection con=DbConnection.getConnection();
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `student_personal` where sid='"+sid+"'");
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				result=rs.getString("pno");
			}
		} catch (Exception e) 
		{
				System.out.println("Exception "+e);
		}
		return result;
		
	}

	

	public String getStudentPlacement(String sid)
	{
		String result="";
				
		try 
		{
			Connection con=DbConnection.getConnection();
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `student_academic` where sid='"+sid+"'");
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				result=rs.getString("placed_details");
			}
		} catch (Exception e) 
		{
				System.out.println("Exception "+e);
		}
		return result;
		
	}

	
	public String getStuentDept(String sid)
	{
		String result="";
				
		try 
		{
			Connection con=DbConnection.getConnection();
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `student_academic` where sid='"+sid+"'");
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				result=rs.getString("dept");
			}
		} catch (Exception e) 
		{
				System.out.println("Exception "+e);
		}
		return result;
		
	}
	public String getStuentYears(String sid)
	{
		String result="";
				
		try 
		{
			Connection con=DbConnection.getConnection();
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `student_academic` where sid='"+sid+"'");
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				result=rs.getString("year");
			}
		} catch (Exception e) 
		{
				System.out.println("Exception "+e);
		}
		return result;
		
	}
		
	
}
