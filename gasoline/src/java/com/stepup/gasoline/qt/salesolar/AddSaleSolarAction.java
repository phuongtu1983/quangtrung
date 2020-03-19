/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.salesolar;

import com.stepup.core.util.NumberUtil;
import com.stepup.core.util.StringUtil;
import com.stepup.gasoline.qt.bean.SaleSolarBean;
import com.stepup.gasoline.qt.bean.SaleSolarDetailBean;
import com.stepup.gasoline.qt.bean.SaleSolarPromotionMaterialDetailBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.GoodDAO;
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
public class AddSaleSolarAction extends SpineAction {

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
        SaleSolarFormBean formBean = (SaleSolarFormBean) form;
        GoodDAO goodDAO = new GoodDAO();
        SaleSolarBean bean = null;
        int saleSolarId = formBean.getId();
        try {
            bean = goodDAO.getSaleSolar(saleSolarId);
        } catch (Exception ex) {
        }
        boolean bNew = false;
        if (saleSolarId == 0) {
            bNew = true;
        } else {
            bNew = false;
        }
        if (bean == null) {
            bean = new SaleSolarBean();
        }

        boolean needUpdate = false;
        if (StringUtil.isEqual(bean.getCreatedDate(), formBean.getCreatedDate())) {
            needUpdate = true;
        }
        bean.setId(formBean.getId());
        bean.setCreatedDate(formBean.getCreatedDate());
        bean.setCode(formBean.getCode());
        bean.setNote(formBean.getNote());
        bean.setTotal(formBean.getTotal());
        bean.setPaid(formBean.getPaid());
        bean.setDebt(formBean.getDebt());
        bean.setDiscount(formBean.getDiscount());
        bean.setTotalPay(formBean.getTotalPay());
        bean.setAccountId(formBean.getAccountId());
        bean.setCustomerId(formBean.getCustomerId());
        bean.setCommission(formBean.getCommission());
        bean.setCommissionKind(formBean.getCommissionKind());
        bean.setCommissionAmount(formBean.getCommissionAmount());
        bean.setGapAgencyAmount(formBean.getGapAgencyAmount());
        bean.setGapCustomerAmount(formBean.getGapCustomerAmount());
        bean.setTotalBeforeCommisison(formBean.getTotalBeforeCommisison());
        bean.setCreatedEmployeeId(QTUtil.getEmployeeId(request.getSession()));
        bean.setIsCalculateAgencyCommission(formBean.getIsCalculateAgencyCommission() == true ? 1 : 0);
        try {
            if (bNew) {
                int id = goodDAO.insertSaleSolar(bean);
                formBean.setId(id);
                addSaleSolarDetail(formBean, needUpdate);
                addSaleSolarPromotionMaterial(formBean, needUpdate);
            } else {
                addSaleSolarDetail(formBean, needUpdate);
                addSaleSolarPromotionMaterial(formBean, needUpdate);
                goodDAO.updateSaleSolar(bean);
            }
        } catch (Exception ex) {
        }
        return true;
    }

    private void addSaleSolarDetail(SaleSolarFormBean formBean, boolean needUpdate) {
        try {
            GoodDAO goodDAO = new GoodDAO();
            ArrayList arrDetail = goodDAO.getSaleSolarDetail(formBean.getId());
            int length = formBean.getSolarId().length;
            int id = 0;
            boolean isUpdate = false;
            for (int i = 0; i < length; i++) {
                id = NumberUtil.parseInt(formBean.getSaleSolarDetailId()[i], 0);
                if (id == 0) {
                    SaleSolarDetailBean bean = new SaleSolarDetailBean();
                    bean.setSolarId(NumberUtil.parseInt(formBean.getSolarId()[i], 0));
                    bean.setUnitId(NumberUtil.parseInt(formBean.getUnitId()[i], 0));
                    bean.setStoreId(NumberUtil.parseInt(formBean.getStoreId()[i], 0));
                    bean.setQuantity(NumberUtil.parseInt(formBean.getQuantity()[i], 0));
                    bean.setPrice(NumberUtil.parseDouble(formBean.getPrice()[i], 0));
                    bean.setAmount(NumberUtil.parseDouble(formBean.getAmount()[i], 0));
                    bean.setPriceBeforeCommission(NumberUtil.parseFloat(formBean.getPriceBeforeCommission()[i], 0));
                    bean.setCommissionPrice(NumberUtil.parseFloat(formBean.getCommissionPrice()[i], 0));
                    bean.setFirstAmount(NumberUtil.parseDouble(formBean.getFirstAmount()[i], 0));
                    bean.setCommission(NumberUtil.parseFloat(formBean.getCommissionDetail()[i], 0));
                    bean.setGapAgencyAmount(NumberUtil.parseDouble(formBean.getGapAgencyAmountDetail()[i], 0));
                    bean.setGapCustomerAmount(NumberUtil.parseDouble(formBean.getGapCustomerAmountDetail()[i], 0));
                    bean.setSaleSolarId(formBean.getId());
                    goodDAO.insertSaleSolarDetail(bean, formBean.getCreatedDate());
                } else {
                    isUpdate = false;
                    int j = 0;
                    SaleSolarDetailBean oldBean = null;
                    for (; j < arrDetail.size(); j++) {
                        oldBean = (SaleSolarDetailBean) arrDetail.get(j);
                        if (oldBean.getId() == id) {
                            break;
                        }
                    }
                    if (j < arrDetail.size()) {
                        arrDetail.remove(j);
                        if (oldBean.getQuantity() != NumberUtil.parseInt(formBean.getQuantity()[i], 0)) {
                            isUpdate = true;
                            oldBean.setQuantity(NumberUtil.parseInt(formBean.getQuantity()[i], 0));
                        }
                        if (oldBean.getPrice() != NumberUtil.parseDouble(formBean.getPrice()[i], 0)) {
                            isUpdate = true;
                            oldBean.setPrice(NumberUtil.parseDouble(formBean.getPrice()[i], 0));
                        }
                        if (oldBean.getAmount() != NumberUtil.parseDouble(formBean.getAmount()[i], 0)) {
                            isUpdate = true;
                            oldBean.setAmount(NumberUtil.parseDouble(formBean.getAmount()[i], 0));
                        }
                        if (oldBean.getPriceBeforeCommission() != NumberUtil.parseDouble(formBean.getPriceBeforeCommission()[i], 0)) {
                            isUpdate = true;
                            oldBean.setPriceBeforeCommission(NumberUtil.parseDouble(formBean.getPriceBeforeCommission()[i], 0));
                        }
                        if (oldBean.getCommissionPrice() != NumberUtil.parseDouble(formBean.getCommissionPrice()[i], 0)) {
                            isUpdate = true;
                            oldBean.setCommissionPrice(NumberUtil.parseFloat(formBean.getCommissionPrice()[i], 0));
                        }
                        if (oldBean.getFirstAmount() != NumberUtil.parseDouble(formBean.getFirstAmount()[i], 0)) {
                            isUpdate = true;
                            oldBean.setFirstAmount(NumberUtil.parseDouble(formBean.getFirstAmount()[i], 0));
                        }
                        if (oldBean.getCommission() != NumberUtil.parseDouble(formBean.getCommissionDetail()[i], 0)) {
                            isUpdate = true;
                            oldBean.setCommission(NumberUtil.parseFloat(formBean.getCommissionDetail()[i], 0));
                        }
                        if (oldBean.getGapAgencyAmount() != NumberUtil.parseDouble(formBean.getGapAgencyAmountDetail()[i], 0)) {
                            isUpdate = true;
                            oldBean.setGapAgencyAmount(NumberUtil.parseDouble(formBean.getGapAgencyAmountDetail()[i], 0));
                        }
                        if (oldBean.getGapCustomerAmount() != NumberUtil.parseDouble(formBean.getGapCustomerAmountDetail()[i], 0)) {
                            isUpdate = true;
                            oldBean.setGapCustomerAmount(NumberUtil.parseDouble(formBean.getGapCustomerAmountDetail()[i], 0));
                        }
                        if (needUpdate) {
                            isUpdate = true;
                        }
                        if (isUpdate) {
                            goodDAO.updateSaleSolarDetail(oldBean, formBean.getCreatedDate());
                        }
                    }
                }
            }
            String ids = "0,";
            SaleSolarDetailBean oldBean = null;
            for (int i = 0; i < arrDetail.size(); i++) {
                oldBean = (SaleSolarDetailBean) arrDetail.get(i);
                ids += oldBean.getId() + ",";
            }
            ids += "0";
            goodDAO.deleteSaleSolarDetails(ids);
        } catch (Exception ex) {
        }
    }

    private void addSaleSolarPromotionMaterial(SaleSolarFormBean formBean, boolean needUpdate) {
        try {
            GoodDAO goodDAO = new GoodDAO();
            ArrayList arrDetail = goodDAO.getSaleSolarPromotionMaterialDetail(formBean.getId());
            if (formBean.getPromotionMaterialId() != null) {
                int length = formBean.getPromotionMaterialId().length;
                int id = 0;
                boolean isUpdate = false;
                for (int i = 0; i < length; i++) {
                    id = NumberUtil.parseInt(formBean.getSaleSolarPromotionMaterialDetailId()[i], 0);
                    if (id == 0) {
                        SaleSolarPromotionMaterialDetailBean bean = new SaleSolarPromotionMaterialDetailBean();
                        bean.setPromotionMaterialId(NumberUtil.parseInt(formBean.getPromotionMaterialId()[i], 0));
                        bean.setQuantity(NumberUtil.parseInt(formBean.getPromotionMaterialQuantity()[i], 0));
                        bean.setPromotionMaterialStoreId(NumberUtil.parseInt(formBean.getPromotionMaterialStoreId()[i], 0));
                        bean.setPromotionMaterialUnitId(NumberUtil.parseInt(formBean.getPromotionMaterialUnitId()[i], 0));
                        bean.setSaleSolarId(formBean.getId());
                        goodDAO.insertSaleSolarPromotionMaterialDetail(bean);
                    } else {
                        isUpdate = false;
                        int j = 0;
                        SaleSolarPromotionMaterialDetailBean oldBean = null;
                        for (; j < arrDetail.size(); j++) {
                            oldBean = (SaleSolarPromotionMaterialDetailBean) arrDetail.get(j);
                            if (oldBean.getId() == id) {
                                break;
                            }
                        }
                        if (j < arrDetail.size()) {
                            arrDetail.remove(j);
                            if (oldBean.getQuantity() != NumberUtil.parseInt(formBean.getPromotionMaterialQuantity()[i], 0)) {
                                isUpdate = true;
                                oldBean.setQuantity(NumberUtil.parseInt(formBean.getPromotionMaterialQuantity()[i], 0));
                            }
                            if (needUpdate) {
                                isUpdate = true;
                            }
                            if (isUpdate) {
                                goodDAO.updateSaleSolarPromotionMaterialDetail(oldBean);
                            }
                        }
                    }
                }
            }
            String ids = "0,";
            SaleSolarPromotionMaterialDetailBean oldBean = null;
            for (int i = 0; i < arrDetail.size(); i++) {
                oldBean = (SaleSolarPromotionMaterialDetailBean) arrDetail.get(i);
                ids += oldBean.getId() + ",";
            }
            ids += "0";
            goodDAO.deleteSaleSolarPromotionMaterialDetails(ids);
        } catch (Exception ex) {
        }
    }
}
