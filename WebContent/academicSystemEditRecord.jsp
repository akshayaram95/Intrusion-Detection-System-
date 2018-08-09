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
					PreparedStatement ps=con.prepareStatement("SELECT * FROM `student_academic` where sid='"+sid+"'");
					ResultSet rs=ps.executeQuery();
					GlobalFunction gf=new GlobalFunction();
				//	String fullname="",dept="",year="";
					if(rs.next())
					{
			%>
				<form action="UpdateAcademicSystem" name="uRegi" method="post"
					onsubmit="return Regvalidation()">
					<h2 align="center">
						<b>Student Academic Detail Edit...!</b>
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

							<td><strong>Login ID</strong></td>
							<td><strong>:</strong></td>
							<td><input type="text" name="lid" id="fname" value="<%=rs.getString(2) %>" required /> <input type="hidden" name="Usertype"
								id="Usertype" value="User" /></td>
						</tr>
						<tr>

							<td><strong>Password</strong></td>
							<td><strong>:</strong></td>
							<td><input type="password" name="pass" id="email" value="<%=rs.getString(3) %>"
								placeholder="********" maxlength="12" required /></td>
						</tr>
						<tr>

							<td><strong>Department</strong></td>
							<td><strong>:</strong></td>
							<td><input type="text" name="dept" value="<%=rs.getString(4) %>"
								id="Department"  maxlength="10" required /></td>
						</tr>
						
						<tr>

							<td><strong>Year</strong></td>
							<td><strong>:</strong></td>
							<td><input type="text" name="year" id="fname" value="<%=rs.getString(5) %>" required /> <input type="hidden" name="Usertype"
								id="Usertype" value="User" /></td>
						</tr>
				
				
					<tr>

							<td><strong>Roll No</strong></td>
							<td><strong>:</strong></td>
							<td><input type="text" name="rno" id="mname" value="<%=rs.getString(8) %>" required /> <input type="hidden" name="Usertype"
								id="Usertype" value="User" /></td>
						</tr>
						<tr>

							<td><strong>University Seat No</strong></td>
							<td><strong>:</strong></td>
							<td><input type="text" name="uni_seat_no" id="memail" value="<%=rs.getString(9) %>"
								 maxlength="10" required /></td>
						</tr>
						<tr>

							<td><strong>Unit test Marks</strong></td>
							<td><strong>:</strong></td>
							<td><input type="text" name="unit_test_marks"  value="<%=rs.getString(10) %>"
								id="Utmarks"  maxlength="10" required /></td>
						</tr>
						
						<tr>

							<td><strong>University Marks</strong></td>
							<td><strong>:</strong></td>
							<td><input type="text" name="uni_marks" id="fname" value="<%=rs.getString(11) %>" required /> <input type="hidden" name="Usertype"
								id="Usertype" value="User" /></td>
						</tr>
				
				<tr>

							<td><strong>Attendance</strong></td>
							<td><strong>:</strong></td>
							<td><input type="text" name="attendance" id="fname" value="<%=rs.getString(12) %>" required /> <input type="hidden" name="Usertype"
								id="Usertype" value="User" /></td>
						</tr>
				<tr>

							<td><strong>Fees</strong></td>
							<td><strong>:</strong></td>
							<td><input type="text" name="fees" id="fname" value="<%=rs.getString(13) %>" required /> <input type="hidden" name="Usertype"
								id="Usertype" value="User" /></td>
						</tr>
				<tr>

							<td><strong>10th Marks</strong></td>
							<td><strong>:</strong></td>
							<td><input type="text" name="10th_marks" id="fname" value="<%=rs.getString(14) %>" required /> <input type="hidden" name="Usertype"
								id="Usertype" value="User" /></td>
						</tr>
				<tr>

							<td><strong>12th Marks</strong></td>
							<td><strong>:</strong></td>
							<td><input type="text" name="12th_marks" id="fname" value="<%=rs.getString(15) %>" required /> <input type="hidden" name="Usertype"
								id="Usertype" value="User" /></td>
						</tr>
				<tr>

							<td><strong>Placement Details</strong></td>
							<td><strong>:</strong></td>
							<td><input type="text" name="place_detail" id="fname" value="<%=rs.getString(16) %>" required /> <input type="hidden" name="Usertype"
								id="Usertype" value="User" /></td>
						</tr>
				<tr>

							<td><strong>Paper Publication Details</strong></td>
							<td><strong>:</strong></td>
							<td><input type="text" name="paper_pub_detail" id="fname" value="<%=rs.getString(17) %>" required /> <input type="hidden" name="Usertype"
								id="Usertype" value="User" /></td>
						</tr>
				<tr>

							<td><strong>Extra Curricular Activities</strong></td>
							<td><strong>:</strong></td>
							<td><input type="text" name="extra_cirr" id="fname" value="<%=rs.getString(18) %>" required /> <input type="hidden" name="Usertype"
								id="Usertype" value="User" /></td>
						</tr>
				<tr>

							<td><strong>Sponsorship Details</strong></td>
							<td><strong>:</strong></td>
							<td><input type="text" name="spons_detail" id="fname" value="<%=rs.getString(19) %>" required /> <input type="hidden" name="Usertype"
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
