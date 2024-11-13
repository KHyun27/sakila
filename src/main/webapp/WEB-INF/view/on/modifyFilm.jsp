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
			
			// Title
			$('#btnTitle').click(function(){
				if($('#title').val() == '') {
					alert('수정 할 Title을 입력해주세요');
				} else {
					$('#formTitle').submit();	
				}
			});
			
			// Description
			$('#btnDescription').click(function(){
				if($('#description').val() == '') {
					alert('수정 할 Description을 입력해주세요');
				} else {
					$('#formDescription').submit();	
				}
			});
			
			// ReleaseYear
			
			// Language
			$('#btnLanguage').click(function(){
				if($('#languageId').val() == '') {
					alert('수정 할 Language를 입력해주세요');
				} else {
					$('#formLanguage').submit();	
				}
			});
			
			// OriginalLanguage
			$('#btnOriginalLanguage').click(function(){
				if($('#originalLanguageId').val() == '') {
					alert('수정 할 OriginalLanguage를 입력해주세요');
				} else {
					$('#formOriginalLanguage').submit();	
				}
			});
			
			// Length
			$('#btnLength').click(function(){
				if($('#length').val() == '') {
					alert('수정 할 Length를 입력해주세요');
				} else {
					$('#formLength').submit();	
				}
			});
			
			// Special Features
			$('#btnSpecialFeatures').click(function(){
				if($('#specialFeatures').val() == '') {
					alert('수정 할 Special Features를 입력해주세요');
				} else {
					$('#formSpecialFeatures').submit();	
				}
			});
			
			// Rental Rate
			$('#btnRentalRate').click(function(){
				if($('#rentalRate').val() == '') {
					alert('수정 할 Rental Rate를 입력해주세요');
				} else {
					$('#formRentalRate').submit();	
				}
			});
			
			// Rental Duration
			$('#btnRentalDuration').click(function(){
				if($('#rentalDuration').val() == '') {
					alert('수정 할 Rental Duration를 입력해주세요');
				} else {
					$('#formRentalDuration').submit();	
				}
			});
			
			// Replacement Cost
			$('#btnReplacementCost').click(function(){
				if($('#replacementCost').val() == '') {
					alert('수정 할 Replacement Cost를 입력해주세요');
				} else {
					$('#formReplacementCost').submit();	
				}
			});
			
			// Rating
			$('#btnRating').click(function(){
				if($('#rating').val() == '') {
					alert('수정 할 Rating을 입력해주세요');
				} else {
					$('#formRating').submit();	
				}
			});
			
		});
	</script>
	<style>
		.main {
			margin-top: 50px;
			margin-left: 50px;
		}
		.table th {
	    padding-left: 80px;
        text-align: left;
        vertical-align: middle;
        width: 300px;
    	}
    	.table td {
    	padding-right: 30px;
        text-align: left;
        vertical-align: middle;
        width: 800px;
    	}
	</style>
	<meta charset="UTF-8">
	<title>Modify Film</title>
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
					<table class="table text-center" style="width: 1300px; border-radius: 10px; overflow: hidden; margin-right: 30px;">
					    <tr>
					        <th class="table-success text-center" colspan="2" style="padding-left: 0px">Modify Film</th>
					    </tr>
					    <tr>
				        	<th>Film ID</th>
					        <td>
					        	<input type="text" id="filmId" name="filmId" value="${film.filmId}" readonly>
					        </td>
				    	</tr>
				    	<tr>
				        	<th>Title <span style="color: red;">*</span></th>
					        <td>
					        	<form id="formTitle" method="post" action="${pageContext.request.contextPath}/on/modifyFilm">
					        		<div class="d-flex justify-content-between">
					        			<input type="hidden" name="filmId" value="${film.filmId}">
					        			<input type="text" id="title" name="title" value="${film.title}">
					        			<button id="btnTitle" type="button" class="btn btn-sm btn-outline-primary">Title 수정</button>
					        		</div>
				        		</form>
					        </td>
				    	</tr>
				    	<tr>
				        	<th>Description</th>
					        <td>
					        	<form id="formDescription" method="post" action="${pageContext.request.contextPath}/on/modifyFilm">
								    <div class="d-flex justify-content-between align-items-center">
								        <input type="hidden" name="filmId" value="${film.filmId}">
								        <div class="textarea-container">
								            <textarea rows="3" cols="50" id="description" name="description">${film.description}</textarea>
								        </div>
							            <button id="btnDescription" type="button" class="btn btn-sm btn-outline-primary">Description 수정</button>
								    </div>
								</form>
					        </td>
				    	</tr>
				    	<tr>
				        	<th>ReleaseYear</th>
					        <td>
					        	<form id="formReleaseYear" method="post" action="${pageContext.request.contextPath}/on/modifyFilm">
					        		<div class="d-flex justify-content-between">
					        			<span>
						        			<input type="hidden" name="filmId" value="${film.filmId}">
						        			<input type="text" id="releaseYear" name="releaseYear" value="${film.releaseYear}">
						        			<span style="margin-left: 5px;">Year</span>
				        				</span>
				        				<span>
					        				<button id="btnReleaseYear" type="button" class="btn btn-sm btn-outline-primary">ReleaseYear 수정</button>
					        			</span>
					        		</div>
				        		</form>
					        </td>
				    	</tr>
				    	<tr>
				        	<th>Language <span style="color: red;">*</span></th>
					        <td>
					        	<form id="formLanguage" method="post" action="${pageContext.request.contextPath}/on/modifyFilm">
					        		<div class="d-flex justify-content-between">
					        			<input type="hidden" name="filmId" value="${film.filmId}">
					        			<select id="languageId" name="languageId">
							    			<option selected="selected" value="${film.languageId}">${film.language}</option>
							    			<c:forEach var="la" items="${languageList}">
							    				<option value="${la.languageId}">${la.name}</option>
							    			</c:forEach>
							    		</select>
					        			<button id="btnLanguage" type="button" class="btn btn-sm btn-outline-primary">Language 수정</button>
					        		</div>
				        		</form>
					        </td>
				    	</tr>
				    	<tr>
				        	<th>OriginalLanguage</th>
					        <td>
					        	<form id="formOriginalLanguage" method="post" action="${pageContext.request.contextPath}/on/modifyFilm">
					        		<div class="d-flex justify-content-between">
					        			<input type="hidden" name="filmId" value="${film.filmId}">
					        			<select id="originalLanguageId" name="originalLanguageId">
							    			<option selected="selected" value="${film.originalLanguageId}">${film.originalLanguage}</option>
							    			<c:forEach var="la" items="${languageList}">
							    				<option value="${la.languageId}">${la.name}</option>
							    			</c:forEach>
							    		</select>
					        			<button id="btnOriginalLanguage" type="button" class="btn btn-sm btn-outline-primary">OriginalLanguage 수정</button>
					        		</div>
				        		</form>
					        </td>
				    	</tr>
				    	<tr>
				        	<th>Length</th>
					        <td>
					        	<form id="formLength" method="post" action="${pageContext.request.contextPath}/on/modifyFilm">
					        		<div class="d-flex justify-content-between">
					        			<span>
						        			<input type="hidden" name="filmId" value="${film.filmId}">
						        			<input type="number" id="length" name="length" value="${film.length}">
						        			<span style="margin-left: 5px;">Minute</span>
					        			</span>
					        			<span>
					        				<button id="btnLength" type="button" class="btn btn-sm btn-outline-primary">Length 수정</button>
					        			</span>
					        		</div>
				        		</form>
					        </td>
				    	</tr>
				    	<tr>
				        	<th>Special Features</th>
					        <td>
					        	<form id="formSpecialFeatures" method="post" action="${pageContext.request.contextPath}/on/modifyFilm">
					        		<div class="d-flex justify-content-between align-items-center">
					        			<input type="hidden" name="filmId" value="${film.filmId}">
					        			<div>
					        			<!-- specialFeatures 배열에서 값 받아와서 비교 -->
					        				<input type="checkbox" name="specialFeatures" value="Trailers"
									            <c:forEach var="sf" items="${specialFeaturesList}">
									                <c:if test="${sf == 'Trailers'}">checked</c:if>
									            </c:forEach>> Trailers<br>
									        <input type="checkbox" name="specialFeatures" value="Commentaries"
									            <c:forEach var="sf" items="${specialFeaturesList}">
									                <c:if test="${sf == 'Commentaries'}">checked</c:if>
									            </c:forEach>> Commentaries<br>
									        <input type="checkbox" name="specialFeatures" value="Deleted Scenes"
									            <c:forEach var="sf" items="${specialFeaturesList}">
									                <c:if test="${sf == 'Deleted Scenes'}">checked</c:if>
									            </c:forEach>> Deleted Scenes<br>
									        <input type="checkbox" name="specialFeatures" value="Behind the Scenes"
									            <c:forEach var="sf" items="${specialFeaturesList}">
									                <c:if test="${sf == 'Behind the Scenes'}">checked</c:if>
									            </c:forEach>> Behind the Scenes<br>            
							    		</div>
					        			<button id="btnSpecialFeatures" type="button" class="btn btn-sm btn-outline-primary">Special Features 수정</button>
					        		</div>
				        		</form>
					        </td>
				    	</tr>
				    	<tr>
				        	<th>Rental Rate <span style="color: red;">*</span></th>
					        <td>
					        	<form id="formRentalRate" method="post" action="${pageContext.request.contextPath}/on/modifyFilm">
					        		<div class="d-flex justify-content-between">
					        			<span>
						        			<input type="hidden" name="filmId" value="${film.filmId}">
						        			<input type="number" id="rentalRate" name="rentalRate" value="${film.rentalRate}">
						        			<span style="margin-left: 5px;">$</span>
					        			</span>
					        			<span>
					        				<button id="btnRentalRate" type="button" class="btn btn-sm btn-outline-primary">Rental Rate 수정</button>
					        			</span>
					        		</div>
				        		</form>
					        </td>
				    	</tr>
				    	<tr>
				        	<th>Rental Duration <span style="color: red;">*</span></th>
					        <td>
					        	<form id="formRentalDuration" method="post" action="${pageContext.request.contextPath}/on/modifyFilm">
					        		<div class="d-flex justify-content-between">
					        			<span>
						        			<input type="hidden" name="filmId" value="${film.filmId}">
						        			<input type="number" id="rentalDuration" name="rentalDuration" value="${film.rentalDuration}">
						        			<span style="margin-left: 5px;">Days</span>
					        			</span>
					        			<span>
					        				<button id="btnRentalDuration" type="button" class="btn btn-sm btn-outline-primary">Rental Duration 수정</button>
					        			</span>
					        		</div>
				        		</form>
					        </td>
				    	</tr>
				    	<tr>
				        	<th>Replacement Cost</th>
					        <td>
					        	<form id="formReplacementCost" method="post" action="${pageContext.request.contextPath}/on/modifyFilm">
					        		<div class="d-flex justify-content-between">
					        			<span>
						        			<input type="hidden" name="filmId" value="${film.filmId}">
						        			<input type="number" id="replacementCost" name="replacementCost" value="${film.replacementCost}">
						        			<span style="margin-left: 5px;">$</span>
					        			</span>
					        			<span>
					        				<button id="btnReplacementCost" type="button" class="btn btn-sm btn-outline-primary">Replacement Cost 수정</button>
					        			</span>
					        		</div>
				        		</form>
					        </td>
				    	</tr>
				    	<tr>
				        	<th>Rating <span style="color: red;">*</span></th>
					        <td>
					        	<form id="formRating" method="post" action="${pageContext.request.contextPath}/on/modifyFilm">
					        		<div class="d-flex justify-content-between align-items-center">
					        			<input type="hidden" name="filmId" value="${film.filmId}">
					        			<div>
						        			<input type="radio" name="rating" class="rating" value="G" 
								                <c:if test="${film.rating == 'G'}">checked</c:if>> G<br>
								            <input type="radio" name="rating" class="rating" value="PG" 
								                <c:if test="${film.rating == 'PG'}">checked</c:if>> PG<br>
								            <input type="radio" name="rating" class="rating" value="PG-13" 
								                <c:if test="${film.rating == 'PG-13'}">checked</c:if>> PG-13<br>
								            <input type="radio" name="rating" class="rating" value="R" 
								                <c:if test="${film.rating == 'R'}">checked</c:if>> R<br>
								            <input type="radio" name="rating" class="rating" value="NC-17" 
								                <c:if test="${film.rating == 'NC-17'}">checked</c:if>> NC-17<br>
					        			</div>
					        			<button id="btnRating" type="button" class="btn btn-sm btn-outline-primary">Rating 수정</button>
					        		</div>
				        		</form>
					        </td>
				    	</tr>
					</table>
					<div class="d-flex justify-content-between" style="width: 1300px">
						<div><span class="text-danger">* 표시는 필수항목</span></div>
						<div>
							<a href ="${pageContext.request.contextPath}/on/filmOne?filmId=${film.filmId}" class="btn btn-sm btn-outline-danger" style="margin-right: 5px;">Cancel</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>