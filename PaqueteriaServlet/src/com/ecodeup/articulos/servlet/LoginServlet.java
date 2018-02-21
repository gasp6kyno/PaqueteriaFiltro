package com.ecodeup.articulos.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		// me llega la url "proyecto/login/out"
		System.out.println("Peticion GET");
		String action = (request.getPathInfo() != null ? request.getPathInfo() : "/out");
		HttpSession sesion = request.getSession();
		if (action.equals("/out")) {
			sesion.invalidate();
			response.sendRedirect("vista/login.jsp");
			System.out.println("Sesion borrada");
		} else {
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		
		HttpSession sesion = request.getSession();
		String usu, pass;
		usu = request.getParameter("user");
		pass = request.getParameter("password");
		
		if (usu.equals("admin") && pass.equals("admin") && sesion.getAttribute("usuario") == null) {
			// si coincide usuario y password y además no hay sesión iniciada
			sesion.setAttribute("usuario", usu);
			// redirijo a página con información de login exitoso
			response.sendRedirect("privada/register.jsp");
		} else {
			// lógica para login inválido
			response.sendRedirect("/vista/login.jsp");
			System.out.println("Error de login");
		}
	}
}
