<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The Durgapur Projects Limited</title>
<meta name="keywords" content="DPL" />
<meta name="description" content="DPL" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="style.css" media="screen, print, projection">
<link rel="stylesheet" type="text/css" href="styles.css" >
<style type="text/css">
<!--
.style3 {font-size: medium}
-->
</style>
</head>
<body onLoad="document.frm1.con_id.focus();">

<div id="templatemo_container_wrapper">
	<div class="templatemo_spacer"></div>
<div id="templatemo_container">

  <div id="templatemo_header" align="center">
      <div id="inner_header"><br><br>
       <img src="images/logo_dpl.jpg" /><br>
      </div>
  </div>
  
  <div align="center">
	
</div>	
	
<br><br>
	
  
      <div id="templatemo_left_column">
 		<div class="text_area" align="justify" fon>
<a href="home.dpl?con_no=${requestScope.con_no}">Home</a> 
<div class="title" align="center">Download Payment Receipt</div>
<br><div align="center">Please Click on the reference number to download the receipt.</div>
<form name="frm1" action="#" method="post">
<p>
<p><br>
<table width="500" height="100" border="2" align="center"  >
   
  <tr>
    <td height="70" colspan="15" bgcolor="#6699CC">
      <div align="center">
        
       <table cellspacing="10" border="1">
       
       <th><FONT FACE="Geneva, Arial" SIZE=2>Consumer No</FONT></th>
       <th><FONT FACE="Geneva, Arial" SIZE=2>Transaction Dt</FONT></th>
       <th><FONT FACE="Geneva, Arial" SIZE=2>Bill Month</FONT></th>
       <th><FONT FACE="Geneva, Arial" SIZE=2>Transaction Amt(Rs)</FONT></th>
       <th><FONT FACE="Geneva, Arial" SIZE=2>Reference No</FONT></th>
       
       
       
      <c:forEach items="${info}" var="object">
      <tr>
        <td ><FONT FACE="Geneva, Arial" SIZE=2>${object.consumerNo}</FONT></td>
        <td ><FONT FACE="Geneva, Arial" SIZE=2>${object.tranDate}</FONT></td>
        <td ><FONT FACE="Geneva, Arial" SIZE=2>${object.billMonth}</FONT></td>
        <td ><FONT FACE="Geneva, Arial" SIZE=2>${object.tranAmt}</FONT></td>
        <td ><FONT FACE="Geneva, Arial" SIZE=2><a href="PaymentStatus.dpl?ref_no=${object.refNo}">${object.refNo}</a></FONT></td>
         
   	  </tr>
    	 </c:forEach>
    	
       
       
       
       </table>



    </div></td></tr>
</table>
<br>
<div align="center"></div>




</font><br />
<br />
		<div class="section_box2" align="justify">
        <div class="post_title"></div>
        <div class="text_area">
        </div>
                    
      	</div>
        
        <div class="section_box2" align="justify">
        <!-- <div class="post_title">New Flash Player</div> -->
        <div class="text_area">
        
          </div>
      	</div>
       
        </div>
      </div>
    
    	
          

	<div id="templatemo_footer" align="center">
    Copyright 2015. Site Developed & Maintained by IT Cell, The Durgapur Projects Limited.    </div>
        
</div>
<div class="templatemo_spacer"></div>
</div>
</body>
</html>