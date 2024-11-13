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
			$('#btnAddLanguage').click(function(){
				// alert('추가');
				$('#formAddLanguage').submit();
			});o
		});
	</script>
	<style>
		.main {
			margin-top: 50px;
			margin-left: 50px;
		}
	</style>
	<meta charset="UTF-8">
	<title>Add Language</title>
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
				<form id="formAddLanguage" method="post" action="${pageContext.request.contextPath}/on/addLanguage">
					<table class="table text-center" style="width:400px; border-radius: 10px; overflow: hidden;">
						<tr>
							<th class="table-success text-center"colspan="2">Language Add</th>
						</tr>
						<tr>
							<th>Language Name</th>
							<td><input type="text" name="name" id="name"></td>
						</tr>
					</table>
					<div class="d-flex justify-content-end" style="width: 400px">
						<div>
							<button id="btnAddLanguage" type="button" class="btn btn-sm btn-outline-success">Language Add</button>
							<a href="${pageContext.request.contextPath}/on/languageList" class="btn btn-sm btn-outline-danger">Cancel</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>