/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.saleaccessory;

import com.stepup.core.util.NumberUtil;
import com.stepup.core.util.StringUtil;
import com.stepup.gasoline.qt.bean.SaleAccessoryBean;
import com.stepup.gasoline.qt.bean.SaleAccessoryChangeDetailBean;
import com.stepup.gasoline.qt.bean.SaleAccessoryDetailBean;
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
public class AddSaleAccessoryAction extends SpineAction {

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
        SaleAccessoryFormBean formBean = (SaleAccessoryFormBean) form;
        GoodDAO goodDAO = new GoodDAO();
        SaleAccessoryBean bean = null;
        int saleAccessoryId = formBean.getId();
        try {
            bean = goodDAO.getSaleAccessory(saleAccessoryId);
        } catch (Exception ex) {
        }
        boolean bNew = false;
        if (saleAccessoryId == 0) {
            bNew = true;
        } else {
            bNew = false;
        }
        if (bean == null) {
            bean = new SaleAccessoryBean();
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
        bean.setCreatedEmployeeId(QTUtil.getEmployeeId(request.getSession()));
        try {
            if (bNew) {
                int id = goodDAO.insertSaleAccessory(bean);
                formBean.setId(id);
                addSaleAccessoryDetail(formBean, needUpdate);
                addSaleAccessoryChange(formBean);
            } else {
                addSaleAccessoryDetail(formBean, needUpdate);
                addSaleAccessoryChange(formBean);
                goodDAO.updateSaleAccessory(bean);
            }
        } catch (Exception ex) {
        }
        return true;
    }

    private void addSaleAccessoryDetail(SaleAccessoryFormBean formBean, boolean needUpdate) {
        try {
            GoodDAO goodDAO = new GoodDAO();
            ArrayList arrDetail = goodDAO.getSaleAccessoryDetail(formBean.getId());
            int length = formBean.getGoodId().length;
            int id = 0;
            boolean isUpdate = false;
            for (int i = 0; i < length; i++) {
                id = NumberUtil.parseInt(formBean.getSaleAccessoryDetailId()[i], 0);
                if (id == 0) {
                    SaleAccessoryDetailBean bean = new SaleAccessoryDetailBean();
                    bean.setAccessoryId(NumberUtil.parseInt(formBean.getGoodId()[i], 0));
                    bean.setQuantity(NumberUtil.parseInt(formBean.getQuantity()[i], 0));
                    bean.setPrice(NumberUtil.parseDouble(formBean.getPrice()[i], 0));
                    bean.setAmount(NumberUtil.parseDouble(formBean.getAmount()[i], 0));
                    bean.setSaleAccessoryId(formBean.getId());
                    goodDAO.insertSaleAccessoryDetail(bean);
                } else {
                    isUpdate = false;
                    int j = 0;
                    SaleAccessoryDetailBean oldBean = null;
                    for (; j < arrDetail.size(); j++) {
                        oldBean = (SaleAccessoryDetailBean) arrDetail.get(j);
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
                        if (needUpdate) {
                            isUpdate = true;
                        }
                        if (isUpdate) {
                            goodDAO.updateSaleAccessoryDetail(oldBean);
                        }
                    }
                }
            }
        } catch (Exception ex) {
        }
    }

    private void addSaleAccessoryChange(SaleAccessoryFormBean formBean) {
        try {
            GoodDAO goodDAO = new GoodDAO();
            ArrayList arrDetail = goodDAO.getSaleAccessoryChangeDetail(formBean.getId());
            int length = formBean.getChangeGoodId().length;
            int id = 0;
            boolean isUpdate = false;
            for (int i = 0; i < length; i++) {
                id = NumberUtil.parseInt(formBean.getSaleAccessoryChangeGoodDetailId()[i], 0);
                if (id == 0) {
                    SaleAccessoryChangeDetailBean bean = new SaleAccessoryChangeDetailBean();
                    bean.setAccessoryId(NumberUtil.parseInt(formBean.getChangeGoodId()[i], 0));
                    bean.setQuantity(NumberUtil.parseInt(formBean.getChangeGoodQuantity()[i], 0));
                    bean.setPrice(NumberUtil.parseDouble(formBean.getChangeGoodPrice()[i], 0));
                    bean.setAmount(NumberUtil.parseDouble(formBean.getChangeGoodAmount()[i], 0));
                    bean.setSaleAccessoryId(formBean.getId());
                    goodDAO.insertSaleAccessoryChangeDetail(bean);
                } else {
                    isUpdate = false;
                    int j = 0;
                    SaleAccessoryChangeDetailBean oldBean = null;
                    for (; j < arrDetail.size(); j++) {
                        oldBean = (SaleAccessoryChangeDetailBean) arrDetail.get(j);
                        if (oldBean.getId() == id) {
                            break;
                        }
                    }
                    if (j < arrDetail.size()) {
                        arrDetail.remove(j);
                        if (oldBean.getQuantity() != NumberUtil.parseInt(formBean.getChangeGoodQuantity()[i], 0)) {
                            isUpdate = true;
                            oldBean.setQuantity(NumberUtil.parseInt(formBean.getChangeGoodQuantity()[i], 0));
                        }
                        if (oldBean.getPrice() != NumberUtil.parseDouble(formBean.getChangeGoodPrice()[i], 0)) {
                            isUpdate = true;
                            oldBean.setPrice(NumberUtil.parseDouble(formBean.getChangeGoodPrice()[i], 0));
                        }
                        if (oldBean.getAmount() != NumberUtil.parseDouble(formBean.getChangeGoodAmount()[i], 0)) {
                            isUpdate = true;
                            oldBean.setAmount(NumberUtil.parseDouble(formBean.getChangeGoodAmount()[i], 0));
                        }
                        if (isUpdate) {
                            goodDAO.updateSaleAccessoryChangeDetail(oldBean);
                        }
                    }
                }
            }
        } catch (Exception ex) {
        }
    }

}
