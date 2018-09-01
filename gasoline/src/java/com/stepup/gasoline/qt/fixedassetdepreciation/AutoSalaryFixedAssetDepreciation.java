/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.fixedassetdepreciation;

import com.stepup.core.util.DateUtil;
import com.stepup.gasoline.qt.dao.FixedAssetDAO;

/**
 *
 * @author Administrator
 */
public class AutoSalaryFixedAssetDepreciation implements Runnable {

    @Override
    public void run() {
        try {
            String code = DateUtil.today("yyyyMMdd") + "-AF";
            FixedAssetDAO fixedAssetDAO = new FixedAssetDAO();
            fixedAssetDAO.autoCreateFixedAssetDepreciation(code);
        } catch (Exception ex) {

        }
    }

}
