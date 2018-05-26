/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.employeetimesheet;

import com.stepup.gasoline.qt.bean.EmployeeTimesheetBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.EmployeeDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class AddEmployeeTimesheetAction extends SpineAction {

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
        EmployeeTimesheetFormBean formBean = (EmployeeTimesheetFormBean) form;
        EmployeeDAO employeeDAO = new EmployeeDAO();

        boolean bNew = true;
        if (formBean.getId() != 0) {
            bNew = false;
        }
        EmployeeTimesheetBean bean = new EmployeeTimesheetBean();
        bean.setId(formBean.getId());
        bean.setTimesheetDate(formBean.getTimesheetDate());
        bean.setQuantity(formBean.getQuantity());
        bean.setCode(formBean.getCode());
        bean.setEmployeeId(formBean.getEmployeeId());
        bean.setNote(formBean.getNote());
        bean.setFieldId(formBean.getFieldId());
        try {
            if (bNew) {
                employeeDAO.insertEmployeeTimesheet(bean);
            } else {
                employeeDAO.updateEmployeeTimesheet(bean);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}
