package pack1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dbconnection.DbConnection;

public class FacultyValues 
{
	public String  getLoginId(String fid) 
	{
		String result="";
		try
		{
			Connection con=DbConnection.getConnection();
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `org_details` where fid='"+fid+"'");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				result=rs.getString("login_id");
			}
		}
		catch(Exception e)
		{
		}
		
		 return result; 
	}
	
	public String  getEmpNo(String fid) 
	{
		String result="";
		try
		{
			Connection con=DbConnection.getConnection();
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `org_details` where fid='"+fid+"'");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				result=rs.getString("emp_no");
			}
		}
		catch(Exception e)
		{
		}
		
		 return result; 
		
	}
	
	public String  getDateJoining(String fid) 
	{
		String result="";
		try
		{
			Connection con=DbConnection.getConnection();
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `org_details` where fid='"+fid+"'");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				result=rs.getString("date_joining");
			}
		}
		catch(Exception e)
		{
		}
		
		 return result; 
		
	}
	
	public String  getSal(String fid) 
	{
		String result="";
		try
		{
			Connection con=DbConnection.getConnection();
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `org_details` where fid='"+fid+"'");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				result=rs.getString("sal");
			}
		}
		catch(Exception e)
		{
		}
		
		 return result; 
		
	}
	
	public String  getPost(String fid) 
	{
		String result="";
		try
		{
			Connection con=DbConnection.getConnection();
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `org_details` where fid='"+fid+"'");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				result=rs.getString("post");
			}
		}
		catch(Exception e)
		{
		}
		
		 return result; 
		
	}
	
	public String  getDeptWorking(String fid) 
	{
		String result="";
		try
		{
			Connection con=DbConnection.getConnection();
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `org_details` where fid='"+fid+"'");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				result=rs.getString("dept_working");
			}
		}
		catch(Exception e)
		{
		}
		
		 return result; 
		
	}
	
	public String  getSpecialization(String fid) 
	{
		String result="";
		try
		{
			Connection con=DbConnection.getConnection();
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `org_details` where fid='"+fid+"'");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				result=rs.getString("specialization");
			}
		}
		catch(Exception e)
		{
		}
		
		 return result; 
		
	}
	
	public String  getLeaveRecord(String fid) 
	{
		String result="";
		try
		{
			Connection con=DbConnection.getConnection();
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `org_details` where fid='"+fid+"'");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				result=rs.getString("leave_record");
			}
		}
		catch(Exception e)
		{
		}
		
		 return result; 
		
	}
	
	
}
