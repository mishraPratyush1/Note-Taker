<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Notes</title>
<link rel="icon" href="add.png" type="image/icon" sizes="16x16">
<%@include file="allJsCss.jsp"%>
</head>
<body>

	
	<div class="container">
		<%@ include file="Navbar.jsp"%>
		<br>
		<h1 class="text-center text-primary display-4">Please fill your Note Details</h1>

		<br>
		<form action="saveNote" method="post">
			<div class="container">

				<div class="form-group">
					<label for="title">Note Title</label> <input
						type="text" required="required" name="title" class="form-control" id="title"
						aria-describedby="emailHelp" placeholder="Enter id here"> 
				</div>
				<div class="form-group">
					<label for="content">Note content</label> 
					<textarea required="required" name="content" class="form-control" style="height: 130px" id="content" placeholder="enter your content here"></textarea>
				</div>
				
				
			</div>
			<div class="container text-center">
			<button type="submit" class="btn btn-primary ">Add</button>
			</div>
		</form>


	</div>
</body>
</html>