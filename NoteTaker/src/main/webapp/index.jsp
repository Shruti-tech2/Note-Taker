<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

   <!-- ALL CSS AND SCRIPT FILE ARE IN DIFFER FILE -->
    <title>Note Taker: Home Page</title>
    
    <!-- INCLUDING ALL JS CSS FILE HERE -->
    <%@include file="all_js_css.jsp" %>
  </head>
  <body>                                         
                                            <!-- TO INCLUDE navbar.jsp FILE  BY SCRIPTED TAG-->
    <div class="container-fluid p-0 m-0">    <!-- container-fluid to maximize it  and p-0 for padding-0 and m-0 for margin- 0-->
    	<%@include file="navbar.jsp" %>
    	<br>
    	<div class="card mt-3">
						  <img class="img-fluid mx-auto" style="max-width:300px;" src="img/note.png" alt="Card image cap">
						    <h1 class ="text-primary text-uppercase text-center mt-3">Start writing your notes !</h1>
						    <div class = "container text-center">
						    	<a href="add_notes.jsp" class="btn btn-outline-primary">Start here</a>
						    </div>
						</div>
    </div>
     </body>
</html>