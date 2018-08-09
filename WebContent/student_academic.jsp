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
						<li class="active"><a href="index.jsp"><span>Home
									Page</span></a></li>


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
			<form action="Student_Academic" name="uRegi" method="post"
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
						<td><input type="text" name="lid" id="fname" maxlength="20"
							required /></td>
					</tr>
					<tr>

						<td><strong>Password</strong></td>
						<td><strong>:</strong></td>
						<td><input type="text" name="pass" id="lname" maxlength="20"
							required /></td>
					</tr>

					<tr>

						<td><strong>Department</strong></td>
						<td><strong>:</strong></td>
						<td><select name="dept">
								<option value="--Select--">--Select--</option>
								<option value="Computer">Computer</option>
								<option value="I.T.">I.T.</option>
								<option value="Civil">Civil</option>
								<option value="Mechanical">Mechanical</option>
								<option value="Entc">Entc</option>
						</select></td>
					</tr>
					<tr>

						<td><strong>Year</strong></td>
						<td><strong>:</strong></td>
						<td><input type="text" name="year" id="email" maxlength="50"
							required /></td>
					</tr>

					<!-- <tr>
						<td><strong>Semester</strong></td>
						<td><strong>:</strong></td>
						<td><input type="text" name="sem" id="passwords"
							maxlength="20" required /></td>
					</tr> -->
					<!-- <tr>
						<td><strong>Subjects</strong></td>
						<td><strong>:</strong></td>
						<td><input type="text" name="sub" id="passwords"
							maxlength="20" required /></td>
					</tr> -->
					<tr>
						<td><strong>Roll No</strong></td>
						<td><strong>:</strong></td>
						<td><input type="text" name="rno" id="passwords"
							maxlength="20" required /></td>
					</tr>
					<tr>
						<td><strong>University Seat No</strong></td>
						<td><strong>:</strong></td>
						<td><input type="text" name="uno" id="passwords"
							maxlength="20" required /></td>
					</tr>
					<!-- <tr>
						<td><strong>Unit Test Marks</strong></td>
						<td><strong>:</strong></td>
						<td><input type="text" name="utmark" id="passwords"
							maxlength="20" required /></td>
					</tr> -->
					<!-- <tr>
						<td><strong>University Marks</strong></td>
						<td><strong>:</strong></td>
						<td><input type="text" name="umark" id="passwords"
							maxlength="20" required /></td>
					</tr> -->
					<!-- <tr>
						<td><strong>Attendance</strong></td>
						<td><strong>:</strong></td>
						<td><input type="text" name="attend" id="passwords"
							maxlength="20" required /></td>
					</tr> -->
					<!-- <tr>
						<td><strong>Fees</strong></td>
						<td><strong>:</strong></td>
						<td><select name="fees">
								<option value="--Select--">--Select--</option>
								<option value="Pending">Pending</option>
								<option value="Complete">Complete</option>
						</select></td>
					</tr> -->
					<tr>
						<td><strong>10th Marks</strong></td>
						<td><strong>:</strong></td>
						<td><input type="text" name="10marks" id="passwords"
							maxlength="20" required /></td>
					</tr>
					<tr>
						<td><strong>12th Marks</strong></td>
						<td><strong>:</strong></td>
						<td><input type="text" name="12marks" id="passwords"
							maxlength="20" required /></td>
					</tr>
					<!-- <tr>
						<td><strong>Placement Details</strong></td>
						<td><strong>:</strong></td>
						<td><select name="pdetails">
								<option value="--Select--">--Select--</option>
								<option value="Placded">Placded</option>
								<option value="Unplacded">Unplacded</option>
						</select></td>
					</tr>
					<tr>
						<td><strong>Paper Publication Details</strong></td>
						<td><strong>:</strong></td>
						<td><input type="text" name="paper_details" id="passwords"
							maxlength="20" required /></td>
					</tr>
					<tr>
						<td><strong>Extra-Curricular activities</strong></td>
						<td><strong>:</strong></td>
						<td><input type="text" name="extra" id="passwords"
							maxlength="20" required /></td>
					</tr>
					<tr>
						<td><strong>Internship/Project Sponsorship details.</strong></td>
						<td><strong>:</strong></td>
						<td><input type="text" name="spons_detail" id="passwords"
							maxlength="20" required /></td>
					</tr> -->
					<tr>
						<td colspan="3" align="center"><div
								style="margin-right: 20px">
								&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="Register"
									name="submit" />
							</div></td>
					</tr>
				</table>
			</form>


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
