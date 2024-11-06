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

	<div class="row">
		<div class="col-sm-2 bg-light">
			<!-- leftMenu.jsp include -->
			<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
		</div>
		<div class="col-sm-10 bg-light">
			<div class="main">
				<!-- main -->
				<!-- Actor -->
				<table class="table text-center" style="width: 500px; border-radius: 10px; overflow: hidden; float: left; margin-right: 30px;">
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
				            <a href="" class="btn btn-sm btn-outline-success" style="margin-top: 5px">Actor 수정</a>
				        </td>
				    </tr>
				</table>
				
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
				                <img src="${pageContext.request.contextPath}/upload/${af.filename}.${af.ext}">
				            </td>
				            <td>${af.type}</td>
				            <td>${af.size} Byte</td>
				            <td>${af.createDate}</td>
				            <td><a href="">삭제</a></td>
				        </tr>
				    </c:forEach>
				    <tr>
				        <td colspan="5" style="text-align: right; background-color: transparent; border-bottom-color: transparent;">
				            <a href="" class="btn btn-sm btn-outline-success" style="margin-top: 5px">Image 추가</a>
				        </td>
				    </tr>
				</table>
				<div style="clear: both;"></div>
				
				<!-- clear float을 위한 div -->

				<hr style="width:1330px">
				<!-- Film -->
				<table class="table table-success text-center" style="width:500px; border-bottom-color: transparent; border-radius: 10px; overflow: hidden;">
					<tr>
						<th style="font-size: x-large;">Film List</th>
					</tr>
				</table>
				<table class="table table-sm text-center" style="width:500px; border-radius: 10px; overflow: hidden; border-bottom-style: hidden;">
					<c:forEach var="f" items="${filmList}">
						<tr>
							<td><a class="film-link" href="${pageContext.request.contextPath}/on/filmOne?filmId=${f.filmId}">${f.title}</a></td>
						</tr>
					</c:forEach>
				</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>