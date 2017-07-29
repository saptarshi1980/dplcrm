<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tariff Modification </title>
</head>
<body>
<div align="center"><img src="images/logo_blue.jpg" /></div><br><br><br>
<table border="1" cellspacing="5">
<tr>
        <th>Sr No</th>
        <th>Title</th>
        <th>Description</th>
        <th>Viewable ?</th>
</tr>


<c:forEach items="${tariffs}" var="tar">
<tr>     
  <td><a href="fetchDetails.dpl?sr_no=<c:out value="${tar.sr_no}" />"><c:out value="${tar.sr_no}"/> </a></td>
  <td><c:out value="${tar.title}"/></td>
  <td><c:out value="${tar.description}"/></td>
  <td><c:out value="${tar.view_flag}"/></td>
 </tr> 
</c:forEach>

</table>
</body>
</html>