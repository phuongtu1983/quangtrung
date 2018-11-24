/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.salegood;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.SaleGoodBean;
import com.stepup.gasoline.qt.bean.SaleGoodDetailBean;
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
public class AddSaleGoodAction extends SpineAction {

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
        SaleGoodFormBean formBean = (SaleGoodFormBean) form;
        GoodDAO goodDAO = new GoodDAO();
        SaleGoodBean bean = null;
        int saleGoodId = formBean.getId();
        try {
            bean = goodDAO.getSaleGood(saleGoodId);
        } catch (Exception ex) {
        }
        boolean bNew = false;
        if (saleGoodId == 0) {
            bNew = true;
        } else {
            bNew = false;
        }
        if (bean == null) {
            bean = new SaleGoodBean();
        }

        bean.setId(formBean.getId());
        bean.setCode(formBean.getCode());
        bean.setNote(formBean.getNote());
        bean.setTotal(formBean.getTotal());
        bean.setPaid(formBean.getPaid());
        bean.setDebt(formBean.getDebt());
        bean.setDiscount(formBean.getDiscount());
        bean.setTotalPay(formBean.getTotalPay());
        bean.setAccountId(formBean.getAccountId());
        bean.setCustomerId(formBean.getCustomerId());
        bean.setStoreId(formBean.getStoreId());
        bean.setCreatedEmployeeId(QTUtil.getEmployeeId(request.getSession()));
        try {
            if (bNew) {
                bean.setCreatedDate(formBean.getCreatedDate());
                int id = goodDAO.insertSaleGood(bean);
                formBean.setId(id);
            } else {
                goodDAO.updateSaleGood(bean);
            }
            addSaleGoodDetail(formBean);
        } catch (Exception ex) {
        }
        return true;
    }

    private void addSaleGoodDetail(SaleGoodFormBean formBean) {
        try {
            GoodDAO goodDAO = new GoodDAO();
            ArrayList arrDetail = goodDAO.getSaleGoodDetail(formBean.getId());
            int length = formBean.getGoodId().length;
            int id = 0;
            boolean isUpdate = false;
            for (int i = 0; i < length; i++) {
                id = NumberUtil.parseInt(formBean.getSaleGoodDetailId()[i], 0);
                if (id == 0) {
                    SaleGoodDetailBean bean = new SaleGoodDetailBean();
                    bean.setGoodId(NumberUtil.parseInt(formBean.getGoodId()[i], 0));
                    bean.setQuantity(NumberUtil.parseInt(formBean.getQuantity()[i], 0));
                    bean.setPrice(NumberUtil.parseDouble(formBean.getPrice()[i], 0));
                    bean.setAmount(NumberUtil.parseDouble(formBean.getAmount()[i], 0));
                    bean.setSaleGoodId(formBean.getId());
                    goodDAO.insertSaleGoodDetail(bean);
                } else {
                    isUpdate = false;
                    int j = 0;
                    SaleGoodDetailBean oldBean = null;
                    for (; j < arrDetail.size(); j++) {
                        oldBean = (SaleGoodDetailBean) arrDetail.get(j);
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
                        if (isUpdate) {
                            goodDAO.updateSaleGoodDetail(oldBean);
                        }
                    }
                }
            }
            String ids = "0,";
            SaleGoodDetailBean oldBean = null;
            for (int i = 0; i < arrDetail.size(); i++) {
                oldBean = (SaleGoodDetailBean) arrDetail.get(i);
                ids += oldBean.getId() + ",";
            }
            ids += "0";
            goodDAO.deleteSaleGoodDetails(ids);
        } catch (Exception ex) {
        }
    }
}
