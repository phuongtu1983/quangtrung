/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.saleinner;

import com.stepup.core.util.NumberUtil;
import com.stepup.core.util.StringUtil;
import com.stepup.gasoline.qt.bean.SaleInnerBean;
import com.stepup.gasoline.qt.bean.SaleInnerDetailBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.GasDAO;
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
public class AddSaleInnerAction extends SpineAction {

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
        SaleInnerFormBean formBean = (SaleInnerFormBean) form;
        GasDAO gasDAO = new GasDAO();
        SaleInnerBean bean = null;
        int saleInnerId = formBean.getId();
        try {
            bean = gasDAO.getSaleInner(saleInnerId);
        } catch (Exception ex) {
        }
        boolean bNew = false;
        if (saleInnerId == 0) {
            bNew = true;
        } else {
            bNew = false;
        }
        if (bean == null) {
            bean = new SaleInnerBean();
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
        bean.setEmployeeId(formBean.getEmployeeId());
        bean.setCreatedEmployeeId(QTUtil.getEmployeeId(request.getSession()));
        try {
            if (bNew) {
                int id = gasDAO.insertSaleInner(bean);
                formBean.setId(id);
                addSaleInnerDetail(formBean, needUpdate);
            } else {
                addSaleInnerDetail(formBean, needUpdate);
                gasDAO.updateSaleInner(bean);
            }
        } catch (Exception ex) {
        }
        return true;
    }

    private void addSaleInnerDetail(SaleInnerFormBean formBean, boolean needUpdate) {
        try {
            GasDAO gasDAO = new GasDAO();
            ArrayList arrDetail = gasDAO.getSaleInnerDetail(formBean.getId());
            if (formBean.getGoodId() != null) {
                int length = formBean.getGoodId().length;
                int id = 0;
                boolean isUpdate = false;
                for (int i = 0; i < length; i++) {
                    id = NumberUtil.parseInt(formBean.getSaleInnerDetailId()[i], 0);
                    if (id == 0) {
                        SaleInnerDetailBean bean = new SaleInnerDetailBean();
                        bean.setShellId(NumberUtil.parseInt(formBean.getGoodId()[i], 0));
                        bean.setQuantity(NumberUtil.parseInt(formBean.getQuantity()[i], 0));
                        bean.setPrice(NumberUtil.parseDouble(formBean.getPrice()[i], 0));
                        bean.setAmount(NumberUtil.parseDouble(formBean.getAmount()[i], 0));
                        bean.setSaleInnerId(formBean.getId());
                        gasDAO.insertSaleInnerDetail(bean);
                    } else {
                        isUpdate = false;
                        int j = 0;
                        SaleInnerDetailBean oldBean = null;
                        for (; j < arrDetail.size(); j++) {
                            oldBean = (SaleInnerDetailBean) arrDetail.get(j);
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
                                gasDAO.updateSaleInnerDetail(oldBean);
                            }
                        }
                    }
                }
            }
            String ids = "0,";
            SaleInnerDetailBean oldBean = null;
            for (int i = 0; i < arrDetail.size(); i++) {
                oldBean = (SaleInnerDetailBean) arrDetail.get(i);
                ids += oldBean.getId() + ",";
            }
            ids += "0";
            gasDAO.deleteSaleInnerDetails(ids);
        } catch (Exception ex) {
        }
    }
}
