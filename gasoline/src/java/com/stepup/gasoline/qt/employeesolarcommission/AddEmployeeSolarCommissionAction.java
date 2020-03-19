/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.employeesolarcommission;

import com.stepup.gasoline.qt.bean.EmployeeSolarCommissionBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.EmployeeDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

/**
 *
 * @author phuongtu
 */
public class AddEmployeeSolarCommissionAction extends SpineAction {

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
        EmployeeSolarCommissionFormBean formBean = (EmployeeSolarCommissionFormBean) form;
        EmployeeDAO employeeDAO = new EmployeeDAO();
        EmployeeSolarCommissionBean bean = null;
        boolean bNew = false;
        boolean isExist = false;
        try {
            bean = employeeDAO.getEmployeeSolarCommissionByName(formBean.getName());
        } catch (Exception ex) {
        }
        int employeeSolarCommissionId = formBean.getId();
        if (employeeSolarCommissionId == 0) {
            bNew = true;
            if (bean != null) {
                isExist = true;
            }
        } else {
            bNew = false;
            if (bean != null && bean.getId() != employeeSolarCommissionId) {
                isExist = true;
            }
            try {
                if (bean == null) {
                    bean = employeeDAO.getEmployeeSolarCommission(employeeSolarCommissionId);
                }
            } catch (Exception ex) {
            }
        }
        if (isExist) {
            ActionMessages errors = new ActionMessages();
            errors.add("employeeSolarCommissionExisted", new ActionMessage("employeeSolarCommission.save.error"));
            saveErrors(request, errors);
            return false;
        }
        boolean isUpdate = false;
        try {
            if (!bNew) {
                if (!formBean.getName().equals(bean.getName())) {
                    isUpdate = true;
                }
                if (!formBean.getNote().equals(bean.getNote())) {
                    isUpdate = true;
                }
                if (formBean.getAmount()!= bean.getAmount()) {
                    isUpdate = true;
                }
            }
        } catch (Exception ex) {
        }
        bean = new EmployeeSolarCommissionBean();
        bean.setId(formBean.getId());
        bean.setName(formBean.getName());
        bean.setNote(formBean.getNote());
        bean.setAmount(formBean.getAmount());
        try {
            if (bNew) {
                employeeDAO.insertEmployeeSolarCommission(bean);
            } else {
                if (isUpdate) {
                    employeeDAO.updateEmployeeSolarCommission(bean);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}
