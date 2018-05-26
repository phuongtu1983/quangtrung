/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.employeeoff;

import com.stepup.core.util.DateUtil;
import com.stepup.gasoline.qt.bean.EmployeeOffBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.EmployeeDAO;
import java.util.Calendar;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class AddEmployeeOffAction extends SpineAction {

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
        EmployeeOffFormBean formBean = (EmployeeOffFormBean) form;
        EmployeeDAO employeeDAO = new EmployeeDAO();

        boolean bNew = true;
        if (formBean.getId() != 0) {
            bNew = false;
        }
        EmployeeOffBean bean = new EmployeeOffBean();
        bean.setId(formBean.getId());
        bean.setCreatedDate(formBean.getCreatedDate());
        bean.setEmployeeId(formBean.getEmployeeId());
        bean.setFromDate(formBean.getFromDate());
        bean.setCode(formBean.getCode());
        bean.setToDate(formBean.getToDate());
        bean.setNote(formBean.getNote());
        bean.setActualOffDay(getActualOff(formBean.getFromDate(), formBean.getToDate()));
        try {
            if (bNew) {
                employeeDAO.insertEmployeeOff(bean);
            } else {
                employeeDAO.updateEmployeeOff(bean);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }

    private int getActualOff(String fromDate, String toDate) {
        int result = 0;
        try {
            Calendar fromC = Calendar.getInstance();
            fromC.setTime(DateUtil.convertStringToDate(fromDate, "dd/MM/yyyy"));

            Calendar toC = Calendar.getInstance();
            toC.setTime(DateUtil.convertStringToDate(toDate, "dd/MM/yyyy"));

            while (toC.after(fromC)) {
                if (fromC.get(Calendar.DAY_OF_WEEK) != Calendar.SUNDAY) {
                    result++;
                }
                fromC.add(Calendar.DATE, 1);
            }
        } catch (Exception ex) {

        }
        return result;
    }
}
