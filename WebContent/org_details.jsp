<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="dbconnection.*" %>
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
        <h1><span> Intrusion Detection System</span></h1>
        <br></br>
      </div>
  <div class="header">
    <div class="header_resize">
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="index.jsp"><span>Home Page</span></a></li>
          
                    
        </ul>
      </div>
      
      <div class="clr"></div>
      <div class="slider">
        <div id="coin-slider"><a href="#"><img src="images/slide1.jpg"  alt="" /></a> <a href="#"><img src="images/b1.jpg"  alt="" /></a> </div>        <div class="clr"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div>
  <h2 align="center">View Staff Details</h2>
<div align="center">
<form action="org_details.jsp">
<table border="1" align="center">
<tr align="center">
<td align="center"><strong>Staff Email Id</strong></td>
<td>
	<select name="staffemail" required="required">
	<option value="">--Select--</option>
<%
String oemail=(String)session.getAttribute("oemail");
Connection con = DbConnection.getConnection();
PreparedStatement ps = con.prepareStatement("SELECT * FROM `fac_personal` WHERE status='0' ");
ResultSet rs = ps.executeQuery();
while(rs.next()){
	
	%>
	
	
	<option value="<%=rs.getString("mailid")%>"><%=rs.getString("mailid")%></option>
	
	<%
}
%>
</select>
	</td>
	</tr>
	<tr>
<td><input type="submit"> </td>
</tr>
	
</table>
</form>
<br>
<%
if(request.getParameter("staffemail")!=null && request.getParameter("p")==null)
{
	String staffemail=request.getParameter("staffemail");
	session.setAttribute("staffemail",staffemail);
	Statement stp=con.createStatement();
	ResultSet rsp=stp.executeQuery("select * from fac_personal where mailid='"+staffemail+"'");
	if(rsp.next())
	{
		int fid = rsp.getInt("fid");
		session.setAttribute("fid",fid);
		session.setAttribute("staffemail",rsp.getString("mailid"));
		
	%>
	<table border="1" align="center">
<!-- <tr>
<strong>Staff Information</strong>
</tr> -->
<tr><td>Full Name</td><td>Address</td><td>Phone No</td><td>Email Id</td><td>Birth Date</td>
<td>Gender</td><td>Bank Account No</td><td>Adhar No</td><td>Pan Card No</td><td>Designation</td>
</tr>
<tr><td><%=rsp.getString(2) %></td><td><%=rsp.getString(3) %></td><td><%=rsp.getString(4) %></td>
<td><%=rsp.getString(5)%></td><td><%=rsp.getString(6)%></td><td><%=rsp.getString(7)%></td>
<td><%=rsp.getString(8)%></td><td><%=rsp.getString(9)%></td><td><%=rsp.getString(10)%></td>
<td><%=rsp.getString(11)%></td>
</tr>
	</table>
		</br></br></br>
	<% }
%>
<form action="Org_Detail_Action" method="post">

<table border="1" align="center">
<tr>
<strong>Information By Admin</strong>
</tr>
<tr>
	<td>Login Id</td>
	<td><input type="text" name="lid"></td>
</tr>

<tr>
	<td>Password</td>
	<td><input type="text" name="pass"></td>
</tr>
<tr>
	<td>Employee No</td>
	<td><input type="text" name="empno"></td>
</tr>
<tr>
	<td>Date Of Joining</td>
	<td><input type="text" name="joining_date"></td>
</tr>
<tr>
	<td>Salary</td>
	<td><input type="text" name="sal"></td>
</tr>
<tr>
	<td>Tax Details</td>
	<td><input type="text" name="tax_detail"></td>
</tr>
<tr>
	<td>Post</td>
	<td><input type="text" name="post"></td>
</tr>
<tr>
	<td>Department Of Working</td>
	<td><input type="text" name="dept_working"></td>
</tr>
<tr>
	<td>Area Of Specialization</td>
	<td><input type="text" name="spec"></td>
</tr>
<tr>
	<td>Leave Record</td>
	<td><input type="text" name="leave"></td>
</tr>

<tr>
<td>Submit Query</td>
<td><input type="submit"> </td>
</tr>


</table>
<br>
<%
}
%>
</form>



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
