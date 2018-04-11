package com.bpm.asset.config;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

import javax.sql.DataSource;
import org.apache.commons.dbcp.DriverManagerConnectionFactory;
import org.apache.commons.dbcp.PoolableConnection;
import org.apache.commons.dbcp.PoolableConnectionFactory;
import org.apache.commons.dbcp.PoolingDataSource;
import org.apache.commons.pool.impl.GenericObjectPool;


public class ConnectionFactory {
	private static interface Singleton {
		final ConnectionFactory INSTANCE = new ConnectionFactory();
	}

	private final DataSource dataSource;

	private ConnectionFactory() {

		try {
			Class.forName("com.mysql.jdbc.Driver");

		} catch (Exception e) {
			e.printStackTrace();
		}
		Properties properties = new Properties();
		properties.setProperty("driverClassName", "com.mysql.jdbc.Driver");
		properties.setProperty("user", "javalog");
		properties.setProperty("password", "atools2017");

		GenericObjectPool<PoolableConnection> pool = new GenericObjectPool<PoolableConnection>();
		DriverManagerConnectionFactory connectionFactory = new DriverManagerConnectionFactory(
				"jdbc:mysql://59.151.8.55:3306/javalog", properties);
		new PoolableConnectionFactory(connectionFactory, pool, null, "SELECT 1", 3, false, false,
				Connection.TRANSACTION_READ_COMMITTED);
		this.dataSource = new PoolingDataSource(pool);
	}

	public static Connection getDatabaseConnection() throws SQLException {
		return Singleton.INSTANCE.dataSource.getConnection();
	}

}