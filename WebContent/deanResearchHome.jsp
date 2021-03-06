<%@page import="pack1.GlobalFunction"%>
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
						<li><a href="deanResearchHome.jsp"><span>Home</span></a></li>
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
			<h2 align="center">
				<font style="color: red"> <b>Welcome Dean Industry Institute Interaction (</b></font>
			</h2>
			<br /> <br />
			<div>
			<h2 align="center">
				<font style="color: red"> <b>Students Details</b></font>
			</h2>
				<div align="center">
					
					<table border="1">
						<tr>
							<th>Sr.No</th>
							<th>Student Name</th>
							<th>Department</th>
							<th>Year</th>
							<th>Paper Details</th>
						</tr>

						<%
						
						try 
						{
								Connection con = DbConnection.getConnection();
								PreparedStatement ps = con.prepareStatement("SELECT * FROM `student_academic`");
								ResultSet rs = ps.executeQuery();
								GlobalFunction gf = new GlobalFunction();
								String fullname = "", dept = "", year = "";
								String sid = "", placed_details = "";
								int sr_no = 0;
								while (rs.next()) 
								{
									sr_no++;
									sid = rs.getString("sid");
									fullname = gf.getStuentFname(sid);
									dept = gf.getStuentDept(sid);
									year = gf.getStuentYears(sid);
									String ppr_details= rs.getString("paper_pub_detail");
						%>
						<tr>
							<td><%=sr_no %></td>
							<td><%=fullname%></td>
							<td><%=dept%></td>
							<td><%=year%></td>
							<td><%=ppr_details%></td>

							<%
								}
								} catch (Exception e) 
								{
									System.out.print("Exc "+e);
								}
							%>
						</tr>
					</table>
				</div>
		
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
