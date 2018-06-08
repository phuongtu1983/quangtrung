/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.promotionmaterialimport;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.PromotionMaterialImportBean;
import com.stepup.gasoline.qt.bean.PromotionMaterialImportDetailBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.GoodDAO;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class AddPromotionMaterialImportAction extends SpineAction {

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
        PromotionMaterialImportFormBean formBean = (PromotionMaterialImportFormBean) form;
        GoodDAO goodDAO = new GoodDAO();
        PromotionMaterialImportBean bean = null;
        int gasImportId = formBean.getId();
        try {
            bean = goodDAO.getPromotionMaterialImport(gasImportId);
        } catch (Exception ex) {
        }
        boolean bNew = false;
        if (gasImportId == 0) {
            bNew = true;
        } else {
            bNew = false;
        }
        if (bean == null) {
            bean = new PromotionMaterialImportBean();
        }

        bean.setId(formBean.getId());
        bean.setCode(formBean.getCode());
        bean.setNote(formBean.getNote());
        bean.setCreatedDate(formBean.getCreatedDate());
        bean.setVendorId(formBean.getVendorId());
        bean.setTotal(formBean.getTotal());
        bean.setPaid(formBean.getPaid());
        bean.setDebt(formBean.getDebt());
        bean.setAccountId(formBean.getAccountId());
        try {
            if (bNew) {
                int id = goodDAO.insertPromotionMaterialImport(bean);
                formBean.setId(id);
            } else {
                goodDAO.updatePromotionMaterialImport(bean);
            }
            addPromotionMaterialImportPromotionMaterial(formBean);
        } catch (Exception ex) {
        }
        return true;
    }

    private void addPromotionMaterialImportPromotionMaterial(PromotionMaterialImportFormBean formBean) {
        try {
            GoodDAO goodDAO = new GoodDAO();
            ArrayList arrDetail = goodDAO.getPromotionMaterialImportDetail(formBean.getId());
            int length = formBean.getPromotionMaterialId().length;
            int id = 0;
            boolean isUpdate = false;
            for (int i = 0; i < length; i++) {
                id = NumberUtil.parseInt(formBean.getPromotionMaterialImportDetailId()[i], 0);
                if (id == 0) {
                    PromotionMaterialImportDetailBean bean = new PromotionMaterialImportDetailBean();
                    bean.setPromotionMaterialId(NumberUtil.parseInt(formBean.getPromotionMaterialId()[i], 0));
                    bean.setQuantity(NumberUtil.parseFloat(formBean.getQuantity()[i], 0));
                    bean.setPrice(NumberUtil.parseFloat(formBean.getPrice()[i], 0));
                    bean.setAmount(NumberUtil.parseFloat(formBean.getAmount()[i], 0));
                    bean.setPromotionMaterialImportId(formBean.getId());
                    goodDAO.insertPromotionMaterialImportDetail(bean);
                } else {
                    isUpdate = false;
                    int j = 0;
                    PromotionMaterialImportDetailBean oldBean = null;
                    for (; j < arrDetail.size(); j++) {
                        oldBean = (PromotionMaterialImportDetailBean) arrDetail.get(j);
                        if (oldBean.getId() == id) {
                            break;
                        }
                    }
                    if (j < arrDetail.size()) {
                        arrDetail.remove(j);
                        if (oldBean.getQuantity() != NumberUtil.parseDouble(formBean.getQuantity()[i], 0)) {
                            isUpdate = true;
                            oldBean.setQuantity(NumberUtil.parseFloat(formBean.getQuantity()[i], 0));
                        }
                        if (oldBean.getPrice() != NumberUtil.parseDouble(formBean.getPrice()[i], 0)) {
                            isUpdate = true;
                            oldBean.setPrice(NumberUtil.parseFloat(formBean.getPrice()[i], 0));
                        }
                        if (oldBean.getAmount() != NumberUtil.parseDouble(formBean.getAmount()[i], 0)) {
                            isUpdate = true;
                            oldBean.setAmount(NumberUtil.parseFloat(formBean.getAmount()[i], 0));
                        }
                        if (isUpdate) {
                            goodDAO.updatePromotionMaterialImportDetail(oldBean);
                        }
                    }
                }
            }
        } catch (Exception ex) {
        }
    }
}
