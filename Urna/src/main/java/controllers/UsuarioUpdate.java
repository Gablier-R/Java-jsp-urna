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

@WebServlet("/UsuarioUpdate")
public class UsuarioUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int usuarioId = Integer.parseInt(request.getParameter("usuarioId"));
		
		Usuario usuario = UsuarioDao.findByPk(usuarioId);
		
		request.setAttribute("usuario", usuario);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("ListaUsuario.jsp");
		requestDispatcher.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Usuario usuario = new Usuario();
		
		usuario.setId(Integer.parseInt(request.getParameter("id")));
		usuario.setNome(request.getParameter("nome"));
		usuario.setLogin(request.getParameter("login"));
		usuario.setCpf(request.getParameter("cpf"));
		usuario.setNascimento(request.getParameter("nascimento"));
		usuario.setSenha(request.getParameter("senha"));
		
		UsuarioDao.update(usuario);

	    HttpSession sessao = request.getSession(true);
		sessao.invalidate();
		
		String mensagem = "Dados atualizados com sucesso";
	    request.setAttribute("mensagemUpdate", mensagem);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("Login.jsp");
		requestDispatcher.forward(request, response);

	}

}
