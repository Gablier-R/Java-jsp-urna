package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UsuarioDao;
import model.Usuario;

@WebServlet("/LoginUsuario")
public class LoginUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");
		
		try {
			UsuarioDao dao = new UsuarioDao();
			Usuario usuario = new Usuario();
			usuario = dao.logar(login,senha);

				if(usuario != null) {
				HttpSession sessao = request.getSession(true);
				
				sessao.setAttribute("id", usuario.getId());
				sessao.setAttribute("login", usuario.getLogin());
				sessao.setAttribute("nome", usuario.getNome());
				
				response.sendRedirect("Home.jsp");
				
			}else {
				String mensagem = "Credencias incorretas";
			    request.setAttribute("mensagem", mensagem);
			    RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp");
			    dispatcher.forward(request, response);
			}
		} catch (Exception e) {
			System.out.println("Erro: "+e.getMessage());
			response.sendRedirect("Erro.jsp");
		}
	}

}
