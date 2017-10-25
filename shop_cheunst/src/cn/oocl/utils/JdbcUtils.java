package cn.oocl.utils;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class JdbcUtils {
	
	private static ThreadLocal<Connection> connLocal = new ThreadLocal<Connection>();
	
	private static final String jdbcUrl = PropUtils.getValue("jdbcUrl");
	private static final String driverName = PropUtils.getValue("driverName");
	private static final String userName = PropUtils.getValue("username");
	private static final String password = PropUtils.getValue("password");
	static{
		//only being run for once
		System.out.println("--static--");
		
		try {
			Class.forName(driverName);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}	
	}
//	
//	public static void main(String[] args) {
//		// JdbcUtils.main(args);
//	}
	
	
	public static Connection getConnection() {
		// 
		Connection connection = connLocal.get();
		try {
			
			if (connection == null || connection.isClosed()){
				connection = DriverManager.getConnection(jdbcUrl,userName,password);
				connLocal.set(connection);
			}
			return connection;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	
	
	public static void close(Connection conn, PreparedStatement pre) {
		close(conn, pre, null);
	}
	
	public static void close(Connection conn, PreparedStatement pre, ResultSet rs) {
		try {
			if(rs!=null && !rs.isClosed()){
				rs.close();
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}finally{
			try {
				if(pre!=null && !pre.isClosed()){
					pre.close();
				}
			}catch (SQLException e){
				throw new RuntimeException(e);
			}finally{
				try {
					if(conn!=null && !conn.isClosed()){
						conn.close();
					}
				} catch (SQLException e) {
					throw new RuntimeException(e);
				}
			}
		}
	}
	
	public static void main(String[] args) {
		System.out.println(JdbcUtils.getConnection());
		System.out.println(JdbcUtils.getConnection());
	}

}
