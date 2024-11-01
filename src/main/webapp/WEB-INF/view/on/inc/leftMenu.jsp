<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<ul class="list-group text-center">
	<li class="list-group-item">
		<a href="${pageContext.request.contextPath}/on/sakilaMain">Home</a>
	</li>
	
	<li class="list-group-item">
		<a href="${pageContext.request.contextPath}/on/staffOne">${loginStaff.username}님</a>
	</li>
	
	<li class="list-group-item">
		<a href="${pageContext.request.contextPath}/on/logoutStaff">Logout</a>
	</li>
</ul>

<hr>

<ul class="list-group text-center">
	<li class="list-group-item" style="font-weight:bold;">
		:: 지점 관리 ::
	</li>
	
	<li class="list-group-item">
		<a href="">지점 추가</a>
	</li>
	
	<li class="list-group-item">
		<a href="">지점 수정</a>
	</li>
</ul>

<hr>

<ul class="list-group text-center">
	<li class="list-group-item" style="font-weight:bold;">
		:: 고객 관리 ::
	</li>
	
	<li class="list-group-item">
		<a href="">고객 추가</a>
	</li>
	
	<li class="list-group-item">
		<a href="">고객 수정</a>
	</li>
</ul>

<hr>

<ul class="list-group text-center">
	<li class="list-group-item" style="font-weight:bold;">
		:: Staff Management ::
	</li>
	
	<li class="list-group-item">
		<a href="">Staff Add</a>
	</li>
	
	<li class="list-group-item">
		<a href="">Staff Update</a>
	</li>
</ul>
