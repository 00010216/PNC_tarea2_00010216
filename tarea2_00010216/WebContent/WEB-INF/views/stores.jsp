<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>${message}</title>
</head>
<body>
	<h1>${message}</h1>
	<main role = "main" class = "container">
		<table class="table table-dark">
  <thead>
    <tr>
			<th scope="col">Store</th>
			<th scope="col">Address</th>
			<th scope="col">Operations</th>
		</tr>
  </thead>
  <tbody>
   	<c:forEach items="${book}" var="book">
				<tr>
					<td>${book.bTitle}</td>
					<td>${book.bAuthor}</td>
					<td>${book.bIsbn}</td>
					<td>${book.bGenre}</td>
					<td>${book.bStock}</td>
				</tr>	
			</c:forEach>
  </tbody>
</table>
</main>
</body>
</html>