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
           <!-- class="active" --> <li><a href="index.jsp"><span>Home Page</span></a></li>
          <li><a href="student_personal_detail.jsp"><span>Student Registration</span></a></li>
          <li><a href="fac_personal_detail.jsp"><span>Faculty Registration</span></a></li>
          <li><a href="facultylogin.jsp"><span>Faculty Login</span></a></li>
          <li><a href="admin_login.jsp"><span>Administration</span></a></li>
          
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
				<form action="Student_Personal" name="uRegi" method="post"
					onsubmit="return Regvalidation()">
					<h2 align="center">
						<b>Student Personal Detail Form...!</b>
					</h2>
					<table cellpadding="5" cellspacing="5" align="center">
						<tr>
							<td align="center" colspan="3" class="ttlbgcolor"><div
									style="margin: 5px">
									<h3>
										<b></b>
									</h3>
								</div></td>
						</tr>
						<tr>

							<td><strong>Full Name</strong></td>
							<td><strong>:</strong></td>
							<td><input type="text" name="fname" id="fname"
								maxlength="20" required /> <input type="hidden" name="Usertype"
								id="Usertype" value="User" /></td>
						</tr>
						<tr>

							<td><strong>Address</strong></td>
							<td><strong>:</strong></td>
							<td><input type="text" name="add" id="lname" maxlength="20"
								required /></td>
						</tr>
						<tr>

							<td><strong>Gender</strong></td>
							<td><strong>:</strong></td>
							<td><select name="gender" id="gender" required>

									<option name="male" value="Male">Male</option>
									<option name="female" value="FeMale">FeMale</option>
							</select></td>
						</tr>
						<tr>

							<td><strong>Phone No.</strong></td>
							<td><strong>:</strong></td>
							<td><input type="text" name="pno" pattern="[7|8|9][0-9]{9}"
								id="contactNo" placeholder="1234567890" maxlength="10" required /></td>
						</tr>
						<tr>

							<td><strong>Email</strong></td>
							<td><strong>:</strong></td>
							<td><input type="text" name="email" id="email"
								placeholder="abc@gmail.com" maxlength="50" required /></td>
						</tr>

						<tr>
							<td><strong>Date Of Birth</strong></td>
							<td><strong>:</strong></td>
							<td><input type="text" name="bdate" id="passwords"
								maxlength="20" required /></td>
						</tr>
						<tr>
							<td><strong>Bank Account No</strong></td>
							<td><strong>:</strong></td>
							<td><input type="text" name="bno" id="passwords"
								maxlength="20" required /></td>
						</tr>
						<tr>
							<td><strong>Adhar Card No</strong></td>
							<td><strong>:</strong></td>
							<td><input type="text" name="ano" id="passwords"
								maxlength="20" required /></td>
						</tr>
						<tr>
							<td colspan="3" align="center"><div
									style="margin-right: 20px">
									&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="Register"
										name="submit" />
								</div></td>
						</tr>
					</table>
				</form>
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
