package com.tiaotiao.web.utils.dbutils;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.sql.DataSource;
import org.apache.commons.dbutils.AbstractQueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;

/**
 * Based on the DbUtil hierarchy, this class allows us to call stored
 * procedures from DbUtil. Executes SQL stored procedure calls with pluggable
 * strategies for handling ResultSets. This class is thread safe.
 *
 * @author javabob64
 *
 * @see ResultSetHandler
 */
public class ProcRunner extends AbstractQueryRunner {

    public ProcRunner() {
	super();
    }

    public ProcRunner(DataSource ds) {
	super(ds);
    }

    public ProcRunner(boolean pmdKnownBroken) {
        super(pmdKnownBroken);
    }

    public ProcRunner(DataSource ds, boolean pmdKnownBroken) {
        super(ds, pmdKnownBroken);
    }

    public <T> T queryProc(Connection conn, String sql,
                           ResultSetHandler<T> rsh, Object... params)
	         throws SQLException {
	return this.queryProc(conn, false, sql, rsh, params);
    }

    public <T> T queryProc(Connection conn, String sql,
                           ResultSetHandler<T> rsh) throws SQLException {
	 return this.queryProc(conn, false, sql, rsh, (Object[]) null);
	}

    public <T> T queryProc(String sql, ResultSetHandler<T> rsh,
                           Object... params) throws SQLException {
	Connection conn = this.prepareConnection();
        return this.queryProc(conn, true, sql, rsh, params);
    }

    public <T> T queryProc(String sql, ResultSetHandler<T> rsh)
                 throws SQLException {
        Connection conn = this.prepareConnection();
        return this.queryProc(conn, true, sql, rsh, (Object[]) null);
    }

    /**
     * Calls stored procedure after checking the parameters to ensure nothing
     * is null.
     * @param conn The connection to use for the query call.
     * @param closeConn True if the connection should be closed, else false.
     * @param sql The stored procedure call to execute.
     * @param params An array of query replacement parameters.  Each row in
     * this array is one set of batch replacement values.
     * @return The results of the query.
     * @throws SQLException If there are database or parameter errors.
     */
    private <T> T queryProc(Connection conn, boolean closeConn, String sql,
	                    ResultSetHandler<T> rsh, Object... params)
                            throws SQLException {
	if (conn == null) {
		throw new SQLException("Null connection");
	}
	if (sql == null) {
		if (closeConn) {close(conn);}
		throw new SQLException("Null SQL statement");
	}
	if (rsh == null) {
		if (closeConn) {close(conn);}
		throw new SQLException("Null ResultSetHandler");
	}
	if (sql.toUpperCase().indexOf("CALL") == -1) {
		if (closeConn) {close(conn);}
		throw new SQLException("Not a callable statement");
	}
	CallableStatement stmt = null;
	ResultSet rs = null;
	T result = null;

	try {
		stmt = this.prepareCall(conn, sql);
		this.fillStatement(stmt, params);
		rs = this.wrap(stmt.executeQuery());
		result = rsh.handle(rs);
	} catch (SQLException e) {
		this.rethrow(e, sql, params);
	} finally {
		try {
			close(rs);
		} finally {
			close(stmt);
			if (closeConn) {
				close(conn);
			}
		}
	}
	return result;
    }

    protected CallableStatement prepareCall(Connection conn, String sql)
                                throws SQLException {
    	return conn.prepareCall(sql);
    }
}//end of class ProcRunner