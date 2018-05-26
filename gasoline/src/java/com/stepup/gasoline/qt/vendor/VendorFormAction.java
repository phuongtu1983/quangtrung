/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.vendor;

import com.stepup.gasoline.qt.bean.DynamicFieldBean;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.OrganizationBean;
import com.stepup.gasoline.qt.core.DynamicFieldValueAction;
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
public class VendorFormAction extends DynamicFieldValueAction {

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
        VendorFormBean formBean = null;
        String vendorid = request.getParameter("vendorId");
        VendorDAO vendorDAO = new VendorDAO();
        int seletecOrganizationId = 0;
        if (!GenericValidator.isBlankOrNull(vendorid)) {
            try {
                formBean = vendorDAO.getVendor(Integer.parseInt(vendorid));
            } catch (Exception ex) {
            }
        }
        if (formBean == null) {
            formBean = new VendorFormBean();
        }
        seletecOrganizationId = formBean.getOrganizationId();

        request.setAttribute(Constants.VENDOR, formBean);

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

        ArrayList arrOrganization = null;
        try {
            OrganizationDAO organizationDAO = new OrganizationDAO();
            arrOrganization = organizationDAO.getOrganizations(EmployeeBean.STATUS_ACTIVE);
        } catch (Exception ex) {
        }
        if (arrOrganization == null) {
            arrOrganization = new ArrayList();
        }
        request.setAttribute(Constants.ORGANIZATION_LIST, arrOrganization);

        if (seletecOrganizationId == 0) {
            if (arrOrganization != null && arrOrganization.size() > 0) {
                OrganizationBean orgBean = (OrganizationBean) arrOrganization.get(0);
                seletecOrganizationId = orgBean.getId();
            }
        }
        super.setOrganizationId(seletecOrganizationId);
        super.setParentId(formBean.getId());
        return true;
    }

    @Override
    protected String getTableName() {
        return DynamicFieldBean.VENDOR;
    }
}
