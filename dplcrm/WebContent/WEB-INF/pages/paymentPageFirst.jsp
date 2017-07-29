<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
	<script src="https://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>	
<head>
<title>Payment Page</title>
<style>
table {
    border-collapse: collapse;
}
</style>
<script type="text/javascript">
function pay(){
	var MyRows = $('table#tab').find('tbody').find('tr');
	var j=0;
	for (var i = 0; i < MyRows.length; i++) {
	var MyIndexValue = $(MyRows[i]).find('td:eq(0)').html();
	j=j+1;
	}
	
	if(j==2){
		
		alert('Dear Customer, please pay the bill with earlier due date of '+$(MyRows[0]).find('td:eq(4)').html()+' before the bill with later due date of '+$(MyRows[1]).find('td:eq(4)').html());
		//alert($(MyRows[0]).find('td:eq(4)').html());
		//alert($(MyRows[1]).find('td:eq(4)').html());
	}
	}
	

</script>
</head>
<html>
<body onload="pay();">

<div align="center"><img src="images/logo_dpl.jpg" /></div><br><br><br><br><br>
<div align="center"><h3><font color="red">Please note that Double Payment made by customer will not be credited back to Consumer's Bank Account. Kindly check your Bank Account to ensure that Bank Account has not been debited for a particular bill month before initiating payment for the same month.</font></h3><br></div>
<form:form action="" method="POST"  modelAttribute="pr">
<div align="center">
            <table id="tab" class="table table-striped" border="1">
                <thead>
                    <tr>
                        
                        <th>Con No</th>
                        <th>Con Name</th>
                        <th>Bill Month</th>
                        <th>Bill Amount</th>
                        <th>Due Date</th>
                        <th>Rebate</th>
                        <th>Pay Option<th>
                    </tr>
                </thead>
                <tbody>
                
                    <c:forEach var="user" items="${pr}">
                    
                 
                        <tr>
                            
                            <td>${user.conNo}</td>
                            <td>${user.consumer_name}</td>
                            <td>${user.billMonthWord}</td>
                            <td>Rs. ${user.billAmount}</td>
                            <td>${user.dueDate}</td>
                            <td>${user.rebate}</td>
                            <td><a href="PayBillHandler.dpl?token=${user.conNo}|${user.billMonth}|${user.rebate}|${user.billAmount}">Pay This Bill</a></td>    
						    
						    
                            
                            
                        </tr>
                    </c:forEach>
                </tbody>
            </table>  
  </div>                    
  </form:form>
  <br><br><br><br>
  <div align="center">
<%@ include file = "footer.jsp" %>
</div>
            
   </body>
   </html>