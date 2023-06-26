package dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import db.MySqlConnection;
import model.Reuniao;
import model.Usuario;

public class UsuarioDao {

	private static Connection connection = MySqlConnection.createConnection();
	private static String sql;

	public static void create(Usuario usuario) {

		sql = "INSERT INTO usuarios VALUES (null, ?, ?, ?, ?, ?)";

		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, usuario.getLogin());
			preparedStatement.setString(2, usuario.getSenha());
			preparedStatement.setString(3, usuario.getNome());
			preparedStatement.setString(4, usuario.getNascimento());
			preparedStatement.setString(5, usuario.getCpf());

			preparedStatement.executeUpdate();

			System.out.println("--Sucesso: Usuario inserido");
		} catch (SQLException e) {
			System.out.println("--Erro: Usuario não inserido");
		}
	};

	public static void delete(int usuarioId) {

		sql = "DELETE FROM usuarios WHERE id = ?";

		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, usuarioId);
			preparedStatement.executeUpdate();

			System.out.println("Sucesso: registro deletado");
		} catch (SQLException e) {
			System.out.println("Erro: registro não deletado " + e.getMessage());
		}
	};

	public static List<Usuario> find(String pesquisa) {

		//sql = String.format("SELECT * FROM usuarios WHERE login like '%s%%'", pesquisa, pesquisa);
		sql = "SELECT * FROM usuarios WHERE nome like %?%";
		List<Usuario> usuarios = new ArrayList<Usuario>();

		try {
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(0, pesquisa);
			ResultSet resultset = statement.executeQuery();

			while (resultset.next()) {
				Usuario usuario = new Usuario();
				usuario.setId(resultset.getInt("id"));
				usuario.setNome(resultset.getString("nome"));

				usuarios.add(usuario);
			}

			System.out.println("Usuarios encontrados");
			return usuarios;
		} catch (SQLException e) {
			System.out.println("Usuarios não encontrados");
			return null;
		}

	};

	public static List<Usuario> listaTodos() {

		sql = String.format("SELECT * FROM usuarios");
		List<Usuario> usuarios = new ArrayList<Usuario>();

		try {
			Statement statement = connection.createStatement();
			ResultSet resultset = statement.executeQuery(sql);
			while (resultset.next()) {
				Usuario usuario = new Usuario();
				usuario.setId(resultset.getInt("id"));
				usuario.setLogin(resultset.getString("login"));
				usuario.setNome(resultset.getString("nome"));
				usuarios.add(usuario);
			}

			System.out.println("Usuarios encontrados");
			return usuarios;
		} catch (SQLException e) {
			System.out.println("Usuarios não encontrados");
			return null;
		}

	};
	
	public static List<Usuario> getUsuariosDaReuniao(Reuniao reuniao) throws SQLException {
		String sql = "SELECT u.id, p.id_participante, u.nome, u.login FROM participantes p "
		+ "INNER JOIN usuarios u "
		+ "ON u.id = p.id_participante WHERE p.id_reuniao = ? ";
		List<Usuario> usuarios = new ArrayList<>();
		PreparedStatement stmt = connection.prepareStatement(sql);
		stmt.setInt(1, reuniao.getIdReuniao());
		ResultSet rs = stmt.executeQuery();
		while (rs.next()) {
		Usuario usuario = new Usuario();
		usuario.setId(rs.getInt("id"));
		usuario.setNome(rs.getString("nome"));
		usuario.setLogin(rs.getString("login"));
		usuarios.add(usuario);
		}
		return usuarios;
		}

	public static Usuario findByPk(int usuarioId) {

		sql = String.format("SELECT * FROM usuarios WHERE id = %d", usuarioId);

		try {
			java.sql.Statement statement = connection.createStatement();
			ResultSet resultset = statement.executeQuery(sql);
			Usuario usuario = new Usuario();

			while (resultset.next()) {

				usuario.setId(resultset.getInt("id"));
				usuario.setLogin(resultset.getString("login"));
				usuario.setSenha(resultset.getString("senha"));
				usuario.setNome(resultset.getString("nome"));
				usuario.setNascimento(resultset.getString("nascimento"));
				usuario.setCpf(resultset.getString("cpf"));

			}
			System.out.println("--Sucesso: Usuarios atraves do ID encontrados");
			return usuario;
		} catch (SQLException e) {
			System.out.println("--Erro: Usuarios atraves do ID não encontrados");
			return null;
		}
	}

	public static void update(Usuario usuario) {

		sql = "UPDATE usuarios SET login = ?, senha = ?, nome =?, nascimento =?, cpf = ? WHERE id =?";

		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, usuario.getLogin());
			preparedStatement.setString(2, usuario.getSenha());
			preparedStatement.setString(3, usuario.getNome());
			preparedStatement.setString(4, usuario.getNascimento());
			preparedStatement.setString(5, usuario.getCpf());
			preparedStatement.setInt(6, usuario.getId());

			preparedStatement.executeUpdate();

			System.out.println("--Sucesso: update realizado em Usuarios");
		} catch (SQLException e) {
			System.out.println("--Erro: update não realizado em Usuarios");
		}
	}

	public Usuario logar(String login, String senha) {

		sql = "SELECT * FROM usuarios WHERE login = ? AND senha = ?";
		try {

			PreparedStatement preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, login);
			preparedStatement.setString(2, senha);

			ResultSet resultSet = preparedStatement.executeQuery();
			Usuario usuario = new Usuario();
			while (resultSet.next()) {
				usuario.setId(resultSet.getInt("id"));
				usuario.setLogin(resultSet.getString("login"));
				usuario.setNome(resultSet.getString("nome"));
				

				return usuario;

			}

		} catch (SQLException e) {
			System.out.println("erro " + e.getMessage());
		}

		return null;
	}
}
