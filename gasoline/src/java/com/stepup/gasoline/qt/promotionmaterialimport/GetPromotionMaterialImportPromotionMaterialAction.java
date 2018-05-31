/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.promotionmaterialimport;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.PromotionMaterialImportDetailBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.GoodDAO;
import com.stepup.gasoline.qt.promotionmaterial.PromotionMaterialFormBean;
import com.stepup.gasoline.qt.util.Constants;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class GetPromotionMaterialImportPromotionMaterialAction extends SpineAction {

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
        PromotionMaterialImportDetailBean bean = new PromotionMaterialImportDetailBean();
        try {
            GoodDAO goodDAO = new GoodDAO();
            PromotionMaterialFormBean promotionMaterialBean = goodDAO.getPromotionMaterial(promotionMaterialId);
            if (promotionMaterialBean != null) {
                bean.setPromotionMaterialName(promotionMaterialBean.getName());
                bean.setPromotionMaterialId(promotionMaterialBean.getId());
                bean.setUnitId(promotionMaterialBean.getUnitId());
                bean.setUnitName(promotionMaterialBean.getUnitName());
            }
        } catch (Exception ex) {
        }
        arrDetail.add(bean);
        request.setAttribute(Constants.PROMOTION_MATERIAL_IMPORT_PROMOTION_MATERIAL, arrDetail);

        return true;
    }
}
