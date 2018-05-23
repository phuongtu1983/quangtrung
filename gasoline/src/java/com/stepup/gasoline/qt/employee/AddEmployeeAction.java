/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.employee;

import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.core.AddDynamicFieldValueAction;
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
public class AddEmployeeAction extends AddDynamicFieldValueAction {

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
    public boolean doMainAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        EmployeeFormBean formBean = (EmployeeFormBean) form;
        EmployeeDAO employeeDAO = new EmployeeDAO();
        EmployeeFormBean oldBean = null;
        boolean bNew = false;
        boolean isExist = false;
        try {
            oldBean = employeeDAO.getEmployeeByNameOrEmail(formBean.getFullname(), formBean.getEmail());
        } catch (Exception ex) {
        }
        int employeeId = formBean.getId();
        if (employeeId == 0) {
            bNew = true;
            if (oldBean != null) {
                isExist = true;
            }
        } else {
            bNew = false;
            if (oldBean != null && oldBean.getId() != employeeId) {
                isExist = true;
            }
            if (oldBean == null) {
                try {
                    oldBean = employeeDAO.getEmployee(employeeId);
                } catch (Exception ex) {
                }
            }
        }
        if (isExist) {
            ActionMessages errors = new ActionMessages();
            errors.add("employeeExisted", new ActionMessage("employee.save.error"));
            saveErrors(request, errors);
            return false;
        }
        boolean isUpdate = false;
        try {
            if (!bNew) {
                if (!formBean.getFullname().equals(oldBean.getFullname())) {
                    isUpdate = true;
                }
                if (!formBean.getEmail().equals(oldBean.getEmail())) {
                    isUpdate = true;
                }
                if (formBean.getSalary() != oldBean.getSalary()) {
                    isUpdate = true;
                }
                if (formBean.getOrganizationId() != oldBean.getOrganizationId()) {
                    isUpdate = true;
                }
                if (formBean.getStatus() != oldBean.getStatus()) {
                    isUpdate = true;
                }
            }
        } catch (Exception ex) {
        }
        EmployeeBean bean = new EmployeeBean();
        bean.setId(formBean.getId());
        bean.setFullname(formBean.getFullname());
        bean.setEmail(formBean.getEmail());
        bean.setSalary(formBean.getSalary());
        bean.setStatus(formBean.getStatus());
        bean.setOrganizationId(formBean.getOrganizationId());
        try {
            if (bNew) {
                employeeId = employeeDAO.insertEmployee(bean);
                super.setParentId(employeeId);
            } else {
                if (isUpdate) {
                    employeeDAO.updateEmployee(bean);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }

    @Override
    protected String getTableName() {
        return "employee";
    }
}
