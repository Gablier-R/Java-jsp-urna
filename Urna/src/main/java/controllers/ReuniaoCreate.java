package controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import controllers.Legado.CandidatoCreateAndFind;
import dao.ReuniaoDao;
import dao.UsuarioDao;
import model.Reuniao;
import model.Usuario;

@WebServlet("/ReuniaoCreate")
public class ReuniaoCreate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher requestDispatcher = request.getRequestDispatcher("ListaReuniao.jsp");
		requestDispatcher.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Reuniao reuniao = new Reuniao();

		reuniao.setTitulo(request.getParameter("titulo"));
		reuniao.setData(request.getParameter("data"));
		reuniao.setHora(request.getParameter("hora"));
		reuniao.setLocal(request.getParameter("local"));

		String[] participantesSelecionados = request.getParameterValues("participantes");
		Gson gson = new Gson();

        // Converter o array em formato JSON
        String json = gson.toJson(participantesSelecionados);
        System.out.println(json);
		List<Usuario> participantes = new ArrayList<>();
		int id = ReuniaoDao.create(reuniao);
		reuniao.setIdReuniao(id);
		if (participantesSelecionados != null) {
			for (String participanteId : participantesSelecionados) {
				Usuario usuario = new Usuario();
				usuario.setId(Integer.parseInt(participanteId));
				participantes.add(usuario);
			}
		}
		ReuniaoDao.insereParticipante(reuniao, participantes);

		doGet(request, response);
	}

}
