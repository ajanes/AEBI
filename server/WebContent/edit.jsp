<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="library.*" %>
<!doctype html>

<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Edit book</title>
    <link rel="stylesheet" href="styles.css">
</head>

<body>
	<%
	boolean isAdd = (request.getParameter("id")==null);
	String welcome = "";
	if (isAdd) 
		welcome = "Please enter the data";
	else
		welcome = "Please edit the data";
	%>
	
	<h1><%=welcome %></h1>
	<form action="save.jsp">
	
	<%
	Book b = new Book();
	
	if (!isAdd) {
		int id = Integer.parseInt(request.getParameter("id"));
		Library l = new Library();
		b = l.getBook(id);
	}
	%>
		
    <table style="width:100%;">
        <tr>
            <td>Title</td>
            <td><input name="title" type="text" style="width: 300px" value="<%=b.title%>"></td>
        </tr>
        <tr>
            <td>First name of the author</td>
            <td><input name="author_first_name" type="text" style="width: 200px" value="<%=b.author_first_name%>"></td>
        </tr>
        <tr>
            <td>Second name of the author</td>
            <td><input name="author_last_name" type="text" style="width: 200px" value="<%=b.author_last_name%>"></td>
        </tr>
        <tr>
            <td>Year</td>
            <td><input name="year" type="text" style="width: 50px" value="<%=b.year%>"></td>
        </tr>
    </table>
    
    <input name="id" type="hidden" style="width: 50px" value="<%=b.id%>">
    
    <div style="margin-top: 10px; text-align: center;">
        <input class="button" type="submit" value="Submit">
        <a class="button" href="list.jsp">Close</a>
    </div>
    
    </form>
</body>

</html>