package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Product;
import model.ProductDAO;
/**
 * Servlet implementation class ProductController
 */
@WebServlet(urlPatterns = {"/ProductController", "/products", "/insert"})
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	String action;
	
	ProductDAO dao = new ProductDAO();
	
	Product product = new Product();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		action = request.getServletPath();
		if(action.equals("/products")) {
			products(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		action = request.getServletPath();
		if (action.equals("/insert")) {
			insert(request, response);
		}
	}
	
	protected void products(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("admin/admin.jsp");
		rd.forward(request, response);
	}
	
	protected void insert(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		product.setName(request.getParameter("name"));
		product.setPrice(Float.parseFloat(request.getParameter("price")));
		product.setDescription(request.getParameter("description"));
		product.setImg(request.getParameter("img"));
		product.setQuantity(Integer.parseInt(request.getParameter("quantity")));
		dao.insert(product);
		response.sendRedirect("products");
	}

}
