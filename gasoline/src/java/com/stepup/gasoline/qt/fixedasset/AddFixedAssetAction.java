/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.fixedasset;

import com.stepup.gasoline.qt.bean.FixedAssetBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.FixedAssetDAO;
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
public class AddFixedAssetAction extends SpineAction {

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
        FixedAssetFormBean formBean = (FixedAssetFormBean) form;
        FixedAssetDAO assetDAO = new FixedAssetDAO();
        FixedAssetBean bean = null;
        boolean bNew = false;
        boolean isExist = false;
        try {
            bean = assetDAO.getFixedAssetByName(formBean.getName());
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
                    bean = assetDAO.getFixedAsset(shellId);
                }
            } catch (Exception ex) {
            }
        }
        if (isExist) {
            ActionMessages errors = new ActionMessages();
            errors.add("fixedAssetExisted", new ActionMessage("fixedAsset.save.error"));
            saveErrors(request, errors);
            return false;
        }
        boolean isUpdate = false;
        try {
            if (bNew) {
            } else {
                if (!formBean.getName().equals(bean.getName())) {
                    isUpdate = true;
                }
                if (formBean.getUnitId() != bean.getUnitId()) {
                    isUpdate = true;
                }
                if (formBean.getGroupId()!= bean.getGroupId()) {
                    isUpdate = true;
                }
                if (formBean.getStartDate()!= bean.getStartDate()) {
                    isUpdate = true;
                }
                if (formBean.getQuantity()!= bean.getQuantity()) {
                    isUpdate = true;
                }
                if (formBean.getRate()!= bean.getRate()) {
                    isUpdate = true;
                }
                if (formBean.getMonthCount()!= bean.getMonthCount()) {
                    isUpdate = true;
                }
                if (formBean.getStatus()!= bean.getStatus()) {
                    isUpdate = true;
                }
            }
        } catch (Exception ex) {
        }
        bean = new FixedAssetBean();
        bean.setId(formBean.getId());
        bean.setName(formBean.getName());
        bean.setUnitId(formBean.getUnitId());
        bean.setGroupId(formBean.getGroupId());
        bean.setStartDate(formBean.getStartDate());
        bean.setQuantity(formBean.getQuantity());
        bean.setRate(formBean.getRate());
        bean.setMonthCount(formBean.getMonthCount());
        bean.setStatus(formBean.getStatus());
        try {
            if (bNew) {
                assetDAO.insertFixedAsset(bean);
            } else {
                if (isUpdate) {
                    assetDAO.updateFixedAsset(bean);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}
