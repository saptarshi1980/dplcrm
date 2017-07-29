<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <script language="Javascript">window.history.forward(1);</script> -->
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Month Selection</title>

<!-- <script language="javascript">
document.onmousedown=disableclick;
status="Right Click Disabled";
Function disableclick(event)
{
  if(event.button==2)
   {
     alert(status);
     return false;    
   }
}
</script> -->
</style>

</head>
<body>


<table width="1068" height="98" border="0" align="center">
  <tr>
    <td width="187" rowspan="2"><div align="center"><img src="images/logo_dpl.jpg" alt="logo" /></div></td>
   
    <a href="home.dpl?con_no=${sessionScope.con_no}">Home</a> 
   
    <p>&nbsp;</p></td>
   
	
  </tr>
</table>
<br><br>

<div align="center">
  <table width="364" height="262" border="1" bordercolor="#990066">
    <tr>
      <td height="41" bordercolor="#996633" bgcolor="#CCCC66"><div align="center"><span class="style9">Please select Bill Period</span> </div></td>
    </tr>
    <tr>
      <td width="354" height="213" bordercolor="#996633" bgcolor="#CCCC99"><form name="form1" method="get" action="billPrint.dpl">
        <p align="center"><strong>Bill Period Selection </strong>
          <select id="billmonth" name="billmonth">
            <c:forEach items="${billMonth}" var="billMonth">
              <option value="${billMonth}"> ${billMonth} </option>
            </c:forEach>
            
          </select>
         
           
          <br>
          <br>
          <br><label>
            <input type="submit" name="Submit" value="Generate Bill">
            </label>
          <br>
          <br>
          <br>
          
          
           
        </form>      </td>
    </tr>
  </table>
</div><br><br>
<div align="center">
<%@ include file = "footer.jsp" %>
</div>
</body>
</body>
</html>