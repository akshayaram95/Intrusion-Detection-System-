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
						<li><a href="systemHome.jsp"><span>Home</span></a></li>
						<li><a href="studentRecord.jsp"><span>Student</span></a></li>
						<li><a href="facultyRecord.jsp"><span>Faculty</span></a></li>
						<li><a href="deanRecord.jsp"><span>Dean / HOD</span></a></li>
						<li><a href="noticeSystem.jsp"><span>Notice</span></a></li>
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
					PreparedStatement ps=con.prepareStatement("SELECT * FROM `student_parent` where sid='"+sid+"'");
					ResultSet rs=ps.executeQuery();
					GlobalFunction gf=new GlobalFunction();
				//	String fullname="",dept="",year="";
					if(rs.next())
					{
			%>
				<form action="UpdateParentSystem" name="uRegi" method="post"
					onsubmit="return Regvalidation()">
					<h2 align="center">
						<b>Student Parent Detail Edit...!</b>
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

							<td><strong>Father Name</strong></td>
							<td><strong>:</strong></td>
							<td><input type="text" name="fname" id="fname" value="<%=rs.getString(2) %>" required /> <input type="hidden" name="Usertype"
								id="Usertype" value="User" /></td>
						</tr>
						<tr>

							<td><strong>Email</strong></td>
							<td><strong>:</strong></td>
							<td><input type="text" name="femail" id="email" value="<%=rs.getString(3) %>"
								placeholder="abc@gmail.com" maxlength="50" required /></td>
						</tr>
						<tr>

							<td><strong>Father Phone No.</strong></td>
							<td><strong>:</strong></td>
							<td><input type="text" name="fpno" pattern="[7|8|9][0-9]{9}" value="<%=rs.getString(4) %>"
								id="contactNo" placeholder="1234567890" maxlength="10" required /></td>
						</tr>
						
						<tr>

							<td><strong>Father Occupation</strong></td>
							<td><strong>:</strong></td>
							<td><input type="text" name="focc" id="fname" value="<%=rs.getString(5) %>" required /> <input type="hidden" name="Usertype"
								id="Usertype" value="User" /></td>
						</tr>
				
				
					<tr>

							<td><strong>Mother Name</strong></td>
							<td><strong>:</strong></td>
							<td><input type="text" name="mname" id="mname" value="<%=rs.getString(6) %>" required /> <input type="hidden" name="Usertype"
								id="Usertype" value="User" /></td>
						</tr>
						<tr>

							<td><strong>Mother Email</strong></td>
							<td><strong>:</strong></td>
							<td><input type="text" name="memail" id="memail" value="<%=rs.getString(7) %>"
								placeholder="abc@gmail.com" maxlength="50" required /></td>
						</tr>
						<tr>

							<td><strong>Mother Phone No.</strong></td>
							<td><strong>:</strong></td>
							<td><input type="text" name="mpno" pattern="[7|8|9][0-9]{9}" value="<%=rs.getString(8) %>"
								id="mcontactNo" placeholder="1234567890" maxlength="10" required /></td>
						</tr>
						
						<tr>

							<td><strong>Mother Occupation</strong></td>
							<td><strong>:</strong></td>
							<td><input type="text" name="mocc" id="fname" value="<%=rs.getString(9) %>" required /> <input type="hidden" name="Usertype"
								id="Usertype" value="User" /></td>
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
