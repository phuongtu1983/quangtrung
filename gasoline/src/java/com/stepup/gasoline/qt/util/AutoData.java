/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.util;

import com.stepup.gasoline.qt.dao.AutoDAO;

/**
 *
 * @author Administrator
 */
public class AutoData implements Runnable {

    @Override
    public void run() {
        autoInStock();
    }

    private void autoInStock() {
        try {
            AutoDAO autoDAO = new AutoDAO();
            autoDAO.insertInStockDay();
        } catch (Exception ex) {

        }
    }

}
