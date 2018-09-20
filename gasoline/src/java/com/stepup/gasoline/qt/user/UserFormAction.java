/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.user;

import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.UserBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.EmployeeDAO;
import com.stepup.gasoline.qt.dao.UserDAO;
import com.stepup.gasoline.qt.employee.EmployeeFormBean;
import com.stepup.gasoline.qt.util.Constants;
import com.stepup.gasoline.qt.util.QTUtil;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.validator.GenericValidator;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.util.LabelValueBean;

/**
 *
 * @author phuongtu
 */
public class UserFormAction extends SpineAction {

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
        UserBean bean = new UserBean();
        String userid = request.getParameter("userId");
        if (!GenericValidator.isBlankOrNull(userid)) {
            UserDAO userDAO = new UserDAO();
            try {
                bean = userDAO.getUser(Integer.parseInt(userid));
            } catch (Exception ex) {
            }
        }
        UserFormBean formBean = null;
        if (bean == null) {
            formBean = new UserFormBean();
        } else {
            formBean = new UserFormBean(bean);
        }
        request.setAttribute(Constants.USER, formBean);

        ArrayList empList = null;
        try {
            EmployeeDAO empDAO = new EmployeeDAO();
            if (formBean.getId() == 0) {
                empList = empDAO.getEmployeeHasNotAccount(EmployeeBean.STATUS_ACTIVE, QTUtil.getOrganizationManageds(request.getSession()));
            } else {
                EmployeeFormBean empBean = empDAO.getEmployee(formBean.getEmpId());
                empList = new ArrayList();
                empList.add(empBean);
            }
        } catch (Exception ex) {
        }

        if (empList == null) {
            empList = new ArrayList();
        }

        request.setAttribute(Constants.USER_LIST, empList);

        ArrayList arrStatus = new ArrayList();
        LabelValueBean value;
        value = new LabelValueBean();
        value.setLabel(QTUtil.getBundleString("employee.detail.status.active"));
        value.setValue(EmployeeBean.STATUS_ACTIVE + "");
        arrStatus.add(value);
        value = new LabelValueBean();
        value.setLabel(QTUtil.getBundleString("employee.detail.status.inactive"));
        value.setValue(EmployeeBean.STATUS_INACTIVE + "");
        arrStatus.add(value);
        request.setAttribute(Constants.STATUS_LIST, arrStatus);
        return true;
    }
}
