<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7; IE=EmulateIE9">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/style_user.css" />" media="all" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/demo_user.css" />" media="all" />
<script>
    history.forward();
</script>
<title>User Home</title>
</head>
<body>

<%
if(session.getAttribute("token")==null) {
%>
<jsp:forward page="index.dpl"></jsp:forward>
<%
} %>

<div align="center"><img src="images/logo_dpl.jpg" /></div><br>

 <div class="container">
			<!-- freshdesignweb top bar -->
            
			<header>
				<h1><span>Welcome, ${user.userName} </span> </h1><br><br>
		<div align="center"><table border="1"><tr><td>Consumer No- ${user.conNo} </td><td>Meter No - ${user.meterNo}</td><td>Email id - ${user.email}</td><td>Mobile - ${user.mobile}</td></tr></table></div>
		<br><br>
		<div align="center">
<c:if test="${not empty requestScope.msg}">
<table border="1" bgcolor="cyan">
 <tr><td>   <font colour="RED">No Pending bill for payment / Due Date expired</font></td></tr>
    
</table>    
</c:if>
</div>		
            </header>       
      <div  class="form">
    		 
    			<p class="contact" align="center"><label for="name"><a href="billFetch.dpl?con_no=${user.conNo}" >Pay Electricity Bill</a></label></p>
    			<p class="contact" align="center"><label for="email"><a href="billSelect.dpl?con_no=${user.conNo}" >View Bills</label></a></p> 
                <p class="contact" align="center"><label for="username"><a href="Rcpt.dpl?con_no=${user.conNo}" >Generate Online Payment Receipt</a> </label></p>
                <p class="contact" align="center"><label for="username"><a href="graph.dpl?con_no=${user.conNo}" target="_blank" >Consumption Pattern</a> </label></p> 
    			<p class="contact" align="center"><label for="password"><a href="reset.dpl" >Change password</label></a></p> 
                <p class="contact" align="center"><label for="repassword"><a href="logout.dpl" >Logout</label></p> <br>
 
</div> <br><br><br><br><br><br><br><br><br>
<div align="center">
<%@ include file = "footer.jsp" %>
</div>     
</div>


</body>


</html>
