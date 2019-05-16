/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.agency;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.AgencyBean;
import com.stepup.gasoline.qt.bean.AgencyCommissionDetailBean;
import com.stepup.gasoline.qt.bean.AgencyCustomerDetailBean;
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
public class AddAgencyAction extends SpineAction {

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
        AgencyFormBean formBean = (AgencyFormBean) form;
        CustomerDAO customerDAO = new CustomerDAO();
        AgencyBean bean = null;
        boolean bNew = false;
        boolean isExist = false;
        try {
            bean = customerDAO.getAgencyByName(formBean.getName());
        } catch (Exception ex) {
        }
        int agencyId = formBean.getId();
        if (agencyId == 0) {
            bNew = true;
            if (bean != null) {
                isExist = true;
            }
        } else {
            bNew = false;
            if (bean != null && bean.getId() != agencyId) {
                isExist = true;
            }
            try {
                if (bean == null) {
                    bean = customerDAO.getAgency(agencyId);
                }
            } catch (Exception ex) {
            }
        }
        if (isExist) {
            ActionMessages errors = new ActionMessages();
            errors.add("agencyExisted", new ActionMessage("agency.save.error"));
            saveErrors(request, errors);
            return false;
        }
        boolean isUpdate = false;
        try {
            if (!bNew) {
                if (!formBean.getName().equals(bean.getName())) {
                    isUpdate = true;
                }
                if (!formBean.getPhone().equals(bean.getPhone())) {
                    isUpdate = true;
                }
                if (!formBean.getAddress().equals(bean.getAddress())) {
                    isUpdate = true;
                }
                if (!formBean.getNote().equals(bean.getNote())) {
                    isUpdate = true;
                }
                if (formBean.getStatus() != bean.getStatus()) {
                    isUpdate = true;
                }
            }
        } catch (Exception ex) {
        }
        bean = new AgencyBean();
        bean.setId(formBean.getId());
        bean.setName(formBean.getName());
        bean.setPhone(formBean.getPhone());
        bean.setAddress(formBean.getAddress());
        bean.setNote(formBean.getNote());
        bean.setStatus(formBean.getStatus());
        try {
            if (bNew) {
                int id = customerDAO.insertAgency(bean);
                formBean.setId(id);
                addAgencyCustomer(formBean);
                addAgencyCommission(formBean);
            } else {
                addAgencyCustomer(formBean);
                addAgencyCommission(formBean);
                if (isUpdate) {
                    customerDAO.updateAgency(bean);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }

    private void addAgencyCustomer(AgencyFormBean formBean) {
        try {
            CustomerDAO customerDAO = new CustomerDAO();
            ArrayList arrDetail = customerDAO.getAgencyCustomerDetail(formBean.getId());
            if (formBean.getCustomerId() != null) {
                int length = formBean.getCustomerId().length;
                int id = 0;
                for (int i = 0; i < length; i++) {
                    id = NumberUtil.parseInt(formBean.getAgencyCustomerDetailId()[i], 0);
                    if (id == 0) {
                        AgencyCustomerDetailBean bean = new AgencyCustomerDetailBean();
                        bean.setCustomerId(NumberUtil.parseInt(formBean.getCustomerId()[i], 0));
                        bean.setAgencyId(formBean.getId());
                        customerDAO.insertAgencyCustomerDetail(bean);
                    } else {
                        int j = 0;
                        AgencyCustomerDetailBean oldBean = null;
                        for (; j < arrDetail.size(); j++) {
                            oldBean = (AgencyCustomerDetailBean) arrDetail.get(j);
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
            AgencyCustomerDetailBean oldBean = null;
            for (int i = 0; i < arrDetail.size(); i++) {
                oldBean = (AgencyCustomerDetailBean) arrDetail.get(i);
                ids += oldBean.getId() + ",";
            }
            ids += "0";
            customerDAO.deleteAgencyCustomerDetails(ids);
        } catch (Exception ex) {
        }
    }
    
    private void addAgencyCommission(AgencyFormBean formBean) {
        try {
            CustomerDAO customerDAO = new CustomerDAO();
            ArrayList arrDetail = customerDAO.getAgencyCommissionDetail(formBean.getId());
            if (formBean.getAgencyCommissionCommission() != null) {
                int length = formBean.getAgencyCommissionCommission().length;
                int id = 0;
                boolean isUpdate = false;
                for (int i = 0; i < length; i++) {
                    id = NumberUtil.parseInt(formBean.getAgencyCommissionDetailId()[i], 0);
                    if (id == 0) {
                        AgencyCommissionDetailBean bean = new AgencyCommissionDetailBean();
                        bean.setCommissionFrom(NumberUtil.parseInt(formBean.getAgencyCommissionCommissionFrom()[i], 0));
                        bean.setCommissionTo(NumberUtil.parseInt(formBean.getAgencyCommissionCommissionTo()[i], 0));
                        bean.setCommission(NumberUtil.parseInt(formBean.getAgencyCommissionCommission()[i], 0));
                        bean.setAgencyId(formBean.getId());
                        customerDAO.insertAgencyCommissionDetail(bean);
                    } else {
                        isUpdate = false;
                        int j = 0;
                        AgencyCommissionDetailBean oldBean = null;
                        for (; j < arrDetail.size(); j++) {
                            oldBean = (AgencyCommissionDetailBean) arrDetail.get(j);
                            if (oldBean.getId() == id) {
                                break;
                            }
                        }
                        if (j < arrDetail.size()) {
                            arrDetail.remove(j);
                            if (oldBean.getCommissionFrom() != NumberUtil.parseInt(formBean.getAgencyCommissionCommissionFrom()[i], 0)) {
                                isUpdate = true;
                                oldBean.setCommissionFrom(NumberUtil.parseInt(formBean.getAgencyCommissionCommissionFrom()[i], 0));
                            }
                            if (oldBean.getCommissionTo() != NumberUtil.parseInt(formBean.getAgencyCommissionCommissionTo()[i], 0)) {
                                isUpdate = true;
                                oldBean.setCommissionTo(NumberUtil.parseInt(formBean.getAgencyCommissionCommissionTo()[i], 0));
                            }
                            if (oldBean.getCommission() != NumberUtil.parseInt(formBean.getAgencyCommissionCommission()[i], 0)) {
                                isUpdate = true;
                                oldBean.setCommission(NumberUtil.parseInt(formBean.getAgencyCommissionCommission()[i], 0));
                            }
                            if (isUpdate) {
                                customerDAO.updateAgencyCommissionDetail(oldBean);
                            }
                        }
                    }
                }
            }
            String ids = "0,";
            AgencyCommissionDetailBean oldBean = null;
            for (int i = 0; i < arrDetail.size(); i++) {
                oldBean = (AgencyCommissionDetailBean) arrDetail.get(i);
                ids += oldBean.getId() + ",";
            }
            ids += "0";
            customerDAO.deleteAgencyCommissionDetails(ids);
        } catch (Exception ex) {
        }
    }
}
