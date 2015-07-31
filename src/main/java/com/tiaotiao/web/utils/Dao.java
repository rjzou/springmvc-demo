package com.tiaotiao.web.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;

import javax.sql.DataSource;

import org.apache.commons.dbutils.BasicRowProcessor;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Repository;

import com.tiaotiao.web.utils.dbutils.HumpBeanProcessor;
import com.tiaotiao.web.utils.dbutils.HumpMatcher;

/**
 * dbutils常用模板，使用log4jdbc监控sql执行，需要用到dao的地方直接注入即可
 * 
 * @author dj
 * 
 */
@Repository
public class Dao {
	// 主库数据源 master
	private DataSource dataSource;
	// 从库数据源 slave
	private DataSource readOnlyDataSource;
	private QueryRunner queryRunner;
	private static ResourceBundle rb = null;
	private static final String CONFIG_FILE = "config.jdbc";
	
	private static final Logger logger = LoggerFactory.getLogger(Dao.class);

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	

	public DataSource getDataSource() {
		return dataSource;
	}


	public DataSource getReadOnlyDataSource() {
		return readOnlyDataSource;
	}

	public void setReadOnlyDataSource(DataSource readOnlyDataSource) {
		this.readOnlyDataSource = readOnlyDataSource;
	}

	/**
	 * 执行sql语句
	 * 
	 * @param sql
	 *            sql语句
	 * @return 受影响的行数
	 * @throws SQLException
	 */
	public int update(String sql) throws SQLException {
		int affectedRows =  update(sql, null);
		loggerInfo(sql, null,affectedRows);
		return affectedRows;
	}

