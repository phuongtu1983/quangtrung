/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.employeetimesheet;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.DynamicFieldBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.DynamicFieldDAO;
import com.stepup.gasoline.qt.dao.EmployeeDAO;
import com.stepup.gasoline.qt.employee.EmployeeFormBean;
import com.stepup.gasoline.qt.util.Constants;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class GetDynamicFieldByOrganizationInTimeSheetAction extends SpineAction {

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
        ArrayList arrField = null;
        try {
            int employeeId = NumberUtil.parseInt(request.getParameter("employeeId"), 0);
            EmployeeDAO employeeDAO = new EmployeeDAO();
            EmployeeFormBean employeeBean = employeeDAO.getEmployee(employeeId);
            int organizationId = 0;
            if (employeeBean != null) {
                organizationId = employeeBean.getOrganizationId();
            }
            DynamicFieldDAO dynamicFieldDAO = new DynamicFieldDAO();
            arrField = dynamicFieldDAO.getDynamicFieldValues(0, DynamicFieldBean.TIMESHEET, organizationId);
        } catch (Exception ex) {
        }
        request.setAttribute(Constants.DYNAMIC_FIELD_LIST, arrField);
        return true;
    }
}
