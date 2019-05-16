/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.oil;

import com.stepup.gasoline.qt.bean.OilBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.GoodDAO;
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
public class AddOilAction extends SpineAction {

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
        OilFormBean formBean = (OilFormBean) form;
        GoodDAO goodDAO = new GoodDAO();
        OilBean bean = null;
        boolean bNew = false;
        boolean isExist = false;
        try {
            bean = goodDAO.getOilByName(formBean.getName());
        } catch (Exception ex) {
        }
        int shellId = formBean.getId();
        if (shellId == 0) {
            bNew = true;
            if (bean != null) {
                isExist = true;
            }
        } else {
            bNew = false;
            if (bean != null && bean.getId() != shellId) {
                isExist = true;
            }
            try {
                if (bean == null) {
                    bean = goodDAO.getOil(shellId);
                }
            } catch (Exception ex) {
            }
        }
        if (isExist) {
            ActionMessages errors = new ActionMessages();
            errors.add("oilExisted", new ActionMessage("oil.save.error"));
            saveErrors(request, errors);
            return false;
        }
        boolean isUpdate = false;
        try {
            if (bNew) {
            } else {
                if (!formBean.getCode().equals(bean.getCode())) {
                    isUpdate = true;
                }
                if (!formBean.getName().equals(bean.getName())) {
                    isUpdate = true;
                }
                if (formBean.getStatus() != bean.getStatus()) {
                    isUpdate = true;
                }
                if (formBean.getGroupId() != bean.getGroupId()) {
                    isUpdate = true;
                }
                if (formBean.getWeight() != bean.getWeight()) {
                    isUpdate = true;
                }
                if (formBean.getWeightUnitId() != bean.getWeightUnitId()) {
                    isUpdate = true;
                }
                if (formBean.getBaseUnitId() != bean.getBaseUnitId()) {
                    isUpdate = true;
                }
                if (formBean.getSaleUnitId() != bean.getSaleUnitId()) {
                    isUpdate = true;
                }
                if (formBean.getEmployeeCommissionId() != bean.getEmployeeCommissionId()) {
                    isUpdate = true;
                }
                if (formBean.getOrganizationId() != bean.getOrganizationId()) {
                    isUpdate = true;
                }
                if (formBean.getPrice()!= bean.getPrice()) {
                    isUpdate = true;
                }
                if (formBean.getVendorId()!= bean.getVendorId()) {
                    isUpdate = true;
                }
            }
        } catch (Exception ex) {
        }
        bean = new OilBean();
        bean.setId(formBean.getId());
        bean.setCode(formBean.getCode());
        bean.setName(formBean.getName());
        bean.setVendorId(formBean.getVendorId());
        bean.setGroupId(formBean.getGroupId());
        bean.setWeight(formBean.getWeight());
        bean.setWeightUnitId(formBean.getWeightUnitId());
        bean.setBaseUnitId(formBean.getBaseUnitId());
        bean.setSaleUnitId(formBean.getSaleUnitId());
        bean.setEmployeeCommissionId(formBean.getEmployeeCommissionId());
        bean.setOrganizationId(formBean.getOrganizationId());
        bean.setStatus(formBean.getStatus());
        bean.setPrice(formBean.getPrice());
        try {
            if (bNew) {
                goodDAO.insertOil(bean);
            } else {
                if (isUpdate) {
                    goodDAO.updateOil(bean);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}
