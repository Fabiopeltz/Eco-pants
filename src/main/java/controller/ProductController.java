package controller;

import java.io.IOException;
import java.util.ArrayList;

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
@WebServlet(urlPatterns = {"/ProductController", "/admin_main", "/insert", "/delete", "/select", "/update"})
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	String action;
	
	ProductDAO productDao = new ProductDAO();
	
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
		if(action.equals("/admin_main")) {
			products(request, response);
		} else if(action.equals("/select")) {
			select(request, response);
		} else if(action.equals("/delete")) {
			delete(request, response);
		} 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		action = request.getServletPath();
		if (action.equals("/insert")) {
			insert(request, response);
		} else if(action.equals("/update")) {
			update(request, response);
		}
	}
	
	protected void products(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<Product> products = productDao.getProducts();
		request.setAttribute("products", products);
		RequestDispatcher rd = request.getRequestDispatcher("admin/admin_home.jsp");
		rd.forward(request, response);
	}
	
	protected void insert(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		product.setName(request.getParameter("name"));
		product.setPrice(Float.parseFloat(request.getParameter("price")));
		product.setDescription(request.getParameter("description"));
		product.setImg(request.getParameter("img"));
		product.setQuantity(Integer.parseInt(request.getParameter("quantity")));
		productDao.insert(product);
		response.sendRedirect("admin_main");
	}
	
	protected void select(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		product.setId(Integer.parseInt(request.getParameter("id")));
		productDao.select(product);
		request.setAttribute("id", product.getId());
		request.setAttribute("name", product.getName());
		request.setAttribute("price", product.getPrice());
		request.setAttribute("description", product.getDescription());
		request.setAttribute("img", product.getImg());
		request.setAttribute("quantity", product.getQuantity());
		RequestDispatcher rd = request.getRequestDispatcher("admin/admin_edit.jsp");
		rd.forward(request, response);
	}
	
	protected void update (HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		product.setId(Integer.parseInt(request.getParameter("id")));
		product.setName(request.getParameter("name"));
		product.setPrice(Float.parseFloat(request.getParameter("price")));
		product.setDescription(request.getParameter("description"));
		product.setImg(request.getParameter("img"));
		product.setQuantity(Integer.parseInt(request.getParameter("quantity")));
		productDao.update(product);
		response.sendRedirect("admin_main");
	}
	
	protected void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		product.setId(Integer.parseInt(request.getParameter("id")));
		productDao.delete(product);
		response.sendRedirect("admin_main");
	}
	
}
