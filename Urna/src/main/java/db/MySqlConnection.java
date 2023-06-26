package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySqlConnection {
	
	private static final String url = "jdbc:mysql://localhost:3306/urna";
	private static final String user = "root";
	private static final String password = "root";
	
	public static Connection createConnection() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver ecnontrado");
			
		} catch(ClassNotFoundException e) {
			System.out.println("Driver não encontrado. " + e.getMessage());
		}
		
		try {
			Connection connection = DriverManager.getConnection(url, user, password);
			System.out.println("Conectado ao banco");
			return connection;
			
		} catch(SQLException e) {
			System.out.println("Não foi conectado ao banco. " + e.getMessage());
			return null;
		}
	}
}