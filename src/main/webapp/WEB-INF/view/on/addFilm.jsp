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
			$('#btnAddFilm').click(function(){
				// 폼 유효성 검사 (제외 : description, releaseYear, originalLanguageId, length, specialFeatures)
				if($('#title').val()== '') {
					alert('Title을 입력하세요');
					return false;
				} else if($('#languageId').val()== '') {
					alert('Language ID를 입력하세요');
					return false;
				} else if(!$.isNumeric($('#rentalDuration').val())) {
					alert('Rental Duration는 숫자만 입력 가능합니다');
					return false;
				} else if(!$.isNumeric($('#rentalRate').val())) {
					alert('Rental Rate는 숫자만 입력 가능합니다');
					return false;
				} else if(!$.isNumeric($('#replacementCost').val())) {
					alert('Replacement Cost는 숫자만 입력 가능합니다');
					return false;
				} else if($('.rating:checked').length == 0) {
					alert('Rating을 선택하세요');
					return false;
				} else {
					$('#formAddFilm').submit();	
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
	    padding-left: 50px;
        text-align: left;
    	}
    	.table td {
    	padding-left: 90px;
        text-align: left;
    	}
	</style>
	<meta charset="UTF-8">
	<title>Add Film</title>
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
				<form id="formAddFilm" method="post" action="${pageContext.request.contextPath}/on/addFilm">
					<table class="table" style="width: 800px; border-radius: 10px; overflow: hidden; margin-right: 30px;">
						<tr>
					        <th class="table-success text-center" colspan="2">Film Insert&#128516;</th>
					    </tr>
					    <tr>
					    	<th>Title <span style="color: red;">*</span></th>
					    	<td>
					    		<input type="text" id="title" name="title">
					    	</td>
					    </tr>
					    <tr>
					    	<th>Description</th>
					    	<td>
					    		<!-- textarea -->
					    		<textarea rows="3" cols="50" id="description" name="description"></textarea>
					    	</td>
					    </tr>
					    <tr>
					    	<th>Release Year</th>
					    	<td>
					    		<input type="number" id="releaseYear" name="releaseYear"> Year
					    	</td>
					    </tr>
					    <tr>
					    	<th>language ID <span style="color: red;">*</span></th>
					    	<td>
					    		<select id="languageId" name="languageId">
					    			<option value="">Select Language</option>
					    			<c:forEach var="la" items="${languageList}">
					    				<option value="${la.languageId}">${la.name}</option>
					    			</c:forEach>
					    		</select>
					    	</td>
					    </tr>
					    <tr>
					    	<th>Original Language ID</th>
					    	<td>
					    		<select id="originalLanguageId" name="originalLanguageId">
					    			<option value="">Select Original Language</option>
					    			<c:forEach var="la" items="${languageList}">
					    				<option value="${la.languageId}">${la.name}</option>
					    			</c:forEach>
					    		</select>
					    	</td>
					    </tr>
					    <tr>
					    	<th>Rental Duration <span style="color: red;">*</span></th>
					    	<td>
					    		<!-- DB기본값 : 3 -->
					    		<input type="number" id="rentalDuration" name="rentalDuration" value="3"> day
					    	</td>
					    </tr>
					    <tr>
					    	<th>Rental Rate <span style="color: red;">*</span></th>
					    	<td>
					    		<!-- DB기본값 : 4.99 -->
					    		<input type="number" id="rentalRate" name="rentalRate" value="4.99"> $
					    	</td>
					    </tr>
					    <tr>
					    	<th>Length</th>
					    	<td>
					    		<input type="number" id="length" name="length"> minute
					    	</td>
					    </tr>
					    <tr>
					    	<th>Replacement Cost <span style="color: red;">*</span></th>
					    	<td>
					    		<!-- DB기본값 : 19.99 -->
					    		<input type="number" id="replacementCost" name="replacementCost" value="19.99"> $
					    	</td>
					    </tr>
					    <tr>
					    	<th>Rating <span style="color: red;">*</span></th>
					    	<td>
					    		<!-- radio, ENUM Type(G,PG,PG-13,R,NC-17) DB기본값 : 'G' -->
					    		<input type="radio" name="rating" class="rating" value="G"> G<br>
					    		<input type="radio" name="rating" class="rating" value="PG"> PG<br>
					    		<input type="radio" name="rating" class="rating" value="PG-13"> PG-13<br>
					    		<input type="radio" name="rating" class="rating" value="R"> R<br>
					    		<input type="radio" name="rating" class="rating" value="NC-17"> NC-17<br>
					    	</td>
					    </tr>
					    <tr>
					    	<th>Special Features</th>
					    	<td>
					    		<!-- checkbox, SET('Trailers','Commentaries','Deleted Scenes','Behind the Scenes') DB기본값 : NULL -->
					    		<input type="checkbox" name="specialFeatures" id="specialFeatures" value="Trailers"> Trailers<br>
					    		<input type="checkbox" name="specialFeatures" id="specialFeatures" value="Commentaries"> Commentaries<br>
					    		<input type="checkbox" name="specialFeatures" id="specialFeatures" value="Deleted Scenes"> Deleted Scenes<br>
					    		<input type="checkbox" name="specialFeatures" id="specialFeatures" value="Behind the Scenes"> Behind the Scenes<br>
					    	</td>
					    </tr>
					</table>
					<div class="d-flex justify-content-between" style="width: 800px;">
						<div><span class="text-danger">* 표시는 필수항목</span></div>
						<div>
							<button type="reset" class="btn btn-sm btn-outline-danger" style="margin-right: 5px">Reset</button>
							<button id="btnAddFilm" type="button" class="btn btn-sm btn-outline-success">Film Add</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>