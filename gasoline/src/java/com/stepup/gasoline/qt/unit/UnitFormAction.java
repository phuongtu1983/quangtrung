/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.unit;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.UnitBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.UnitDAO;
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
public class UnitFormAction extends SpineAction {

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
        UnitBean bean = null;
        String unitid = request.getParameter("unitId");
        if (!GenericValidator.isBlankOrNull(unitid)) {
            UnitDAO unitDAO = new UnitDAO();
            try {
                bean = unitDAO.getUnit(NumberUtil.parseInt(unitid, 0));
            } catch (Exception ex) {
            }
        }
        UnitFormBean formBean = null;
        if (bean == null) {
            formBean = new UnitFormBean();
        } else {
            formBean = new UnitFormBean(bean);
        }
        request.setAttribute(Constants.UNIT, formBean);

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
