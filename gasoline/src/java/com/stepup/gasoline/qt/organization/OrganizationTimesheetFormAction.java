/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.organization;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.DynamicFieldBean;
import com.stepup.gasoline.qt.bean.OrganizationBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.OrganizationDAO;
import com.stepup.gasoline.qt.util.Constants;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.validator.GenericValidator;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class OrganizationTimesheetFormAction extends SpineAction {

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
        OrganizationBean formBean = null;
        OrganizationTimesheetFormBean timesheetFormBean = new OrganizationTimesheetFormBean();
        String organizationId = request.getParameter("organizationId");
        OrganizationDAO organizationDAO = new OrganizationDAO();
        if (!GenericValidator.isBlankOrNull(organizationId)) {
            try {
                formBean = organizationDAO.getOrganization(NumberUtil.parseInt(organizationId, 0));
            } catch (Exception ex) {
            }
        }
        if (formBean == null) {
            formBean = new OrganizationBean();
        }
        timesheetFormBean.setOrganizationId(formBean.getId());
        timesheetFormBean.setOrganizationName(formBean.getName());
        request.setAttribute(Constants.ORGANIZATION_TIMESHEET, timesheetFormBean);

        ArrayList arrField = null;
        try {
            arrField = organizationDAO.getOrganizationTimesheetField(formBean.getId(), formBean.getId(), DynamicFieldBean.TIMESHEET);
        } catch (Exception ex) {
        }
        if (arrField != null && arrField.size() > 0) {
            request.setAttribute(Constants.DYNAMIC_FIELD_VALUE, arrField);
        }
        return true;
    }
}
