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
			$('#btnAddFile').click(function() {
				if($('.actorFile').last().val() == '') { // 마지막 input=file값이 공백이라면
					alert('첨부하지 않은 파일이 이미 존재');
				} else {
					let html = '<div><input type="file" name="actorFile" class="actorFile mt-1"></div>';
					$('#fileDiv').append(html);
				}
			});
				
			$('#btnRemoveFile').click(function() {
				if($('.actorFile').length == 0) {
					alert('삭제 할 File이 존재하지 않습니다');
				} else {
					$('.actorFile').last().closest('div').remove();	
				}
			});
			
			$('#btnAddActor').click(function() {
				if($('#firstName').val() == null || $('#firstName').val() == '') {
					alert('First Name을 입력하세요');
				} else if($.isNumeric($('#firstName').val())) {
					alert('First Name은 글자만 입력 가능합니다');
				} else if($('#lastName').val() == null || $('#lastName').val() == '') {
					alert('Last Name을 입력하세요');
				} else if($.isNumeric($('#lastName').val())) {
					alert('Last Name은 글자만 입력 가능합니다');
				} else if($('.actorFile').length > 0 && $('.actorFile').last().val() == '') {
					alert('첨부되지 않은 파일이 있습니다');
				} else {
					$('#formActor').submit();
				}
			});
			
			$('#btnAddActorFile').click(function(){
				if($('.actorFile').length == 0) {
					alert('첨부 할 파일이 없습니다');
				} else if($('.actorFile').last().val() == '') {
					alert('첨부되지 않은 파일이 있습니다');
				} else {
					$('#formAddActorFile').submit();
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
        text-align: center;
    	}
    	.table td {
    	padding-left: 90px;
        text-align: left;
    	}
		
	</style>
	<meta charset="UTF-8">
	<title>Add Actor File</title>
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
				<form id="formAddActorFile" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/on/addActorFile">
					<table class="table" style="width: 600px; border-radius: 10px; overflow: hidden; margin-right: 30px;">
						<tr>
					        <th class="table-success text-center" colspan="2">Actor File ADD</th>
					    </tr>
					    <tr>
					    	<th>Actor ID</th>
					    	<td>
					    		<input type="text" name="actorId" value="${actorId}" readonly>
					    	</td>
					    </tr>
					    <tr>
					    	<th>File</th>
					    	<td>
					    		<div id="fileDiv">
									<button id="btnAddFile" type="button" class="btn btn-sm btn-outline-success">파일추가</button>
									<button id="btnRemoveFile" type="button" class="btn btn-sm btn-outline-danger">파일삭제</button>
									<div><input type="file" name="actorFile" class="actorFile mt-1"></div>
								</div>
					    	</td>
					    </tr>
					</table>
					<button id="btnAddActorFile" type="button" class="btn btn-sm btn-outline-success">배우 파일 추가</button>
					<div>${msg}</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>