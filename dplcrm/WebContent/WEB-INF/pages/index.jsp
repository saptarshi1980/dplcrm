<!DOCTYPE html>
<html >
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <meta charset="UTF-8">
  <title>DPL Online Bill Payment-Login</title>
  
  
  
      <link rel="stylesheet" href="<c:url value="/css/style.css" />">

      <script src="<c:url value="/js/index.js" />"></script>
      <script>
    history.forward();
</script>
</head>
<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);

  

  %> 
  

  <body>
  
<div class="container"></div>
<div align="center"><img src="images/logo_dpl.jpg" /></div><br><br>
	<section id="content">
		<form action="UserLoginAuth.dpl" method="POST">
			<h3>Consumer Login</h3>
			<div>
				<input type="text" placeholder="Username" required="" id="username" name="username"/>
			</div>
			<div>
				<input type="password" placeholder="Password" required="" id="password" name="password" />
			</div>
			<div>
				<input type="submit" value="Log in" />
				<a href="conValidation.dpl">New user Registration</a>
				<a href="forgot.dpl">Forgot password?</a> <br>
				
			</div>
		</form><!-- form -->
		<div class="button" >
			<a href="quickpay.dpl"><font color="BLUE" ><span style="font-weight:bold">Quick Pay(Pay Bill Without Registration) </font></span></a>
		</div><!-- button -->
	</section><!-- content -->
</div><!-- container -->
<br><br><br>
  <table style="width: 100%;" bgcolor="black">
    <tr >
        <marquee scrolldelay="80" scrollamount="3" onMouseOver="document.all.test.stop()" onMouseOut="document.all.test.start()"><td align="center"><font color="white">Now Registered Users can Pay Bills (Through Credit/ Debit Cards, Internet Banking, Digital Wallets), Download payment Receipts, Download Bills, View Consumption Pattern </font></td>
        
    </tr>
   
</table>

</body>
</html>
