package com.stepup.core.database;

import javax.servlet.ServletConfig;
import javax.sql.DataSource;
import java.sql.SQLException;
import javax.servlet.http.HttpServlet;
import javax.servlet.ServletContext;

/***
 *
 * @author Administrator
 *
 */
public class DBInit extends HttpServlet {

    public static DataSource dataSource = null;

    public DBInit() {

    }

    public synchronized DataSource getDataSource(String dbName) throws SQLException {
        try {
            ServletConfig config = getServletConfig();

            ServletContext context = config.getServletContext();

            dataSource = (DataSource) context.getAttribute(dbName);

            if (dataSource == null) {
                System.out.println("Cannot find key " + dbName +" data source in struts-config.xml");
            }
            return dataSource;
        } catch (Exception ex) {
            System.out.println("Can't get DataSource ");
            ex.printStackTrace();
            throw new SQLException("Cannot Create Connection in DBInit:getDataSource");
        }
    }
   
}
