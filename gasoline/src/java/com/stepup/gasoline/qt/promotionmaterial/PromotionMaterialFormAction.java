/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.promotionmaterial;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.GoodDAO;
import com.stepup.gasoline.qt.dao.UnitDAO;
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
public class PromotionMaterialFormAction extends SpineAction {

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
        PromotionMaterialFormBean formBean = null;
        String promotionMaterialId = request.getParameter("promotionMaterialId");
        GoodDAO goodDAO = new GoodDAO();
        if (!GenericValidator.isBlankOrNull(promotionMaterialId)) {
            try {
                formBean = goodDAO.getPromotionMaterial(NumberUtil.parseInt(promotionMaterialId, 0));
            } catch (Exception ex) {
            }
        }
        if (formBean == null) {
            formBean = new PromotionMaterialFormBean();
        }
        request.setAttribute(Constants.PROMOTION_MATERIAL, formBean);

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

        ArrayList arrUnit = null;
        try {
            UnitDAO unitDAO = new UnitDAO();
            arrUnit = unitDAO.getUnits(EmployeeBean.STATUS_ACTIVE);
        } catch (Exception ex) {
        }
        if (arrUnit == null) {
            arrUnit = new ArrayList();
        }
        request.setAttribute(Constants.UNIT_LIST, arrUnit);

        return true;
    }

}
