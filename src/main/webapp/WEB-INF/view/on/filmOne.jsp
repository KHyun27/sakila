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
			// 카테고리 추가
			$('#btnFilmCategory').click(function(){
				if($('#categoryId').val() == '') {
					alert('Category를 선택하세요');
				} else {
					$('#formFilmCategory').submit();
				}
			});
			
			// 배우 검색
			$('#btnSearchName').click(function(){
				if($('#searchName').val() == '') {
					alert('Search Name을 입력하세요');
				} else {
					$('#formSearchName').submit();	
				}
			});
			
			// 출연 배우 추가
			$('#btnFilmActor').click(function(){
				if($('#actorId').val() == null || $('#actorId').val() == '') {
					alert('Actor를 선택하세요');
				} else {
					$('#formFilmActor').submit();	
				}
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
        
        .my-table th {
	    	padding-left: 80px;
        	text-align: left;
        	width: 300px;
    	}
    	.my-table td {
    		padding-right: 200px;
        	text-align: left;
        	width: 800px;
    	}
	</style>
	<meta charset="UTF-8">
	<title>Film One</title>
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
		
		<!-- 
			√ 1) film 상세
			1-1) film 수정 /on/modifyFilm
			1-2) film 삭제 /on/removiFilm 
			(inventory 렌탈 정보 확인 + film_category 삭제 + film_actor 삭제 + film 삭제)
			
			2) film_category List
			2-1) film_category 추가 /on/addFilmCategory → Category 전체 목록에서 선택
			2-2) film_category 삭제 /on/removeFilmCategory
			
			√ 3) film_actor List
			3-1) film_actor 추가 /on/addActorByFilm → Actor 검색 후 선택
			3-2) film_actor 삭제 /on/removeFilmActor
			
			4) inventory 연동
		 -->
		
		<div class="col-sm-10 bg-light">
			<div class="main">
				<!-- main -->
				<div>	
					<table class="my-table table text-center" style="width: 1300px; border-radius: 10px; overflow: hidden; margin-right: 30px;">
					    <tr>
					        <th class="table-success text-center" colspan="2" style="padding-left: 0px">Film Info</th>
					    </tr>
					    <tr>
					        <th>Film ID</th>
					        <td>${film.filmId}</td>
					    </tr>
					    <tr>
					        <th>Title</th>
					        <td>${film.title}</td>
					    </tr>
					    <tr>
					        <th>Description</th>
					        <td>${film.description}</td>
					    </tr>
					    <tr>
					        <th>ReleaseYear</th>
					        <td>${fn:substring(film.releaseYear.toString(), 0, 4)}</td>
					    </tr>
					    <tr>
					        <th>Language</th>
					        <td>${film.language}</td>
					    </tr>
					    <tr>
					        <th>OriginalLanguage</th>
					        <td>${film.originalLanguage}</td>
					    </tr>
					    <tr>
					        <th>Length</th>
					        <td>
			        	        <c:if test="${not empty film.length}">
            						${film.length} Minute
        						</c:if>
					        </td>
					    </tr>
					    <tr>
					        <th>Special Features</th>
					        <td>${film.specialFeatures}</td>
					    </tr>
					    <tr>
					        <th>Rental Rate</th>
					        <td>${film.rentalRate} $</td>
					    </tr>
					    <tr>
					        <th>Rental Duration</th>
					        <td>${film.rentalDuration} Days</td>
					    </tr>
					    <tr>
					        <th>Replacement Cost</th>
					        <td>${film.replacementCost} $</td>
					    </tr>
					    <tr>
					        <th>Rating</th>
					        <td>${film.rating}</td>
					    </tr>
					    <tr>
					        <th>Last Update</th>
					        <td>${film.lastUpdate}</td>
					    </tr>
					</table>
					<div class="d-flex justify-content-between" style="width:1300px; ">
						<div>
							<table class="table table-sm text-center" style="width:400px; border-radius: 10px; overflow: hidden; border-bottom-style: hidden; margin-right: 20px; float: left;">
								<tr>
									<th class="table-success text-center" colspan="3">Film Actor List</th>
								</tr>
								<c:forEach var="a" items="${actorList}">
									<tr>
										<td class="text-center" style="padding-left: 20px;">${a.actorId}</td>
										<td class="text-center"><a class="film-link" href="${pageContext.request.contextPath}/on/actorOne?actorId=${a.actorId}">${a.firstName} ${a.lastName}</a></td>
										<td><a href="${pageContext.request.contextPath}/on/removeFilmActorByFilm?filmId=${film.filmId}&actorId=${a.actorId}" class="film-link" style="color: red; font-size:small; padding-right: 5px;">삭제</a></td>
									</tr>
								</c:forEach>
							</table>
							<table class="table table-sm text-center" style="width:320px; border-radius: 10px; overflow: hidden; border-bottom-style: hidden;">
								<tr>
									<th class="table-success text-center" colspan="3">Category</th>
								</tr>
								<!-- 카테고리 리스트 model.filmCategoryList -->
								<c:forEach var="fc" items="${filmCategoryList}">
									<tr>
										<td style="padding-left: 15px;">${fc.categoryId}</td>
			        					<td style="padding-left: 25px;">${fc.name}</td>
			        					<td>
			        						<a href="${pageContext.request.contextPath}/on/removeFilmCategory?filmId=${fc.filmId}&categoryId=${fc.categoryId}" class="film-link" style="color: red; font-size:small;">삭제</a>	
			        					</td>
			        				</tr>
			        		</c:forEach>
							</table>
							<div class="d-flex justify-content-end">
								<form id="formFilmCategory" method="post" action="${pageContext.request.contextPath}/on/addFilmCategory">
									<input type="hidden" name="filmId" value="${film.filmId}">
					        		<select name="categoryId" id="categoryId" style="text-align: center;">
					        			<option value="">Select Category</option>
					        			<!-- modle.categoryList -->
					        			<c:forEach var="ac" items="${allCategoryList}">
					        				<option value="${ac.categoryId}">${ac.name}</option>
					        			</c:forEach>
					        		</select>
					        		<button id="btnFilmCategory" type="button" class="btn btn-sm btn-outline-primary">Add Category</button>
					        	</form>
							</div>
						</div>
						
						<div>
							<span class="text-danger" style="margin-right: 20px;">${removeFilmMsg}</span>
							<a href="${pageContext.request.contextPath}/on/filmList" class="btn btn-sm btn-outline-primary">Film List</a>
							<a href="${pageContext.request.contextPath}/on/modifyFilm?filmId=${film.filmId}" class="btn btn-sm btn-outline-success">Film Modify</a>
							<a href="${pageContext.request.contextPath}/on/removeFilm?filmId=${film.filmId}" class="btn btn-sm btn-outline-danger">Film Delete</a>
						</div>
					</div>
					<div style="clear: both;"></div><!-- float clear -->
				</div>
				<!-- 배우이름 검색 -->
				<div class="d-flex justify-content-between mb-2" style="width:400px;">
					<span style="color: red;">${addFilmActorMsg}</span>
					<form id="formSearchName" method=get action="${pageContext.request.contextPath}/on/filmOne">
						<input type="hidden" name="filmId" value="${film.filmId}">
						<input type="text" name="searchName" id="searchName" style="width: 180px">
						<button id="btnSearchName" type="button" class="btn btn-sm btn-outline-success">Search</button>
					</form>
				</div>
				<!-- 출연배우 검색 -->
				<div class="d-flex justify-content-end" style="width:400px;">	
					<form id="formFilmActor" method="post" action="${pageContext.request.contextPath}/on/addFilmActorByFilm">
						<input type="hidden" name="filmId" value="${film.filmId}">
						<c:if test="${empty searchActorList}">
							<br>
						</c:if>
						<c:if test="${not empty searchActorList}">
							<select name="actorId" id="actorId" size="5" style="width: 245px; text-align: left;">
								<!-- model.searchActorList -->
								<c:forEach var="sa" items="${searchActorList}">
									<option value="${sa.actorId}">[${sa.actorId}] ${sa.firstName} ${sa.lastName}</option>
								</c:forEach>
							</select>
						<div class="d-flex justify-content-end mt-1">
							<button id="btnFilmActor" type=	"button" class="btn btn-sm btn-outline-primary">Add Actor</button>
						</div>
						</c:if>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>