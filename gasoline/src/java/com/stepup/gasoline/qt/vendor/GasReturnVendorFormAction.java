/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.vendor;

import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.OrganizationDAO;
import com.stepup.gasoline.qt.dao.VendorDAO;
import com.stepup.gasoline.qt.util.Constants;
import com.stepup.gasoline.qt.util.QTUtil;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class GasReturnVendorFormAction extends SpineAction {

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
        GasReturnVendorFormBean formBean = null;
        VendorDAO vendorDAO = new VendorDAO();
        try {
            String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
            formBean = vendorDAO.getGasReturnVendor(organizationIds);
        } catch (Exception ex) {
        }
        if (formBean == null) {
            formBean = new GasReturnVendorFormBean();
        }

        request.setAttribute(Constants.GAS_RETURN_VENDOR, formBean);

        ArrayList arrVendor = null;
        try {
            arrVendor = vendorDAO.getVendorEqualOrganizations();
        } catch (Exception ex) {
        }
        if (arrVendor == null) {
            arrVendor = new ArrayList();
        }
        request.setAttribute(Constants.VENDOR_LIST, arrVendor);

        ArrayList arrOrganization = null;
        try {
            OrganizationDAO organizationDAO = new OrganizationDAO();
            String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
            arrOrganization = organizationDAO.getOrganizations(organizationIds);
        } catch (Exception ex) {
        }
        if (arrOrganization == null) {
            arrOrganization = new ArrayList();
        }
        request.setAttribute(Constants.ORGANIZATION_LIST, arrOrganization);

        return true;
    }

}
