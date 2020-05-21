<%@ page language="java" contentType="text/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="library.*" %>
<%
	String result = "{ \"tip_of_the_day\": \"" + TipOfTheDay.getTip() + "\"}";
	out.write(result);
%>
