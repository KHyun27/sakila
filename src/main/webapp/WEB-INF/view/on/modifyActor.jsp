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
			$('#btnModifyActor').click(function(){
				if($('#firstName').val() == '') {
					alert('First Name을 입력해주세요');
				} else if($('#lastName').val() == '') {
					alert('Last Name을 입력해주세요');
				} else {
					$('#formModify').submit();	
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
        vertical-align: middle;
    	}
    	.table td {
    	padding-left: 90px;
        text-align: left;
        vertical-align: middle;
    	}
	</style>
	<meta charset="UTF-8">
	<title>Modify Actor</title>
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
				<form id="formModify" method="post" action="${pageContext.request.contextPath}/on/modifyActor">
					<table class="table text-center" style="width: 500px; border-radius: 10px; overflow: hidden; margin-right: 30px;">
					    <tr>
					        <th class="table-success text-center" colspan="2">Actor Info</th>
					    </tr>
					    <tr>
					        <th>Actor ID</th>
					        <td>
					        	<input type="text" id="actorId" name="actorId" value="${actorId}" readonly>
					        </td>
					    </tr>
					    <tr>
					        <th>First Name</th>
					        <td>
					        	<input type="text" id="firstName" name="firstName">
					        </td>
					    </tr>
					    <tr>
					        <th>Last Name</th>
					        <td>
					        	<input type="text" id="lastName" name="lastName">
					        </td>
					    </tr>
					    <tr>
					        <td colspan="2" style="text-align: right; background-color: transparent; border-bottom-color: transparent;">
					        	<button type="reset" class="btn btn-sm btn-outline-info" style="margin-top: 5px">Reset</button>
					        	<button id="btnModifyActor" type="button" class="btn btn-sm btn-outline-success" style="margin-top: 5px">Modify</button>
					        	<a href ="${pageContext.request.contextPath}/on/actorOne?actorId=${actorId}" class="btn btn-sm btn-outline-danger" style="margin-top: 5px">Cancel</a>
					        </td>
					    </tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>