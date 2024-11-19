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
		
		.table th {
        text-align: center;
        vertical-align: middle;
    	}
    	.table td {
        text-align: center;
        vertical-align: middle;
        height: 47px;
    	}
    	
		.iv-link {
        	color: black;
        	text-decoration: none;
        }
        
        .iv-link:hover {
            color: #002266;
            text-decoration: none;
        }
        
        .iv-link:visited {
        	color: black;
        	text-decoration: none;
        }
		
		.pagination {
		  display: flex;
  		  justify-content: center;
		}
		
		.pagination a {
		  color: #008000;
		  float: left;
		  padding: 6px 12px;
		  text-decoration: none;
		  border: 1px solid #ddd;
		}
		
		.pagination a.active {
		  background-color: #28a745;
		  color: white;
		  border: 1px solid #28a745;
		}
		
		.pagination a:hover:not(.active) {background-color: #ddd;}
		
		.pagination a:first-child {
		  border-top-left-radius: 5px;
		  border-bottom-left-radius: 5px;
		}
		
		.pagination a:last-child {
		  border-top-right-radius: 5px;
		  border-bottom-right-radius: 5px;
		}
	</style>
	<meta charset="UTF-8">
	<title>Inventory List</title>
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
				<table class="table table-success text-center" style="width:1300px; border-radius: 10px; overflow: hidden; border-bottom-style: hidden;">
					<tr>
						<th style="font-size: large;">Store [${storeId}] : Inventory List</th>
					</tr>
				</table>
				
				<hr style="width: 1300px;">
				
				<table class="table text-center" style="width:1300px; border-radius: 10px; overflow: hidden; border-bottom-style: hidden;">
					<thead class=table-success>
						<tr>
						<th>Inventory ID</th>
						<th>[ID] Title</th>
						<th>Rental</th>
						<th>Customer Rental</th>
						<th>Last Update</th>
						<th>Remove</th>
					</tr>
					</thead>
					<c:forEach var="iv" items="${inventoryList}">
						<tr>
							<td>${iv.inventoryId}</td>
							<td>	
								<a href="${pageContext.request.contextPath}/on/filmOne?filmId=${iv.filmId}" class="iv-link">
									[${iv.filmId}] ${iv.title}
								</a>
							</td>
							<td>${iv.rentalDate}</td>
							<td><!-- 대여중인 상태면 고객ID, 대여 가능이면 addRental링크 -->
								<c:if test="${iv.customerId != null }">
									<a href="${pageContext.request.contextPath}/on/customerOne?customerId=${iv.customerId}" class="iv-link" style="color: #002266;">${iv.customerId}</a>
								</c:if>
								<c:if test="${iv.customerId == null }">
									<a href="${pageContext.request.contextPath}/on/addRental?inventoryId=${iv.inventoryId}" class="btn btn-sm btn-outline-primary">
										대여
									</a>
								</c:if>
							</td>
							<td>${iv.lastUpdate}</td>
							<td>
								<a href="${pageContext.request.contextPath}/on/removeInventoryByKey?inventoryId=${iv.inventoryId}&storeId=${storeId}" class="iv-link text-danger" style="font-size: small;">Remove</a>
							</td>
						</tr>
					</c:forEach>
				</table>
				<div class="d-flex justify-content-end" style="width: 1300px;">
					<a href="${pageContext.request.contextPath}/on/storeList" class="btn btn-sm btn-outline-primary" style="margin-right: 5px;">Store List</a>
					<a href="${pageContext.request.contextPath}/on/addInventory?storeId=${storeId}" class="btn btn-sm btn-outline-success">Add Inventory</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>