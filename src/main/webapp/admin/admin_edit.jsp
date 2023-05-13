<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Administration</title>
</head>
<body>
	<h1>Edit product</h1>
	<form name="frmProduct" action="update" method="post" id="frmProduct" enctype="multipart/form-data">
		<input type="number" name="id" placeholder="id" readonly value="<%out.print(request.getAttribute("id"));%>">
		<input type="text" name="name" placeholder="name" value="<%out.print(request.getAttribute("name"));%>">
		<input type="number" name="price" placeholder="price" value="<%out.print(request.getAttribute("price"));%>">
		<input type="text" name="description" placeholder="description" value="<%out.print(request.getAttribute("description"));%>">
		<input type="file" name="image" value="<%out.print(request.getAttribute("img"));%>">
		<input type="text" name="imgUrl" placeholder="img" readonly value="<%out.print(request.getAttribute("img"));%>">
		<input type="number" name="quantity" placeholder="quantity" value="<%out.print(request.getAttribute("quantity"));%>">
		
		<button type="submit" value="Submit" form="frmProduct">Update</button>
	</form>
</body>
</html>