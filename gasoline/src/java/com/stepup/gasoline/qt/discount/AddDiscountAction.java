/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.discount;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.DiscountBean;
import com.stepup.gasoline.qt.bean.DiscountCommissionDetailBean;
import com.stepup.gasoline.qt.bean.DiscountCustomerDetailBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.CustomerDAO;
import java.util.ArrayList;
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
public class AddDiscountAction extends SpineAction {

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
        DiscountFormBean formBean = (DiscountFormBean) form;
        CustomerDAO customerDAO = new CustomerDAO();
        DiscountBean bean = null;
        boolean bNew = false;
        boolean isExist = false;
        try {
            bean = customerDAO.getDiscountByName(formBean.getName());
        } catch (Exception ex) {
        }
        int discountId = formBean.getId();
        if (discountId == 0) {
            bNew = true;
            if (bean != null) {
                isExist = true;
            }
        } else {
            bNew = false;
            if (bean != null && bean.getId() != discountId) {
                isExist = true;
            }
            try {
                if (bean == null) {
                    bean = customerDAO.getDiscount(discountId);
                }
            } catch (Exception ex) {
            }
        }
        if (isExist) {
            ActionMessages errors = new ActionMessages();
            errors.add("discountExisted", new ActionMessage("discount.save.error"));
            saveErrors(request, errors);
            return false;
        }

        bean = new DiscountBean();
        bean.setId(formBean.getId());
        bean.setName(formBean.getName());
        bean.setCode(formBean.getCode());
        bean.setNote(formBean.getNote());
        bean.setShellGasComission(formBean.getShellGasComission());
        try {
            if (bNew) {
                int id = customerDAO.insertDiscount(bean);
                formBean.setId(id);
                addDiscountCommission(formBean);
                addDiscountCustomer(formBean);
            } else {
                addDiscountCommission(formBean);
                addDiscountCustomer(formBean);
                customerDAO.updateDiscount(bean);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }

    private void addDiscountCommission(DiscountFormBean formBean) {
        try {
            CustomerDAO customerDAO = new CustomerDAO();
            ArrayList arrDetail = customerDAO.getDiscountCommissionDetail(formBean.getId());
            if (formBean.getDiscountCommissionCommission() != null) {
                int length = formBean.getDiscountCommissionCommission().length;
                int id = 0;
                boolean isUpdate = false;
                for (int i = 0; i < length; i++) {
                    id = NumberUtil.parseInt(formBean.getDiscountCommissionDetailId()[i], 0);
                    if (id == 0) {
                        DiscountCommissionDetailBean bean = new DiscountCommissionDetailBean();
                        bean.setFrom(NumberUtil.parseDouble(formBean.getDiscountCommissionFrom()[i], 0));
                        bean.setTo(NumberUtil.parseDouble(formBean.getDiscountCommissionTo()[i], 0));
                        bean.setCommission(NumberUtil.parseDouble(formBean.getDiscountCommissionCommission()[i], 0));
                        bean.setDiscountId(formBean.getId());
                        customerDAO.insertDiscountCommissionDetail(bean);
                    } else {
                        isUpdate = false;
                        int j = 0;
                        DiscountCommissionDetailBean oldBean = null;
                        for (; j < arrDetail.size(); j++) {
                            oldBean = (DiscountCommissionDetailBean) arrDetail.get(j);
                            if (oldBean.getId() == id) {
                                break;
                            }
                        }
                        if (j < arrDetail.size()) {
                            arrDetail.remove(j);
                            if (oldBean.getFrom() != NumberUtil.parseDouble(formBean.getDiscountCommissionFrom()[i], 0)) {
                                isUpdate = true;
                                oldBean.setFrom(NumberUtil.parseDouble(formBean.getDiscountCommissionFrom()[i], 0));
                            }
                            if (oldBean.getTo() != NumberUtil.parseDouble(formBean.getDiscountCommissionTo()[i], 0)) {
                                isUpdate = true;
                                oldBean.setTo(NumberUtil.parseDouble(formBean.getDiscountCommissionTo()[i], 0));
                            }
                            if (oldBean.getCommission() != NumberUtil.parseDouble(formBean.getDiscountCommissionCommission()[i], 0)) {
                                isUpdate = true;
                                oldBean.setCommission(NumberUtil.parseDouble(formBean.getDiscountCommissionCommission()[i], 0));
                            }
                            if (isUpdate) {
                                customerDAO.updateDiscountCommissionDetail(oldBean);
                            }
                        }
                    }
                }
            }
            String ids = "0,";
            DiscountCommissionDetailBean oldBean = null;
            for (int i = 0; i < arrDetail.size(); i++) {
                oldBean = (DiscountCommissionDetailBean) arrDetail.get(i);
                ids += oldBean.getId() + ",";
            }
            ids += "0";
            customerDAO.deleteDiscountCommissionDetails(ids);
        } catch (Exception ex) {
        }
    }
    
    private void addDiscountCustomer(DiscountFormBean formBean) {
        try {
            CustomerDAO customerDAO = new CustomerDAO();
            ArrayList arrDetail = customerDAO.getDiscountCustomerDetail(formBean.getId());
            if (formBean.getCustomerId() != null) {
                int length = formBean.getCustomerId().length;
                int id = 0;
                for (int i = 0; i < length; i++) {
                    id = NumberUtil.parseInt(formBean.getDiscountCustomerDetailId()[i], 0);
                    if (id == 0) {
                        DiscountCustomerDetailBean bean = new DiscountCustomerDetailBean();
                        bean.setCustomerId(NumberUtil.parseInt(formBean.getCustomerId()[i], 0));
                        bean.setDiscountId(formBean.getId());
                        customerDAO.insertDiscountCustomerDetail(bean);
                    } else {
                        int j = 0;
                        DiscountCustomerDetailBean oldBean = null;
                        for (; j < arrDetail.size(); j++) {
                            oldBean = (DiscountCustomerDetailBean) arrDetail.get(j);
                            if (oldBean.getId() == id) {
                                break;
                            }
                        }
                        if (j < arrDetail.size()) {
                            arrDetail.remove(j);
                        }
                    }
                }
            }
            String ids = "0,";
            DiscountCustomerDetailBean oldBean = null;
            for (int i = 0; i < arrDetail.size(); i++) {
                oldBean = (DiscountCustomerDetailBean) arrDetail.get(i);
                ids += oldBean.getId() + ",";
            }
            ids += "0";
            customerDAO.deleteDiscountCustomerDetails(ids);
        } catch (Exception ex) {
        }
    }
}
