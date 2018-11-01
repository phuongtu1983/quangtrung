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
public class PetroStockReportOutBean {

    private String petroIds;
    private int openingStock;

    public String getPetroIds() {
        return petroIds;
    }

    public void setPetroIds(String petroIds) {
        this.petroIds = petroIds;
    }

    public int getOpeningStock() {
        return openingStock;
    }

    public void setOpeningStock(int openingStock) {
        this.openingStock = openingStock;
    }

}
