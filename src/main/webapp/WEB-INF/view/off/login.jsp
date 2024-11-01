<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	$(document).ready(function() { // <body> 까지 메모리에 로드 후 진행
		//btn 버튼 클릭 시 Form값 유효성 검사
		$('#staffId').focus();
		
		$('#btn').click(function() {
			console.log('click');
			// 숫자가 아니면
			if($('#staffId').val().trim() === "" || $('#password').val().trim() === "") {
				if(!($('#staffId').val().trim() === "")) {
					alert('비밀번호를 입력하세요');
					$('#password').focus();
					return;
				}
				alert('아이디, 비밀번호를 입력하세요');
				$('#staffId').focus();
			} else if(!$.isNumeric($('#staffId').val())) { // $.isNumeric($('#staffId').val()) == false 
				alert('Staff ID는 숫자만 입력 가능');
				$('#staffId').focus();
			} else if($('#password').val().length < 4) {
				alert('Password는 4자리 이상 입력');
				$('#password').focus();
			} else {
				$('#loginForm').submit();
			}

		});
	});
</script>

<style>
	.custom-bg-light {
	    background-color: #8BBDFF !important; /* !important : 기존 Bootstrap 클래스를 덮어쓰기 */
	}
</style>
<meta charset="UTF-8">
<title>Staff Login</title>
</head>

<body class="container vh-100 d-flex justify-content-center align-items-center">
	<div class="row w-100">
		<div class="col-12 col-md-6 col-lg-4 mx-auto pt-5 p-4 bg-light text-body rounded">
			<h1 class="mt-2 mb-4 text-center" style="font-weight: bold;">Staff Login</h1>
			<div class="mt-3 text-center text-danger">&nbsp;${loginMsg}&nbsp;</div>
			<form id="loginForm" method="post" action="${pageContext.request.contextPath}/off/login">
				<div class="mb-4 mt-3">
					<label for="staffId" class="form-label">Staff ID:</label> 
					<input id="staffId" type="text" class="form-control" placeholder="Enter staff ID" name="staffId">
				</div>
				<div class="mb-4">
					<label for="password" class="form-label">Password:</label> 
					<input id="password" type="password" class="form-control" placeholder="Enter password" name="password">
				</div>
				<br>
				<button id="btn" type="button" class="btn btn-primary w-100 mb-3">Login</button>
			</form>
			<br><br><br><br>
		</div>
	</div>
</body>
</html>