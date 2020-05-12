<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <tr>
            <td>1</td>
            <td>Title 1</td>
            <td>Author 1</td>
            <td><a href="#">Edit</a> | <a href="#">Delete</a></td>
        </tr>
        <tr>
            <td>2</td>
            <td>Title 2</td>
            <td>Author 2</td>
            <td><a href="#">Edit</a> | <a href="#">Delete</a></td>
        </tr>
    </table>
</body>

</html>