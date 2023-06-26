package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllers.Legado.CandidatoCreateAndFind;
import dao.CandidatoDao;
import model.Candidato;

@WebServlet("/CandidatoUpdate")
public class CandidatoUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CandidatoUpdate() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int candidatoId = Integer.parseInt(request.getParameter("candidatoId"));
		
		Candidato candidato = CandidatoDao.findByPk(candidatoId);
		
		request.setAttribute("candidato", candidato);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("UpdateCandidato.jsp");
		requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Candidato candidato = new Candidato();
		
		candidato.setId(Integer.parseInt(request.getParameter("id")));
		candidato.setNome(request.getParameter("nome"));
		candidato.setNumero(request.getParameter("numero"));
		candidato.setTipo(request.getParameter("tipo"));
		candidato.setPartido(request.getParameter("partido"));
		
		CandidatoDao.update(candidato);
		
		CandidatoCreateAndFind createAndFind = new CandidatoCreateAndFind();
		createAndFind.doGet(request, response);
	}

}
