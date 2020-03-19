/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.report;

/**
 *
 * @author Administrator
 */
public class SolarStockReportOutBean {

    private String solarIds;
    private int openingStock;
    private int closingStock;

    public String getSolarIds() {
        return solarIds;
    }

    public void setSolarIds(String solarIds) {
        this.solarIds = solarIds;
    }

    public int getOpeningStock() {
        return openingStock;
    }

    public void setOpeningStock(int openingStock) {
        this.openingStock = openingStock;
    }

    public int getClosingStock() {
        return closingStock;
    }

    public void setClosingStock(int closingStock) {
        this.closingStock = closingStock;
    }

}
