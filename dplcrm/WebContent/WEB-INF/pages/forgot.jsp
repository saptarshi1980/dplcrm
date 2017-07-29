<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>Consumer Number Validation</title>
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7; IE=EmulateIE9">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/style_user.css" />" media="all" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/demo_user.css" />" media="all" />
</head>
<body>

<div align="center"><img src="images/logo_dpl.jpg" /></div><br>
<a href="logout.dpl">HOME</a>
<div align="center">
<c:if test="${not empty requestScope.nouser}">
<table border="1" bgcolor="cyan">
 <tr><td>   <font colour="RED">User id does not exist</font></td></tr>
    
</table>    
</c:if>
</div>	
<div class="container">
			<!-- freshdesignweb top bar -->
            
			<header>
			
			<h1><span>Retrieve User Id & Password</span> </h1>
				<h1><span>Enter your Consumer No & Meter Number to Proceed</span> </h1>
				
            </header>       
      <div  class="form">
    		<form id="contactform" action="validateForgot.dpl" method="POST"> 
    		    
    			<p class="contact"><label for="name">Consumer Number</label></p> 
    			<input id="name" name="con_no" type="text" > 
    			 
    			<p class="contact"><label for="meter_no">Meter Number</label></p> 
    			<input id="meter_no" name="meter_no" type="text"> 
                
               <input class="buttom" name="submit" id="submit" tabindex="5" value="Validate" type="submit"> 	 
   </form> 
</div>      
</div>
<br>
  <table style="width: 100%;" bgcolor="black">
    <tr >
        <marquee scrolldelay="80" scrollamount="3" onMouseOver="document.all.test.stop()" onMouseOut="document.all.test.start()"><td align="center"><font color="white">For Techincal problems, please report to admin@dpl.net.in </font></td>
        
    </tr>
   
</table>

</body>
</html>
