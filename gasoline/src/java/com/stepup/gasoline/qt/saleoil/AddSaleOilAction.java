/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.saleoil;

import com.stepup.core.util.NumberUtil;
import com.stepup.core.util.StringUtil;
import com.stepup.gasoline.qt.bean.SaleOilBean;
import com.stepup.gasoline.qt.bean.SaleOilDetailBean;
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
public class AddSaleOilAction extends SpineAction {

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
        SaleOilFormBean formBean = (SaleOilFormBean) form;
        GoodDAO goodDAO = new GoodDAO();
        SaleOilBean bean = null;
        int saleOilId = formBean.getId();
        try {
            bean = goodDAO.getSaleOil(saleOilId);
        } catch (Exception ex) {
        }
        boolean bNew = false;
        if (saleOilId == 0) {
            bNew = true;
        } else {
            bNew = false;
        }
        if (bean == null) {
            bean = new SaleOilBean();
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
        try {
            if (bNew) {
                int id = goodDAO.insertSaleOil(bean);
                formBean.setId(id);
                addSaleOilDetail(formBean, needUpdate);
            } else {
                addSaleOilDetail(formBean, needUpdate);
                goodDAO.updateSaleOil(bean);
            }
        } catch (Exception ex) {
        }
        return true;
    }

    private void addSaleOilDetail(SaleOilFormBean formBean, boolean needUpdate) {
        try {
            GoodDAO goodDAO = new GoodDAO();
            ArrayList arrDetail = goodDAO.getSaleOilDetail(formBean.getId());
            int length = formBean.getOilId().length;
            int id = 0;
            boolean isUpdate = false;
            for (int i = 0; i < length; i++) {
                id = NumberUtil.parseInt(formBean.getSaleOilDetailId()[i], 0);
                if (id == 0) {
                    SaleOilDetailBean bean = new SaleOilDetailBean();
                    bean.setOilId(NumberUtil.parseInt(formBean.getOilId()[i], 0));
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
                    bean.setSaleOilId(formBean.getId());
                    goodDAO.insertSaleOilDetail(bean, formBean.getCreatedDate());
                } else {
                    isUpdate = false;
                    int j = 0;
                    SaleOilDetailBean oldBean = null;
                    for (; j < arrDetail.size(); j++) {
                        oldBean = (SaleOilDetailBean) arrDetail.get(j);
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
                            goodDAO.updateSaleOilDetail(oldBean, formBean.getCreatedDate());
                        }
                    }
                }
            }
            String ids = "0,";
            SaleOilDetailBean oldBean = null;
            for (int i = 0; i < arrDetail.size(); i++) {
                oldBean = (SaleOilDetailBean) arrDetail.get(i);
                ids += oldBean.getId() + ",";
            }
            ids += "0";
            goodDAO.deleteSaleOilDetails(ids);
        } catch (Exception ex) {
        }
    }
}
