<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>
    <!-- INCLUDING ALL JS CSS FILE HERE -->
    <%@include file="all_js_css.jsp" %>

</head>
<body>                                         
                                            <!-- TO INCLUDE navbar.jsp FILE  BY SCRIPTED TAG-->
    <div class="container-fluid p-0 m-0">    <!-- container-fluid to maximize it  and p-0 for padding-0 and m-0 for margin- 0-->
    	<%@include file="navbar.jsp" %>
    	<br>
    	<h1> Please fill your note detail</h1>
    	<br>
        <!-- Servlet savenoteservlet will call on submission of this form and will call it's post method -->
    	<form action="SaveNoteServlet" method="post">
		  <div class="form-group">
		    <label for="title">Note title</label>
		    <input 
		    	name="title"
		    	required 
		    	type="text" 
		    	class="form-control" 
		    	id="title" 
		    	aria-describedby="emailHelp" 
		    	placeholder="Enter here"/>
		    <!--for message <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
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
		    </textarea>
		    <!-- form control class use to fix text area -->
		  </div>
		  <div class="container text-center">
		 	 <button type="submit" class="btn btn-primary">Add</button>
		  </div>
	 </form>
    </div>
    
    <!-- Form to get data from user e.i title<text> and content<textArea> -->
 </body>
</html>