	public int updateByTranscation(String sql, Connection conn, Object... params) throws SQLException {
		queryRunner = new QueryRunner();
		int affectedRows = 0;
		try {
			if (params == null) {
				affectedRows = queryRunner.update(conn, sql);
			} else {
				affectedRows = queryRunner.update(conn, sql, params);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;

		}
		loggerInfo(sql, params, affectedRows);
		return affectedRows;
	}

	/**
	 * 执行sql语句 <code> 
	 * executeUpdate("update user set username = 'kitty' where username = ?", "hello kitty"); 
	 * </code>
	 * 
	 * @param sql
	 *            sql语句
	 * @param param
	 *            参数
	 * @return 受影响的行数
	 * @throws SQLException
	 */
	public int update(String sql, Object param) throws SQLException {
		int affectedRows = update(sql, new Object[] { param });
		loggerInfo(sql, param, affectedRows);
		return affectedRows;
	}

	/**
	 * 执行sql语句
	 * 
	 * @param sql
	 *            sql语句
	 * @param params
	 *            参数数组
	 * @return 受影响的行数
	 * @throws SQLException
	 */
	public int update(String sql, Object[] params) throws SQLException {
		queryRunner = new QueryRunner(dataSource);
		int affectedRows = 0;
		try {
			if (params == null) {
				affectedRows = queryRunner.update(sql);
			} else {
				affectedRows = queryRunner.update(sql, params);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		loggerInfo(sql, params, affectedRows);
		return affectedRows;
	}

	/**
	 * 执行批量sql语句
	 * 
	 * @param sql
	 *            sql语句
	 * @param params
	 *            二维参数数组
	 * @return 受影响的行数的数组
	 * @throws SQLException
	 */
	public int[] batchUpdate(String sql, Object[][] params) throws SQLException {
		queryRunner = new QueryRunner(dataSource);
		int[] affectedRows = new int[0];
		try {
			affectedRows = queryRunner.batch(sql, params);
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		loggerInfo(sql, params, affectedRows.length);
		return affectedRows;
	}

	/**
	 * 执行查询，将每行的结果保存到一个Map对象中，然后将所有Map对象保存到List中
	 * 
	 * @param sql
	 *            sql语句
	 * @return 查询结果
	 * @throws SQLException
	 */
	public List<Map<String, Object>> find(String sql) {
		List<Map<String, Object>> obj = new ArrayList<Map<String,Object>>();
		try {
			obj = find(sql, null);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return obj;
	}

	/**
	 * 执行查询，将每行的结果保存到一个Map对象中，然后将所有Map对象保存到List中
	 * 
	 * @param sql
	 *            sql语句
	 * @param param
	 *            参数
	 * @return 查询结果
	 * @throws SQLException
	 */
	public List<Map<String, Object>> find(String sql, Object param){
		List<Map<String, Object>> obj = new ArrayList<Map<String, Object>>();
		try {
			obj = find(sql, new Object[] { param });
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return obj;
	}

	/**
	 * 执行查询，将每行的结果保存到一个Map对象中，然后将所有Map对象保存到List中
	 * 
	 * @param sql
	 *            sql语句
	 * @param params
	 *            参数数组
	 * @return 查询结果
	 * @throws SQLException
	 */
	public List<Map<String, Object>> find(String sql, Object[] params) throws SQLException {
		if (sql.indexOf("select nextval(") >= 0) {
			queryRunner = new QueryRunner(dataSource);
		} else {
			queryRunner = new QueryRunner(readOnlyDataSource);
		}
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		try {
			if (params == null) {
				list = (List<Map<String, Object>>) queryRunner.query(sql, new MapListHandler());
			} else {
				list = (List<Map<String, Object>>) queryRunner.query(sql, new MapListHandler(), params);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return list;
	}

	public List<Map<String, Object>> find(String sql, Object[] params, boolean useMaster) throws SQLException {
		if (sql.indexOf("select nextval(") >= 0 || useMaster) {
			queryRunner = new QueryRunner(dataSource);
		} else {
			queryRunner = new QueryRunner(readOnlyDataSource);
		}
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		try {
			if (params == null) {
				list = (List<Map<String, Object>>) queryRunner.query(sql, new MapListHandler());
			} else {
				list = (List<Map<String, Object>>) queryRunner.query(sql, new MapListHandler(), params);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return list;
	}

	// 求count
	// TODO 子查询等。。进行优化
	public long count(String sql, Object[] params) throws Exception {
		// count(Type)返回的是Long类型,无奈
		Long retVal = 0L;
		try {
			sql = "select count(1) as count " + sql.substring(sql.indexOf("from"));
			Map<String, Object> first = findFirst(sql, params);
			retVal = (first == null)? 0l :Long.valueOf(first.get("count").toString());
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return retVal;
	}

	/**
	 * 执行查询，将每行的结果保存到一个Map对象中，然后将所有Map对象保存到List中,然后在拼装成page对象
	 * 
	 * @param sql
	 *            sql语句
	 * @param params
	 *            参数数组
	 * @return 查询结果
	 * @throws Exception
	 */
	public Page<Map<String, Object>> find(String sql, Object[] params, PageRequest pageRequest){
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Long count = 0l;
		try {
			if (sql.indexOf("select nextval(") >= 0) {
				queryRunner = new QueryRunner(dataSource);
			} else {
				queryRunner = new QueryRunner(readOnlyDataSource);
			}
			count = count(sql, params);
			String limit = " limit " + pageRequest.getOffset() + " ," + pageRequest.getPageSize();
			sql += limit;
			if (params == null) {
				list = (List<Map<String, Object>>) queryRunner.query(sql, new MapListHandler());
			} else {
				list = (List<Map<String, Object>>) queryRunner.query(sql, new MapListHandler(), params);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new PageImpl<Map<String, Object>>(list, pageRequest, count);
	}

	public Page<Map<String, Object>> find(String sql, Object[] params, PageRequest pageRequest, boolean useMaster) throws Exception {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Long count = 0l;
		try {
			if (sql.indexOf("select nextval(") >= 0 || useMaster) {
				queryRunner = new QueryRunner(dataSource);
			} else {
				queryRunner = new QueryRunner(readOnlyDataSource);
			}
			count = count(sql, params);
			String limit = " limit " + pageRequest.getOffset() + " ," + pageRequest.getPageSize();
			sql += limit;
			if (params == null) {
				list = (List<Map<String, Object>>) queryRunner.query(sql, new MapListHandler());
			} else {
				list = (List<Map<String, Object>>) queryRunner.query(sql, new MapListHandler(), params);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}

		return new PageImpl<Map<String, Object>>(list, pageRequest, count);
	}

	// 求count
	// TODO 子查询等。。进行优化
	public long count1(String sql, Object[] params) throws Exception {
		// count(Type)返回的是Long类型,无奈
		Long retVal = 0L;
		try {
			sql = "select count(1) as count from (" + sql + ") t";
			Map<String, Object> first = findFirst(sql, params);
			retVal = Long.valueOf(first.get("count").toString());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return retVal;
	}

	/**
	 * 执行查询，将每行的结果保存到一个Map对象中，然后将所有Map对象保存到List中,然后在拼装成page对象
	 * 
	 * @param sql
	 *            sql语句
	 * @param params
	 *            参数数组
	 * @return 查询结果
	 * @throws Exception
	 */
	public Page<Map<String, Object>> find1(String sql, Object[] params, PageRequest pageRequest) throws Exception {
		queryRunner = new QueryRunner(readOnlyDataSource);
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Long count = count1(sql, params);
		String limit = " limit " + pageRequest.getOffset() + " ," + pageRequest.getPageSize();
		sql += limit;

		try {
			if (params == null) {
				list = (List<Map<String, Object>>) queryRunner.query(sql, new MapListHandler());
			} else {
				list = (List<Map<String, Object>>) queryRunner.query(sql, new MapListHandler(), params);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}

		return new PageImpl<Map<String, Object>>(list, pageRequest, count);
	}

	/**
	 * 执行查询，将每行的结果保存到Bean中，然后将所有Bean保存到List中
	 * 
	 * @param entityClass
	 *            类名
	 * @param sql
	 *            sql语句
	 * @return 查询结果
	 * @throws SQLException
	 */
	public <T> List<T> find(Class<T> entityClass, String sql) throws SQLException {
		return find(entityClass, sql, null);
	}

	/**
	 * 执行查询，将每行的结果保存到Bean中，然后将所有Bean保存到List中
	 * 
	 * @param entityClass
	 *            类名
	 * @param sql
	 *            sql语句
	 * @param param
	 *            参数
	 * @return 查询结果
	 * @throws SQLException
	 */
	public <T> List<T> find(Class<T> entityClass, String sql, Object param) throws SQLException {
		return find(entityClass, sql, new Object[] { param });
	}

	/**
	 * 执行查询，将每行的结果保存到Bean中，然后将所有Bean保存到List中
	 * 
	 * @param entityClass
	 *            类名
	 * @param sql
	 *            sql语句
	 * @param params
	 *            参数数组
	 * @return 查询结果
	 * @throws SQLException
	 */
	public <T> List<T> find(Class<T> entityClass, String sql, Object[] params) throws SQLException {
		if (sql.indexOf("select nextval(") >= 0) {
			queryRunner = new QueryRunner(dataSource);
		} else {
			queryRunner = new QueryRunner(readOnlyDataSource);
		}
		List<T> list = new ArrayList<T>();
		try {
			if (params == null) {
				list = (List<T>) queryRunner.query(sql, getBeanList(entityClass));
			} else {
				list = (List<T>) queryRunner.query(sql, getBeanList(entityClass), params);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return list;
	}

	public <T> List<T> find(Class<T> entityClass, String sql, Object[] params, boolean useMaster) throws SQLException {
		if (sql.indexOf("select nextval(") >= 0 || useMaster) {
			queryRunner = new QueryRunner(dataSource);
		} else {
			queryRunner = new QueryRunner(readOnlyDataSource);
		}
		List<T> list = new ArrayList<T>();
		try {
			if (params == null) {
				list = (List<T>) queryRunner.query(sql, getBeanList(entityClass));
			} else {
				list = (List<T>) queryRunner.query(sql, getBeanList(entityClass), params);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return list;
	}

	/**
	 * 查询出结果集中的第一条记录，并封装成对象
	 * 
	 * @param entityClass
	 *            类名
	 * @param sql
	 *            sql语句
	 * @return 对象
	 * @throws SQLException
	 */
	public <T> T findFirst(Class<T> entityClass, String sql) throws SQLException {
		return findFirst(entityClass, sql, null);
	}

	/**
	 * 查询出结果集中的第一条记录，并封装成对象
	 * 
	 * @param entityClass
	 *            类名
	 * @param sql
	 *            sql语句
	 * @param param
	 *            参数
	 * @return 对象
	 * @throws SQLException
	 */
	public <T> T findFirst(Class<T> entityClass, String sql, Object param) throws SQLException {
		return findFirst(entityClass, sql, new Object[] { param });
	}

	/**
	 * 查询出结果集中的第一条记录，并封装成对象
	 * 
	 * @param entityClass
	 *            类名
	 * @param sql
	 *            sql语句
	 * @param params
	 *            参数数组
	 * @return 对象
	 * @throws SQLException
	 */
	@SuppressWarnings("unchecked")
	public <T> T findFirst(Class<T> entityClass, String sql, Object[] params) throws SQLException {
		if (sql.indexOf("select nextval(") >= 0) {
			queryRunner = new QueryRunner(dataSource);
		} else {
			queryRunner = new QueryRunner(readOnlyDataSource);
		}
		Object object = null;
		try {
			if (params == null) {
				object = queryRunner.query(sql, getBean(entityClass));
			} else {
				object = queryRunner.query(sql, getBean(entityClass), params);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return (T) object;
	}

	public <T> T findFirst(Class<T> entityClass, String sql, Object[] params, boolean useMaster) throws SQLException {
		if (sql.indexOf("select nextval(") >= 0 || useMaster) {
			queryRunner = new QueryRunner(dataSource);
		} else {
			queryRunner = new QueryRunner(readOnlyDataSource);
		}
		Object object = null;
		try {
			if (params == null) {
				object = queryRunner.query(sql, getBean(entityClass));
			} else {
				object = queryRunner.query(sql, getBean(entityClass), params);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return (T) object;
	}

	/**
	 * 查询出结果集中的第一条记录，并封装成Map对象
	 * 
	 * @param sql
	 *            sql语句
	 * @return 封装为Map的对象
	 * @throws SQLException
	 */
	public Map<String, Object> findFirst(String sql){
		return findFirst(sql, null);
	}

	/**
	 * 查询出结果集中的第一条记录，并封装成Map对象
	 * 
	 * @param sql
	 *            sql语句
	 * @param param
	 *            参数
	 * @return 封装为Map的对象
	 * @throws SQLException
	 */
	public Map<String, Object> findFirst(String sql, Object param){
		return findFirst(sql, new Object[] { param });
	}

	public Map<String, Object> findFirst(String sql, Object param, boolean useMaster) throws SQLException {
		return findFirst(sql, new Object[] { param }, useMaster);
	}

	/**
	 * 查询出结果集中的第一条记录，并封装成Map对象
	 * 
	 * @param sql
	 *            sql语句
	 * @param params
	 *            参数数组
	 * @return 封装为Map的对象
	 * @throws SQLException
	 */
	public Map<String, Object> findFirst(String sql, Object[] params){
		Map<String, Object> map = null;
		try {
			if (sql.indexOf("select nextval(") >= 0) {
				queryRunner = new QueryRunner(dataSource);
			} else {
				queryRunner = new QueryRunner(readOnlyDataSource);
			}
			if (params == null) {
				map = (Map<String, Object>) queryRunner.query(sql, new MapHandler());
			} else {
				map = (Map<String, Object>) queryRunner.query(sql, new MapHandler(), params);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 从有“写入”角色的数据源中，查询出结果集中的第一条记录，并封装成Map对象
	 * 
	 * @param sql
	 * @param params
	 * @return
	 * @throws SQLException
	 * @author zengja
	 * @date 2014年8月12日 上午11:47:07
	 */
	public Map<String, Object> findFirstByWrite(String sql, Object... params) throws SQLException {
		queryRunner = new QueryRunner(dataSource);
		Map<String, Object> map = null;
		try {
			if (params == null) {
				map = (Map<String, Object>) queryRunner.query(sql, new MapHandler());
			} else {
				map = (Map<String, Object>) queryRunner.query(sql, new MapHandler(), params);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return map;
	}

	public Map<String, Object> findFirst(String sql, Object[] params, boolean useMaster) throws SQLException {
		if (sql.indexOf("select nextval(") >= 0 || useMaster) {
			queryRunner = new QueryRunner(dataSource);
		} else {
			queryRunner = new QueryRunner(readOnlyDataSource);
		}
		Map<String, Object> map = null;
		try {
			if (params == null) {
				map = (Map<String, Object>) queryRunner.query(sql, new MapHandler());
			} else {
				map = (Map<String, Object>) queryRunner.query(sql, new MapHandler(), params);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return map;
	}

	/**
	 * 查询某一条记录，并将指定列的数据转换为Object
	 * 
	 * @param sql
	 *            sql语句
	 * @param columnName
	 *            列名
	 * @return 结果对象
	 * @throws SQLException
	 */
	public Object findBy(String sql, String columnName) throws SQLException {
		return findBy(sql, columnName, null);
	}

	/**
	 * 查询某一条记录，并将指定列的数据转换为Object
	 * 
	 * @param sql
	 *            sql语句
	 * @param columnName
	 *            列名
	 * @param param
	 *            参数
	 * @return 结果对象
	 * @throws SQLException
	 */
	public Object findBy(String sql, String columnName, Object param) throws SQLException {
		return findBy(sql, columnName, new Object[] { param });
	}

	/**
	 * 使用ScalarHandler处理单行记录，只返回结果集第一行中的指定字段，如未指定字段，则返回第一个字段！
	 * 
	 * @param sql
	 *            sql语句
	 * @param columnName
	 *            列名
	 * @param params
	 *            参数数组
	 * @return 结果对象
	 * @throws SQLException
	 */
	public <T> T findBy(String sql, String columnName, Object[] params) throws SQLException {
		if (sql.indexOf("select nextval(") >= 0) {
			queryRunner = new QueryRunner(dataSource);
		} else {
			queryRunner = new QueryRunner(readOnlyDataSource);
		}
		T object = null;
		try {
			if (params == null) {
				object = queryRunner.query(sql, new ScalarHandler<T>(columnName));
			} else {
				object = queryRunner.query(sql, new ScalarHandler<T>(columnName), params);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return object;
	}

	public <T> T findBy(String sql, String columnName, Object[] params, boolean useMaster) throws SQLException {
		if (sql.indexOf("select nextval(") >= 0 || useMaster) {
			queryRunner = new QueryRunner(dataSource);
		} else {
			queryRunner = new QueryRunner(readOnlyDataSource);
		}
		T object = null;
		try {
			if (params == null) {
				object = queryRunner.query(sql, new ScalarHandler<T>(columnName));
			} else {
				object = queryRunner.query(sql, new ScalarHandler<T>(columnName), params);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return object;
	}

	/**
	 * 查询某一条记录，并将指定列的数据转换为Object
	 * 
	 * @param sql
	 *            sql语句
	 * @param columnIndex
	 *            列索引
	 * @return 结果对象
	 * @throws SQLException
	 */
	public Object findBy(String sql, int columnIndex) throws SQLException {
		return findBy(sql, columnIndex, null);
	}

	/**
	 * 查询某一条记录，并将指定列的数据转换为Object
	 * 
	 * @param sql
	 *            sql语句
	 * @param columnIndex
	 *            列索引
	 * @param param
	 *            参数
	 * @return 结果对象
	 * @throws SQLException
	 */
	public Object findBy(String sql, int columnIndex, Object param) throws SQLException {
		return findBy(sql, columnIndex, new Object[] { param });
	}

	/**
	 * 查询某一条记录，并将指定列的数据转换为Object
	 * 
	 * @param sql
	 *            sql语句
	 * @param columnIndex
	 *            列索引
	 * @param params
	 *            参数数组
	 * @return 结果对象
	 * @throws SQLException
	 */
	public <T> T findBy(String sql, int columnIndex, Object[] params) throws SQLException {
		if (sql.indexOf("select nextval(") >= 0) {
			queryRunner = new QueryRunner(dataSource);
		} else {
			queryRunner = new QueryRunner(readOnlyDataSource);
		}
		T object = null;
		try {
			if (params == null) {
				object = queryRunner.query(sql, new ScalarHandler<T>(columnIndex));
			} else {
				object = queryRunner.query(sql, new ScalarHandler<T>(columnIndex), params);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return object;
	}

	public <T> T findBy(String sql, int columnIndex, Object[] params, boolean useMaster) throws SQLException {
		if (sql.indexOf("select nextval(") >= 0 || useMaster) {
			queryRunner = new QueryRunner(dataSource);
		} else {
			queryRunner = new QueryRunner(readOnlyDataSource);
		}
		T object = null;
		try {
			if (params == null) {
				object = queryRunner.query(sql, new ScalarHandler<T>(columnIndex));
			} else {
				object = queryRunner.query(sql, new ScalarHandler<T>(columnIndex), params);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return object;
	}

	public <T> BeanListHandler<T> getBeanList(Class<T> clazz) {
		return new BeanListHandler<T>(clazz, new BasicRowProcessor(new HumpBeanProcessor(new HumpMatcher())));
	}

	public <T> BeanHandler<T> getBean(Class<T> clazz) {
		return new BeanHandler<T>(clazz, new BasicRowProcessor(new HumpBeanProcessor(new HumpMatcher())));
	}

	// 为支持事务
	/**
	 * 获取数据库连接
	 *  @param releaseConn 是否需要手动提交；true：手动提交；false：自动提交
	 *  @return
	 *  @throws SQLException
	 *  @author zengja
	 *  @date 2015年6月4日 上午10:52:53
	 */
	public Connection getConn(boolean releaseConn) throws SQLException {
		Connection conn = null;
		if (releaseConn) {
			//conn = getConnByJDBC();
			conn = dataSource.getConnection();
			conn.setAutoCommit(false);
		}else{
			conn = dataSource.getConnection();
			conn.setAutoCommit(true);
		}
		return conn;
	}

	/**
	 * 查询，获取查询结果的第一条记录
	 * 
	 * @param entityClass
	 * @param sql
	 * @param params
	 * @param releaseConn
	 *            是否手动释放链接
	 * @return
	 * @throws SQLException
	 * @author zengja
	 * @date 2014年6月24日 上午9:09:18
	 */
	public <T> T findFirstTrans(Class<T> entityClass, String sql, Object[] params, boolean releaseConn) throws SQLException {
		Connection conn = getConn(releaseConn);
		queryRunner = new QueryRunner(dataSource);
		Object object = null;
		try {
			if (releaseConn) {
				if (params == null) {
					object = queryRunner.query(conn, sql, getBean(entityClass));
				} else {
					object = queryRunner.query(conn, sql, getBean(entityClass), params);
				}
			} else {
				if (params == null) {
					object = queryRunner.query(sql, getBean(entityClass));
				} else {
					object = queryRunner.query(sql, getBean(entityClass), params);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return (T) object;
	}

	/**
	 * 执行增删改语句
	 * 
	 * @param sql
	 * @param params
	 * @param releaseConn
	 *            是否手动提交及手动释放连接
	 * @return
	 * @throws SQLException
	 * @author zengja
	 * @date 2014年6月24日 下午12:16:40
	 */
	public int update(String sql, Object[] params, boolean releaseConn) throws SQLException {
		Connection conn = getConn(releaseConn);
		queryRunner = new QueryRunner(dataSource);
		int affectedRows = 0;
		try {
			if (releaseConn) {
				if (params == null) {
					affectedRows = queryRunner.update(conn, sql);
				} else {
					affectedRows = queryRunner.update(conn, sql, params);
				}
			} else {
				if (params == null) {
					affectedRows = queryRunner.update(sql);
				} else {
					affectedRows = queryRunner.update(sql, params);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		loggerInfo(sql, params, affectedRows);
		return affectedRows;
	}

	/**
	 * 为数据库增、删、改操作写日志，同时写入到数据库表中
	 *  @param sql
	 *  @param params
	 *  @param affectedRows
	 *  @author zengja
	 *  @date 2015年1月9日 下午6:02:17
	 */
	private void loggerInfo(String sql, Object params,int affectedRows) {
	}
	
	/**
	 * 直接JDBC，从读写库中获取数据库连接
	 *  @return
	 *  @author zengja
	 *  @date 2015年6月3日 下午7:30:53
	 */
	public Connection getConnByJDBC() {
		Connection conn = null;
		try {
        	rb = ResourceBundle.getBundle(CONFIG_FILE);
        	String className = rb.getString("master.driverClassName");
			className = StringUtils.isEmpty(className) ? "com.mysql.jdbc.Driver" : className;
        	String url = rb.getString("master.url");
        	String username = rb.getString("master.username");
        	String password = rb.getString("master.password");
		    Class.forName(className);
		    conn = DriverManager.getConnection(url, username, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
}