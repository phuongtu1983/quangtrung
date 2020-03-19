/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.salesolar;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.SolarBean;
import com.stepup.gasoline.qt.bean.SaleSolarPromotionMaterialDetailBean;
import com.stepup.gasoline.qt.bean.VendorBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.GoodDAO;
import com.stepup.gasoline.qt.dao.OrganizationDAO;
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
public class GetSaleSolarPromotionMaterialAction extends SpineAction {

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
        int promotionMaterialId = NumberUtil.parseInt(request.getParameter("promotionMaterialId"), 0);
        ArrayList arrDetail = new ArrayList();
        ArrayList arrUnit = new ArrayList();
        ArrayList arrStore = null;
        SaleSolarPromotionMaterialDetailBean promotionMaterialDetailBean = new SaleSolarPromotionMaterialDetailBean();
        try {
            GoodDAO goodDAO = new GoodDAO();
            SolarBean bean = goodDAO.getSolar(promotionMaterialId);
            if (bean != null) {
                promotionMaterialDetailBean.setPromotionMaterialId(bean.getId());
                promotionMaterialDetailBean.setPromotionMaterialName(bean.getName());
                promotionMaterialDetailBean.setPromotionMaterialUnitId(bean.getBaseUnitId());
            }
            arrUnit = goodDAO.getSolarUnits(promotionMaterialId);

            OrganizationDAO orgDAO = new OrganizationDAO();
            String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
            arrStore = orgDAO.getStores(organizationIds, VendorBean.IS_SOLAR);
        } catch (Exception ex) {
        }
        if (arrUnit == null) {
            arrUnit = new ArrayList();
        }
        if (arrStore == null) {
            arrStore = new ArrayList();
        }
        arrDetail.add(promotionMaterialDetailBean);
        request.setAttribute(Constants.SALE_SOLAR_PROMOTION_MATERIAL, arrDetail);
        request.setAttribute(Constants.UNIT_LIST, arrUnit);
        request.setAttribute(Constants.STORE_LIST, arrStore);

        return true;
    }
}
