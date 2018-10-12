/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.saleshell;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.SaleShellBean;
import com.stepup.gasoline.qt.bean.SaleShellDetailBean;
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
public class AddSaleShellAction extends SpineAction {

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
        SaleShellFormBean formBean = (SaleShellFormBean) form;
        GasDAO gasDAO = new GasDAO();
        SaleShellBean bean = null;
        int saleShellId = formBean.getId();
        try {
            bean = gasDAO.getSaleShell(saleShellId);
        } catch (Exception ex) {
        }
        boolean bNew = false;
        if (saleShellId == 0) {
            bNew = true;
        } else {
            bNew = false;
        }
        if (bean == null) {
            bean = new SaleShellBean();
        }

        bean.setId(formBean.getId());
        bean.setCode(formBean.getCode());
        bean.setNote(formBean.getNote());
        bean.setCreatedDate(formBean.getCreatedDate());
        bean.setTotal(formBean.getTotal());
        bean.setPaid(formBean.getPaid());
        bean.setDebt(formBean.getDebt());
        bean.setDiscount(formBean.getDiscount());
        bean.setTotalPay(formBean.getTotalPay());
        bean.setAccountId(formBean.getAccountId());
        bean.setCustomerId(formBean.getCustomerId());
        bean.setCreatedEmployeeId(QTUtil.getEmployeeId(request.getSession()));
        try {
            if (bNew) {
                int id = gasDAO.insertSaleShell(bean);
                formBean.setId(id);
            } else {
                gasDAO.updateSaleShell(bean);
            }
            addSaleShellDetail(formBean);
        } catch (Exception ex) {
        }
        return true;
    }

    private void addSaleShellDetail(SaleShellFormBean formBean) {
        try {
            GasDAO gasDAO = new GasDAO();
            ArrayList arrDetail = gasDAO.getSaleShellDetail(formBean.getId());
            if (formBean.getGoodId() != null) {
                int length = formBean.getGoodId().length;
                int id = 0;
                boolean isUpdate = false;
                for (int i = 0; i < length; i++) {
                    id = NumberUtil.parseInt(formBean.getSaleShellDetailId()[i], 0);
                    if (id == 0) {
                        SaleShellDetailBean bean = new SaleShellDetailBean();
                        bean.setShellId(NumberUtil.parseInt(formBean.getGoodId()[i], 0));
                        bean.setQuantity(NumberUtil.parseInt(formBean.getQuantity()[i], 0));
                        bean.setPrice(NumberUtil.parseDouble(formBean.getPrice()[i], 0));
                        bean.setAmount(NumberUtil.parseDouble(formBean.getAmount()[i], 0));
                        bean.setSaleShellId(formBean.getId());
                        gasDAO.insertSaleShellDetail(bean);
                    } else {
                        isUpdate = false;
                        int j = 0;
                        SaleShellDetailBean oldBean = null;
                        for (; j < arrDetail.size(); j++) {
                            oldBean = (SaleShellDetailBean) arrDetail.get(j);
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
                                gasDAO.updateSaleShellDetail(oldBean);
                            }
                        }
                    }
                }
            }
            String ids = "0,";
            SaleShellDetailBean oldBean = null;
            for (int i = 0; i < arrDetail.size(); i++) {
                oldBean = (SaleShellDetailBean) arrDetail.get(i);
                ids += oldBean.getId() + ",";
            }
            ids += "0";
            gasDAO.deleteSaleShellDetails(ids);
        } catch (Exception ex) {
        }
    }
}
