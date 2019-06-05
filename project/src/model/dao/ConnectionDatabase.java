package model.dao;
import java.sql.*;


public class ConnectionDatabase {
	public Connection connec;
	public void getConnection() throws SQLException
	{
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String conURL ="";
			conURL = "jdbc:sqlserver://localhost:1433;databaseName=QL_CTBH;user=sa;password=phuphu";
			connec = DriverManager.getConnection(conURL);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
			
	}
}
