<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Layout</title>

<style>
	* {
	    margin: 0;
	    padding: 0;
	    line-height: 1;
	}
	#container {
		position: relative;
		width: 100%;
	}
	
	header {
		position: relative;
		width: 20%;
		height: 100%;
		background: #dbdbdb;
	}
	
	#contents {
		position: relative;
		width: 100%;
		height: 100%;
	}
	
	footer {
		position: relative;
		width: 80%;
		height: 100%;
		right: 0;
		background: #000;
	}
</style>
</head>
<body>
	<div id="container">
		<header></header>
		<div id="contents"></div>
		<footer></footer>
	</div>
</body>
</html>