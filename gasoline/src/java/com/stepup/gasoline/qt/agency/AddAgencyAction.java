/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.agency;

import com.stepup.gasoline.qt.bean.AgencyBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.CustomerDAO;
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
                customerDAO.insertAgency(bean);
            } else {
                if (isUpdate) {
                    customerDAO.updateAgency(bean);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}
