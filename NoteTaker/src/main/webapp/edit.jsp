<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.hibernate.Session"%>
<%@ page import="com.helper.FactoryProvider"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entities.Note"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Note</title>
<!-- INCLUDING ALL JS CSS FILE HERE -->
    <%@include file="all_js_css.jsp" %>
</head>
<body>
	<div class="container-fluid p-0 m-0">    <!-- container-fluid to maximize it  and p-0 for padding-0 and m-0 for margin- 0-->
    	<%@include file="navbar.jsp" %>
    	<br>
    	<h1> Edit Note: </h1>
    	<%
    		int noteId = Integer.parseInt(request.getParameter("note_id").trim());
    		Session s = FactoryProvider.getFactory().openSession();
    		Note note = (Note)s.get(Note.class,noteId);
    	%>
    	
    	<form action="UpdateServlet" method="post">
		  <div class="form-group">
		    <label for="title">Note title</label>
		    <input 
		    	name="title"
		    	required 
		    	type="text" 
		    	class="form-control" 
		    	id="title" 
		    	aria-describedby="emailHelp" 
		    	placeholder="Enter here"
		    	value="<%=note.getTitle()%>"/>
		   </div>
		  <div class="form-group">
		    <label for="content">Note Content</label>
		    <textarea 
		    	name="content"
		    	required 
		    	id="content" 
		    	placeholder="Enter your content here." 
		    	class="form-control" 
		    	style="height:200px;">
		    	<%=note.getContent() %>
		    </textarea>
		    <!-- form control class use to fix text area -->
		    
		    <!-- pass id to update data in data base -->
		    <input type="hidden" name ="noteId" value="<%=note.getId() %>"/>
		  </div>
		  <div class="container text-center">
		 	 <button type="submit" class="btn btn-success">Update</button>
		  </div>
	 </form>
	 
    	<br>
    </div>
</body>
</html>