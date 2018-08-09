<%@page import="pack1.GlobalFunction"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dbconnection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Intrusion Detection System</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-georgia.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
</head>
<body>
<div class="main">
<div class="logo">
        <h1><span>Intrusion Detection System</span></h1>
        <br></br>
      </div>
  <div class="header">
    <div class="header_resize">
      <div class="menu_nav">
      <ul>
      			<li><a href="deptHome.jsp"><span>Home</span></a></li>
						<li><a href="deptModify.jsp"><span>Modification</span></a></li>
						<li><a href="viewStudentDept.jsp"><span>View Student</span></a></li>
						<li><a href="deptNotification.jsp"><span>Notification</span></a></li>
						<li><a href="Logout"><span>Logout</span></a></li>
					</ul>

      </div>
      
      <div class="clr"></div>
      <div class="slider">
        <div id="coin-slider"><a href="#"><img src="images/slide1.jpg"  alt="" /></a> <a href="#"><img src="images/b1.jpg"  alt="" /></a> </div>        <div class="clr"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
 <div align="center">
			<h2>
				<font style="color: Red">Result < 50% Student Details</font>
			</h2>
			<table cellpadding="3" cellspacing="3" align="center" border="1">
				<tr align="center">
					<th>Sr. No.</th>
					<th>Full Name</th>
					<th>Unit Test Marks</th>
					<th>Phone Number</th>
					<th>Email ID</th>
					<th>Username</th>
				</tr>
				<%
				try{
					String dept1=session.getAttribute("dept").toString();
					
					System.out.print("dept "+dept1);
					Connection con=DbConnection.getConnection();
					
					PreparedStatement ps=con.prepareStatement("SELECT * FROM `student_academic` where dept='"+dept1+"'");
					ResultSet rs=ps.executeQuery();
					GlobalFunction gf=new GlobalFunction();
					int sr_no=0;
					while(rs.next())
					{
						sr_no++;
						String uni_marks=rs.getString("uni_marks");
						
						if(!uni_marks.equals("NotStored"))
						{
							int u_marks=Integer.parseInt(uni_marks);
						
						
						if(u_marks<50)
						{
						String sid=rs.getString("sid");
						String uname=gf.getStuentUname(sid);
						String fname=gf.getStuentFname(sid);
						String dept=gf.getStuentDept(sid);
						String mobileNo=gf.getStuentMobileNo(sid);
						
					%>

				<tr align="center">
					<td><%=sr_no %></td>
					<td><%=fname %></td>
					<td><%=u_marks %></td>
					<td><%=dept%></td>
					<td><%=mobileNo %></td>
					<td><%=uname %></td>
				</tr>

				<%
					}
						}
						}
				}catch(Exception e)
				{
					System.out.print("Ex "+e);
					
				}
				
				
				%>

			</table>

			<br /> <br /> <br /> <br />



		</div>
  <div>
  </div>
  
</div>
<div class="footer">
    <div class="footer_resize">
      <p class="lf">&copy; Copyright <a href="#">MyWebSite</a>.</p>
      <p class="rf">Design by Student </p>
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
</body>
</html>
