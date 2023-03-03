<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="org.hibernate.Session"%>
<%@ page import="com.helper.FactoryProvider"%>
<%@ page import="com.entities.Note"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show note</title>
<!-- INCLUDING ALL JS CSS FILE HERE -->
    <%@include file="all_js_css.jsp" %>
</head>
<body>
	<div class="container-fluid p-0 m-0">    <!-- container-fluid to maximize it  and p-0 for padding-0 and m-0 for margin- 0-->
    	<%@include file="navbar.jsp" %>
    	<br>
    	<h1> Searched Note: </h1>
    	
</body>
</html>