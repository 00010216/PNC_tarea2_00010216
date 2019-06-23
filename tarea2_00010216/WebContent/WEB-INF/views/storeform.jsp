<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
 
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    <!-- Custom styles for this template -->
    <link href="form-validation.css" rel="stylesheet">
  </head>
  <body class="bg-light">
    <div class="container">
  <div class="py-4 text-center">
  </div>
    <div class="col-md-8 order-md-1">
      <h4 class="mb-3">Store Form</h4>
      <form:form action = "${pageContext.request.contextPath}/save" method = "POST" modelAttribute = "store">
      <form:input type="hidden" path="code" />
        <div class="row">
          <div class="col-md-6 mb-3">
            <label for="firstName">Store name</label>
            <form:input type="text" class="form-control" id="firstName" path="name"/>
          </div>
          <div class="col-md-6 mb-3">
          </div>
        </div>

        <div class="mb-3">
          <label for="address">Address</label>
          <form:input type="text" class="form-control" id="address" path = "address" placeholder="1234 Main St"/>
        </div>
        <div class="mb-3">
          <label>Opening hours</label>
          <form:input type="text" class="form-control" id="tables" path ="schedule" />
        </div>
        <div class="mb-3">
          <label for="number">Number of Tables</label>
          <form:input type="text" class="form-control" id="tables" path = "numTables"/>
        </div>
        <hr class="mb-4">
          <div class="mb-3">
          <label for="firstName">Manager name</label>
          <form:input type="text" class="form-control" id="manager" path = "manager"/>
        </div>
         <hr class="mb-4">
        <button class="btn btn-primary btn-lg btn-block" type="submit">Save</button>
      </form:form>
    </div>
  </div>

  <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">&copy; 2017-2019 Company Name</p>
    <ul class="list-inline">
      <li class="list-inline-item"><a href="#">Privacy</a></li>
      <li class="list-inline-item"><a href="#">Terms</a></li>
      <li class="list-inline-item"><a href="#">Support</a></li>
    </ul>
  </footer>
</body>
</html>