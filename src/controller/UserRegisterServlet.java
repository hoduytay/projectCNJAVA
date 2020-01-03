package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAOImpl;
import model.User;

/**
 * Servlet implementation class UserRegisterServlet
 */
@WebServlet("/UserRegisterServlet")
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAOImpl userDAO = new UserDAOImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		String url = "/login.jsp";
		String username_err = "",password_err = "";
		if(username.equals("") || password.equals("")) {
			username_err += "Vui long nhap du thong tin";
		}else {
			if(userDAO.checkUsername(username) == true) {
				username_err += "user da ton tai";
			}
		}
		
			if(password.equals("")) {
				password_err += "Vui long nhap mat khau";
			}else {
			if(password.length()<5) {
				password_err += "Mat khau phai it nhat 6 ky tu";
			}
		}
		if(username_err.length()>0) {
			request.setAttribute("username_err", username_err);
			request.setAttribute("username", username);
		}
		if(password_err.length()>0) {
			request.setAttribute("password_err", password_err);
		}
		try {
			if(username_err.length()== 0 && password_err.length() == 0) {
				userDAO.insertUser(new User(0,username,password,2));
				HttpSession session = request.getSession();
				session.getAttribute(username);
				url = "/index.jsp";
			}else {
				url = "/login.jsp";
			}
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
