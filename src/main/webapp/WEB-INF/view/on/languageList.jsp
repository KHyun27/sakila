<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script>
		$(document).ready(function() {
			
			
		});
	</script>
	<style>
		.main {
			margin-top: 50px;
			margin-left: 50px;
		}
		
		.lanuage-link {
        	color: black;
        	text-decoration: none;
        }
        
        .lanuage-link:hover {
            color: #002266;
            text-decoration: none;
        }
        
        .lanuage-link:visited {
        	color: black;
        	text-decoration: none;
        }
	</style>
	<meta charset="UTF-8">
	<title>Language List</title>
</head>

<body class="container-fluid bg-light p-3">

	<div class="bg-light"><!-- header.jsp -->
		<c:import url="/WEB-INF/view/on/inc/headMenu.jsp"></c:import>
	</div>

	<div class="row">
		<div class="col-sm-2 bg-light">
			<!-- leftMenu.jsp include -->
			<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
		</div>
		<div class="col-sm-10 bg-light">
			<div class="main">
				<!-- main -->
				<table class="table table-success text-center" style="width:500px; border-radius: 10px; overflow: hidden; border-bottom-style: hidden;">
					<tr>
						<th style="font-size: large;">Language List</th>
					</tr>
				</table>
				
				<hr style="width:500px;">
				
				<table class="table text-center" style="width:500px; border-radius: 10px; overflow: hidden;">
					<thead class="table-success">
						<tr>
							<th style="width: 120px;">Language ID</th>
							<th>Name</th>
							<th style="width: 100px;">Remove</th>
						</tr>
					<thead>
					<c:forEach var="la" items="${languageList}"> <!-- filmList -->
						<tr>
							<td>${la.languageId}</td>
							<td>${la.name}</td>
							<td>
								<a href="${pageContext.request.contextPath}/on/removeLanguage?languageId=${la.languageId}" class="lanuage-link text-danger" style="font-size:small;">삭제</a>
							</td>
						</tr>
					</c:forEach>
				</table>
				<div class="d-flex justify-content-end" style="width:500px;">
					<a href="${pageContext.request.contextPath}/on/addLanguage" class="btn btn-sm btn-outline-success">Add Language</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>