<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-sm navbar-light bg-light pb-3">
    <div class="container-fluid">
        <!-- 왼쪽에 위치한 홈 버튼 -->
        <a class="navbar-brand btn btn-light text-muted" href="${pageContext.request.contextPath}/on/sakilaMain">Home</a>

        <!-- 오른쪽에 위치한 버튼들 -->
        <div class="d-flex ms-sm-auto">
            <a class="btn btn-light light text-muted me-2" href="${pageContext.request.contextPath}/on/staffOne">${loginStaff.username}님</a>
            <a class="btn btn-light text-muted me-3" href="${pageContext.request.contextPath}/on/logoutStaff">Logout</a>
        </div>
    </div>
</nav>