/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.account;

import com.stepup.gasoline.qt.bean.AccountBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.AccountDAO;
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
public class AddAccountAction extends SpineAction {

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
        AccountFormBean formBean = (AccountFormBean) form;
        AccountDAO accountDAO = new AccountDAO();
        AccountFormBean oldBean = null;
        boolean bNew = false;
        boolean isExist = false;
        try {
            oldBean = accountDAO.getAccountByNumberAndBank(formBean.getNumber(), formBean.getBank());
        } catch (Exception ex) {
        }
        int accountId = formBean.getId();
        if (accountId == 0) {
            bNew = true;
            if (oldBean != null) {
                isExist = true;
            }
        } else {
            bNew = false;
            if (oldBean != null && oldBean.getId() != accountId) {
                isExist = true;
            }
            if (oldBean == null) {
                try {
                    oldBean = accountDAO.getAccount(accountId);
                } catch (Exception ex) {
                }
            }
        }
        if (isExist) {
            ActionMessages errors = new ActionMessages();
            errors.add("accountExisted", new ActionMessage("account.save.error"));
            saveErrors(request, errors);
            return false;
        }
        boolean isUpdate = false;
        try {
            if (!bNew) {
                if (!formBean.getNumber().equals(oldBean.getNumber())) {
                    isUpdate = true;
                }
                if (!formBean.getHolder().equals(oldBean.getHolder())) {
                    isUpdate = true;
                }
                if (!formBean.getBank().equals(oldBean.getBank())) {
                    isUpdate = true;
                }
                if (!formBean.getBranch().equals(oldBean.getBranch())) {
                    isUpdate = true;
                }
                if (!formBean.getNote().equals(oldBean.getNote())) {
                    isUpdate = true;
                }
                if (formBean.getOrganizationId() != oldBean.getOrganizationId()) {
                    isUpdate = true;
                }
                if (formBean.getIsCash()!= oldBean.getIsCash()) {
                    isUpdate = true;
                }
            }
        } catch (Exception ex) {
        }
        AccountBean bean = new AccountBean();
        bean.setId(formBean.getId());
        bean.setNumber(formBean.getNumber());
        bean.setHolder(formBean.getHolder());
        bean.setBank(formBean.getBank());
        bean.setBranch(formBean.getBranch());
        bean.setNote(formBean.getNote());
        bean.setOrganizationId(formBean.getOrganizationId());
        bean.setIsCash(formBean.getIsCash());
        try {
            if (bNew) {
                accountDAO.insertAccount(bean);
            } else {
                if (isUpdate) {
                    accountDAO.updateAccount(bean);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}
