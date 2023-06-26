package controllers.Legado;

import java.io.IOException;

import java.io.InputStream;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.mysql.cj.jdbc.Blob;

import dao.CandidatoDao;
import model.Candidato;

@WebServlet("/CandidatoCreateAndFind")
public class CandidatoCreateAndFind extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String pesquisa = request.getParameter("pesquisa");
		
		if (pesquisa.equals("")) {
			pesquisa = "%";
		}
		
		List<Candidato> candidatos = CandidatoDao.find(pesquisa);
		
		request.setAttribute("candidatos", candidatos);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("CreateReuniao.jsp");
		requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Candidato candidato = new Candidato();
		
		candidato.setNome(request.getParameter("nome"));
		candidato.setNumero(request.getParameter("numero"));
		candidato.setTipo(request.getParameter("tipo"));
		candidato.setPartido(request.getParameter("partido"));

		CandidatoDao.create(candidato);
		doGet(request, response);
	}

}
