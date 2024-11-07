<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
    #custom-container a:link {
      color: #002266;
      text-decoration: none;
    }
    #custom-container a:visited {
      color: #002266;
      text-decoration: none;
    }
    #custom-container a:hover {
      color: #002266;
      text-decoration: none;
    }
    #custom-container a:active {
      color: #002266;
      text-decoration: none;
    }
</style>

<div id="custom-container">
    <ul class="list-group text-center" style="margin-top: 50px">
        <li class="list-group-item text-white" style="font-weight:bold; background-color: #8BBDDF;">
            :: Store Management ::
        </li>

        <li class="list-group-item">
            <a href="">Store List</a>
        </li>

        <li class="list-group-item">
            <a href="">Store Add</a>
        </li>
    </ul>

    <hr>

    <ul class="list-group text-center">
        <li class="list-group-item text-white" style="font-weight:bold; background-color: #8BBDDF;">
            :: Customer Management ::
        </li>

        <li class="list-group-item">
            <a href="">Customer List</a>
        </li>

        <li class="list-group-item">
            <a href="">Customer Add</a>
        </li>
    </ul>

    <hr>
    
    <ul class="list-group text-center">
        <li class="list-group-item text-white" style="font-weight:bold; background-color: #8BBDDF;">
            :: Film Management ::
        </li>

        <li class="list-group-item">
            <a href="">Film List</a>
        </li>

        <li class="list-group-item">
            <a href="${pageContext.request.contextPath}/on/addFilm">Film Add</a>
        </li>
    </ul>
    
    <hr>

    <ul class="list-group text-center">
        <li class="list-group-item text-white" style="font-weight:bold; background-color: #8BBDDF;">
            :: Actor Management ::
        </li>

        <li class="list-group-item">
            <a href="${pageContext.request.contextPath}/on/actorList">Actor List</a>
        </li>

        <li class="list-group-item">
            <a href="${pageContext.request.contextPath}/on/addActor">Actor Add</a>
        </li>
    </ul>

    <hr>

    <ul class="list-group text-center">
        <li class="list-group-item text-white" style="font-weight:bold; background-color: #8BBDDF;">
            :: Staff Management ::
        </li>

        <li class="list-group-item">
            <a href="${pageContext.request.contextPath}/on/staffList">Staff List</a>
        </li>

        <li class="list-group-item">
            <a href="${pageContext.request.contextPath}/on/addStaff">Staff Add</a>
        </li>
    </ul>
    
    <hr>
    
     <ul class="list-group text-center">
        <li class="list-group-item text-white" style="font-weight:bold; background-color: #8BBDDF;">
        	<a href="${pageContext.request.contextPath}/on/addStaff">:: 통계 ::</a>
        </li>
    </ul>
</div>
