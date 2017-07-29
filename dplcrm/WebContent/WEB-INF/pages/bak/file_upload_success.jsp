<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>File Upload Successful</title>
<style>
body { font-family: "Trebuchet MS"; }
h1 { font-size: 1.5em; }
</style>
</head>
<body>

<div align="center"><img src="images/logo_blue.jpg" /></div><br><br><br><br><br>
	<h1>Files uploaded successfully:</h1>
	
	<ol>
		<c:forEach items="${files}" var="file">
			<li>${file}</li>
		</c:forEach>
	</ol>
	
	<br><br>
	
	<a href="index.dpl">HOME</a>
</body>
</html>
