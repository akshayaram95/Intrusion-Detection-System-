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
				<span> Intrusion Detection System</span>
			</h1>
			<br></br>
		</div>
		<div class="header">
			<div class="header_resize">
				<div class="menu_nav">
					<ul>
						<li><a href="studentHome.jsp"><span>Home Page</span></a></li>
						<li><a href="studentMyAccount.jsp"><span>My Account</span></a></li>
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
		<div>
			<%
				if (request.getParameter("p") != null) {
					out.print("<script>alert('Please Fill Academic Detail')</script>");
				}
			%>

			<%
			if(request.getParameter("sid")!=null)
			{
				String sid=request.getParameter("sid");
				
				try
				{
					Connection con=DbConnection.getConnection();
					
					PreparedStatement ps=con.prepareStatement("SELECT * FROM `student_academic` where sid='"+sid+"'");
					ResultSet rs=ps.executeQuery();
					if(rs.next())
					{
						
						
				
			%>
			<form action="UpdateAcademic" name="uRegi" method="post"
				onsubmit="return Regvalidation()">
				<h2 align="center">
					<b>Student Academic Detail Form...!</b>
				</h2>
				<table cellpadding="3" cellspacing="3" align="center">
					<tr>
						<td align="center" colspan="3" class="ttlbgcolor"><div
								style="margin: 5px"></div></td>
					</tr>
					<tr>

						<td><strong>Login Id</strong></td>
						<td><strong>:</strong></td>
						<td><input type="text" name="lid" value="<%=rs.getString(2) %>" readonly="readonly" id="fname" maxlength="20"
							required  /></td>
					</tr>
					<tr>

						<td><strong>Password</strong></td>
						<td><strong>:</strong></td>
						<td><input type="password" name="pass" value="<%=rs.getString(2) %>" readonly="readonly" id="lname"
							maxlength="20" required /></td>
					</tr>

					<tr>

						<td><strong>Department</strong></td>
						<td><strong>:</strong></td>
						<td>
						<% 
						if(rs.getString(4).equals("Computer"))
						{
							%>
						
						<select readonly="readonly" name="dept">
								<option value="--Select--">--Select--</option>
								<option selected="selected" value="Computer">Computer</option>
								<option value="I.T.">I.T.</option>
								<option value="Civil">Civil</option>
								<option value="Mechanical">Mechanical</option>
								<option value="Entc">Entc</option>
						</select></td>
						<% } %>
						<% 
						if(rs.getString(4).equals("I.T."))
						{
							%>
						<select readonly="readonly" name="dept">
								<option value="--Select--">--Select--</option>
								<option value="Computer">Computer</option>
								<option selected value="I.T.">I.T.</option>
								<option value="Civil">Civil</option>
								<option value="Mechanical">Mechanical</option>
								<option value="Entc">Entc</option>
						</select></td>
						<% } %>
						<% 
						if(rs.getString(4).equals("Civil"))
						{
							%>
						
						<select readonly="readonly" name="dept">
								<option value="--Select--">--Select--</option>
								<option value="Computer">Computer</option>
								<option value="I.T.">I.T.</option>
								<option selected value="Civil">Civil</option>
								<option value="Mechanical">Mechanical</option>
								<option value="Entc">Entc</option>
						</select></td>
						<% } %>
						<% 
						if(rs.getString(4).equals("Mechanical"))
						{
							%>
						
						<select readonly="readonly" name="dept">
								<option value="--Select--">--Select--</option>
								<option value="Computer">Computer</option>
								<option value="I.T.">I.T.</option>
								<option value="Civil">Civil</option>
								<option selected="selected" value="Mechanical">Mechanical</option>
								<option value="Entc">Entc</option>
						</select></td>
						<% } %>
						<% 
						if(rs.getString(4).equals("Entc"))
						{
							%>
						<select readonly="readonly" name="dept">
								<option value="--Select--">--Select--</option>
								<option value="Computer">Computer</option>
								<option value="I.T.">I.T.</option>
								<option value="Civil">Civil</option>
								<option value="Mechanical">Mechanical</option>
								<option selected="selected" value="Entc">Entc</option>
						</select></td>
						<% } %>
					</tr>
					<tr>
						<td><strong>Year</strong></td>
						<td><strong>:</strong></td>
						<td><input type="text" readonly="readonly" name="year" id="email" maxlength="50" value="<%=rs.getString(5) %>" required /></td>
					</tr>
<%-- 
					<tr>
						<td><strong>Semester</strong></td>
						<td><strong>:</strong></td>
						<td><input type="text" name="sem" readonly="readonly" id="passwords" value="<%=rs.getString(6) %>" maxlength="20" required /></td>
					</tr>
					<tr>
						<td><strong>Subjects</strong></td>
						<td><strong>:</strong></td>
						<td><input type="text" name="sub" readonly="readonly" id="passwords" value="<%=rs.getString(3) %>" maxlength="20" required /></td>
					</tr>
 --%>					<tr>
						<td><strong>Roll No</strong></td>
						<td><strong>:</strong></td>
						<td><input type="text" name="rno" readonly="readonly" id="passwords" value="<%=rs.getString(8) %>" maxlength="20" required /></td>
					</tr>
					<tr>
						<td><strong>University Seat No</strong></td>
						<td><strong>:</strong></td>
						<td><input type="text" name="uno" readonly="readonly" id="passwords" value="<%=rs.getString(9) %>" maxlength="20" required /></td>
					</tr>
					<tr>
						<td><strong>Unit Test Marks</strong></td>
						<td><strong>:</strong></td>
						<td><input type="text" name="utmark" id="passwords" value="<%=rs.getString(10) %>" maxlength="2" required readonly="readonly"/>(OUt of 10%)</td>
					</tr>
					<tr>
						<td><strong>University Marks</strong></td>
						<td><strong>:</strong></td>
						<td><input type="text" name="umark" id="passwords" value="<%=rs.getString(11) %>" maxlength="3" required readonly="readonly"/>(OUt of 100%)</td>
					</tr>
					<tr>
						<td><strong>Attendance</strong></td>
						<td><strong>:</strong></td>
						<td><input type="text" name="attend" id="passwords" maxlength="3" value="<%=rs.getString(12) %>"
							maxlength="20" required  readonly="readonly"/>(OUt of 100%)</td>
					</tr>
					<tr>
						<td><strong>Fees</strong></td>
						<td><strong>:</strong></td>
						<td><input type="text" name="fees" readonly="readonly" id="passwords" value="<%=rs.getString(13) %>"
							maxlength="20" required /></td>
					</tr>
					<tr>
						<td><strong>10th Marks</strong></td>
						<td><strong>:</strong></td>
						<td><input type="text" name="10marks" readonly="readonly" id="passwords" value="<%=rs.getString(14) %>"
							maxlength="20" required /></td>
					</tr>
					<tr>
						<td><strong>12th Marks</strong></td>
						<td><strong>:</strong></td> 
						<td><input type="text" name="12marks" readonly="readonly" id="passwords" value="<%=rs.getString(15) %>"
							maxlength="20" required /></td>
					</tr>
					<tr>
						<td><strong>Placement Details</strong></td>
						<td><strong>:</strong></td>
						<td><input type="text" name="pdetails" readonly="readonly" id="passwords" value="<%=rs.getString(16) %>"
							maxlength="20" required /></td>
					</tr>
					<tr>
						<td><strong>Paper Publication Details</strong></td>
						<td><strong>:</strong></td>
						<td><input type="text" name="paper_details" readonly="readonly" id="passwords" value="<%=rs.getString(17) %>"
							maxlength="20" required /></td>
					</tr>
					<tr>
						<td><strong>Extra-Curricular activities</strong></td>
						<td><strong>:</strong></td>
						<td><input type="text" name="extra" readonly="readonly" id="passwords" value="<%=rs.getString(18) %>"
							maxlength="20" required /></td>
					</tr>
					<tr>
						<td><strong>Internship/Project Sponsorship details.</strong></td>
						<td><strong>:</strong></td>
						<td><input type="text" name="spons_detail" readonly="readonly" id="passwords" value="<%=rs.getString(19) %>"
							maxlength="20" required /></td>
					</tr>
					<%-- <tr>
						<td colspan="3" align="center"><div
								style="margin-right: 20px">
								&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="Update"
									name="submit" />
							</div></td>
					</tr>--%>
				</table>
			</form>

			<%
					}
					}
					catch(Exception e)
					{
					}
					}%>
			<br></br> <br></br> <br></br>




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
