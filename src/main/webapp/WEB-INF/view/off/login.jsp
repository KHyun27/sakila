<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>Staff Login</title>
</head>

<body class="container">
	<h1>Staff Login<span>${loginMsg}</span></h1>

	<form method="post" action="${pageContext.request.contextPath}/off/login">
		<div class="mb-3 mt-3">
			<label for="staffId" class="form-label">Staff ID:</label> 
			<input type="text" class="form-control" id="staffId" placeholder="Enter staff ID" name="staffId">
		</div>
		<div class="mb-3">
			<label for="password" class="form-label">Password:</label> 
			<input type="password" class="form-control" id="password" placeholder="Enter password" name="password">
		</div>
		
		<button type="submit" class="btn btn-primary">Login</button>
	</form>
</body>
</html>