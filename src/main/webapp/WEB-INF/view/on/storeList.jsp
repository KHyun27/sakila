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
			$('#inventoryListGrantIsNone').click(function(){
				alert('Inventory List 권한이 없습니다.')
			})
			
			$('#inventoryAddGrantIsNone').click(function(){
				alert('Inventory Add 권한이 없습니다.')
			})
		});
	</script>
	<style>
		.main {
			margin-top: 50px;
			margin-left: 50px;
		}
		.remove-link {
        	color: red;
        	text-decoration: none;
        }
        
        .remove-link:hover {
            color: #002266;
            text-decoration: none;
        }
        
        .remove-link:visited {
        	color: red;
        	text-decoration: none;
        }
	</style>
	<meta charset="UTF-8">
	<title>Store List</title>
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
				<table class="table table-success text-center" style="width:1400px; border-radius: 10px; overflow: hidden; border-bottom-style: hidden;">
					<tr>
						<th style="font-size: large;">Store List</th>
					</tr>
				</table>
				
				<hr style="width: 1400px;">
				
				<table class="table text-center" style="width:1400px; border-radius: 10px; overflow: hidden; border-bottom-style: hidden;">
					<thead class=table-success>
					<tr>
						<th>Store ID</th>
						<th>Inventory</th>
						<th>Inventory</th>
						<th>Store Address</th>
						<th>Postal Code</th>
						<th>Staff ID</th>
						<th>Staff Name</th>
						<th>Phone</th>
						<th>Manager Staff ID</th>
						<th>Last Update</th>
						<th>Remove</th>
					</tr>
					</thead>
					<c:forEach var="s" items="${storeList}">
						<tr>
							<td>${s.storeId}</td>
							<td>
								<c:if test="${loginStaff.staffId == s.staffId}">
									<a href="${pageContext.request.contextPath}/on/inventoryList?storeId=${s.storeId}" class="remove-link text-success">List</a>
								</c:if>
								<c:if test="${!(loginStaff.staffId == s.staffId)}">
									<a href="" class="remove-link text-success" id="inventoryListGrantIsNone">List</a>
								</c:if>
							</td>
							<td>
								<c:if test="${loginStaff.staffId == s.staffId}">
									<a href="${pageContext.request.contextPath}/on/addInventory?storeId=${s.storeId}" class="remove-link text-primary">Add</a>
								</c:if>
								<c:if test="${!(loginStaff.staffId == s.staffId)}">
									<a href="" class="remove-link text-primary" id="inventoryAddGrantIsNone">Add</a>
								</c:if>
							</td>
							<td>${s.address}${s.address2}, ${s.district}, ${s.city}, ${s.country}</td>
							<td>${s.postalCode}</td>
							<td>${s.staffId}</td>
							<td>${s.firstName} ${s.lastName}</td>
							<td>${s.phone}</td>
							<td>${s.managerStaffId}</td>
							<td>${s.lastUpdate}</td>
							<td>
								<a href="" class="remove-link text-danger" style="font-size: small;">Remove</a>
							</td>
						</tr>
					</c:forEach>
				</table>
				<div class="d-flex justify-content-end" style="width: 1400px;">
					<a href="${pageContext.request.contextPath}/on/addStore" class="btn btn-sm btn-outline-primary" style="margin-right: 5px;">Add Store</a>
					<a href="" class="btn btn-sm btn-outline-success">Modify Store</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>