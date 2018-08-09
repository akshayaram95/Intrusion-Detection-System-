<%@page import="java.sql.ResultSet"%>
<%@page import="pack1.GlobalFunction"%>
<%@page import="dbconnection.DbConnection"%>
<%@page import="java.sql.PreparedStatement"%>
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
				<span> Intrusion Detection System</span>
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
		<div align="center">
			<div align="center">
			<%
			if(request.getParameter("sid")!=null)
			{
				String sid=request.getParameter("sid");
				
				try
				{
					Connection con=DbConnection.getConnection();
					PreparedStatement ps=con.prepareStatement("SELECT * FROM `student_personal` where sid='"+sid+"'");
					ResultSet rs=ps.executeQuery();
					GlobalFunction gf=new GlobalFunction();
					String fullname="",dept="",year="";
					if(rs.next())
					{
						
						
				
			%>
			
			
				<form action="UpdatePersonalDept" name="uRegi" method="post"
					onsubmit="return Regvalidation()">
					<h2 align="center">
						<b>Student Personal Detail Edit...!</b>
					</h2>
					<table cellpadding="5" cellspacing="5" align="center">
						<tr>
							<td align="center" colspan="3" class="ttlbgcolor"><div
									style="margin: 5px">
									<h3>
										<b></b>
									</h3>
								</div>
								<input type="hidden" name="sid" value="<%=sid %>" /> 
								</td>
						</tr>
						<tr>

							<td><strong>Full Name</strong></td>
							<td><strong>:</strong></td>
							<td><input type="text" name="fname" id="fname" value="<%=rs.getString(2) %>" required /> <input type="hidden" name="Usertype"
								id="Usertype" value="User" /></td>
						</tr>
						<tr>

							<td><strong>Address</strong></td>
							<td><strong>:</strong></td>
							<td><input type="text" name="add" id="lname" value="<%=rs.getString(3) %>"
								required /></td>
						</tr>
						<tr>

							<td><strong>Gender</strong></td>
							<td><strong>:</strong></td>
							
							<%
							if(rs.getString(4).equals("Male"))
							{
							%>
							<td>
							<select name="gender" id="gender"  required>
									<option selected   value="Male">Male</option>
									<option value="FeMale">FeMale</option>
							</select></td>
							<%} %>
							<%
							if(rs.getString(4).equals("FeMale"))
							{
							%>
							<td>
							<select name="gender" id="gender"  required>
									<option value="Male">Male</option>
									<option selected value="FeMale">FeMale</option>
							</select></td>
							<%} %>
						</tr>
						<tr>

							<td><strong>Phone No.</strong></td>
							<td><strong>:</strong></td>
							<td><input type="text" name="pno" pattern="[7|8|9][0-9]{9}" value="<%=rs.getString(5) %>"
								id="contactNo" placeholder="1234567890" maxlength="10" required /></td>
						</tr>
						<tr>

							<td><strong>Email</strong></td>
							<td><strong>:</strong></td>
							<td><input type="text" name="email" id="email" value="<%=rs.getString(6) %>"
								placeholder="abc@gmail.com" maxlength="50" required /></td>
						</tr>

						<tr>
							<td><strong>Date Of Birth</strong></td>
							<td><strong>:</strong></td>
							<td><input type="text" name="bdate" id="passwords" value="<%=rs.getString(7) %>"
								maxlength="20" required /></td>
						</tr>
						<tr>
							<td><strong>Bank Account No</strong></td>
							<td><strong>:</strong></td>
							<td><input type="text" name="bno" id="passwords" value="<%=rs.getString(8) %>"
								maxlength="20" required /></td>
						</tr>
						<tr>
							<td><strong>Adhar Card No</strong></td>
							<td><strong>:</strong></td>
							<td><input type="text" name="ano" id="passwords" value="<%=rs.getString(9) %>"
								maxlength="20" required /></td>
						</tr>
						<tr>
							<td colspan="3" align="center"><div
									style="margin-right: 20px">
									&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="Update"
										name="submit" />
								</div></td>
						</tr>
					</table>
				</form>
				<%
					}
				}
				catch(Exception e)
				{
					
				}
			}
				
				%>
				
			</div>
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
