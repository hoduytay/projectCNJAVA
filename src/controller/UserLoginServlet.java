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

/**
 * Servlet implementation class UserLoginServlet
 */
@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAOImpl userDAO = new UserDAOImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String command = request.getParameter("command");
		String url = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
		if(command.equals("logout")) {
			HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect(url +"/index.jsp");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		String err = "";
		if(username.equals("")||password.equals("")) {
			err += "Vui long nhap du thong tin";
		}else {
			if(userDAO.checkLogin(username, password)==false) {
				err += "tai khoan hoac mat khaau khong dung";
			}
		}
		if(err.length()>0) {
			request.setAttribute("username", username);
			request.setAttribute("err", err);
		}
		String url = "/login.jsp";
		try {
			if(err.length()==0) {
				HttpSession session = request.getSession();
				session.setAttribute("uname", username);
				url ="/index.jsp";
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
