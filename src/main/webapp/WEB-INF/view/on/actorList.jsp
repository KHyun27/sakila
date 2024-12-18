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
		
       .actor-link {
        	color: black;
        	text-decoration: none;
        }
        
        .actor-link:hover {
            color: #002266;
            text-decoration: none;
        }
        
        .actor-link:visited {
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
	<title>Actor List</title>
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
				<table class="table table-success text-center" style="width:500px; border-radius: 10px; overflow: hidden; border-bottom-style: hidden;">
					<tr>
						<th style="font-size: large;">Actor List</th>
					</tr>
				</table>
				
				<hr style="width:500px;">
				
				<table class="table text-center" style="width:500px; border-radius: 10px; overflow: hidden;">
					<thead class="table-success">
						<tr>
							<th>Actor ID</th>
							<th>Name</th>
						</tr>
					</thead>
					<c:forEach var="a" items="${actorList}">
						<tr>
							<td>${a.actorId}</td>
							<td>
								<a class="actor-link" href="${pageContext.request.contextPath}/on/actorOne?actorId=${a.actorId}">${a.firstName} ${a.lastName}</a>
							</td>
						</tr>
					</c:forEach>
				</table>
				<form id="formSearch" method="get" action="${pageContext.request.contextPath}/on/actorList">
				<div class="d-flex justify-content-between" style="width: 500px;">
					<div><span style="color: #008000;">Current SearchWord : ${searchWord}</span></div>
					<div>
						<input type="text" name="searchWord" id="searchWord">
						<button id="btnSearch" type="button" class="btn btn-sm btn-outline-success">Search</button>
					</div>
				</div>
				</form>
				<!-- Pagination -->
				<div class="pagination justify-content-center" style="text-align: center; margin-top: 20px; width: 500px">
					<!-- 첫 페이지 -->
					<c:if test="${!(currentPage > 1)}">
						<a href="" style="pointer-events: none;">&laquo;</a>
					</c:if>
					<c:if test="${currentPage > 1}">
						<a href="${pageContext.request.contextPath}/on/actorList?currentPage=1&searchWord=${searchWord}">&laquo;</a>
					</c:if>
					<!-- 이전 페이지 -->
					<c:if test="${!(currentPage > 1)}">
						<a href="" style="pointer-events: none;">Previous</a>
					</c:if>
					<c:if test="${currentPage > 1}">
						<a href="${pageContext.request.contextPath}/on/actorList?currentPage=${currentPage-1}&searchWord=${searchWord}">Previous</a>
					</c:if>
					<!-- 페이지 번호 링크 -->
<!-- 					 
				    <c:forEach var="page" begin="1" end="${lastPage}">
				        <c:if test="${page == currentPage}">
				            <a class="active">${page}</a> <!-- 현재 활성화 페이지 -->
<!--  				    </c:if>
				        
				        <c:if test="${page != currentPage}">
				            <a href="${pageContext.request.contextPath}/on/actorList?currentPage=${page}">${page}</a>
				        </c:if>
				    </c:forEach>
				    
-->					
					<!-- 페이지 번호 링크 -->
					<c:if test="${currentPage <= 1}">
						<a href="" style="pointer-events: none;">&nbsp;&nbsp;</a>
					</c:if>
					
					<c:if test="${currentPage > 1}">
						<a href="${pageContext.request.contextPath}/on/actorList?currentPage=${currentPage-1}&searchWord=${searchWord}">${currentPage - 1}</a>
					</c:if>
					
					<a class="active">${currentPage}</a>
					
					<c:if test="${currentPage < lastPage}">
						<a href="${pageContext.request.contextPath}/on/actorList?currentPage=${currentPage+1}&searchWord=${searchWord}">${currentPage + 1}</a>
					</c:if>
					
					<c:if test="${currentPage >= lastPage}">
						<a href="" style="pointer-events: none;">&nbsp;&nbsp;</a>
					</c:if>
					
				    <!-- 다음 페이지 -->
				    <c:if test="${!(currentPage < lastPage)}">
						<a href="" style="pointer-events: none;">Next</a>
					</c:if>
					<c:if test="${currentPage < lastPage}">
						<a href="${pageContext.request.contextPath}/on/actorList?currentPage=${currentPage+1}&searchWord=${searchWord}">Next</a>
					</c:if>
					
				    <!-- 마지막 페이지 -->
					<c:if test="${!(currentPage < lastPage)}">
						<a href="" style="pointer-events: none;">&raquo;</a>
					</c:if>
					<c:if test="${currentPage < lastPage}">
						<a href="${pageContext.request.contextPath}/on/actorList?currentPage=${lastPage}&searchWord=${searchWord}">&raquo;</a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>