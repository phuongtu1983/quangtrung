/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.salesolarreturn;

import com.stepup.core.util.NumberUtil;
import com.stepup.core.util.StringUtil;
import com.stepup.gasoline.qt.bean.SaleSolarReturnBean;
import com.stepup.gasoline.qt.bean.SaleSolarReturnDetailBean;
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
public class AddSaleSolarReturnAction extends SpineAction {

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
        SaleSolarReturnFormBean formBean = (SaleSolarReturnFormBean) form;
        GoodDAO goodDAO = new GoodDAO();
        SaleSolarReturnBean bean = null;
        int saleSolarReturnId = formBean.getId();
        try {
            bean = goodDAO.getSaleSolarReturn(saleSolarReturnId);
        } catch (Exception ex) {
        }
        boolean bNew = false;
        if (saleSolarReturnId == 0) {
            bNew = true;
        } else {
            bNew = false;
        }
        if (bean == null) {
            bean = new SaleSolarReturnBean();
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
                int id = goodDAO.insertSaleSolarReturn(bean);
                formBean.setId(id);
                addSaleSolarReturnDetail(formBean, needUpdate);
            } else {
                addSaleSolarReturnDetail(formBean, needUpdate);
                goodDAO.updateSaleSolarReturn(bean);
            }
        } catch (Exception ex) {
        }
        return true;
    }

    private void addSaleSolarReturnDetail(SaleSolarReturnFormBean formBean, boolean needUpdate) {
        try {
            GoodDAO goodDAO = new GoodDAO();
            ArrayList arrDetail = goodDAO.getSaleSolarReturnDetail(formBean.getId());
            int length = formBean.getSolarId().length;
            int id = 0;
            boolean isUpdate = false;
            for (int i = 0; i < length; i++) {
                id = NumberUtil.parseInt(formBean.getSaleSolarReturnDetailId()[i], 0);
                if (id == 0) {
                    SaleSolarReturnDetailBean bean = new SaleSolarReturnDetailBean();
                    bean.setSolarId(NumberUtil.parseInt(formBean.getSolarId()[i], 0));
                    bean.setSaleSolarDetailId(NumberUtil.parseInt(formBean.getSaleSolarDetailId()[i], 0));
                    bean.setQuantity(NumberUtil.parseInt(formBean.getQuantity()[i], 0));
                    bean.setPrice(NumberUtil.parseDouble(formBean.getPrice()[i], 0));
                    bean.setAmount(NumberUtil.parseDouble(formBean.getAmount()[i], 0));
                    bean.setPriceBeforeCommission(NumberUtil.parseFloat(formBean.getPriceBeforeCommission()[i], 0));
                    bean.setCommissionPrice(NumberUtil.parseFloat(formBean.getCommissionPrice()[i], 0));
                    bean.setFirstAmount(NumberUtil.parseDouble(formBean.getFirstAmount()[i], 0));
                    bean.setCommission(NumberUtil.parseFloat(formBean.getCommissionDetail()[i], 0));
                    bean.setGapAgencyAmount(NumberUtil.parseDouble(formBean.getGapAgencyAmountDetail()[i], 0));
                    bean.setGapCustomerAmount(NumberUtil.parseDouble(formBean.getGapCustomerAmountDetail()[i], 0));
                    bean.setSaleSolarReturnId(formBean.getId());
                    goodDAO.insertSaleSolarReturnDetail(bean);
                } else {
                    isUpdate = false;
                    int j = 0;
                    SaleSolarReturnDetailBean oldBean = null;
                    for (; j < arrDetail.size(); j++) {
                        oldBean = (SaleSolarReturnDetailBean) arrDetail.get(j);
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
                        if (needUpdate) {
                            isUpdate = true;
                        }
                        if (isUpdate) {
                            goodDAO.updateSaleSolarReturnDetail(oldBean);
                        }
                    }
                }
            }
            String ids = "0,";
            SaleSolarReturnDetailBean oldBean = null;
            for (int i = 0; i < arrDetail.size(); i++) {
                oldBean = (SaleSolarReturnDetailBean) arrDetail.get(i);
                ids += oldBean.getId() + ",";
            }
            ids += "0";
            goodDAO.deleteSaleSolarReturnDetails(ids);
        } catch (Exception ex) {
        }
    }
}
