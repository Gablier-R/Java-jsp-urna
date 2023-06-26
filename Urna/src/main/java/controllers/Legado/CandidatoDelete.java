package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllers.Legado.CandidatoCreateAndFind;
import dao.CandidatoDao;

@WebServlet("/CandidatoDelete")
public class CandidatoDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CandidatoDelete() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int clienteId =  Integer.parseInt(request.getParameter("candidatoId"));
		CandidatoDao.delete(clienteId);
		
		CandidatoCreateAndFind createAndFind = new CandidatoCreateAndFind();
		createAndFind.doGet(request, response);
	}
}
