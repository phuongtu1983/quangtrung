/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.customer;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.CustomerBean;
import com.stepup.gasoline.qt.bean.CustomerDocumentBean;
import com.stepup.gasoline.qt.bean.DynamicFieldBean;
import com.stepup.gasoline.qt.core.AddDynamicFieldValueAction;
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
public class AddCustomerAction extends AddDynamicFieldValueAction {

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
    public boolean doMainAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        CustomerFormBean formBean = (CustomerFormBean) form;
        CustomerDAO customerDAO = new CustomerDAO();
        CustomerFormBean oldBean = null;
        boolean bNew = false;
        boolean isExist = false;
        try {
            oldBean = customerDAO.getCustomerByName(formBean.getName());
        } catch (Exception ex) {
        }
        int customerId = formBean.getId();
        if (customerId == 0) {
            bNew = true;
            if (oldBean != null) {
                isExist = true;
            }
        } else {
            super.setParentId(customerId);
            bNew = false;
            if (oldBean != null && oldBean.getId() != customerId) {
                isExist = true;
            }
            if (oldBean == null) {
                try {
                    oldBean = customerDAO.getCustomer(customerId);
                } catch (Exception ex) {
                }
            }
        }
        if (isExist) {
            ActionMessages errors = new ActionMessages();
            errors.add("customerExisted", new ActionMessage("customer.save.error"));
            saveErrors(request, errors);
            return false;
        }
        boolean isUpdate = false;
        try {
            if (!bNew) {
                if (!formBean.getName().equals(oldBean.getName())) {
                    isUpdate = true;
                }
                if (!formBean.getPhone().equals(oldBean.getPhone())) {
                    isUpdate = true;
                }
                if (!formBean.getTax().equals(oldBean.getTax())) {
                    isUpdate = true;
                }
                if (!formBean.getPresenter().equals(oldBean.getPresenter())) {
                    isUpdate = true;
                }
                if (!formBean.getPresenterPosition().equals(oldBean.getPresenterPosition())) {
                    isUpdate = true;
                }
                if (!formBean.getDiscount().equals(oldBean.getDiscount())) {
                    isUpdate = true;
                }
                if (!formBean.getBankAccount().equals(oldBean.getBankAccount())) {
                    isUpdate = true;
                }
                if (!formBean.getAddress().equals(oldBean.getAddress())) {
                    isUpdate = true;
                }
                if (!formBean.getCode().equals(oldBean.getCode())) {
                    isUpdate = true;
                }
                if (formBean.getOrganizationId() != oldBean.getOrganizationId()) {
                    isUpdate = true;
                }
                if (formBean.getStatus() != oldBean.getStatus()) {
                    isUpdate = true;
                }
                if (formBean.getKind() != oldBean.getKind()) {
                    isUpdate = true;
                }
                if (formBean.getIsGas() != oldBean.getIsGas()) {
                    isUpdate = true;
                }
                if (formBean.getIsPetro() != oldBean.getIsPetro()) {
                    isUpdate = true;
                }
                if (formBean.getIsGood() != oldBean.getIsGood()) {
                    isUpdate = true;
                }
            }
        } catch (Exception ex) {
        }
        CustomerBean bean = new CustomerBean();
        bean.setId(formBean.getId());
        bean.setName(formBean.getName());
        bean.setCode(formBean.getCode());
        bean.setStatus(formBean.getStatus());
        bean.setOrganizationId(formBean.getOrganizationId());
        bean.setKind(formBean.getKind());
        bean.setAddress(formBean.getAddress());
        bean.setPhone(formBean.getPhone());
        bean.setBankAccount(formBean.getBankAccount());
        bean.setTax(formBean.getTax());
        bean.setPresenter(formBean.getPresenter());
        bean.setPresenterPosition(formBean.getPresenterPosition());
        bean.setDiscount(formBean.getDiscount());
        bean.setIsGas(formBean.getIsGas() == true ? 1 : 0);
        bean.setIsPetro(formBean.getIsPetro() == true ? 1 : 0);
        bean.setIsGood(formBean.getIsGood() == true ? 1 : 0);
        try {
            if (bNew) {
                customerId = customerDAO.insertCustomer(bean);
                formBean.setId(customerId);
                super.setParentId(customerId);
            } else {
                if (isUpdate) {
                    customerDAO.updateCustomer(bean);
                }
            }
            addCustomerDocuments(formBean);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        super.setOrganizationId(formBean.getOrganizationId());
        return true;
    }

    protected void addCustomerDocuments(CustomerFormBean formBean) {
        try {
            CustomerDAO customerDAO = new CustomerDAO();
            ArrayList arrDetail = customerDAO.getCustomerDocuments(formBean.getId());
            int length = formBean.getCustomerDocumentId().length;
            int id = 0;
            CustomerDocumentBean bean = null;
            for (int i = 0; i < length; i++) {
                id = NumberUtil.parseInt(formBean.getCustomerDocumentId()[i], 0);
                if (id == 0) {
                    bean = new CustomerDocumentBean();
                    bean.setCustomerId(formBean.getId());
                    bean.setDocumentId(NumberUtil.parseInt(formBean.getDocumentId()[i], 0));
                    bean.setExpiredDate(formBean.getCustomerDocumentExpiredDate()[i]);
                    customerDAO.insertCustomerDocument(bean);
                } else {
                    CustomerDocumentBean oldBean = null;
                    boolean isUpdate = false;
                    for (int j = 0; j < arrDetail.size(); j++) {
                        oldBean = (CustomerDocumentBean) arrDetail.get(j);
                        if (oldBean.getId() == id) {
                            bean = new CustomerDocumentBean();
                            bean.setId(id);
                            isUpdate = false;
                            if (!oldBean.getExpiredDate().equals(formBean.getCustomerDocumentExpiredDate()[i] + "")) {
                                isUpdate = true;
                                bean.setExpiredDate(formBean.getCustomerDocumentExpiredDate()[i] + "");
                            }
                            if (isUpdate) {
                                customerDAO.updateCustomerDocument(bean);
                            }
                            arrDetail.remove(j);
                            break;
                        }
                    }
                }
            }
        } catch (Exception ex) {
        }
    }

    @Override
    protected String getTableName() {
        return DynamicFieldBean.CUSTOMER;
    }
}
