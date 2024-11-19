<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#btnSearch').click(function(){
				if($('#searchWord').val() == '') {
					alert('검색어를 입력하세요');
					return;
				}
				$('#formSearch').submit();
			});
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
	<title>Customer List</title>
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
						<th style="font-size: large;">Customer List</th>
					</tr>
				</table>
				
				<hr style="width:1300px;">
				
				<table class="table text-center" style="width:1300px; border-radius: 10px; overflow: hidden;">
					<thead class="table-success">
						<tr>
							<th>Customer ID</th>
							<th>Store ID</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Address ID</th>
							<th>Email</th>
							<th>Create Date</th>
							<th>Last Update</th>
							<th>Active</th>
							<th>활/비활</th>
						</tr>
					</thead>
					<c:forEach var="c" items="${customerList}">
						<tr>
							<td>
								<!-- 고객 상세 정보(주소 x 렌탈 x payment 조인 발생 -->
								<a href="${pageContext.request.contextPath}/on/customerOne?customerId=${c.customerId}" class="customer-link" style="color: #002266;">
									${c.customerId}
								</a>
							</td>
							<td>${c.storeId}</td>
							<td>${c.firstName}</td>
							<td>${c.lastName}</td>
							<td>${c.addressId}</td>
							<td>${c.email}</td>
							<td>${fn:substring(c.createDate.toString(), 0, 10)}</td>
							<td>${fn:substring(c.lastUpdate.toString(), 0, 10)}</td>
							<td>
								<c:if test="${c.active == 1}">
									<span class="text-primary">활성화</span>
								</c:if>
								<c:if test="${c.active != 1}">
									<span class="text-danger">비활성화</span>
								</c:if>
							</td>
							<td>
								<a href="${pageContext.request.contextPath}" class="customer-link">
									<c:if test="${c.active == 1}"><span class="text-danger">비활성화</span></c:if>
									<c:if test="${c.active == 0}"><span class="text-primary">활성화</span></c:if>
								</a>
							</td>
						</tr>
					</c:forEach>
				</table>
				<div class="d-flex justify-content-end" style="width: 1300px;">
					<form id="formSearch" method="get" action="${pageContext.request.contextPath}/on/customerList">
						<input type="text" name="searchWord" id="searchWord">
						<button id="btnSearch" type="button" class="btn btn-sm btn-outline-success">Search</button>
					</form>
				</div>
				<div class="pagination justify-content-center" style="text-align: center; margin-top: 20px; width: 1300px">
					<!-- Pagination --> <!-- 이전 11 12 13 14 15 16 17 18 19 20 다음 -->
					<!-- 첫 페이지 -->
					<c:if test="${!(currentPage > 1)}">
						<a href="" style="pointer-events: none;">&laquo;</a>
					</c:if>
					<c:if test="${currentPage > 1}">
						<a href="${pageContext.request.contextPath}/on/customerList?currentPage=1">&laquo;</a>
					</c:if>
					
					<!-- 이전 페이지 -->
					<c:if test="${!(currentPage > 10)}">
						<a href="" style="pointer-events: none;">Previous</a>
					</c:if>
					<c:if test="${currentPage > 10}">
						<a href="${pageContext.request.contextPath}/on/customerList?currentPage=${currentPage - 10}">
							Previous
						</a>
					</c:if>
					
					<!-- 페이지 번호 링크 -->
					<c:forEach var="num" begin="${startPagingNum}" end="${endPagingNum}">
						<c:if test= "${num == currentPage}">
							<a class="active">${num}</a>
						</c:if>
						<c:if test= "${num != currentPage}">
							<a href="${pageContext.request.contextPath}/on/customerList?currentPage=${num}">${num}</a>
						</c:if>
					</c:forEach>
					
					<!-- 다음 페이지 -->
					<c:if test="${!(currentPage < lastPage)}">
						<a href="" style="pointer-events: none;">Next</a>
					</c:if>
					
					<c:if test="${currentPage < lastPage}">
						<a href="${pageContext.request.contextPath}/on/customerList?currentPage=${currentPage + 10}">
							Next
						</a>
					</c:if>
					
					<!-- 마지막 페이지 -->
					<c:if test="${!(currentPage < lastPage)}">
						<a href="" style="pointer-events: none;">&raquo;</a>
					</c:if>
					<c:if test="${currentPage < lastPage}">
						<a href="${pageContext.request.contextPath}/on/customerList?currentPage=${lastPage}">&raquo;</a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>