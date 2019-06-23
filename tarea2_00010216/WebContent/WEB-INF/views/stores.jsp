<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Stores</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
</head>
<body>
	<h1>Stores</h1>
	<main role = "main" class = "container">
	<div class = "container">
		<table class="table table-light">
  <thead>
    <thead class="thead-light">
    <tr>
			<th scope="col">Name</th>
			<th scope="col">Address</th>
			<th scope="col">Operations</th>
		</tr>
  </thead>
  <tbody>
   	<c:forEach items="${store}" var="store">
				<tr>
					<td>${store.name}</td>
					<td>${store.address}</td>
					<td>
					<div class = "container">
					<div class = "row">
						<div class = "cl-sm-6">
						<!--<form action = "${pageContext.request.contextPath}/store/edit/${store.code}" method = "GET" >
						<input type = "submit"  class="btn btn-primary" value = "Edit">
						</form>-->
						<button class="btn btn-primary" onclick="window.location.href='${pageContext.request.contextPath}/stores/edit/${store.code}'">Edit</button>
						</div>
						<div class = "cl-sm-6">
						<!--<form action = "${pageContext.request.contextPath}/store/delete/${store.code}" method = "GET" >
						<input type = "submit"  class="btn btn-danger"  value = "Delete">
						</form>-->
						<button class="btn btn-danger" onclick="window.location.href='${pageContext.request.contextPath}/stores/delete/${store.code}'">Delete</button>
						</div>
					</div>
					</div></td>
				</tr>	
			</c:forEach>
  </tbody>
</table>
</div>
</main>
</body>
</html>