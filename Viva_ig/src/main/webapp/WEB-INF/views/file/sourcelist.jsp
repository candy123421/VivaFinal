<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sourcelist</title>
</head>
<body>

<h1>SourceList</h1>
<hr>
<table border="1">
	<tr>
		<th>Source_no</th>
		<th>Source_name</th>
		<th>BPM</th>
		<th>KEY</th>
		<th>Source_price</th>
		<th>Tag_no</th>
		<th>악기</th>
		<th>악기세부분류</th>
		<th>장르</th>
		<th>분위기</th>
		<th>Fx</th>
		<th>Pack_no</th>
		<th>User_no</th>
		<th>Img_Originname</th>
		<th>Img_Storedname</th>
		<th>File_Originname</th>
		<th>File_Storedname</th>
		
	</tr>
<c:forEach var="list" items="${list }">
	<tr>
		<td>${list.SOURCE_NO }</td>
		<td>${list.SOURCE_NAME }</td>
		<td>${list.BPM }</td>
		<td>${list.KEY }</td>
		<td>${list.sourcePrice }</td>
		<td>${list.TAG_NO }</td>
		<td>${list.INSTRUMENT }</td>
		<td>${list.DETAIL }</td>
		<td>${list.GENRE }</td>
		<td>${list.SCAPE }</td>
		<td>${list.FX }</td>
		<td>${list.PACK_NO }</td>
		<td>${list.USER_NO }</td>
		<td>${list.SOURCE_IMG_ORIGINNAME }</td>
		<td>${list.SOURCE_IMG_STOREDNAME }</td>
		<td>${list.FILE_ORIGINNAME }</td>
		<td>${list.FILE_STOREDNAME }</td>
	</tr>


</c:forEach>
</table>
	



</body>
</html>