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
        <div id="coin-slider"><a href="#"><img src="images/slide1.jpg"  alt="" /></a> <a href="#"><img src="images/b1.jpg"  alt="" /></a> </div>
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div>
  <%
  if(request.getParameter("p")!=null)
  {
	  out.print("<script>alert('Please Fill Orgnizational Details')</script>");
  }
  %>
  
  
  <form action="Fac_Org_Detail" name="uRegi" method="post" onsubmit="return Regvalidation()">
			<h2 align="center"><b>Faculty Organizational Detail Form...!</b></h2> 
	        <table cellpadding="5" cellspacing="5"  width="70%" align="center" >
				<tr>
					<td align="center" colspan="3" class="ttlbgcolor"><div style="margin:5px"><h3><b></b></h3></div> </td>
				</tr>
				<tr>
					
					<td><strong>Login Id</strong></td>
					<td><strong>:</strong></td>
					<td>
					<input type="text" name="lid" id="lid"  maxlength="20" required/>
					
					</td>
				</tr>
				<tr>
					
					<td><strong>Password</strong></td>
					<td><strong>:</strong></td>
					<td><input type="password" name="pass" id="pass" placeholder="********" maxlength="12" required/></td>
				</tr>
				
				<tr>
					
					<td><strong>Employee No</strong></td>
					<td><strong>:</strong></td>
					<td><input type="text" name="eno" id="eno"  maxlength="10" required /></td>
				</tr>
				<tr>
					
					<td><strong>Date Of Joining</strong></td>
					<td><strong>:</strong></td>
					<td><input type="text" name="date" id="date"  maxlength="10" placeholder="DD/MM/YYYY" required/></td>
				</tr>
				
				<tr>
					<td><strong>Salary</strong></td>
					<td><strong>:</strong></td>
					<td><input type="text" name="sal" id="sal"  maxlength="20" required/></td>
				</tr>
				<tr>
					<td><strong>Department</strong></td>
					<td><strong>:</strong></td>
					<td><input type="text" name="dept" id="dept"  maxlength="20" required/></td>
				</tr>
				<tr>
					<td><strong>Specialization</strong></td>
					<td><strong>:</strong></td>
					<td><input type="text" name="spec" id="spec"  maxlength="20" required/></td>
				</tr>
				
				<tr>
					<td colspan="3" align="center"><div style="margin-right:20px">&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="Register" name="submit" /></div></td>
				</tr>
			</table>
			</form>
			<br></br><br></br><br></br>




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
