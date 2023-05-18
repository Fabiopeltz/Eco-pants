<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="model.Cart"%>
<%@ page import ="java.util.ArrayList"%>
<%
	@SuppressWarnings ("unchecked")
	ArrayList<Cart> cartItems = (ArrayList<Cart>) request.getAttribute("cartItems");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cart test</title>
</head>
<body>
	<form name="frmProduct" action="CartController" method="post" id="frmProduct">
		<input type="text" name="action" placeholder="action">
		<input type="text" name="productId" placeholder="productId">
		<input type="text" name="cartItemId" placeholder="cartItemId">
	
		<button type="submit" value="Submit" form="frmProduct">Test</button>
	</form>

	<%
		if(cartItems != null) {
	%>
		<%
			for(Cart i : cartItems) {
		%>
			<span><%= i.getProduct().getName() %></span>
		<%
			}
		%>
	<%
		}
	%>

</body>
</html>