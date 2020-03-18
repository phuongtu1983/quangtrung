/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.bean;

/**
 *
 * @author phuongtu
 */
public class DiscountBean {

    private int id;
    private String name;
    private String code;
    private String note;
    private double shellGasComission;

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public double getShellGasComission() {
        return shellGasComission;
    }

    public void setShellGasComission(double shellGasComission) {
        this.shellGasComission = shellGasComission;
    }

}
