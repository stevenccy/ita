package cn.oocl.dao;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.oocl.model.Product;
import cn.oocl.utils.JdbcUtils;

// to extract common method
public abstract class BaseDaoImpl<T> {

	protected List<T> queryByName(String sql, Class<T> clazz, Object... param) {
		List<T> tList = new ArrayList<T>();
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		try {
			// ctrl + shift + o 導入導出package
			con = JdbcUtils.getConnection();
			pre = con.prepareStatement(sql);
			for (int i = 0; i < param.length; i++) {
				pre.setObject(i + 1, param[i]);
			}
			System.out.println("pre:" + pre);
			rs = pre.executeQuery();
			ResultSetMetaData metaData = rs.getMetaData();
			while (rs.next()) {
				T model = (T) clazz.newInstance();
				for (int i = 1; i <= metaData.getColumnCount(); i++) {
					String colName = metaData.getColumnName(i).toLowerCase();
					Field field = clazz.getDeclaredField(colName);
					field.setAccessible(true); // 取消Java安全性檢查
					field.set(model, rs.getObject(colName));
				}
				tList.add(model);
			}
			return tList;
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtils.close(con, pre,rs);
		}
	}
	
	public List<T> queryByNamePaging(String sql, Class<T> clazz,Object[] params, RowMapper<T> rowMapper) {
		List<T> list = new ArrayList<T>();

		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		try {
			con = JdbcUtils.getConnection();
			pre = con.prepareStatement(sql);
			for (int i = 0; i < params.length; i++) {
				pre.setObject(i + 1, params[i]);
			}

			rs = pre.executeQuery();

			while (rs.next()) {
				T model = rowMapper.mapRow(rs);
				list.add(model);
			}
			return list;
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtils.close(con, pre, rs);
		}
	}
	protected List<T> queryByName(String sql,Object[] param,RowMapper<T> rowMapper) {
		List<T> tList = new ArrayList<T>();
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		try {
			// ctrl + shift + o 導入導出package
			con = JdbcUtils.getConnection();
			pre = con.prepareStatement(sql);
			for (int i = 0; i < param.length; i++) {
				pre.setObject(i + 1, param[i]);
			}
			rs = pre.executeQuery();
			while (rs.next()) {
				T model = rowMapper.mapRow(rs);
				tList.add(model);
			}
			return tList;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			JdbcUtils.close(con, pre,rs);
		}
	}
	
	public List<T> queryByNamePaging(String sql, Class<T> clazz, Object... params) {
		List<T> list = new ArrayList<T>();

		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		try {
			con = JdbcUtils.getConnection();
			pre = con.prepareStatement(sql);
			for (int i = 0; i < params.length; i++) {
				pre.setObject(i + 1, params[i]);
			}

			rs = pre.executeQuery();
			ResultSetMetaData metaData = rs.getMetaData();

			while (rs.next()) {
				T model = (T) clazz.newInstance();
				for (int i = 1; i <= metaData.getColumnCount(); i++) {
					String colName = metaData.getColumnName(i).toLowerCase();
					Field declaredField = clazz.getDeclaredField(colName);
					declaredField.setAccessible(true);
					declaredField.set(model, rs.getObject(colName));
				}
				list.add(model);
			}
			return list;
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtils.close(con, pre, rs);
		}
	}

	protected int getCount(String sql, Object... params) {
		int result = 0;
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		try {
			con = JdbcUtils.getConnection();
			pre = con.prepareStatement(sql);
			for (int i = 0; i < params.length; i++) {
				pre.setObject(i + 1, params[i]);
			}

			rs = pre.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
			return result;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtils.close(con, pre, rs);
		}
	}

	protected T getById(String sql, Object id, Class<T> clazz) {
		T model = null;
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		try {
			con = JdbcUtils.getConnection();
			pre = con.prepareStatement(sql);
			pre.setObject(1, id);
			rs = pre.executeQuery();
			while (rs != null && rs.next()) {
				model = (T) clazz.newInstance();
				ResultSetMetaData metaData = rs.getMetaData();
				for (int i = 1; i <= metaData.getColumnCount(); i++) {
					String colName = metaData.getColumnName(i).toLowerCase();
					Field declaredField = clazz.getDeclaredField(colName);
					declaredField.setAccessible(true);
					declaredField.set(model, rs.getObject(colName));
				}
			}
			return model;
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtils.close(con, pre, rs);
		}
	}

	protected int executeUpdate(String sql, Object... params) {
		Connection connection = null;
		PreparedStatement prepareStatement = null;

		try {
			connection = JdbcUtils.getConnection();
			prepareStatement = connection.prepareStatement(sql);
			for (int i = 0; i < params.length; i++) {
				prepareStatement.setObject(i + 1, params[i]);
			}
			return prepareStatement.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtils.close(connection, prepareStatement);
		}
	}
}
