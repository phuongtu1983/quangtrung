package com.stepup.gasoline.qt.database;

import java.sql.SQLException;

/***
 *
 * @author tunguyen
 *
 */
public class DBInit extends com.stepup.core.database.DBInit {

    public DBInit() {
    }

    @Override
    public void init() {
        try {
            this.getDataSource("DBQTGA");
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
    }
}