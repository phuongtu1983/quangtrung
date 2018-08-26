/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.core;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.DynamicFieldValueBean;
import com.stepup.gasoline.qt.dao.DynamicFieldDAO;
import com.stepup.gasoline.qt.dynamicfield.DynamicFieldValueFormBean;
import com.stepup.gasoline.qt.dynamicfield.DynamicFieldValueParentFormBean;
import com.stepup.gasoline.qt.util.QTUtil;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author Administrator
 */
public class AddDynamicFieldFreeValueAction extends SpineAction {

    protected int parentId;

    protected void setParentId(int id) {
        this.parentId = id;
    }

    protected String getParentTableName() {
        return "";
    }

    @Override
    public boolean doAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        boolean result = doMainAction(mapping, form, request, response);
        addDynamicFieldFreeValues((DynamicFieldValueParentFormBean) form, QTUtil.getOrganizationId(request.getSession()));
        return result;
    }

    public boolean doMainAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        return true;
    }

    protected void addDynamicFieldFreeValues(DynamicFieldValueParentFormBean formBean, int organizationId) {
        try {
            DynamicFieldDAO dynamicFieldDAODAO = new DynamicFieldDAO();
            ArrayList arrDetail = dynamicFieldDAODAO.getDynamicFieldFreeValues(this.parentId, getParentTableName());
            int length = formBean.getFieldValueId().length;
            int id = 0;
            DynamicFieldValueBean bean = null;
            for (int i = 0; i < length; i++) {
                id = NumberUtil.parseInt(formBean.getFieldValueId()[i], 0);
                if (id == 0) {
                    bean = new DynamicFieldValueBean();
                    bean.setParentId(this.parentId);
                    bean.setFieldId(NumberUtil.parseInt(formBean.getFieldId()[i], 0));
                    bean.setValue(formBean.getFieldValue()[i] + "");
                    dynamicFieldDAODAO.insertDynamicFieldFreeValue(bean);
                } else {
                    DynamicFieldValueFormBean oldBean = null;
                    boolean isUpdate = false;
                    for (int j = 0; j < arrDetail.size(); j++) {
                        oldBean = (DynamicFieldValueFormBean) arrDetail.get(j);
                        if (oldBean.getId() == id) {
                            bean = new DynamicFieldValueBean();
                            bean.setId(id);
                            isUpdate = false;
                            if (!oldBean.getValue().equals(formBean.getFieldValue()[i] + "")) {
                                isUpdate = true;
                                bean.setValue(formBean.getFieldValue()[i] + "");
                            }
                            if (isUpdate) {
                                dynamicFieldDAODAO.updateDynamicFieldFreeValue(bean);
                            }
                            arrDetail.remove(j);
                            break;
                        }
                    }
                }
            }
        } catch (Exception ex) {
        }
    }

}
