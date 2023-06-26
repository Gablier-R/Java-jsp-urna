package dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import db.MySqlConnection;
import model.Participante;
import model.Reuniao;
import model.Usuario;

public class ReuniaoDao {

	private static Connection connection = MySqlConnection.createConnection();
	private static String sql;

	public static int create(Reuniao reuniao) {

		sql = "INSERT INTO reunioes VALUES (null, ?, ?, ?, ?)";

		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

			preparedStatement.setString(1, reuniao.getTitulo());
			preparedStatement.setString(2, reuniao.getData());
			preparedStatement.setString(3, reuniao.getHora());
			preparedStatement.setString(4, reuniao.getLocal());

			preparedStatement.executeUpdate();

			int ultimoIdInserido = 0;
			ResultSet resultSet = preparedStatement.getGeneratedKeys();
			if (resultSet.next()) {
				ultimoIdInserido = resultSet.getInt(1);
			}
			System.out.println("Reunião inserida com sucesso!");
			return ultimoIdInserido;
		} catch (Exception e) {
			System.out.println("Erro ao inserir a reunião \n" + e.getMessage());
			return 0;
		}
	};

	public static void insereParticipante(Reuniao reuniao, List<Usuario> participantes) {

		for (Usuario participante : participantes) {
			sql = "INSERT INTO participantes VALUES (?,?)";
			try {
				PreparedStatement preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setInt(1, reuniao.getIdReuniao());
				preparedStatement.setInt(2, participante.getId());
				preparedStatement.executeUpdate();
				System.out.println(participante.getId() + " adicionado(a) na reunião " + reuniao.getIdReuniao());
			} catch (SQLException e) {
				System.out.println("Erro ao adicionar o participante.\n " + e.getMessage());

			}
		}

	};

	public static void delete(int reuniaoId) {

		sql = "DELETE FROM reunioes WHERE id = ?";

		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, reuniaoId);
			preparedStatement.executeUpdate();

			System.out.println("Sucesso: registro deletado");
		} catch (SQLException e) {
			System.out.println("Erro: registro não deletado " + e.getMessage());
		}

	};

	public static List<Reuniao> find(String pesquisa) {

		sql = String.format("SELECT * FROM reunioes WHERE titulo like '%s%%'", pesquisa, pesquisa);
		List<Reuniao> reunioes = new ArrayList<Reuniao>();

		try {
			java.sql.Statement statement = connection.createStatement();
			ResultSet resultset = statement.executeQuery(sql);

			while (resultset.next()) {
				Reuniao reuniao = new Reuniao();
				reuniao.setIdReuniao(resultset.getInt("idReuniao"));
				reuniao.setTitulo(resultset.getString("titulo"));
				reuniao.setData(resultset.getString("data"));
				reuniao.setHora(resultset.getString("hora"));
				reuniao.setLocal(resultset.getString("local"));

				reunioes.add(reuniao);

			}

			System.out.println("Reuniões encontrados");
			return reunioes;
		} catch (SQLException e) {
			System.out.println("Reuniões não encontrados");
			return null;
		}

	}

	public static Reuniao findByPk(int idUsuario) {

		sql = String.format("SELECT * FROM reunioes WHERE id = %d", idUsuario);

		try {
			java.sql.Statement statement = connection.createStatement();
			ResultSet resultset = statement.executeQuery(sql);
			Reuniao reuniao = new Reuniao();

			while (resultset.next()) {

				reuniao.setIdReuniao(resultset.getInt("idReuniao"));
				reuniao.setTitulo(resultset.getString("titulo"));
				reuniao.setData(resultset.getString("data"));
				reuniao.setHora(resultset.getString("hora"));
				reuniao.setLocal(resultset.getString("local"));

			}
			System.out.println("Reuniões atraves do ID encontrados");
			return reuniao;
		} catch (SQLException e) {
			System.out.println("Reuniões atraves do ID não encontrados");
			return null;
		}
	}

	public static void update(Reuniao reuniao) {

		sql = "UPDATE reunioes SET id_usuario_criador = ?, titulo = ?, data = ?, hora = ?, local = ? WHERE id =?";

		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(2, reuniao.getTitulo());
			preparedStatement.setString(3, reuniao.getData());
			preparedStatement.setString(4, reuniao.getHora());
			preparedStatement.setString(5, reuniao.getLocal());

			preparedStatement.executeUpdate();

			System.out.println("Alteração correta feita no banco");
		} catch (SQLException e) {
			System.out.println("Alteração não correta feita no banco");
		}

	}

	public static List<Reuniao> listaTodos() {

		sql = String.format("SELECT * FROM reunioes ORDER BY id_reuniao DESC");
		List<Reuniao> reunioes = new ArrayList<>();
		try {
			Statement statement = connection.createStatement();
			ResultSet resultset = statement.executeQuery(sql);
			while (resultset.next()) {
				Reuniao reuniao = new Reuniao();
				reuniao.setIdReuniao(resultset.getInt("id_reuniao"));
				reuniao.setTitulo(resultset.getString("titulo"));
				reuniao.setLocal(resultset.getString("local"));
				reuniao.setData(resultset.getString("data"));
				reuniao.setHora(resultset.getString("hora"));
				reunioes.add(reuniao);
			}

			System.out.println("Existem reuniões para listar!");
			return reunioes;
		} catch (SQLException e) {
			System.out.println("Erro: \n"+e.getMessage());
			return null;
		}

	}
	
	public static List<Reuniao> listaSomenteLogado(int idUsuario) {

		sql = String.format("SELECT * FROM usuarios, participantes, reunioes WHERE participantes.id_participante = %d",idUsuario);
		List<Reuniao> reunioes = new ArrayList<>();
		try {
			Statement statement = connection.createStatement();
			ResultSet resultset = statement.executeQuery(sql);
			while (resultset.next()) {
				Reuniao reuniao = new Reuniao();
				reuniao.setIdReuniao(resultset.getInt("id_reuniao"));
				reuniao.setTitulo(resultset.getString("titulo"));
				reuniao.setLocal(resultset.getString("local"));
				reuniao.setData(resultset.getString("data"));
				reuniao.setHora(resultset.getString("hora"));
				reunioes.add(reuniao);
			}

			System.out.println("Existem reuniões para listar do usuario logado!");
			return reunioes;
		} catch (SQLException e) {
			System.out.println("Erro: \n"+e.getMessage());
			return null;
		}

	}
}
