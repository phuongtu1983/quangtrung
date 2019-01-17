/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.transportservice;

import com.stepup.core.util.DateUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.TransportServiceBean;
import com.stepup.gasoline.qt.bean.VendorBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.AccountDAO;
import com.stepup.gasoline.qt.dao.VehicleDAO;
import com.stepup.gasoline.qt.dao.VendorDAO;
import com.stepup.gasoline.qt.util.Constants;
import com.stepup.gasoline.qt.util.QTUtil;
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
public class TransportServiceFormAction extends SpineAction {

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
        TransportServiceBean bean = null;
        String transportServiceId = request.getParameter("transportServiceId");
        VehicleDAO vehicleDAO = new VehicleDAO();
        VendorDAO vendorDAO = new VendorDAO();
        String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
        if (!GenericValidator.isBlankOrNull(transportServiceId)) {
            try {
                bean = vehicleDAO.getTransportService(NumberUtil.parseInt(transportServiceId, 0));
            } catch (Exception ex) {
            }
        }
        if (bean == null) {
            bean = new TransportServiceBean();
            try {
                String prefix = "";
                prefix = DateUtil.today("yyyyMMdd") + "-TS-";
                String number = vehicleDAO.getNextTransportServiceNumber(prefix, 4);
                prefix += number;
                bean.setCode(prefix);
            } catch (Exception ex) {
            }
        }
        request.setAttribute(Constants.TRANSPORT_SERVICE, bean);

        ArrayList arrVendor = null;
        try {
            arrVendor = vendorDAO.getVendors(organizationIds, VendorBean.IS_GAS);
        } catch (Exception ex) {
        }
        if (arrVendor == null) {
            arrVendor = new ArrayList();
        }
        request.setAttribute(Constants.VENDOR_LIST, arrVendor);

        ArrayList arrAccount = null;
        try {
            AccountDAO accountDAO = new AccountDAO();
            arrAccount = accountDAO.getAccounts(organizationIds);
        } catch (Exception ex) {
        }
        if (arrAccount == null) {
            arrAccount = new ArrayList();
        }
        request.setAttribute(Constants.ACCOUNT_LIST, arrAccount);

        return true;
    }
}
