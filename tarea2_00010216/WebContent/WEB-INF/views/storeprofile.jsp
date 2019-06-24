<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${store.name}</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
</head>
<body>
  <div class="container mt-4">
       <div class = "row">
    	     	<!-- Inicio de tabla -->
    	<div class = "col">
       		<table class="table table-light">
              <thead>
                <thead class="thead-light">
                <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Age</th>
                        <th scope="col">Gender</th>
                        <th scope="col">Status</th>
                        <th scope="col">Operations</th>
                    </tr>
              </thead>
              <tbody>
                <c:forEach items="${store.employees}" var="employee">
                            <tr>
                                <td>${employee.name}</td>
                                <td>${employee.age}</td>
                                <td>${employee.gender}</td>
                                <td>${employee.status}</td>
                                <td>
                                <div class = "container">
                                <div class = "row">
                                    <div class = "container">
                                    <div class="btn-group btn-group-toggle" data-toggle="buttons">
                                      <label class="btn btn-light">
                                        <input type="radio" name="options" onclick="window.location.href='${pageContext.request.contextPath}/employee/edit/${employee.code}'" autocomplete="off"> Edit
                                      </label>
                                      <label class="btn btn-light">
                                        <input type="radio" name="options" onclick="window.location.href='${pageContext.request.contextPath}/employee/delete/${employee.code}'" autocomplete="off"> Delete
                                      </label>
                                    </div>
                                    </div>
                                </div>
                                </div>
                                </td>
                            </tr>	
                        </c:forEach>
              </tbody>
            </table>
       	</div>
       	<div class = "col-lg-4 col-md-3 col-sm">
	       	<div class="bd-example">
			  <dl>
			    <dt>Name</dt>
			    <dd>${store.name}</dd>
			    <dt>Location</dt>
			    <dd>${store.address}</dd>
			    <dt>Number of tables</dt>
			    <dd>${store.numTables}</dd>
			     <hr class="mb-4">
			    <dt>Manager</dt>
			    <dd>${store.manager}</dd>
			  </dl>
			</div>
         <hr class="mb-4">
         <form class="text-right" action = "${pageContext.request.contextPath}/addEmployee" method = "POST" >
         		<input type="hidden" name="storecode" value="${store.code}"/>
				<input type = "submit" class="btn btn-primary" value = "Add Employee">
			</form>
    	</div>
       	</div>
       </div>
</body>
</html>