package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReuniaoDao;
import model.Reuniao;

@WebServlet("/ReuniaoLista")
public class ReuniaoLista extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			List<Reuniao> reunioes = ReuniaoDao.listaTodos();


	    request.setAttribute("reunioes", reunioes);

	    RequestDispatcher dispatcher = request.getRequestDispatcher("ListaReuniao.jsp");
	    dispatcher.forward(request, response);
	}


}
