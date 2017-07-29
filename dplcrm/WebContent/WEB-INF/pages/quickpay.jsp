<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The Durgapur Projects Limited</title>


</head>

<body onload="document.frm1.con_no.focus();">



  
  
<div align="center"><img src="images/logo_dpl.jpg" /></div> <br><br>	

	
  
      
<div align="center">Welcome to Quick Online Bill Payment System-Registration Not Required</div>
<form name="frm1" action="quickPayHandler.dpl" method="post">
<p>
<p><br>
<table width="305" height="90" border="1" align="center" >
  <td width="221"><div align="center"><span class="style3">Consumer id</span></div></td>
    <td width="68"><input name="con_no" type="text" id="con_no" style="font-size: 14pt" size="12"/></td>
    <!-- <tr><td>Bill Amount </td><td><input type="text" id="amt" name="amt" value="1000"></td> -->
      <div align="center"></div>
    <br />
      <br />
  <tr>
    <td height="1"></td>
  </tr>
  
  <tr>
    <td height="51" colspan="2" bgcolor="#6699CC">
      <div align="center">
        <input name="name" type="submit"  id="name" value="Proceed For Payment" style="width:150px; height:25px;"/>
    </div></td></tr>
    
</table>
<br><br><br><br>
<div align="center">
<br></br>
<%@ include file = "footer.jsp" %>
</div>
		
</body>
</html>