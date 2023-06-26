package dao;

import java.util.List;

import model.Reuniao;


public interface CRUD_Reunioes {
	
	public static void create(Reuniao reuniao) {};
	public static void delete(int reuniaoId) {};
	public static List<Reuniao> find(String pesquisa){return null;}
	public static Reuniao findByPk(int reuniaoId) {return null;}
	public static void update(Reuniao reuniao) {}
	
}
