
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ALL NOTES</title>
<style>
      
      body{
          background-color: wheat!important;
      }
      
</style>
<link rel="icon" href="img/icon.png" type="image/icon">
<%@include file="all_js_css.jsp"%>
</head>
<body>

	<div class="container p-3">
		<%@include file="navbar.jsp"%>
		<br>
		<h1 align="center" class="text-uppercase">SAVED NOTES</h1>


		<div class="row">

			<div class="col-12">

				<%
					Session s = FactoryProvider.getFactory().openSession();
				Query q = s.createQuery("from Note");
				List<Note> list = q.list();
				
				if(list.isEmpty()) {
					%>
					 
					 <div class="card mt-3" >
					<img class="card-img-top m-4 mx-auto" style="max-width:100px;" src="img/icon.png" alt="Card image cap">
					<div class="card-body px-5">
						<h5 align="center" class="card-title">PLEASE ADD SOME NOTES TO SHOW</h5>
						<div class="container text-center mt-4">
				    	    <a href="add_notes.jsp" class="btn btn-primary">Add Notes</a>
				    	 </div>
						</div>
					</div>
				</div>
	           
	              <%
				}
				else{
					for (Note note : list) {
						%>

						<div class="card mt-3" >
							<img class="card-img-top m-4 mx-auto" style="max-width:100px;" src="img/icon.png" alt="Card image cap">
							<div class="card-body px-5">
								<h5 class="card-title"><%= note.getTitle() %></h5>
								<p class="card-text">
								<%= note.getContent() %>
								</p>
								<p ><b class="text-primary"><%= note.getAddedDate()  %></b></p>
								<div class="container text-center mt-2">
								<a href="DeleteServlet?note_id=<%= note.getId() %>" class="btn btn-danger">Delete</a>
								<a href="edit.jsp?note_id=<%= note.getId() %>" class="btn btn-primary">Update</a>
								</div>
							</div>
						</div>


						<%
							}
				}
				

				s.close();
				%>


			</div>

		</div>


	</div>
</body>
</html>