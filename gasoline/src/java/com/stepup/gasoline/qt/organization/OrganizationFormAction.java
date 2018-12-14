/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.organization;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.DynamicFieldBean;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.OrganizationBean;
import com.stepup.gasoline.qt.core.DynamicFieldFreeValueAction;
import com.stepup.gasoline.qt.dao.GoodDAO;
import com.stepup.gasoline.qt.dao.OrganizationDAO;
import com.stepup.gasoline.qt.dao.VendorDAO;
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
public class OrganizationFormAction extends DynamicFieldFreeValueAction {

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
    public boolean doMainAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        OrganizationBean bean = null;
        String organizationId = request.getParameter("organizationId");
        ArrayList arrShellDetail = null;
        if (!GenericValidator.isBlankOrNull(organizationId)) {
            OrganizationDAO organizationDAO = new OrganizationDAO();
            try {
                int id = NumberUtil.parseInt(organizationId, 0);
                bean = organizationDAO.getOrganization(id);
                arrShellDetail = organizationDAO.getOrganizationShellDetail(id);
            } catch (Exception ex) {
            }
        }
        if (bean == null) {
            bean = new OrganizationBean();
        }
        request.setAttribute(Constants.ORGANIZATION, bean);

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

        if (arrShellDetail == null) {
            arrShellDetail = new ArrayList();
        }
        request.setAttribute(Constants.ORGANIZATION_SHELL, arrShellDetail);

        ArrayList arrShell = null;
        try {
            GoodDAO goodDAO = new GoodDAO();
            arrShell = goodDAO.getShells(EmployeeBean.STATUS_ACTIVE);
        } catch (Exception ex) {
        }
        if (arrShell == null) {
            arrShell = new ArrayList();
        }
        request.setAttribute(Constants.SHELL_LIST, arrShell);

        super.setParentId(bean.getId());
        return true;
    }

    @Override
    public String getParentTableName() {
        return DynamicFieldBean.ORGANIZATION;
    }

}
