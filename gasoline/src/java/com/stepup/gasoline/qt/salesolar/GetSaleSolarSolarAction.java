/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.salesolar;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.SolarBean;
import com.stepup.gasoline.qt.bean.SaleSolarDetailBean;
import com.stepup.gasoline.qt.bean.VendorBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.GoodDAO;
import com.stepup.gasoline.qt.dao.OrganizationDAO;
import com.stepup.gasoline.qt.dao.VendorDAO;
import com.stepup.gasoline.qt.util.Constants;
import com.stepup.gasoline.qt.util.QTUtil;
import com.stepup.gasoline.qt.vendor.VendorFormBean;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class GetSaleSolarSolarAction extends SpineAction {

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
        int solarId = NumberUtil.parseInt(request.getParameter("solarId"), 0);
        int customerId = NumberUtil.parseInt(request.getParameter("customerId"), 0);
        ArrayList arrDetail = new ArrayList();
        ArrayList arrUnit = new ArrayList();
        ArrayList arrStore = null;
        SaleSolarDetailBean bean = null;
        try {
            GoodDAO goodDAO = new GoodDAO();
            bean = goodDAO.getLastSaleSolarDetail(solarId, customerId);
            if (bean != null) {
                bean.setNo(NumberUtil.parseInt(request.getParameter("length"), 0));
                if (bean.getPrice() == 0) {
                    SolarBean solarBean = goodDAO.getSolar(solarId);
                    if (solarBean != null) {
                        VendorDAO vendorDAO = new VendorDAO();
                        VendorFormBean vendorFormBean = vendorDAO.getVendor(solarBean.getVendorId());
                        if (vendorFormBean != null) {
                            if (vendorFormBean.getCommissionOnImport() != 0) {
                                bean.setPriceBeforeCommission(solarBean.getPrice());
                            }
                        }
                    }
                }
            }

            arrUnit = goodDAO.getSolarUnits(solarId);

            OrganizationDAO orgDAO = new OrganizationDAO();
            String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
            arrStore = orgDAO.getStores(organizationIds, VendorBean.IS_SOLAR);
        } catch (Exception ex) {
        }
        if (bean == null) {
            bean = new SaleSolarDetailBean();
        }
        if (arrUnit == null) {
            arrUnit = new ArrayList();
        }
        if (arrStore == null) {
            arrStore = new ArrayList();
        }
        arrDetail.add(bean);
        request.setAttribute(Constants.SALE_SOLAR_SOLAR, arrDetail);
        request.setAttribute(Constants.UNIT_LIST, arrUnit);
        request.setAttribute(Constants.STORE_LIST, arrStore);
        return true;
    }
}
