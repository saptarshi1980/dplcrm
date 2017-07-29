<!DOCTYPE html>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>User Registration</title>
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7; IE=EmulateIE9">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
	<script src="https://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>	
	<script src="<c:url value="resources/js/moment.js" />"></script>	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/style_user.css" />" media="all" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/demo_user.css" />" media="all" />
    
    <script >
	function checkRegistration(){
		
				var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
				
				var username=document.getElementById('username').value;
				
				var password=document.getElementById('password').value;
				
				var repassword=document.getElementById('repassword').value;
				
				var email_id=document.getElementById('email').value;
				
				var mobile=document.getElementById('phone').value;
				
				
				
				 if (reg.test(email_id) == false) 
		        {
		            alert('Invalid Email Address');
		            return false;
		        }
				
				 else if(username.length<4){
					
					alert('User name must be atleast of 4 characters');
					return false;
				}
				
				
				
				else if(password.length<6){
					
					alert('Password must be atleast of 6 characters');
					return false;
				}
				 
				else if(mobile.trim().length<10){
					
					alert('Mobile number must be 10 digits');
					return false;
				}
				
				else if(repassword.length<6){
					
					alert('Repeat Password must be atleast of 6 characters');
					return false;
				}
				
				else if(password!=repassword){
					
					alert('Passwords entered by you do not match');
					return false;
				}
				
				
				
					
				else{
					return true;
				}
	
}
	
	
</script>

<script>
$(document).ready(function() {
	$('#username').blur(function(){
			//run the character number check
			
				check_availability();
			
		});
  });
//function to check username availability
function check_availability(){
		//get the username
		var username = $('#username').val();
		//use ajax to run the check
		$.get("checkUser.dpl", { username: username },
			function(result){
				//if the result is 1
				if(result>0){
					
					alert("User Id Already taken. Please enter some other User Id");
					document.getElementById("username").value="";
					document.getElementById("username").focus();
					//$('#user_availability_result').html("User Id already taken..");
					//document.getElementById("username").focus();
				}
		});
}
</script>
</head>


<body>

<div align="center"><img src="images/logo_dpl.jpg" /></div><br>
<div class="container">
			<!-- freshdesignweb top bar -->
            
			<header>
				<h1><span>User Registration For Electricity Bill Payment</span> </h1>
				<h3><span><font color="red">All Fields Are Mandatory</font></span></h3>
            </header>       
      <div  class="form">
    		<form id="contactform" action="RegistrationHandler.dpl" onSubmit="return checkRegistration()" method="POST"> 
    		
    		    <input id="con_no" name="con_no" value="${sessionScope.con_no}"  type="hidden" > 
    			<p class="contact"><label for="name">Name</label></p>
    			<input id="name" name="name" value="${requestScope.user_name}"  type="text" readonly> 
    			<p class="contact"><label for="email">Email</label></p> 
    			<input id="email" name="email" value="${requestScope.email}" type="text" > 
                <p class="contact"><label for="username">Create a username( <font color="red">Atleast of 4 characters</font> )</label></p> 
    			<input id="username" name="username" placeholder="username"  type="text"> 
    			<div id="user_availability_result"></div>
    			<p class="contact"><label for="password">Create a password( <font color="red">Atleast of 6 characters</font> )</label></p> 
    			<input type="password" id="password" name="password" > 
                <p class="contact"><label for="repassword">Confirm your password</label></p> 
    			<input type="password" id="repassword" name="repassword" > 
        
                
                     
            <p class="contact"><label for="phone">Mobile No</label></p> 
            <input id="phone" name="phone" value="${requestScope.mobile}" required="" type="text"> <br>
            <input class="buttom" name="submit" id="submit" value="Sign me up!" type="submit"> 	 
   </form>
   <br><br>
   <div align="center">
<%@ include file = "footer.jsp" %>
</div>     
</div> 
</div>      
</div>

</body>
</html>
