<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="library.*" %>
<%@ page import="java.util.ArrayList" %>

<!doctype html>

<html lang="en">

<head>
    <meta charset="utf-8">
    <title>List of books</title>
    <link rel="stylesheet" href="styles.css">
</head>

<body>
    <h1>List</h1>

    <div style="margin-bottom: 10px"><a href="edit.jsp">Add</a></div>

    <table style="width:100%;">
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Author</th>
            <td></td>
        </tr>
        
        <%
	        Library l = new Library();
	        ArrayList<Book> books = l.getBooks();
	        for (int i=0; i<books.size(); i++) {
	        	Book b = books.get(i);
        %>
        
        <tr>
            <td><%=b.id %></td>
            <td><%=b.title %></td>
            <td><%=b.author_first_name + " " + b.author_last_name %></td>
            <td><a href="edit.jsp?id=<%=b.id %>">Edit</a> | <a href="delete.jsp?id=<%=b.id %>">Delete</a></td>
        </tr>
        
        <%
        	}
        %>
    </table>
</body>

</html>