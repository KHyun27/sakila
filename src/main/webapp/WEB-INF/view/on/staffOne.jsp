<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	
	<style>
		.info {
			margin-top: 50px;
			margin-left: 50px;
		}
		
		.modify-link a {
       		color: DodgerBlue;
        	text-decoration: none;
        }
        
        .modify-link a:hover {
            color: #002266;
        }
        .modify-link a:visited {
      		color: #DodgerBlue;
      		text-decoration: none;
    	}
		.modify-cell	 {
        display: flex;
        justify-content: space-between;
        align-items: center;
	    }
	    
	    .table th {
	    padding-left: 50px;
        text-align: left;
    	}
    	.table td {
    	padding-left: 90px;
        text-align: left;
    	}
	</style>
	
	<meta charset="UTF-8">
	<title>Staff One</title>
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
			<div class="info">
				<!-- main -->
				<table class="table space-text" style="width:800px; border-radius: 10px; overflow: hidden;">
					<tr>
						<th class="table-success text-center" colspan="2">Staff Info</th>
					</tr>
					<tr>
						<th class="spaced-text">Staff Id</th>
						<td>${staff.staffId}</td>
					</tr>
					<tr>
						<th>First Name</th>
						<td>${staff.firstName}</td>
					</tr>
					<tr>
						<th>Last Name</th>
						<td>${staff.lastName}</td>
					</tr>
					<tr>
						<th>Staff Email</th>
						<td class="modify-cell modify-link">
						${staff.staffEmail}
						<a href="" style="margin-right: 20px;">수정</a>
						</td>
					</tr>
					<tr>
						<th>Staff PostalCode</th>
						<td>${staff.staffPostalCode}</td>
					</tr>
					<tr>
						<th>Staff Address</th>
						<td class="modify-cell modify-link">
							${staff.staffAddress}${staff.staffAddress2}, ${staff.staffDistrict}, ${staff.staffCity}, ${staff.staffCountry}
							<a href="" style="margin-right: 20px;">수정</a>
						</td>
					</tr>
					<tr>
						<th>Staff Phone</th>
						<td>${staff.staffPhone}</td>
					</tr>
				</table>
				
				<div style="width: 800px; display: flex; justify-content: flex-end;" class="modify-link">
				    <a href="" style="margin-right: 20px;">Password 수정</a>
				</div>
				<hr style="width: 800px;">
				
				<table class="table" style="width:800px; border-radius: 10px; overflow: hidden;">
					<tr>
						<th class="table-success text-center" colspan="2">Store Info</th>
					</tr>
					<tr>
						<th>Store Id</th>
						<td class="modify-cell modify-link">
							${staff.storeId}
							<a href="" style="margin-right: 20px;">수정</a>
						</td>
					</tr>
					<tr>
						<th>Manager Staff Id</th>
						<td>${staff.managerStaffId}</td>
					</tr>
					<tr>
						<th>Manager Name</th>
						<td>${staff.managerName}</td>
					</tr>
					<tr>
						<th>Store PostalCode</th>
						<td>${staff.storePostCode}</td>
					</tr>
					<tr>
						<th>Store Address</th>
						<td>${staff.storeAddress}${staff.storeAddress2}, ${staff.storeDistrict}, ${staff.storeCity}, ${staff.storeCountry}</td>
					</tr>
					<tr>
						<th>Store Phone</th>
						<td>${staff.storePhone}</td>
					</tr>
				</table>
				
			</div>
		</div>
	</div>
</body>
</html>