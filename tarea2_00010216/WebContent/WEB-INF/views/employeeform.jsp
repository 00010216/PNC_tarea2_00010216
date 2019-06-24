<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
          <h4 class="mb-3">Employee Form</h4>
          
          <form:form  action = "${pageContext.request.contextPath}/save" method = "POST" modelAttribute = "employeeDTO">
            <form:input type="hidden" path="code" />
            
                <div class="row">
                  <div class="col-md-6 mb-3">
                    <label for="firstName">Name</label>
                    <form:input type="text" class="form-control" id="firstName" path="name"/>
                    <form:errors path="name" cssStyle="color:red;"/> 
                  </div>
                  <div class="col-md-6 mb-3">
                  <label for="firstName">Store</label>
                    <form:select class="custom-select d-block w-100 inputs" path="storeid" > 
                        <form:options items="${store}" itemValue="code" itemLabel="name" id="idstore" />
                    </form:select>
                  </div>
                </div>
                
                <div class="mb-3">
                  <label for="address">Age</label>
                  <form:input type="number" class="form-control" path = "age"/>
                  <form:errors path="age" cssStyle="color:red;"/> 
                </div>
                <div class="mb-3">
                  <label>Gender</label>
                  <form:input type="text" class="form-control" path ="gender" placeholder = "M or F" />
                  <form:errors path="gender" cssStyle="color:red;"/> 
                </div>
                <hr class="mb-4">
                <div class="mb-3">
                	<label>Status</label>
                    <div class="d-block my-2">
                   		
                         <form:radiobutton  name="status" path="status" value="true"/> 
                          <label>Active</label>                         
                         <form:radiobutton name="status" path="status" value="false"/>
                          <label>Inactive</label>   
                    </div>
                </div>
                 <hr class="mb-4">
                <button class="btn btn-primary btn-lg btn-block" type="submit">Save</button>
          </form:form>
        </div>
  </div>

  <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">&copy; 2017-2019 Rústico</p>
    <ul class="list-inline">
      <li class="list-inline-item"><a href="#">Privacy</a></li>
      <li class="list-inline-item"><a href="#">Terms</a></li>
      <li class="list-inline-item"><a href="#">Support</a></li>
    </ul>
  </footer>
</body>
</html>