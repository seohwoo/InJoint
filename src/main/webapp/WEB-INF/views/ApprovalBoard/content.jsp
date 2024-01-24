<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <table>
<tr>
	<td>${dto.no}</td>
	<td>${dto.title}</td>
	<td>${dto.content}</td>
	<td>${dto.process}</td>
	<td>${dto.reg}</td>
	<td><a href="/Approval/boardUpdate?num=${dto.no}">수정하기</a></td>
	<td><a href="/Approval/boardDelete?num=${dto.no}">삭제하기</a></td>
</tr>
</table>