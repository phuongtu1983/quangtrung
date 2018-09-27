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
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author Administrator
 */
public class AddDynamicFieldValueAction extends SpineAction {

    protected int parentId;
    protected int organizationId;

    protected void setParentId(int id) {
        this.parentId = id;
    }

    public void setOrganizationId(int organizationId) {
        this.organizationId = organizationId;
    }

    protected String getTableName() {
        return "";
    }

    @Override
    public boolean doAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        boolean result = doMainAction(mapping, form, request, response);
        addDynamicFieldValues((DynamicFieldValueParentFormBean) form);
        return result;
    }

    public boolean doMainAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        return true;
    }

    protected void addDynamicFieldValues(DynamicFieldValueParentFormBean formBean) {
        try {
            DynamicFieldDAO dynamicFieldDAO = new DynamicFieldDAO();
            ArrayList arrDetail = dynamicFieldDAO.getDynamicFieldValues(this.parentId, getTableName(), this.organizationId);
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
                    dynamicFieldDAO.insertDynamicFieldValue(bean);
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
                                dynamicFieldDAO.updateDynamicFieldValue(bean);
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
