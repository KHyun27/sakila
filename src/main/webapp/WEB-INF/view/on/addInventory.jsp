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
			
			$('#btnAddInventory').click(function(){
				// console.log($('#filmId').val());
				
				if($('#filmId').val() == null) {
					alert('추가할 Film을 선택하세요');
				} else {
					// console.log($('#filmId').val());
					$('#formAddInventory').submit();
				}
			});


			$('#btnSearchTitle').click(function(){
				if($('#searchTitle').val() == '') {
					alert('Search Title을 입력하세요');
				} else {
					$('#formSearchTitle').submit();
				}
			});
		
		});
	</script>
	<style>
		.main {
			margin-top: 50px;
			margin-left: 50px;
		}
	</style>
	<meta charset="UTF-8">
	<title>Add Inventory</title>
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
				<div style="width: 500px;">
					<table class="table text-center" style="width:500px; border-radius: 10px; overflow: hidden; border-bottom-style: hidden;">
						<tr>
							<th class="table-success text-center"colspan="2">Search Film</th>
						</tr>
					</table>
					<div class="d-flex justify-content-end">
						<form id="formSearchTitle" method="get" action="${pageContext.request.contextPath}/on/addInventory">
							<input type="hidden" name="storeId" value="${storeId}">
							<input type="text" name="searchTitle" id="searchTitle" value="${searchTitle}">
							<button type="button" id=btnSearchTitle class="btn btn-sm btn-outline-success">Search Film</button>
						</form>
					</div>
				</div>
				
				<hr style="width: 500px;">
				
				<div>
					<form id="formAddInventory" method="post" action="${pageContext.request.contextPath}/on/addInventory">
						<table class="table text-center" style="width:500px; border-radius: 10px; overflow: hidden; border-bottom-style: hidden;">
							<tr>
								<th class="table-success text-center" colspan="2">Inventory Add</th>
							</tr>
							<tr>
								<th>Store ID</th>
								<td align="right">
									<input type="text" name="storeId" value="${storeId}" readonly style="margin-right: 20px;">
								</td>
							</tr>
							<tr>
								<th style="vertical-align: middle;">Film ID</th>
								<td align="right">
									<c:if test="${empty searchTitle}">
										<span class="text-danger" style="padding-right: 20px;">Film을 검색하세요</span>
									</c:if>
									<c:if test="${not empty searchTitle}">
										<select size="1" name="filmId" id="filmId" style="margin-right: 20px;">
											<c:forEach var="f" items="${filmList}">
												<option value="${f.filmId}">[${f.filmId}] ${f.title}</option>
											</c:forEach>
										</select>
									</c:if>
								</td>
							</tr>
						</table>
						<div class="d-flex justify-content-end" style="width: 500px;">
							<button id="btnAddInventory" type="button" class="btn btn-sm btn-outline-primary" style="margin-right: 5px;">Add Inventory</button>
							<a href="${pageContext.request.contextPath}/on/inventoryList?storeId=${storeId}" class="btn btn-sm btn-outline-danger">Cancel</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>