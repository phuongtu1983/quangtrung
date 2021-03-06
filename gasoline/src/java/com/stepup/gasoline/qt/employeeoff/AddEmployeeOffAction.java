/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.employeeoff;

import com.stepup.core.util.OutputUtil;
import com.stepup.gasoline.qt.bean.EmployeeOffBean;
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
        if (formBean.getActualOffDay() == 0) {
            bean.setActualOffDay(QTUtil.getActualOff(formBean.getFromDate(), formBean.getToDate()));
        } else {
            bean.setActualOffDay(formBean.getActualOffDay());
        }
        bean.setCreatedEmployeeId(QTUtil.getEmployeeId(request.getSession()));
        try {
            if (bNew) {
                int id = employeeDAO.insertEmployeeOff(bean);
                bean.setId(id);
            } else {
                employeeDAO.updateEmployeeOff(bean);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
        String json = "{\"id\":\"" + bean.getId() + "\"";
        json += "}";
        OutputUtil.sendStringToOutput(response, json);
        return true;
    }
    
    @Override
    protected boolean isReturnStream() {
        return true;
    }
}
