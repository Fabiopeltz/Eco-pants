package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;
import model.UserDAO;

/**
 * Servlet implementation class UserController
 */
@WebServlet(urlPatterns={"/UserController", "/login_page", "/register_page", "/insertUser", "/authenticateUser", "/logout"})
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	String action;
	UserDAO userDao = new UserDAO();
	User user = new User();
	HttpSession session;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		action = request.getServletPath();
		if (action.equals("/login_page")) {
			RequestDispatcher rd = request.getRequestDispatcher("app/login.jsp");
			rd.forward(request, response);
		} else if (action.equals("/logout")) {
			session.invalidate();
			response.sendRedirect("home");
		} else if (action.equals("/register_page")) {
			RequestDispatcher rd = request.getRequestDispatcher("app/register.jsp");
			rd.forward(request, response);
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		action = request.getServletPath();
		if(action.equals("/insertUser")) {
			insert(request, response);
		} else if(action.equals("/authenticateUser")) {
			authenticate(request, response);
		}
	}
	
	protected void insert(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		user.setName(request.getParameter("name"));
		user.setLastname(request.getParameter("lastname"));
		user.setEmail(request.getParameter("email"));
		user.setPassword(request.getParameter("password"));	
		
		RequestDispatcher rd;
		
		if (userDao.insert(user)) {
			request.setAttribute("status", "Registered! You can log-in now.");
			rd = request.getRequestDispatcher("app/login.jsp");
		} else {
			request.setAttribute("status", "Invalid email");
			rd = request.getRequestDispatcher("app/register.jsp");
		}
		rd.forward(request, response);
	}
	
	protected void authenticate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		user.setEmail(request.getParameter("email"));
		user.setPassword(request.getParameter("password"));
		
		if(userDao.authenticate(user)) {
			session = request.getSession();
			session.setAttribute("user", userDao.getUserByEmail(user.getEmail()));			
			request.setAttribute("session", session);
			response.sendRedirect("home");
		} else {
			request.setAttribute("status", "Error");
			RequestDispatcher rd = request.getRequestDispatcher("app/login.jsp");
			rd.forward(request, response);
		}
	}
}
