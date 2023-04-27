package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cart;
import model.CartDAO;
import model.User;

/**
 * Servlet implementation class CartController
 */
@WebServlet(urlPatterns={"/CartController","/getCart"})
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	String action;
	CartDAO cartDao = new CartDAO();
	Cart cart = new Cart();
	HttpSession session;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session = request.getSession();
		action = request.getServletPath();
		User user = (User) session.getAttribute("user");
		
		if(action.equals("/getCart")) {
			ArrayList<Cart> cartItems = cartDao.getCartItemsByUser(user.getId());
	        request.setAttribute("cartItems", cartItems);
	        RequestDispatcher rd = request.getRequestDispatcher("app/cart.jsp");
			rd.forward(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("app/cart.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 session = request.getSession();
		 action = request.getParameter("action");
		 
		 User user = (User) session.getAttribute("user");
		 
		 if (action.equals("addToCart")) {
	            int productId = Integer.parseInt(request.getParameter("productId"));

	            // Check if product already exists in cart
	            Cart cartItem = cartDao.getCartItem(user.getId(), productId);

	            if (cartItem == null) {
	                // If product doesn't exist in cart, add it
	                Cart newCartItem = new Cart();
	                newCartItem.setProductId(productId);
	                newCartItem.setUserId(user.getId());
	                newCartItem.setQuantity(1);
	                cartDao.insert(newCartItem);
	            } else {
	                // If product already exists in cart, increase its quantity by 1
	                cartItem.setQuantity(cartItem.getQuantity() + 1);
	                cartDao.increaseCartItemQuantity(user.getId(), cartItem.getQuantity());
	            }

	            RequestDispatcher rd = request.getRequestDispatcher("app/cart.jsp");
	    		rd.forward(request, response);
		 } else if (action.equals("removeCartItem")) {
	            int cartItemId = Integer.parseInt(request.getParameter("cartItemId"));

	            cartDao.deleteCartItem(user.getId(), cartItemId);

	            RequestDispatcher rd = request.getRequestDispatcher("app/cart.jsp");
	    		rd.forward(request, response);
		 } 
	}
}


