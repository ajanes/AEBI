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
	Book b = new Book();
	b.title = request.getParameter("title");
	b.author_first_name = request.getParameter("author_first_name");
	b.author_last_name = request.getParameter("author_last_name");
	b.year = Integer.parseInt(request.getParameter("year"));
	int id = Integer.parseInt(request.getParameter("id"));
	
	boolean isAdd = (id==0);
	
	Library l = new Library();
	if (isAdd) {
		l.addBook(b);
	} else {
		l.updateBook(id, b);
	}

%>

The book was successfully saved!

<a href="list.jsp">Go back</a>
</body>
</html>