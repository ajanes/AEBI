<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="library.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	int id = Integer.parseInt(request.getParameter("id"));
	Library l = new Library();
	l.deleteBook(id);
%>

The book was successfully deleted!

<a href="list.jsp">Go back</a>
</body>
</html>