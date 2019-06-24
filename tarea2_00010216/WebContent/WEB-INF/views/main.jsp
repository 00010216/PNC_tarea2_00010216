<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
</head>
<body class="text-center bg-light">
	
	<!-- se utiliza un form normal pq no se esta ocuapando modelatrribute --> 
    <form class="form-signin" action = "${pageContext.request.contextPath}/login" method = "POST">
		 <h1 class = "mt-4">Rústico</h1>
		  <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
		  
		  <div class= "container col-sm-2 col-md-3 col-lg-4" >
		  
		  <div form = "label-group">
		  <label for="inputEmail" class="sr-only">Username</label>
		  <input type="text" id="inputEmail" class="form-control" name = "username" placeholder="Username" required autofocus>
		  </div>
		  
		   <div form = "label-group">
		  <label for="inputPassword" class="sr-only">Password</label>
		  <input type="password" id="inputPassword" class="form-control" name = "password" placeholder="Password" required>
		  </div>
		  
		  <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
		  <div class="alert alert-danger" role="alert"> ${message}</div>
		  </div>
	</form>
</body>
</html>