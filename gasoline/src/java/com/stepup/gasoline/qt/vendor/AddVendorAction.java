/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.vendor;

import com.stepup.gasoline.qt.bean.DynamicFieldBean;
import com.stepup.gasoline.qt.bean.VendorBean;
import com.stepup.gasoline.qt.core.AddDynamicFieldValueAction;
import com.stepup.gasoline.qt.dao.VendorDAO;
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
public class AddVendorAction extends AddDynamicFieldValueAction {

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
        VendorFormBean formBean = (VendorFormBean) form;
        VendorDAO vendorDAO = new VendorDAO();
        VendorFormBean oldBean = null;
        boolean bNew = false;
        boolean isExist = false;
        try {
            oldBean = vendorDAO.getVendorByName(formBean.getName(), formBean.getOrganizationId());
        } catch (Exception ex) {
        }
        int vendorId = formBean.getId();
        if (vendorId == 0) {
            bNew = true;
            if (oldBean != null) {
                isExist = true;
            }
        } else {
            super.setParentId(vendorId);
            bNew = false;
            if (oldBean != null && oldBean.getId() != vendorId) {
                isExist = true;
            }
            if (oldBean == null) {
                try {
                    oldBean = vendorDAO.getVendor(vendorId);
                } catch (Exception ex) {
                }
            }
        }
        if (isExist) {
            ActionMessages errors = new ActionMessages();
            errors.add("vendorExisted", new ActionMessage("vendor.save.error"));
            saveErrors(request, errors);
            return false;
        }
        boolean isUpdate = false;
        try {
            if (!bNew) {
                if (!formBean.getName().equals(oldBean.getName())) {
                    isUpdate = true;
                }
                if (!formBean.getAddress().equals(oldBean.getAddress())) {
                    isUpdate = true;
                }
                if (!formBean.getTax().equals(oldBean.getTax())) {
                    isUpdate = true;
                }
                if (!formBean.getPhone().equals(oldBean.getPhone())) {
                    isUpdate = true;
                }
                if (!formBean.getFax().equals(oldBean.getFax())) {
                    isUpdate = true;
                }
                if (!formBean.getCode().equals(oldBean.getCode())) {
                    isUpdate = true;
                }
                if (formBean.getOrganizationId() != oldBean.getOrganizationId()) {
                    isUpdate = true;
                }
                if (formBean.getEqualOrganizationId() != oldBean.getEqualOrganizationId()) {
                    isUpdate = true;
                }
                if (formBean.getStatus() != oldBean.getStatus()) {
                    isUpdate = true;
                }
                if (formBean.getHasStock() != oldBean.getHasStock()) {
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
                if (formBean.getIsTransport() != oldBean.getIsTransport()) {
                    isUpdate = true;
                }
                if (formBean.getIsSolar() != oldBean.getIsSolar()) {
                    isUpdate = true;
                }
                if (formBean.getIsOil() != oldBean.getIsOil()) {
                    isUpdate = true;
                }
            }
        } catch (Exception ex) {
        }
        VendorBean bean = new VendorBean();
        bean.setId(formBean.getId());
        bean.setName(formBean.getName());
        bean.setAddress(formBean.getAddress());
        bean.setTax(formBean.getTax());
        bean.setPhone(formBean.getPhone());
        bean.setFax(formBean.getFax());
        bean.setCode(formBean.getCode());
        bean.setStatus(formBean.getStatus());
        bean.setOrganizationId(formBean.getOrganizationId());
        bean.setEqualOrganizationId(formBean.getEqualOrganizationId());
        bean.setCommissionOnImport(0);
        bean.setMaxDebt(0);
        bean.setHasStock(formBean.getHasStock() == true ? 1 : 0);
        bean.setIsGas(formBean.getIsGas() == true ? 1 : 0);
        bean.setIsPetro(formBean.getIsPetro() == true ? 1 : 0);
        bean.setIsGood(formBean.getIsGood() == true ? 1 : 0);
        bean.setIsTransport(formBean.getIsTransport() == true ? 1 : 0);
        bean.setIsOil(formBean.getIsOil() == true ? 1 : 0);
        bean.setIsSolar(formBean.getIsSolar() == true ? 1 : 0);
        try {
            if (bNew) {
                vendorId = vendorDAO.insertVendor(bean);
                super.setParentId(vendorId);
            } else {
                if (isUpdate) {
                    vendorDAO.updateVendor(bean);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        super.setOrganizationId(formBean.getOrganizationId());
        return true;
    }

    @Override
    protected String getTableName() {
        return DynamicFieldBean.VENDOR;
    }
}
