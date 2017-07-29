<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Tariff File Upload Form</title>
<style>
	body {font-family: "Trebuchet MS";}
	h1 {font-size: 1.5em;}
</style>


<script 
src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>

<script>
$(document).ready(function() {

	$('#addFile').click(function() {
		//var fileIndex = $('#fileTable tr').children().length - 1;
		var fileIndex = $('#fileTable tr').children().length;
		$('#fileTable').append(
				'<tr><td>'+
				'	<input type="file" name="files['+ fileIndex +']" />'+
				'</td></tr>');
	});
	
});
</script>

<script type="text/javascript">
function checkFile(){
	
	var nme = document.getElementById("uploadFile");
	if(nme.value.length < 1) {
	    alert('A File Must be selected');
	    nme.focus();
	    return false;
	}
	
	
	
	
}
</script>
</head>
<body>

<div align="center"><img src="images/logo_blue.jpg" /></div><br><br><br><br><br>
<h1>Tariff File Upload</h1>

<form:form method="post" action="uploadMultipleTariffFile.dpl" 
		modelAttribute="uploadForm" enctype="multipart/form-data" onsubmit="return checkFile()">

	<p>Select files to upload. Press Add button to add more file inputs.</p>
    <input type="hidden" name="title" value="<c:out value="${title}" />" />
    <input type="hidden" name="description" value="<c:out value="${description}" />" />
    
	<table id="fileTable">
		<tr>
			<td><input name="files[0]" type="file" />&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input id="addFile" type="button" value="Add File" /></td>
		</tr>
		<!-- <tr>
			<td><input name="files[1]" type="file" /></td>
		</tr> -->
	</table>
	
	<br>
	<br>
	Viewable <input type="checkbox" id="select" name="select" value="Viewable?"> 
	<br/><input type="submit" value="Upload" /> <br>
	<br>
	
</form:form>
</body>
</html>
