<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="pack1.GlobalFunction"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dbconnection.DbConnection"%>
<%@page import="java.sql.Connection"%>
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
	<%
		if (request.getParameter("p") != null) {
			out.print("<script>alert('Registered SuccessFully')</script>");
		}
	%>
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
						<!-- class="active" -->
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
		<div></div>
		<div align="center">
			<h2>WELCOME TO Student Home</h2>
			</br>
			</br>
			<%
			
			String uname=session.getAttribute("uname").toString();
			String sid="";
			try{
				
				Connection con=DbConnection.getConnection();
				PreparedStatement ps=con.prepareStatement("SELECT * FROM `student_academic` where login_id='"+uname+"'");
				ResultSet rs=ps.executeQuery();
				GlobalFunction gf=new GlobalFunction();
				String fullname="";
				if(rs.next())
				{
					sid=rs.getString("sid");
					fullname=gf.getStuentFname(sid);
				}
			
			
			%>
			
			
				<table border="1">
				<tr>
					<th>Sr.No</th>
					<th>Edit Operation</th>
				</tr>
				<tr>
					<td>1</td>
					<td><a href="viewStudentPersonal.jsp?sid=<%=sid%>">Personal Info</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="viewStudentParent.jsp?sid=<%=sid%>">Parent Info</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="viewStudentAcademic.jsp?sid=<%=sid%>">Academic Info</a> </td>
				</tr>
			</table>
			<%
			}
			catch(Exception e)
			{
				System.out.print("exe "+e);	
			}
			%>

			</br>
			</br>
			</br>
		</div>

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
