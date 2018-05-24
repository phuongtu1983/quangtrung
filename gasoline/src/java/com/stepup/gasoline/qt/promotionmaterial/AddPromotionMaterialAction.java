/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.promotionmaterial;

import com.stepup.gasoline.qt.bean.PromotionMaterialBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.GoodDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

/**
 *
 * @author phuongtu
 */
public class AddPromotionMaterialAction extends SpineAction {

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
        PromotionMaterialFormBean formBean = (PromotionMaterialFormBean) form;
        GoodDAO goodDAO = new GoodDAO();
        PromotionMaterialFormBean oldBean = null;
        boolean bNew = false;
        boolean isExist = false;
        try {
            oldBean = goodDAO.getPromotionMaterialByName(formBean.getName());
        } catch (Exception ex) {
        }
        int promotionMaterialId = formBean.getId();
        if (promotionMaterialId == 0) {
            bNew = true;
            if (oldBean != null) {
                isExist = true;
            }
        } else {
            bNew = false;
            if (oldBean != null && oldBean.getId() != promotionMaterialId) {
                isExist = true;
            }
            if (oldBean == null) {
                try {
                    oldBean = goodDAO.getPromotionMaterial(promotionMaterialId);
                } catch (Exception ex) {
                }
            }
        }
        if (isExist) {
            ActionMessages errors = new ActionMessages();
            errors.add("promotionMaterialExisted", new ActionMessage("promotionMaterial.save.error"));
            saveErrors(request, errors);
            return false;
        }
        boolean isUpdate = false;
        try {
            if (!bNew) {
                if (!formBean.getName().equals(oldBean.getName())) {
                    isUpdate = true;
                }
                if (formBean.getUnitId()!= oldBean.getUnitId()) {
                    isUpdate = true;
                }
                if (formBean.getStatus() != oldBean.getStatus()) {
                    isUpdate = true;
                }
            }
        } catch (Exception ex) {
        }
        PromotionMaterialBean bean = new PromotionMaterialBean();
        bean.setId(formBean.getId());
        bean.setName(formBean.getName());
        bean.setUnitId(formBean.getUnitId());
        bean.setStatus(formBean.getStatus());
        try {
            if (bNew) {
                goodDAO.insertPromotionMaterial(bean);
            } else {
                if (isUpdate) {
                    goodDAO.updatePromotionMaterial(bean);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}
