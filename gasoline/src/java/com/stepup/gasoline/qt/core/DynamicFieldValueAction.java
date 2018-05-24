/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.core;

import com.stepup.gasoline.qt.dao.DynamicFieldDAO;
import com.stepup.gasoline.qt.util.Constants;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author Administrator
 */
public class DynamicFieldValueAction extends SpineAction {

    protected int parentId;
    protected int organizationId;

    @Override
    public boolean doAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        boolean result = doMainAction(mapping, form, request, response);
        setDynamicFields(request);
        return result;
    }

    public boolean doMainAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        return true;
    }

    protected void setDynamicFields(HttpServletRequest request) {
        ArrayList arrField = null;
        try {
            DynamicFieldDAO dynamicFieldDAO = new DynamicFieldDAO();
            arrField = dynamicFieldDAO.getDynamicFieldValues(this.parentId, getTableName(), this.organizationId);
        } catch (Exception ex) {
        }
        if (arrField != null && arrField.size() > 0) {
            request.setAttribute(Constants.DYNAMIC_FIELD_VALUE, arrField);
        }
    }

    public void setOrganizationId(int organizationId) {
        this.organizationId = organizationId;
    }

    protected void setParentId(int id) {
        this.parentId = id;
    }

    protected String getTableName() {
        return "";
    }
}
