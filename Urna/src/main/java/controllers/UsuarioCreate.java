package controllers;

import java.io.IOException;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.text.SimpleDateFormat;

import dao.UsuarioDao;
import model.Usuario;

@WebServlet("/UsuarioCreate")
public class UsuarioCreate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String mensagem = "Usuario cadastrado com sucesso";
	    request.setAttribute("mensagemCadastro", mensagem);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("Login.jsp");
		requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Usuario usuario = new Usuario();

		
		usuario.setLogin(request.getParameter("login"));
		usuario.setSenha(request.getParameter("senha"));
		usuario.setNome(request.getParameter("nome"));
		usuario.setNascimento(request.getParameter("nascimento"));
		usuario.setCpf(request.getParameter("cpf"));
		
		UsuarioDao.create(usuario);
		doGet(request, response);
		
		

	}

}
