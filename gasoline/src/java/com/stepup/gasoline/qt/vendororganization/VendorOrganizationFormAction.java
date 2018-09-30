/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.vendororganization;

import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.OrganizationDAO;
import com.stepup.gasoline.qt.dao.VendorDAO;
import com.stepup.gasoline.qt.util.Constants;
import com.stepup.gasoline.qt.util.QTUtil;
import com.stepup.gasoline.qt.vendor.VendorFormBean;
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
public class VendorOrganizationFormAction extends SpineAction {

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
        VendorOrganizationFormBean formBean = null;
        String vendorOrganizationId = request.getParameter("vendorOrganizationId");
        VendorDAO vendorDAO = new VendorDAO();
        if (!GenericValidator.isBlankOrNull(vendorOrganizationId)) {
            try {
                formBean = vendorDAO.getVendorOrganization(Integer.parseInt(vendorOrganizationId));
            } catch (Exception ex) {
            }
        }
        if (formBean == null) {
            formBean = new VendorOrganizationFormBean();
        }

        request.setAttribute(Constants.VENDOR_ORGANIZATION, formBean);

        ArrayList arrOrganization = null;
        try {
            OrganizationDAO organizationDAO = new OrganizationDAO();
            arrOrganization = organizationDAO.getOrganizations(EmployeeBean.STATUS_ACTIVE, QTUtil.getOrganizationManageds(request.getSession()));
        } catch (Exception ex) {
        }
        if (arrOrganization == null) {
            arrOrganization = new ArrayList();
        }
        request.setAttribute(Constants.ORGANIZATION_LIST, arrOrganization);

        ArrayList arrVendor = null;
        try {
            if (formBean.getId() == 0) {
                arrVendor = vendorDAO.getVendorsForConnect(QTUtil.getOrganizationManageds(request.getSession()));
            } else {
                arrVendor = new ArrayList();
                VendorFormBean vendorBean = new VendorFormBean();
                vendorBean.setId(formBean.getVendorId());
                vendorBean.setName(formBean.getVendorName() + " - " + formBean.getOrganizationName());
                arrVendor.add(vendorBean);
            }
        } catch (Exception ex) {
        }
        if (arrVendor == null) {
            arrVendor = new ArrayList();
        }
        request.setAttribute(Constants.VENDOR_ORGANIZATION_lIST, arrVendor);

        return true;
    }

}
