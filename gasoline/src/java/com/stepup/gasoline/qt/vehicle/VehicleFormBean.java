/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.vehicle;

import com.stepup.gasoline.qt.bean.VehicleBean;

/**
 *
 * @author phuongtu
 */
public class VehicleFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String plate;
    private String note;

    public VehicleFormBean() {
    }

    public VehicleFormBean(VehicleBean bean) {
        this.id = bean.getId();
        this.plate = bean.getPlate();
        this.note = bean.getNote();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPlate() {
        return plate;
    }

    public void setPlate(String plate) {
        this.plate = plate;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

}
