\<%@page import="pack1.GlobalFunction"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dbconnection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
			<h1>
				<span>Intrusion Detection System</span>
			</h1>
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
						<li><a href="noticeDept.jsp"><span>Notice</span></a></li>
						<li><a href="Logout"><span>Logout</span></a></li>
					</ul>
				</div>
		<%
      		if(request.getParameter("not")!=null)
      		{
    	  		out.print("<script>alert('Student Not Found..!! ')</script>");
      		}
      	%>

				<div class="clr"></div>
				<div class="slider">
					<div id="coin-slider">
						<a href="#"><img src="images/slide1.jpg" alt="" /></a> <a
							href="#"><img src="images/b1.jpg" alt="" /></a>
					</div>
					<div class="clr"></div>
				</div>
				<div class="clr"></div>
			</div>
		</div>
		<div>
			<form action="hodHome.jsp" method="post">
				<h2 align="center">
					<b>Search Student.....!</b>
				</h2>
				<table cellpadding="5" cellspacing="5" align="center">

					<tr>
						<td><strong>Student Username</strong></td>
						<td><strong>:</strong></td>
						<td><input type="text" name="uname" id="uname" required
							style="width: 170px; height: 25px;" /></td>
					</tr>
					<tr>
						<td colspan="3" align="center"><input type="submit"
							value="Search" style="width: 170px; height: 40px;" />
						</div></td>

					</tr>
				</table>
			</form>
			</br>
			</br>

			<%
			if(request.getParameter("uname")!=null)
			{
				String uname=request.getParameter("uname");
				
				try
				{
					Connection con=DbConnection.getConnection();
					PreparedStatement ps=con.prepareStatement("SELECT * FROM `student_academic` where login_id='"+uname+"'");
					ResultSet rs=ps.executeQuery();
					GlobalFunction gf=new GlobalFunction();
					String fullname="",dept="",year="";
					String sid="";
					if(rs.next())
					{
						sid=rs.getString("sid");
						System.out.print("123  "+sid);
						fullname=gf.getStuentFname(sid);
						dept=gf.getStuentDept(sid);
						year=gf.getStuentYears(sid);
						
					}
					else
					{
						response.sendRedirect("hodHome.jsp?not=found");
						
					}
					
					%>
					<div align="center">
					<br/>
					<font style="color: red;"><h2>Student Information</h2> </font>
					<br/>
					
			<table border="1">
				<tr>
					<th>Sr.No</th>
					<th>Student Name</th>
					<th>Department</th>
					<th>Year</th>
					<th>Edit Operation</th>
				</tr>
				<tr>
					<td>1</td>
					<td><%=fullname %></td>
					<td><%=dept %></td>
					<td><%=year %></td>
					<td><%-- <a href="personalInfEdit.jsp?sid=<%=sid%>">Personal Info</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="parentInfEdit.jsp?sid=<%=sid%>">Parent Info</a>&nbsp;&nbsp;&nbsp;| --%>&nbsp;&nbsp;&nbsp;<a href="acdInfoEdit.jsp?sid=<%=sid%>">Academic Info</a> </td>
				</tr>
			</table>
	</div>
	<br/>
					<br/>

			<%
				}
				catch(Exception e)
				{
					
				}
			}
			
			%>


			</br>



		</div>
		<div></div>

	</div>
	<div class="footer">
		<div class="footer_resize">
			<p class="lf">
				&copy; Copyright <a href="#">MyWebSite</a>.
			</p>
			<p class="rf">Design by Student</p>
			<div style="clear: both;"></div>
		</div>
	</div>
	</div>
</body>
</html>
