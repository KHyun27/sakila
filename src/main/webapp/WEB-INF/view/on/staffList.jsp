<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	
	<meta charset="UTF-8">
	<title>Staff List</title>
	
	<style>
		.add {
			margin-top: 50px;
			margin-left: 50px;
		}
		.staff-link {
        	color: black;
        	text-decoration: none;
        }
        
        .staff-link:hover {
            color: #002266;
            text-decoration: none;
        }
        
        .staff-link:visited {
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
				<table class="table table-success text-center" style="width:1300px; border-radius: 10px; overflow: hidden; border-bottom-style: hidden;">
					<tr>
						<th style="font-size: large;">Staff List</th>
					</tr>
				</table>
				
				<hr style="width:1300px;">
				
				<table class="table text-center" style="width:1300px; border-radius: 10px; overflow: hidden;">
				<thead class="table-success">
					<tr>
						<th>Staff ID</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Address ID</th>
						<th>Email</th>
						<th>Store ID</th>
						<th>Username</th>
						<th>Last Update</th>
						<th>Active</th>
						<th>활/비활</th>
					</tr>
				</thead>
					<c:forEach var="s" items="${staffList}">
						<tr>
							<td>${s.staffId}</td>
							<td>${s.firstName}</td>
							<td>${s.lastName}</td>
							<td>${s.addressId}</td>
							<td>${s.email}</td>
							<td>${s.storeId}</td>
							<td>${s.username}</td>
							<td>${s.lastUpdate}</td>
							<td>
								<c:if test="${s.active == 1}">
									<span class="text-primary">활성화</span>
								</c:if>
								<c:if test="${s.active != 1}">
									<span class="text-danger">비활성화</span>
								</c:if>
							</td>
							<td>
								<a href="${pageContext.request.contextPath}/modifyStaffActive?staffId=${s.staffId}&active=${s.active}&currentPage=${currentPage}" class="staff-link">
									<c:if test="${s.active == 1}"><span class="text-danger">비활성화</span></c:if>
									<c:if test="${s.active == 2}"><span class="text-primary">활성화</span></c:if>
								</a>
							</td>
						</tr>
					</c:forEach>
				</table>
				<!-- Pagination -->
				<div class="pagination justify-content-center" style="text-align: center; margin-top: 20px; width: 1300px">
					<!-- 첫 페이지 -->
					<c:if test="${!(currentPage > 1)}">
						<a href="" style="pointer-events: none;">&laquo;</a>
					</c:if>
					<c:if test="${currentPage > 1}">
						<a href="${pageContext.request.contextPath}/on/staffList?currentPage=1">&laquo;</a>
					</c:if>
					<!-- 이전 페이지 -->
					<c:if test="${!(currentPage > 1)}">
						<a href="" style="pointer-events: none;">Previous</a>
					</c:if>
					<c:if test="${currentPage > 1}">
						<a href="${pageContext.request.contextPath}/on/staffList?currentPage=${currentPage-1}">Previous</a>
					</c:if>
					<!-- 페이지 번호 링크 -->
				    <c:forEach var="page" begin="1" end="${lastPage}">
				        <c:if test="${page == currentPage}">
				            <a class="active">${page}</a> <!-- 현재 활성화 페이지 -->
				        </c:if>
				        <c:if test="${page != currentPage}">
				            <a href="${pageContext.request.contextPath}/on/staffList?currentPage=${page}">${page}</a>
				        </c:if>
				    </c:forEach>
				    <!-- 다음 페이지 -->
				    <c:if test="${!(currentPage < lastPage)}">
						<a href="" style="pointer-events: none;">Next</a>
					</c:if>
					<c:if test="${currentPage < lastPage}">
						<a href="${pageContext.request.contextPath}/on/staffList?currentPage=${currentPage+1}">Next</a>
					</c:if>
				    <!-- 마지막 페이지 -->
					<c:if test="${!(currentPage < lastPage)}">
						<a href="" style="pointer-events: none;">&raquo;</a>
					</c:if>
					<c:if test="${currentPage < lastPage}">
						<a href="${pageContext.request.contextPath}/on/staffList?currentPage=${lastPage}">&raquo;</a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>