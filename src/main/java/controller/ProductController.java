package controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.Product;
import model.ProductDAO;
/**
 * Servlet implementation class ProductController
 */
@WebServlet(urlPatterns = {"/ProductController","/", "/home", "/about", "/admin_main", "/view_product", "/insert", "/delete", "/select", "/update"})
@MultipartConfig(location="/tmp", fileSizeThreshold=1024*1024,
maxFileSize=1024*1024*5, maxRequestSize=1024*1024*5*5)
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
		if(action.equals("/home")) {
			getAllProducts(request, response);
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		} else if(action.equals("/admin_main")) {
			getAllProducts(request, response);
			RequestDispatcher rd = request.getRequestDispatcher("admin/admin_home.jsp");
			rd.forward(request, response);
		} else if(action.equals("/select")) {
			select(request, response);
			RequestDispatcher rd = request.getRequestDispatcher("admin/admin_edit.jsp");
			rd.forward(request, response);
		} else if(action.equals("/delete")) {
			delete(request, response);
		} else if(action.equals("/view_product")) {
			getAllProducts(request, response);
			select(request, response);
			RequestDispatcher rd = request.getRequestDispatcher("app/product.jsp");
			rd.forward(request, response);
		} else if(action.equals("/about")) {
			RequestDispatcher rd = request.getRequestDispatcher("app/about.jsp");
			rd.forward(request, response);
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
	
	protected void getAllProducts(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<Product> products = productDao.getProducts();
		request.setAttribute("products", products);
	}
	
	protected void insert(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		product.setName(request.getParameter("name"));
		product.setPrice(Float.parseFloat(request.getParameter("price")));
		product.setDescription(request.getParameter("description"));
		product.setImg(request.getParameter("image"));
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
	}
	
	protected void update (HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		product.setId(Integer.parseInt(request.getParameter("id")));
		product.setName(request.getParameter("name"));
		product.setPrice(Float.parseFloat(request.getParameter("price")));
		product.setDescription(request.getParameter("description"));
		product.setImg(request.getParameter("image"));
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
	
//	protected String uploadImage(HttpServletRequest request) throws ServletException, IOException {
//		Part filePart = request.getPart("image"); 
//		String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); 
//		InputStream fileContent = filePart.getInputStream();
//		
//		String uploadDirPath = request.getServletContext().getRealPath("/") + "images/";
//		File uploadDir = new File(uploadDirPath);
//		if (!uploadDir.exists()) {
//		    uploadDir.mkdir();
//		}
//
//		String fileExtension = fileName.substring(fileName.lastIndexOf(".") + 1);
//		String newFileName = UUID.randomUUID().toString() + "." + fileExtension;
//
//		Files.copy(fileContent, Paths.get(uploadDirPath + newFileName), StandardCopyOption.REPLACE_EXISTING);
//
//		return newFileName;
//	}
}
