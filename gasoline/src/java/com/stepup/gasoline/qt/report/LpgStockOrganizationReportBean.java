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
public class LpgStockOrganizationReportBean {

    private String date;
    private String content;
    private float gas12Stock;
    private float gas45Stock;
    private float fraction12;
    private float fraction45;
    private float vehicleOut12;
    private float vehicleOut45;
    private float vehicleIn12;
    private float vehicleIn45;
    private float closingStock12;
    private float closingStock45;
    private float closingStock;
    private float finalStock;
    private int shieldImport;
    private int shieldDecrease;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public float getGas12Stock() {
        return gas12Stock;
    }

    public void setGas12Stock(float gas12Stock) {
        this.gas12Stock = gas12Stock;
    }

    public float getGas45Stock() {
        return gas45Stock;
    }

    public void setGas45Stock(float gas45Stock) {
        this.gas45Stock = gas45Stock;
    }

    public float getFraction12() {
        return fraction12;
    }

    public void setFraction12(float fraction12) {
        this.fraction12 = fraction12;
    }

    public float getFraction45() {
        return fraction45;
    }

    public void setFraction45(float fraction45) {
        this.fraction45 = fraction45;
    }

    public float getVehicleOut12() {
        return vehicleOut12;
    }

    public void setVehicleOut12(float vehicleOut12) {
        this.vehicleOut12 = vehicleOut12;
    }

    public float getVehicleOut45() {
        return vehicleOut45;
    }

    public void setVehicleOut45(float vehicleOut45) {
        this.vehicleOut45 = vehicleOut45;
    }

    public float getVehicleIn12() {
        return vehicleIn12;
    }

    public void setVehicleIn12(float vehicleIn12) {
        this.vehicleIn12 = vehicleIn12;
    }

    public float getVehicleIn45() {
        return vehicleIn45;
    }

    public void setVehicleIn45(float vehicleIn45) {
        this.vehicleIn45 = vehicleIn45;
    }

    public int getShieldImport() {
        return shieldImport;
    }

    public void setShieldImport(int shieldImport) {
        this.shieldImport = shieldImport;
    }

    public int getShieldDecrease() {
        return shieldDecrease;
    }

    public void setShieldDecrease(int shieldDecrease) {
        this.shieldDecrease = shieldDecrease;
    }

    public float getClosingStock12() {
        return closingStock12;
    }

    public void setClosingStock12(float closingStock12) {
        this.closingStock12 = closingStock12;
    }

    public float getClosingStock45() {
        return closingStock45;
    }

    public void setClosingStock45(float closingStock45) {
        this.closingStock45 = closingStock45;
    }

    public float getClosingStock() {
        return closingStock;
    }

    public void setClosingStock(float closingStock) {
        this.closingStock = closingStock;
    }

    public float getFinalStock() {
        return finalStock;
    }

    public void setFinalStock(float finalStock) {
        this.finalStock = finalStock;
    }

}
