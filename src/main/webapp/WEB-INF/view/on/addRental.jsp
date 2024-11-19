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
			
			// searchName
			$('#btnSearchName').click(function(){
				if($('#searchName').val() == null || $('#searchName').val() == '') {
					alert('Search Name을 입력하세요');
				} else {
					$('#formSearchName').submit();
				}
			});
			
			// addRental
			$('#btnAddRental').click(function(){
				if($('#customerId').val() == null) {
					alert('Customer ID를 선택하세요');
				} else if($('#rentalDate').val() == '') {
					alert('Rental Date를 선택하세요');
				} else {
					$('#formAddRental').submit();
				}
			})
			
			
			
		});
	</script>
	<style>
		.main {
			margin-top: 50px;
			margin-left: 50px;
		}
		
		.table th {
	    padding-left: 40px;
        text-align: left;
        vertical-align: middle;
    	}
    	.table td {
    	padding-right: 20px;
        text-align: right;
        vertical-align: middle;
    	}
	</style>
	<meta charset="UTF-8">
	<title>addRental</title>
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
				<div style="width: 800px;">
					<form id="formSearchName" method="get" action="${pageContext.request.contextPath}/on/addRental">
						<table class="table" style="width: 800px; border-radius: 10px; overflow: hidden; margin-right: 30px;">
							<tr>
						        <th class="table-success text-center" colspan="2" style="padding-left: 0px;">Search Customer</th>
						    </tr>
						    <tr>
						    	<th>SearchName</th>
						    	<td style="padding-right: 15px;">
						    		<input type="hidden" name="inventoryId" value="${inventoryId}">
						    		<input type="text" name="searchName" id="searchName">
						    		<button class="btn btn-sm btn-outline-success">Search</button>
						    	</td>
						    </tr>
						</table>
					</form>
				</div>
				
				<hr style="width: 800px;">
				
				<div style="width: 800px;">
					<form id="formAddRental" method="post" action="${pageContext.request.contextPath}/on/addRental">
						<table class="table" style="width: 800px; border-radius: 10px; overflow: hidden; margin-right: 30px;">
							<tr>
						        <th class="table-success text-center" colspan="2" style="padding-left: 0px">Add Rental</th>
						    </tr>
						    <tr>
						    	<th>Customer ID</th>
								<td>
									<select name="customerId" id="customerId" size="1">
										<c:forEach var="c" items="${customerList}">
											<option value="${c.customerId}">
												[${c.firstName} ${c.lastName}] / ${c.email}
											</option>
										</c:forEach>
									</select>
								</td>
						    </tr>
						    <tr>
						    	<th>Inventory ID</th>
								<td>
									<input type="hidden" name="inventoryId" id="inventoryId" value="${inventoryId}" readonly>
									${inventoryId}
								</td>
						    </tr>
						    <tr>
						    	<th>Film</th>
						    	<td>
						    		[${rentalFilm.filmId}] ${rentalFilm.title}
						    	</td>
						    </tr>
						     <tr>
						    	<th>Staff</th>
								<td>
									<input type="hidden" name="staffId" id="staffId" value="${loginStaff.staffId}" readonly">
									${loginStaff.username}
								</td>
						    </tr>
						    <tr>
						    	<th>Rental Date</th>
								<td>
									<input type="date" name="rentalDate" id="rentalDate">
								</td>
						    </tr>
						</table>
						<div class="d-flex justify-content-end">
							<button id="btnAddRental" type="button" class="btn btn-sm btn-outline-primary" style="margin-right: 5px;">Rental</button>
							<a href="" class="btn btn-sm btn-outline-danger">Cancel</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>