<%@page import="entities.Note"%>
<%@page import="provider.factoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update</title>
<link rel="icon" href="update.png" type="image/icon" sizes="16x16">
<%@include file="allJsCss.jsp"%>
</head>
<body>
	<div class="container">
		<%@ include file="Navbar.jsp"%>
		<h1 class="display-3 text-uppercase text-center">Edit Notes</h1>
		<br>
		<%
			int id = Integer.parseInt(request.getParameter("id").trim());
			Session s = factoryProvider.getSessionFactory().openSession();
			
			Note note = s.get(Note.class, id);
			s.delete(note);
		%>
		<form action="update" method="post">
		
			<div class="container">
				<input value="<%= note.getId()%>" name="id" type="hidden">
				<div class="form-group">
					<label for="title">Note Title</label> <input
						type="text" required="required" name="title" class="form-control" id="title"
						aria-describedby="emailHelp" placeholder="Enter id here"
						value="<%=note.getTitle() %>"> 
				</div>
				<div class="form-group">
					<label for="content">Note content</label> 
					<textarea required="required" name="content" class="form-control" style="height: 130px" id="content" placeholder="enter your content here"> <%=note.getContent() %></textarea>
				</div>
				
				
			</div>
			<div class="container text-center">
			<button type="submit" class="btn btn-success ">Save</button>
			</div>
		</form>
	</div>
</body>
</html>