<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Administration</title>
</head>
<body>
	<h1>Register product:</h1>
	<form name="frmProduct" action="insert" method="post" id="frmProduct">
		<input type="text" name="name" placeholder="name">
		<input type="number" name="price" placeholder="price">
		<input type="text" name="description" placeholder="description">
		<input type="text" name="img" placeholder="img">
		<input type="number" name="quantity" placeholder="quantity">
		
		<button type="submit" value="Submit" form="frmProduct">Add</button>
	</form>
</body>
</html>