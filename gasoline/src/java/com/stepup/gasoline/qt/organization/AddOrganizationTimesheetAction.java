/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.organization;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.DynamicFieldBean;
import com.stepup.gasoline.qt.bean.OrganizationTimesheetFieldBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.OrganizationDAO;
import com.stepup.gasoline.qt.dynamicfield.DynamicFieldValueFormBean;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class AddOrganizationTimesheetAction extends SpineAction {

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public boolean doAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        OrganizationTimesheetFormBean formBean = (OrganizationTimesheetFormBean) form;
        addTimesheetField(formBean);
        return true;
    }

    private void addTimesheetField(OrganizationTimesheetFormBean formBean) {
        try {
            OrganizationDAO employeeDAO = new OrganizationDAO();
            ArrayList arrField = employeeDAO.getOrganizationTimesheetField(formBean.getOrganizationId(), formBean.getOrganizationId(), DynamicFieldBean.TIMESHEET);
            int length = formBean.getFieldId().length;
            int id = 0;
            for (int i = 0; i < length; i++) {
                id = NumberUtil.parseInt(formBean.getFieldValueId()[i], 0);
                if (id == 0) {
                    OrganizationTimesheetFieldBean bean = new OrganizationTimesheetFieldBean();
                    bean.setOrganizationId(formBean.getOrganizationId());
                    bean.setFieldId(NumberUtil.parseInt(formBean.getFieldId()[i], 0));
                    bean.setAmount(NumberUtil.parseDouble(formBean.getFieldValue()[i], 0));
                    employeeDAO.insertOrganizationTimesheetField(bean);
                } else {
                    int j = 0;
                    DynamicFieldValueFormBean oldBean = null;
                    boolean isUpdate = false;
                    double amount = 0;
                    for (; j < arrField.size(); j++) {
                        oldBean = (DynamicFieldValueFormBean) arrField.get(j);
                        if (oldBean.getId() == id) {
                            isUpdate = false;
                            amount = NumberUtil.parseDouble(formBean.getFieldValue()[i], 0);
                            if (NumberUtil.parseDouble(oldBean.getValue(), 0) != amount) {
                                isUpdate = true;
                            }
                            if (isUpdate) {
                                OrganizationTimesheetFieldBean bean = new OrganizationTimesheetFieldBean();
                                bean.setId(id);
                                bean.setAmount(amount);
                                employeeDAO.updateOrganizationTimesheetField(bean);
                            }
                            break;
                        }
                    }
                }
            }
        } catch (Exception ex) {
        }
    }

}
