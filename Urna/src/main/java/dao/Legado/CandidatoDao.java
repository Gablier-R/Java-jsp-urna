package dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import db.MySqlConnection;
import model.Candidato;

public class CandidatoDao implements CRUD_Candidatos {
	
	private static Connection connection = MySqlConnection.createConnection();
	private static String sql;

	public static void create(Candidato candidato) {
		
		sql = "INSERT INTO candidatos VALUES (null, ?, ?, ?, ?, 0)";
		
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, candidato.getNome());
			preparedStatement.setString(2, candidato.getNumero());
			preparedStatement.setString(3, candidato.getTipo());
			preparedStatement.setString(4, candidato.getPartido());
			
			preparedStatement.executeUpdate();
			
			System.out.println("Inserção correta feita no banco");
		} catch (SQLException e) {
			System.out.println("Inserção não correta feita no banco");
		}
	};
	
	public static void delete(int candidatoId) {
		
		sql = "DELETE FROM candidatos WHERE id = ?";
		
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, candidatoId);
			preparedStatement.executeUpdate();
			
			System.out.println("Sucesso: registro deletado");
		} catch (SQLException e) {
			System.out.println("Erro: registro não deletado "+e.getMessage());
		}
	};
	
	public static List<Candidato> find(String pesquisa){
		
		sql = String.format("SELECT * FROM candidatos WHERE nome like '%s%%' OR numero like '%s%%' ", pesquisa, pesquisa);
		List<Candidato> candidatos = new ArrayList<Candidato>();
		
		try {
			java.sql.Statement statement = connection.createStatement();
			ResultSet resultset = statement.executeQuery(sql);
			
			while (resultset.next()) {
				Candidato candidato = new Candidato();
				candidato.setId(resultset.getInt("id"));
				candidato.setNome(resultset.getString("nome"));
				candidato.setNumero(resultset.getString("numero"));
				candidato.setTipo(resultset.getString("tipo"));
				candidato.setPartido(resultset.getString("partido"));
				candidato.setVotos(resultset.getInt("votos"));
				
				candidatos.add(candidato);
				
			}
			
			System.out.println("Candidatos encontrados");
			return candidatos;
		} catch (SQLException e) {
			System.out.println("Candidatos não encontrados");
			return null;
		}
		
		};
	
	public static Candidato findByPk(int candidatoId) {
		
		sql = String.format("SELECT * FROM candidatos WHERE id = %d", candidatoId);
		
		try {
			java.sql.Statement statement = connection.createStatement();
			ResultSet resultset = statement.executeQuery(sql);
			Candidato candidato = new Candidato();
			
			while (resultset.next()) {
				
				candidato.setId(resultset.getInt("id"));
				candidato.setNome(resultset.getString("nome"));
				candidato.setNumero(resultset.getString("numero"));
				candidato.setTipo(resultset.getString("tipo"));
				candidato.setPartido(resultset.getString("partido"));
				candidato.setVotos(resultset.getInt("votos"));

				
			} 
			System.out.println("Candidatos atraves do ID encontrados");
			return candidato;
		} catch (SQLException e) {
			System.out.println("Candidatos atraves do ID não encontrados");
			return null;
		}
	};
	
	public static void update(Candidato candidato) {
		
		sql = "UPDATE candidatos SET nome = ?, numero = ?, tipo = ?, partido = ? WHERE id =?";
		
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, candidato.getNome());
			preparedStatement.setString(2, candidato.getNumero());
			preparedStatement.setString(3, candidato.getTipo());
			preparedStatement.setString(4, candidato.getPartido());
			preparedStatement.setInt(5, candidato.getId());
			
			preparedStatement.executeUpdate();
			
			System.out.println("Alteração correta feita no banco");
		} catch (SQLException e) {
			System.out.println("Alteração não correta feita no banco");
		}
		
	};
}
