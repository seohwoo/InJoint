<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>list</h1>
<table>
<tr>
	<td>글번호</td>
	<td>제목</td>
	<td>작성자</td>
	<td>등록일</td>
</tr>
<c:forEach items="${list}" var="con">
	<tr>
		<td>${con.no}</td>
		<td><a href="/Approval/aprvlContent?num=${con.no}">${con.title}</a></td>
		<td>${con.writer}</td>
		<td>${con.reg}</td>
	</tr>
</c:forEach>
</table>