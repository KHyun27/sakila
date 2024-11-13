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
			$('#categoryId').change(function(){
				// alert('change!'); // debug
				$('#formCategory').submit();
			});
			
		});
	</script>
	<style>
		.main {
			margin-top: 50px;
			margin-left: 50px;
		}
		.film-link {
        	color: black;
        	text-decoration: none;
        }
        
        .film-link:hover {
            color: #002266;
            text-decoration: none;
        }
        
        .film-link:visited {
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
	<title>Film List</title>
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
						<th style="font-size: large;">Film List</th>
					</tr>
				</table>
				
				<hr style="width:1300px;">
				
				<!-- 카테고리 선택 -->
				<div class="d-flex justify-content-between" style="width:1300px; margin-bottom: 15px">
					<div>
						<form id="formCategory" method="get" action="${pageContext.request.contextPath}/on/filmList">
							<select name="categoryId" id="categoryId">
								<option value="">All Category</option>
								<c:forEach var="c" items="${categoryList}">
									<c:if test="${c.categoryId == currentCategoryId}">
										<option selected value="${c.categoryId}">${c.name}</option>
									</c:if>
									<c:if test="${c.categoryId != currentCategoryId}">
										<option value="${c.categoryId}">${c.name}</option>
									</c:if>
								</c:forEach>
							</select>
						</form>
					</div>
					<div>
						<form id="" method=get action="">
							<input type="hidden" name="filmId" value="${film.filmId}">
							<input type="text" name="" id="">
							<button id="" type="button" class="btn btn-sm btn-outline-success">Search</button>
						</form>
					</div>
				</div>
				<table class="table text-center" style="width:1300px; border-radius: 10px; overflow: hidden;">
					<thead class="table-success">
						<tr>
							<th>Film ID</th>
							<th>Title</th>
							<th>Category</th>
							<th>Rating</th>
							<th>Length</th>
							<th>Rental Duration</th>
							<th>Rental Rate</th>
							<th>Replacement Cost</th>
							<th>Release Year</th>
							
						</tr>
					<thead>
					<c:forEach var="f" items="${filmList}"> <!-- filmList -->
						<tr>
							<td>${f.filmId}</td>
							<td>
								<a class="film-link" href="${pageContext.request.contextPath}/on/filmOne?filmId=${f.filmId}">${f.title}</a>
							</td>
							<td>${f.category}</td>
							<td>${f.rating}</td>
							<td>${f.length}</td>
							<td>${f.rentalDuration} day</td>
							<td>${f.rentalRate} $</td>
							<td>${f.replacementCost} $</td>
							<td>${f.releaseYear}</td>
						</tr>
					</c:forEach>
				</table>
				
				<!-- Pagination -->
				<div class="pagination justify-content-center" style="text-align: center; margin-top: 20px; width: 1300px">
					<c:choose>
						<c:when test="${empty currentCategoryId}">
							<!-- 첫 페이지 -->
							<c:if test="${!(currentPage > 1)}">
								<a href="" style="pointer-events: none;">&laquo;</a>
							</c:if>
							<c:if test="${currentPage > 1}">
								<a href="${pageContext.request.contextPath}/on/filmList?currentPage=1">&laquo;</a>
							</c:if>
							
							<!-- 이전 페이지 -->
							<c:if test="${!(currentPage > 1)}">
								<a href="" style="pointer-events: none;">Previous</a>
							</c:if>
							<c:if test="${currentPage > 1}">
								<a href="${pageContext.request.contextPath}/on/filmList?currentPage=${currentPage-1}">Previous</a>
							</c:if>
							
							<!-- 페이지 번호 링크 -->
							<c:if test="${currentPage <= 1}">
								<a href="" style="pointer-events: none;">&nbsp;&nbsp;</a>
							</c:if>
							
							<c:if test="${currentPage > 1}">
								<a href="${pageContext.request.contextPath}/on/filmList?currentPage=${currentPage-1}">${currentPage - 1}</a>
							</c:if>
							
							<a class="active">${currentPage}</a>
							
							<c:if test="${currentPage < lastPage}">
								<a href="${pageContext.request.contextPath}/on/filmList?currentPage=${currentPage+1}">${currentPage + 1}</a>
							</c:if>
							
							<c:if test="${currentPage >= lastPage}">
								<a href="" style="pointer-events: none;">&nbsp;&nbsp;</a>
							</c:if>
							
						    <!-- 다음 페이지 -->
						    <c:if test="${!(currentPage < lastPage)}">
								<a href="" style="pointer-events: none;">Next</a>
							</c:if>
							<c:if test="${currentPage < lastPage}">
								<a href="${pageContext.request.contextPath}/on/filmList?currentPage=${currentPage+1}">Next</a>
							</c:if>
							
						    <!-- 마지막 페이지 -->
							<c:if test="${!(currentPage < lastPage)}">
								<a href="" style="pointer-events: none;">&raquo;</a>
							</c:if>
							<c:if test="${currentPage < lastPage}">
								<a href="${pageContext.request.contextPath}/on/filmList?currentPage=${lastPage}">&raquo;</a>
							</c:if>
						</c:when>
						
						<c:otherwise>
							<!-- 첫 페이지 -->
							<c:if test="${!(currentPage > 1)}">
								<a href="" style="pointer-events: none;">&laquo;</a>
							</c:if>
							<c:if test="${currentPage > 1}">
								<a href="${pageContext.request.contextPath}/on/filmList?currentPage=1&categoryId=${currentCategoryId}">&laquo;</a>
							</c:if>
							
							<!-- 이전 페이지 -->
							<c:if test="${!(currentPage > 1)}">
								<a href="" style="pointer-events: none;">Previous</a>
							</c:if>
							<c:if test="${currentPage > 1}">
								<a href="${pageContext.request.contextPath}/on/filmList?currentPage=${currentPage-1}&categoryId=${currentCategoryId}">Previous</a>
							</c:if>
							
							<!-- 페이지 번호 링크 -->
							<c:if test="${currentPage <= 1}">
								<a href="" style="pointer-events: none;">&nbsp;&nbsp;</a>
							</c:if>
							
							<c:if test="${currentPage > 1}">
								<a href="${pageContext.request.contextPath}/on/filmList?currentPage=${currentPage-1}&categoryId=${currentCategoryId}">${currentPage - 1}</a>
							</c:if>
							
							<a class="active">${currentPage}</a>
							
							<c:if test="${currentPage < lastPage}">
								<a href="${pageContext.request.contextPath}/on/filmList?currentPage=${currentPage+1}&categoryId=${currentCategoryId}">${currentPage + 1}</a>
							</c:if>
							
							<c:if test="${currentPage >= lastPage}">
								<a href="" style="pointer-events: none;">&nbsp;&nbsp;</a>
							</c:if>
							
						    <!-- 다음 페이지 -->
						    <c:if test="${!(currentPage < lastPage)}">
								<a href="" style="pointer-events: none;">Next</a>
							</c:if>
							<c:if test="${currentPage < lastPage}">
								<a href="${pageContext.request.contextPath}/on/filmList?currentPage=${currentPage+1}&categoryId=${currentCategoryId}">Next</a>
							</c:if>
							
						    <!-- 마지막 페이지 -->
							<c:if test="${!(currentPage < lastPage)}">
								<a href="" style="pointer-events: none;">&raquo;</a>
							</c:if>
							<c:if test="${currentPage < lastPage}">
								<a href="${pageContext.request.contextPath}/on/filmList?currentPage=${lastPage}&categoryId=${currentCategoryId}">&raquo;</a>
							</c:if>
						</c:otherwise>
					</c:choose>
				</div>
				
			</div>
		</div>
	</div>
</body>
</html>