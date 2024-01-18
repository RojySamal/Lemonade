package project;
import java.sql.*;
public class ConnectionProvider {
	public static Connection getCon()
	{
		try {
			//Step-1
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//Step-2
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system", "Gourab8280");
			//Step-3
			return con;
		}
		catch(Exception e)
		{
			System.out.print(e);
			return null;
		}
		
		}
	}
