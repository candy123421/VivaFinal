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
		<th>Pack_no</th>
		<th>pack_name</th>
		<th>pack_content</th>
		<th>Source_no</th>
		<th>Tag_no</th>
		<th>악기</th>
		<th>장르</th>
		<th>User_no</th>
		<th>Pack_Img_Originname</th>
		<th>Pack_Img_Storedname</th>
		<th>File_Originname</th>
		<th>File_Storedname</th>
		
	</tr>
<c:forEach var="list" items="${list }">
	<tr>
		<td>${list.PACK_NO }</td>
		<td>${list.PACK_NAME }</td>
		<td>${list.PACK_CONTENT }</td>
		<td>${list.SOURCE_NO }</td>
		<td>${list.TAG_NO }</td>
		<td>${list.INSTRUMENT }</td>
		<td>${list.GENRE }</td>
		<td>${list.USER_NO }</td>
		<td>${list.PACK_IMG_ORIGINNAME }</td>
		<td>${list.PACK_IMG_STOREDNAME }</td>
		<td>${list.FILE_ORIGINNAME }</td>
		<td>${list.FILE_STOREDNAME }</td>
	</tr>


</c:forEach>
</table>
	



</body>
</html>