<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Date"%>
<%@page import="entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.Query"%>
<%@page import="provider.factoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Nodes</title>
<link rel="icon" href="card.png" type="image/icon" sizes="16x16">
<%@include file="allJsCss.jsp"%>

</head>
<body>
	<div class="container">
		<%@ include file="Navbar.jsp"%>
		<br>
		<h1 class="display-3 text-uppercase text-center">All Notes</h1>
		<div class="row">

			<div class="col-12">

				<%
					Session s = factoryProvider.getSessionFactory().openSession();

				Query q = s.createQuery("from Note");
				List<Note> l = q.getResultList();
				for (Note i : l) {
				%>
				<div class="card text-center" >
					<img class="card-img-top pt-1" src="notes.png" style="max-width:100px;margin: 0 auto ">
					<div class="card-body mt-3">
						<h5 class="card-title"><%=i.getTitle().toUpperCase() %></h5>
						<p class="card-text"><%=i.getContent().toUpperCase() %></p>
						<p><%
						
							SimpleDateFormat d = new SimpleDateFormat("dd/mm/yyyy");
							String date = d.format(i.getAddedDate());
							%>
							<%=date %>
						</p>
						<a href="delete?id=<%=i.getId()%>" class="btn btn-danger">Delete</a>
						<a href="update.jsp?id=<%=i.getId()%>" class="btn btn-primary">Update</a>
					</div>
				</div>

				<%
					}

				s.close();
				%>
			</div>

		</div>

	</div>
</body>
</html>