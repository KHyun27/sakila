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
		.customer-link {
        	color: black;
        	text-decoration: none;
        }
        
        .customer-link:hover {
            color: #002266;
            text-decoration: none;
        }
        
        .customer-link:visited {
        	color: black;
        	text-decoration: none;
        }
        
        .my-table th {
	    	padding-left: 100px;
        	text-align: left;
        	width: 300px;
    	}
    	.my-table td {
    		padding-right: 40px;
        	text-align: left;
        	width: 600px;
    	}
	</style>
	<meta charset="UTF-8">
	<title>customerOne</title>
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
				<div>	
					<table class="my-table table text-center" style="width: 1000px; border-radius: 10px; overflow: hidden; margin-right: 30px;">
					    <tr>
					        <th class="table-success text-center" colspan="2" style="padding-left: 0px">Customer Info</th>
					    </tr>
					    <!-- 고객 개인 정보 -->
					    <tr>
					    	<th>Customer ID</th>
					        <td>${customer.customerId}</td>
					    </tr>
					    <tr>
					    	<th>Store</th>
					        <td><span style="color :blue;">[${customer.storeId}]</span>&nbsp;&nbsp;${customer.storeAddress}</td>
					    </tr>
					    <tr>
					    	<th>First Name</th>
					    	<td>${customer.firstName}</td>
					    </tr>
					    <tr>
					    	<th>Last Name</th>
					    	<td>${customer.lastName}</td>
					    </tr>
					    <tr>
					    	<th>Email</th>
					    	<td>${customer.email}</td>
					    </tr>
					    <tr>
					    	<th>Address</th>
					    	<td>${customer.address}${customer.address2}, ${customer.district}, ${customer.city}, ${customer.country}</td>
					    </tr>
					    <tr>
					    	<th>Postal Code</th>
					    	<td>${customer.postalCode}</td>
					    </tr>
					    <tr>
					    	<th>Phone</th>
					    	<td>${customer.phone}</td>
					    </tr>
					    <tr>
					    	<th>Active</th>
					    	<td>
								<c:if test="${customer.active}">
									<span class="text-primary">활성화</span>
								</c:if>
								<c:if test="${!customer.active}">
									<span class="text-danger">비활성화</span>
								</c:if>
					    	</td>
					    </tr>
					    <tr>
					    	<th>Create Date</th>
					    	<td>${customer.createDate}</td>
					    </tr>
					    <tr>
					    	<th>Late Update</th>
					    	<td>${customer.lastUpdate}</td>
					    </tr>
					</table>
				</div>
				<div class="d-flex justify-content-end" style="width: 1000px;">
					<a href="${pageContext.request.contextPath}/on/customerList" class="btn btn-sm btn-outline-primary" style="margin-right: 5px;">Customer List</a>
					<a href="${pageContext.request.contextPath}/on/modifyCustomer?customerId=${customer.customerId}" class="btn btn-sm btn-outline-success" style="margin-right: 5px;">Modify</a>
					<a href="${pageContext.request.contextPath}/on/removeCustomer?customerId=${customer.customerId}" class="btn btn-sm btn-outline-danger" >Remove</a>
				</div>
				
				<br>
				<!-- 고객 렌탈 리스트 정보 -->
				<div>
					<table class="table table-sm text-center" style="width:1000px; border-radius: 10px; overflow: hidden; margin-right: 30px;">
					    <tr>
					        <th class="table-success text-center" colspan="5" style="padding-left: 0px">Customer Rental</th>
					    </tr>
					    <tr>
					    	<th>Inventory ID</th>
					    	<th>Film</th>
					    	<th>Rental Date</th>
					    	<th>Return Date</th>
					    	<th>Staff</th>
					    </tr>
					    <c:forEach var="r" items="${rentalList}">
					    	<tr>
				    			<td>${r.inventoryId}</td>
				    			<td>
				    				<a href="${pageContext.request.contextPath}/on/filmOne?filmId=${r.filmId}" class="customer-link">
				    					[${r.filmId}] ${r.title}
				    				</a> 
				    			</td>
				    			<td>${r.rentalDate}</td>
				    			<td>${r.returnDate}</td>
				    			<td>${r.username}</td>
					    	</tr>
					    </c:forEach>
					</table>
				</div>
				<div class="d-flex justify-content-end" style="width: 1000px;">
					<a href="${pageContext.request.contextPath}/on/inventoryList?storeId=${customer.storeId}" class="btn btn-sm btn-outline-primary" style="margin-right: 5px;">Inventory List</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>