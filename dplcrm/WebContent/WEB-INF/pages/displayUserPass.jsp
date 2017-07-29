<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Id and Password</title>
</head>
<body>

<div align="center"><img src="images/logo_dpl.jpg" /></div><br><br><br>
<div align="center">
<table border ="2" bgcolor="cyan"> 
<tr><td>User id</td><td>${requestScope.user_id}</td></tr>

<tr><td>Password</td><td>${requestScope.pass}</td></tr>

<tr align="center"><td align="center"><a href="logout.dpl">HOME</a></td></tr>
</table>

</div>


</body>
</html>