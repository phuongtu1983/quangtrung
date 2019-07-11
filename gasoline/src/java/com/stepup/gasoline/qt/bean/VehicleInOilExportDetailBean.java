/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.bean;

/**
 *
 * @author phuongtu
 */
public class VehicleInOilExportDetailBean {

    private int id;
    private int vehicleInId;
    private int oilExportId;
    private String code;
    private String customerName;
    private String createdDate;
    private double total;
    private String totalText;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getVehicleInId() {
        return vehicleInId;
    }

    public void setVehicleInId(int vehicleInId) {
        this.vehicleInId = vehicleInId;
    }

    public int getOilExportId() {
        return oilExportId;
    }

    public void setOilExportId(int oilExportId) {
        this.oilExportId = oilExportId;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getTotalText() {
        return totalText;
    }

    public void setTotalText(String totalText) {
        this.totalText = totalText;
    }

}
