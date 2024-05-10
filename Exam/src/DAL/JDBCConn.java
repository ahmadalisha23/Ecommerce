package DAL;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class JDBCConn {
	private static Connection con;

	public static Connection getJDBCConn() {
		if (con == null) {
			Properties p = new Properties();
			try {
				FileReader f = new FileReader("D:\\TEST1\\Exam\\WebContent\\db.properties");
				p.load(f);
				Class.forName(p.getProperty("Driver"));
				con = DriverManager.getConnection(p.getProperty("jdbc_conn"), p.getProperty("user"),
						p.getProperty("password"));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return con;
	}
}