<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="library.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

Welcome to our library!

<div>
<a href="list.jsp">Click here to see the list of books!</a>
</div>

<div>
<b>Tip of the day</b>
</div>
<div id="totd">
</div>


<script>
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			result = JSON.parse(this.responseText);
			document.getElementById("totd").innerHTML = result.tip_of_the_day;
		}
	};
	xhttp.open("GET", "tipoftheday.jsp", true);
	xhttp.send();
</script>



</body>
</html>