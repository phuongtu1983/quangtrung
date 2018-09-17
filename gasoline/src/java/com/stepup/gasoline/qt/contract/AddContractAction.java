/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.contract;

import com.stepup.gasoline.qt.bean.ContractBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.ContractDAO;
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
public class AddContractAction extends SpineAction {

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
        ContractFormBean formBean = (ContractFormBean) form;
        ContractDAO contractDAO = new ContractDAO();
        ContractBean oldBean = null;
        boolean bNew = false;
        boolean isExist = false;
        try {
            oldBean = contractDAO.getContractByCode(formBean.getCode());
        } catch (Exception ex) {
        }
        int contractId = formBean.getId();
        if (contractId == 0) {
            bNew = true;
            if (oldBean != null) {
                isExist = true;
            }
        } else {
            bNew = false;
            if (oldBean != null && oldBean.getId() != contractId) {
                isExist = true;
            }
            if (oldBean == null) {
                try {
                    oldBean = contractDAO.getContract(contractId);
                } catch (Exception ex) {
                }
            }
        }
        if (isExist) {
            ActionMessages errors = new ActionMessages();
            errors.add("contractExisted", new ActionMessage("contract.save.error"));
            saveErrors(request, errors);
            return false;
        }
        boolean isUpdate = false;
        try {
            if (!bNew) {
                if (formBean.getCustomerId() != oldBean.getCustomerId()) {
                    isUpdate = true;
                }
                if (formBean.getShell12Price() != oldBean.getShell12Price()) {
                    isUpdate = true;
                }
                if (formBean.getShell45Price() != oldBean.getShell45Price()) {
                    isUpdate = true;
                }
                if (formBean.getCreditDate() != oldBean.getCreditDate()) {
                    isUpdate = true;
                }
                if (formBean.getCreditAmount() != oldBean.getCreditAmount()) {
                    isUpdate = true;
                }
            }
        } catch (Exception ex) {
        }
        ContractBean bean = new ContractBean();
        bean.setId(formBean.getId());
        bean.setCode(formBean.getCode());
        bean.setCreatedDate(formBean.getCreatedDate());
        bean.setCustomerId(formBean.getCustomerId());
        bean.setShell12Price(formBean.getShell12Price());
        bean.setShell45Price(formBean.getShell45Price());
        bean.setCreditDate(formBean.getCreditDate());
        bean.setCreditAmount(formBean.getCreditAmount());
        bean.setNote(formBean.getNote());
        try {
            if (bNew) {
                contractId = contractDAO.insertContract(bean);
            } else {
                if (isUpdate) {
                    contractDAO.updateContract(bean);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}
