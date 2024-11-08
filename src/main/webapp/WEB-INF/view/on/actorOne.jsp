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
			$('#btnSearchFilm').click(function(){
				$('#formSearchFilm').submit();
			});
			// 출연작(film 추가)
			$('#btnAddFilm').click(function(){
				$('#formAddFilm').submit();
			});
			
		});
	</script>
	<style>
		.main {
			margin-top: 50px;
			margin-left: 50px;
		}
		
		.modify-link{
       		color: #008000;
        	text-decoration: none;
        }
        .modify-link:hover {
            color: #002266;
            text-decoration: none;
        }
        .modify-link:visited {
      		color: #DodgerBlue;
      		text-decoration: none;
    	}
		.modify-cell {
	        display: flex;
	        justify-content: space-between;
	        align-items: center;
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
        
    	
	</style>
	<meta charset="UTF-8">
	<title>Actor One</title>
</head>

<body class="container-fluid bg-light p-3">

	<div class="bg-light"><!-- header.jsp -->
		<c:import url="/WEB-INF/view/on/inc/headMenu.jsp"></c:import>
	</div>
	<!-- 
		√ 1) actor 상세
		1-1) actor 수정 /on/modifyActor
		1-2) actor 삭제 /on/removeActor (actor_file 삭제 + film_actor 삭제 + actor 삭제)
		 
		√ 2) actor_file List
		√ 2-1) actor_file 추가
		√ 2-2) actor_file 삭제 /on/removeActorFile
		
		√ 3) film_actor List
		3-1) film_actor 추가 /on/addFilmByActor → Film 검색 후 선택
		3-2) film_actor 삭제 /on/removeFilmActor
	 -->

	<div class="row">
		<div class="col-sm-2 bg-light">
			<!-- leftMenu.jsp include -->
			<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
		</div>
		<div class="col-sm-10 bg-light">
			<div class="main">
				<!-- main -->
				<!-- Actor -->
				<div style="float: left;">
				<table class="table text-center" style="width: 500px; border-radius: 10px; overflow: hidden; margin-right: 30px;">
				    <tr>
				        <th class="table-success text-center" colspan="2">Actor Info</th>
				    </tr>
				    <tr>
				        <th>Actor ID</th>
				        <td>${actor.actorId}</td>
				    </tr>
				    <tr>
				        <th>First Name</th>
				        <td>${actor.firstName}</td>
				    </tr>
				    <tr>
				        <th>Last Name</th>
				        <td>${actor.lastName}</td>
				    </tr>
				    <tr>
				        <th>Last Update</th>
				        <td>${actor.lastUpdate}</td>
				    </tr>
				    <tr>
				        <td colspan="2" style="text-align: right; background-color: transparent; border-bottom-color: transparent;">
				            <a href="${pageContext.request.contextPath}/on/modifyActor?actorId=${actor.actorId}" class="btn btn-sm btn-outline-success" style="margin-top: 5px">Modify Actor</a>
				        </td>
				    </tr>
				</table>
				
				<!-- Film -->
				<div>
					<table class="table table-sm text-center" style="width:500px; border-radius: 10px; overflow: hidden; border-bottom-style: hidden;">
						<tr>
							<th class="table-success" colspan="3">Film List</th>
						</tr>
						<c:forEach var="f" items="${filmList}">
							<tr>
								<td align="right">${f.filmId}</td>
								<td><a class="film-link" href="${pageContext.request.contextPath}/on/filmOne?filmId=${f.filmId}">${f.title}</a></td>
								<td><a href="${pageContext.request.contextPath}/on/removeFilmActor?filmId=${f.filmId}&actorId=${actor.actorId}" class="film-link" style="color: red;">삭제</a></td>
								<!-- 삭제 시 f.filmId & actor.actorId 필요 -->
							</tr>
						</c:forEach>
					</table>
				</div>
				<!-- 출연작 추가 -->
				<div class="d-flex justify-content-end mb-2" style="width: 500px;">
					<div>
						${param.existsMsg}
					</div>
					<!-- 출연작 추가 -->
					<div>
						<form id="formSearchFilm" method="get" action="${pageContext.request.contextPath}/on/actorOne"><!-- 영화 검색 -->
							<!-- film 검색 시 actorId 같이 전송 -->
							<input type="hidden" name="actorId" value="${actor.actorId}">
							<input type="text" name="searchTitle">
							<button id="btnSearchFilm" type="button" class="btn btn-sm btn-outline-success">Search</button>
						</form>
					</div>
				</div>
				<div class="d-flex justify-content-end" style="width: 500px;">
					<form id="formAddFilm" method="post" action="${pageContext.request.contextPath}/on/addFilmByActor">
						<input type="hidden" name="actorId" value="${actor.actorId}">
						<div class="d-flex justify-content-end mb-2" style="width: 500px;">
							<c:if test="${empty searchFilmList}">
								<br>
							</c:if>
							<c:if test="${not empty searchFilmList}">
							<select size="3" name="filmId">
								<c:forEach var="sf" items="${searchFilmList}">
									<option value="${sf.filmId}">[${sf.filmId}] ${sf.title}</option>
								</c:forEach>
							</select>
							</c:if>	
						</div>
						
						<div class="d-flex justify-content-end" style="width: 500px;">
							<c:if test="${not empty searchFilmList}">
								<button id="btnAddFilm" type="button" class="btn btn-sm btn-outline-success">Add</button>
							</c:if>
						</div>
						
					</form>
				</div>
				</div>
				
				<table class="table text-center" style="width: 800px; border-radius: 10px; overflow: hidden; float: left;">
				    <tr>
				        <th class="table-success text-center" colspan="5">Actor Image</th>
				    </tr>
				    <tr>
				        <th>Image</th>
				        <th>Type</th>
				        <th>Size</th>
				        <th>Create Date</th>
				        <th>Delete</th>
				    </tr>
				    <c:forEach var="af" items="${actorFileList}">
				        <tr>
				            <td>
				                <img width="100px" src="${pageContext.request.contextPath}/upload/${af.filename}.${af.ext}">
				            </td>
				            <td>${af.type}</td>
				            <td>${af.size} Byte</td>
				            <td>${af.createDate}</td>
				            <td><a href="${pageContext.request.contextPath}/on/removeActorFile?actorFileId=${af.actorFileId}&actorId=${actor.actorId}" class="btn btn-sm btn-outline-danger">삭제</a></td>
				        </tr>
				    </c:forEach>
				    <tr>
				        <td colspan="5" style="text-align: right; background-color: transparent; border-bottom-color: transparent;">
				            <a href="${pageContext.request.contextPath}/on/addActorFile?actorId=${actor.actorId}" class="btn btn-sm btn-outline-success" style="margin-top: 5px">Image 추가</a>
				        </td>
				    </tr>
				</table>
				<div style="clear: both;"></div><!-- clear float을 위한 div -->
				<hr style="width:1330px">
			</div>
		</div>
	</div>
</body>
</html>