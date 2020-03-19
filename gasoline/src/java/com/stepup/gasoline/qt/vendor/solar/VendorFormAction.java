/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.vendor.solar;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.VendorBean;
import com.stepup.gasoline.qt.core.DynamicFieldValueAction;
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
        VendorSolarFormBean formBean = null;
        String vendorid = request.getParameter("vendorId");
        VendorDAO vendorDAO = new VendorDAO();
        ArrayList arrStoreDetail = null;
        if (!GenericValidator.isBlankOrNull(vendorid)) {
            try {
                int id = NumberUtil.parseInt(vendorid, 0);
                VendorFormBean vendorBean = vendorDAO.getVendor(id);
                if (vendorBean != null) {
                    formBean = new VendorSolarFormBean(vendorBean);
                }
                arrStoreDetail = vendorDAO.getVendorSolarStoreDetail(id);
            } catch (Exception ex) {
            }
        }
        if (formBean == null) {
            formBean = new VendorSolarFormBean();
        }

        request.setAttribute(Constants.VENDOR_SOLAR, formBean);

        if (arrStoreDetail == null) {
            arrStoreDetail = new ArrayList();
        }
        request.setAttribute(Constants.VENDOR_SOLAR_STORE, arrStoreDetail);

        ArrayList arrStore = null;
        try {
            OrganizationDAO organizationDAO = new OrganizationDAO();
            arrStore = organizationDAO.getStores(QTUtil.getOrganizationManageds(request.getSession()), VendorBean.IS_SOLAR);
        } catch (Exception ex) {
        }
        if (arrStore == null) {
            arrStore = new ArrayList();
        }
        request.setAttribute(Constants.STORE_LIST, arrStore);

        return true;
    }

}
