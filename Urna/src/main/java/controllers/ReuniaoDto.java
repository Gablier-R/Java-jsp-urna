package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UsuarioDao;
import model.Usuario;


@WebServlet("/ReuniaoDto")
public class ReuniaoDto extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		List<Usuario> usuarios = UsuarioDao.listaTodos();
		for (Usuario usuario : usuarios) {
			System.out.println(usuario.getNome());
		}

	    request.setAttribute("usuarios", usuarios);

	    RequestDispatcher dispatcher = request.getRequestDispatcher("CreateReuniao.jsp");
	    dispatcher.forward(request, response);
		
	}


}
