/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.common;

import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.util.Constants;
import com.stepup.gasoline.qt.util.QTUtil;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.util.LabelValueBean;

/**
 *
 * @author phuongtu
 */
public class BaseStatusFormAction extends SpineAction {

    /**
     * This is the action called from the Struts framework.
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
        request.setAttribute(Constants.SELECTED, EmployeeBean.STATUS_ACTIVE);
        return true;
    }
}
