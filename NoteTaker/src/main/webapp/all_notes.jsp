<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.hibernate.Session"%>
<%@ page import="com.helper.FactoryProvider"%>
<%@ page import="org.hibernate.Query"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entities.Note"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Notes</title>
<!-- INCLUDING ALL JS CSS FILE HERE -->
    <%@include file="all_js_css.jsp" %>

</head>
<body>
  <div class="container-fluid p-0 m-0">    <!-- container-fluid to maximize it  and p-0 for padding-0 and m-0 for margin- 0-->
    	<%@include file="navbar.jsp" %>
    	<br>
    	<h1> All Notes: </h1>
    	<br>
    	<div class="row">
    	
    	<div class="col-12">
    				<%
			    		Session s = FactoryProvider.getFactory().openSession();
					  //this query will be same as select*from Note entity
					    Query q = s.createQuery("from Note");
					    List<Note> list = q.list();      //list of all notes's row
					    for(Note note:list)
					    {
					  %>               <!-- closing scriptlet tag here so that we can write html now -->
					  
					  <!-- HERE WE CAN ADD HTML B/W TWO JAVA CODES  -->
					  
					  	<div class="card mt-3">
					  	  <p class="text-primary">Last modified: <%=note.getAddedDate()%></p>
						  <img class="card-img-top m-4" style="max-width:100px;" src="img/note.png" alt="Card image cap">
						  <div class="card-body">
						    <h5 class="card-title"><%=note.getTitle() %></h5>   <!-- HERE WE ARE USING EXPRETION TAG TO PRINT DATA FROM JAVA CODE -->
						    <p class="card-text"><%=note.getContent() %></p>
						    <div class = "container text-center">
						    	<a href="edit.jsp?note_id=<%=note.getId() %>" class="btn btn-primary">Update</a>
						    	
						    	<!-- here we are calling deletesServlet and passing note's id with it as url rewriting And it is calling deletServlet's get method -->
						   		<a href="DeleteServlet?note_id=<%=note.getId() %>" class="btn btn-danger">Delete</a>
						    </div>
						  </div>
						</div>
					  
					  <%
					    	//TO PRINT ON BROWSER ; out.println(note.getId()+": "+note.getTitle()+"<br>");
					    }
					    s.close();
			    	%>
    	</div>
    	
    	</div>
    	<!-- scriptlet tag is used to fetch data  -->
    	
  </div>
</body>
</html>