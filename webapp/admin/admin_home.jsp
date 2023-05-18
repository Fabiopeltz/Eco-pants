<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="model.Product"%>
<%@ page import="java.util.ArrayList"%>

<% 
	@SuppressWarnings ("unchecked")
	ArrayList<Product> products = (ArrayList<Product>) request.getAttribute("products");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Administration</title>
</head>
<body>
	<h1>Register product:</h1>
	<form name="frmProduct" action="insert" method="post" id="frmProduct" enctype="multipart/form-data">
		<input type="text" name="name" placeholder="name">
		<input type="number" name="price" placeholder="price">
		<input type="text" name="description" placeholder="description">
		<input type="text" name="image" placeholder="img">
		<input type="number" name="quantity" placeholder="quantity">
		
		<button type="submit" value="Submit" form="frmProduct">Add</button>
	</form>
	<h1>Products:</h1>
	<table>
		<tr>
			<th>id</th>
			<th>name</th>
			<th>price</th>
			<th>description</th>
			<th>img</th>
			<th>quantity</th>
		</tr>
		<%
			for(Product i : products) {
		%>
		<tr>
			<td><%=i.getId()%></td>
			<td><%=i.getName()%></td>
			<td><%=i.getPrice()%></td>
			<td><%=i.getDescription()%></td>
			<td><%=i.getImg()%></td>
			<td><%=i.getQuantity()%></td>
			<td><a href="select?id=<%=i.getId()%>"><b>Edit</b></a></td>
			<td><a href="delete?id=<%=i.getId()%>"><b>X</b></a></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>