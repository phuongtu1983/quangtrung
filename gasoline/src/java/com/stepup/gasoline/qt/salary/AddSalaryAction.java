/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.salary;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.SalaryBean;
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
public class AddSalaryAction extends SpineAction {

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
        SalaryFormBean formBean = (SalaryFormBean) form;
        try {
            SalaryBean bean = new SalaryBean();
            bean.setId(formBean.getId());
            bean.setTotal(formBean.getTotal());
            EmployeeDAO employeeDAO = new EmployeeDAO();
            employeeDAO.updateSalary(bean);
            updateField(formBean);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }

    protected void updateField(SalaryFormBean formBean) {
        try {
            EmployeeDAO employeeDAO = new EmployeeDAO();
            int length = formBean.getSalaryFieldId().length;
            for (int i = 0; i < length; i++) {
                employeeDAO.updateSalaryField(NumberUtil.parseInt(formBean.getSalaryFieldId()[i], 0), NumberUtil.parseDouble(formBean.getAmount()[i], 0), formBean.getNote()[i]);
            }
        } catch (Exception ex) {
        }
    }
}
