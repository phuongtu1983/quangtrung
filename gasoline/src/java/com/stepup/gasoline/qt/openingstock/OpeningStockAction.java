/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.openingstock;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Administrator
 */
public interface OpeningStockAction {

    public abstract void runImport(HttpServletRequest request, String fileName);
}
