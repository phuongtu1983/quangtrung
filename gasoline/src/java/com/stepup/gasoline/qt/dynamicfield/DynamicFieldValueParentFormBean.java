/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.dynamicfield;

/**
 *
 * @author Administrator
 */
public class DynamicFieldValueParentFormBean extends org.apache.struts.action.ActionForm {

    private String[] fieldValueId;
    private String[] fieldId;
    private String[] fieldValue;

    public String[] getFieldValueId() {
        return fieldValueId;
    }

    public void setFieldValueId(String[] fieldValueId) {
        this.fieldValueId = fieldValueId;
    }

    public String[] getFieldId() {
        return fieldId;
    }

    public void setFieldId(String[] fieldId) {
        this.fieldId = fieldId;
    }

    public String[] getFieldValue() {
        return fieldValue;
    }

    public void setFieldValue(String[] fieldValue) {
        this.fieldValue = fieldValue;
    }
}
