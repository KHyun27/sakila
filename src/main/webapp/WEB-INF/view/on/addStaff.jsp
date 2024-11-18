<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	
	<script>
		$(document).ready(function() { // <body> 까지 메모리에 로드 후 진행
			// 주소 검색 버튼
			$('#btnAddress').click(function() {
				if($('#searchAddress').val() == '') {
					alert('주소 검색어를 입력하세요');
				} else {
					$('#formAddress').submit();
				}
			});
			
			// 주소 선택 버튼
			$('#btnAddrSel').click(function() {
				console.log($('#resultAddress').val());
				if($('#resultAddress').val() == null || $('#resultAddress').val() == '') {
					alert('주소 선택을 먼저 하세요');
				} else {
					$('#addressId').val($('#resultAddress').val());	
				}
			});
			
			// 스태프 추가 submit 버튼
			$('#btnAddStaff').click(function() {
				// email 정규표현식 
				
				// 입력폼 유효성 검사
				if($('#firstName').val() == null || $('#firstName').val() == '') {
					alert('First Name을 입력하세요');
				} else if($.isNumeric($('#firstName').val())) {
					alert('First Name은 글자만 입력 가능합니다');
				} else if($('#lastName').val() == null || $('#lastName').val() == '') {
					alert('Last Name을 입력하세요');
				} else if($.isNumeric($('#lastName').val())) {
					alert('Last Name은 글자만 입력 가능합니다');
				} else if($('#addressId').val() == null || $('#addressId').val() == '') {
					alert('address ID를 입력하세요');
				} else if($('#email').val() == null || $('#email').val() == '') {
					alert('Email을 입력하세요');
				} else if($('#storeId').val() == null || $('#storeId').val() == '') {
					alert('store ID를 입력하세요');
				} else if($('#username').val() == null || $('#username').val() == '') {
					alert('Username을 입력하세요');
				} else {
					// console.log($('#storeId').val());
					// console.log('submit...');
					$('#addForm').submit();					
				}
			});
			
		});
	</script>
	<style>
		.add {
			margin-top: 50px;
			margin-left: 50px;
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
	<title>addStaff</title>
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
			<div class="add">
				<!-- main -->
				<table class="table table-success text-center" style="width:600px; border-radius: 10px; overflow: hidden; border-bottom-style: hidden;">
					<tr>
						<th style="font-size: medium; padding-left: 0px;" class="text-center">Staff Add</th>
					</tr>
				</table>
				
				<hr style="width:600px;">
				<h5 style="color: #24468A;">Search Address</h5>
				
				<form id="formAddress" method="get" action="${pageContext.request.contextPath}/on/addStaff">
					<input id="searchAddress" type="text" name="searchAddress" placeholder="Search Address ..." >
					<button id="btnAddress" type="button" class="btn btn-sm btn-outline-success">Search</button>
				</form>
				<div style="margin-top: 5px;">
					<c:if test="${empty addressList}">
						<br>
					</c:if>
					<c:if test="${not empty addressList}"> 
						<select id="resultAddress" size="7">
							<c:forEach var="a" items="${addressList}">
								<option value="${a.addressId}">[${a.addressId}] ${a.address}</option>
							</c:forEach>
						</select>
						<div style="margin-top: 5px;">
							<button id="btnAddrSel" type="button" class="btn btn-sm btn-outline-primary">Select</button>
						</div>
					</c:if>
				</div>
				<hr style="width:600px;">
				<form id="addForm" method="post" action="${pageContext.request.contextPath}/on/addStaff">
					<table class="table" style="width:600px; border-radius: 10px; overflow: hidden;">
						<tr>
							<th class="table-success text-center" colspan="2" style="padding-left: 0px;">Insert Staff Info</th>
						</tr>
						<tr>
							<th>First Name</th>
							<td>
								<input id="firstName" type="text" name="firstName" placeholder="Enter Fisrt Name">
							</td>
						</tr>
						<tr>
							<th>Last Name</th>
							<td>
								<input id="lastName" type="text" name="lastName" placeholder="Enter Last Name">
							</td>
						</tr>
						<tr>
							<th>Address ID</th>
							<td>
								<input id="addressId" type="text" name="addressId" readonly placeholder="Select Address ID">
							</td>
						</tr>
						<tr>
							<th>Email</th>
							<td>
								<input id="email" type="text" name="email" placeholder="Enter Email">
							</td>
						</tr>
						<tr>
							<th>Store ID</th>
							<td>
								<select id="storeId" name="storeId">
									<option value="" style="text-align: center;">- Select Store -</option>
									<c:forEach var="s" items="${storeList}">
										<option value="${s.storeId}">[${s.storeId}] ${s.address}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th>Username</th>
							<td>
								<input id="username" type="text" name="username" placeholder="Enter Username">
							</td>
						</tr>
					</table>
					<div class="d-flex justify-content-end" style="width: 600px;">
						<button id="btnAddStaff" type="button" class="btn btn-sm btn-outline-primary">Add Staff</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>