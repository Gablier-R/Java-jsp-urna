package dao;

import java.util.List;

import model.Candidato;

public interface CRUD_Candidatos {
	
	public static void create(Candidato candidato) {};
	public static void delete(int candidatoId) {};
	public static List<Candidato> find(String pesquisa){return null;}
	public static Candidato findByPk(int candidatoId) {return null;}
	public static void update(Candidato candidato) {}
}
