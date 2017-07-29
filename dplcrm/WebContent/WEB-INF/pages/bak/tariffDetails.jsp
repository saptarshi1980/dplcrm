<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tariff Modification  </title>

<script type="text/javascript">
function check(){
	
	var view=document.getElementById("view").value;
		
	if(!((view == 'Y') || (view == 'N'))){
		
		alert(view+" Invalid input. Enter either Y or N .");
		return false;
		
	}
	
	
	
	
	else{
		return true;
	}
	
	
	
	
}
</script>
</head>
<body>


<div align="center"><img src="images/logo_blue.jpg" /></div><br><br><br><br><br>

*********TARIFF DETAILS********* <BR><BR>
<c:forEach items="${tariffs}" var="tar">     
  Tariff Sr No - <c:out value="${tar.sr_no}"/> <br><br>
  Tariff Title - <c:out value="${tar.title}"/> <br><br>
  Tariff Description-  <c:out value="${tar.description}"/> <br><br>
  Viewable&nbsp ?&nbsp&nbsp << <c:out value="${tar.view_flag}"/> >>
  
  <br><br>


<form name="form1" action="TariffChange.dpl" method="post" onsubmit="return check()">

<input type="hidden" name="sr_no" value="<c:out value="${tar.sr_no}"/>" size="1" id="sr_no">

View Status (Y/N)?&nbsp<input type="text" name="view" id="view" value="<c:out value="${tar.view_flag}"/>" size="1" id="view"><br><br>
 
 <input type="submit" value="Submit" >

</form>
</c:forEach>

</body>
</html>