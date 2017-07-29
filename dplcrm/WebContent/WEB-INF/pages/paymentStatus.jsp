<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The Durgapur Projects Limited</title>

<style type="text/css">
<!--
.style3 {font-size: medium}
.style4 {
	font-size: medium;
	color: #663366;
	font-weight: bold;
}
.style5 {
	color: #663366;
	font-weight: bold;
}
-->
</style>
</head>
<body>

<div align="center"><img src="images/logo_dpl.jpg" /></div><br><br>
	
<br><br>
	
   
      <div align="center">
     
        
        <h3>You have returned to DPL's Payment Portal.</h3></p>
       
       <h3>Click here to view <a href="PaymentStatus.dpl?ref_no=${requestScope.ref_no}"><strong>Payment Status/Payment Receipt</strong></h3></a> </p>
       
      </div>
    

<br><br><br><br><br><br><br>
 <div align="center">
<br></br>
<%@ include file = "footer.jsp" %>
</div>
        
</body>
</html>