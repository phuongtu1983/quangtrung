/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.employeepanelty;

import com.stepup.gasoline.qt.bean.EmployeePaneltyBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.EmployeeDAO;
import com.stepup.gasoline.qt.util.QTUtil;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class AddEmployeePaneltyAction extends SpineAction {

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
        EmployeePaneltyFormBean formBean = (EmployeePaneltyFormBean) form;
        EmployeeDAO employeeDAO = new EmployeeDAO();

        boolean bNew = true;
        if (formBean.getId() != 0) {
            bNew = false;
        }
        EmployeePaneltyBean bean = new EmployeePaneltyBean();
        bean.setId(formBean.getId());
        bean.setCreatedDate(formBean.getCreatedDate());
        bean.setPaneltyId(formBean.getPaneltyId());
        bean.setEmployeeId(formBean.getEmployeeId());
        bean.setAmount(formBean.getAmount());
        bean.setCode(formBean.getCode());
        bean.setNote(formBean.getNote());
        bean.setCreatedEmployeeId(QTUtil.getEmployeeId(request.getSession()));
        try {
            if (bNew) {
                employeeDAO.insertEmployeePanelty(bean);
            } else {
                employeeDAO.updateEmployeePanelty(bean);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}
