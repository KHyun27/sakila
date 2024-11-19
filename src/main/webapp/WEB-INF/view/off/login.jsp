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
		$('#username').focus();
		
		$('#btn').click(function() {
			console.log('click');
			// 숫자가 아니면
			if($('#username').val() == null || $('#username').val() == '' ) {
				alert('Staff ID를 입력하세요');
				$('#username').focus();
				return false;
			} else if(!/^[a-zA-Z가-힣]+$/.test($('#username').val())) {  // 문자만 허용하는 정규표현식 사용 
				alert('Staff ID는 글자만 입력 가능');
				$('#username').focus();
				return false;
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
					<label for="username" class="form-label">Staff Username:</label> 
					<input id="username" type="text" class="form-control" placeholder="Enter Staff ID" name="username">
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