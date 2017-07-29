<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Warning</title>
<!-- <script type="text/javascript">
    function submit()
    {
        
        document.frm1.submit(); // Submits the form without the button
    }
</script> -->
</head>
<body >
<div align="center"><br><br>
 <img src="images/logo_blue.jpg" alt="" width="325" height="65">
 </div>


<br>
<br><br>
<font color="red" size="+1">
${requestScope.msg}
</font>

<br><br>


<a href="index.dpl">HOME</a> 
</body>
</html>