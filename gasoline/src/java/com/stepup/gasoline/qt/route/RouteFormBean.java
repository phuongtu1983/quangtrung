/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.route;

import com.stepup.gasoline.qt.bean.RouteBean;

/**
 *
 * @author phuongtu
 */
public class RouteFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String name;
    private float distance;
    private String note;

    public RouteFormBean() {
    }

    public RouteFormBean(RouteBean bean) {
        this.id = bean.getId();
        this.name = bean.getName();
        this.distance = bean.getDistance();
        this.note = bean.getNote();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getDistance() {
        return distance;
    }

    public void setDistance(float distance) {
        this.distance = distance;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

}
