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
	<main role = "main" class = "container">
	<div class = "container">
	<h1>Stores</h1>
		<div class="row justify-content-start mt-4 mb-2">
	    <div class="col">
	      <form class="text-right" action = "${pageContext.request.contextPath}/addStore" method = "POST" >
				<input type = "submit" class="btn btn-primary" value = "Add Store">
			</form>
	    </div>
	  </div>
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
						<div class = "container"></div>
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
						  <label class="btn btn-light">
						    <input type="radio" name="options" onclick="window.location.href='${pageContext.request.contextPath}/stores/profile/${store.code}'"  autocomplete="off" > Profile
						  </label>
						  <label class="btn btn-light">
						    <input type="radio" name="options" onclick="window.location.href='${pageContext.request.contextPath}/stores/edit/${store.code}'" autocomplete="off"> Edit
						  </label>
						  <label class="btn btn-light">
						    <input type="radio" name="options" onclick="window.location.href='${pageContext.request.contextPath}/stores/delete/${store.code}'" autocomplete="off"> Delete
						  </label>
						</div>
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