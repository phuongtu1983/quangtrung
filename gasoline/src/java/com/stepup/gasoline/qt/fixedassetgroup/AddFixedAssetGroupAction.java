/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.fixedassetgroup;

import com.stepup.gasoline.qt.bean.FixedAssetGroupBean;
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
public class AddFixedAssetGroupAction extends SpineAction {

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
        FixedAssetGroupFormBean formBean = (FixedAssetGroupFormBean) form;
        FixedAssetDAO assetDAO = new FixedAssetDAO();
        FixedAssetGroupBean oldBean = null;
        boolean bNew = false;
        boolean isExist = false;
        try {
            oldBean = assetDAO.getFixedAssetGroupByName(formBean.getName());
        } catch (Exception ex) {
        }
        int storeId = formBean.getId();
        if (storeId == 0) {
            bNew = true;
            if (oldBean != null) {
                isExist = true;
            }
        } else {
            bNew = false;
            if (oldBean != null && oldBean.getId() != storeId) {
                isExist = true;
            }
            if (oldBean == null) {
                try {
                    oldBean = assetDAO.getFixedAssetGroup(storeId);
                } catch (Exception ex) {
                }
            }
        }
        if (isExist) {
            ActionMessages errors = new ActionMessages();
            errors.add("fixedAssetGroupExisted", new ActionMessage("fixedassetgroup.save.error"));
            saveErrors(request, errors);
            return false;
        }
        boolean isUpdate = false;
        try {
            if (!bNew) {
                if (!formBean.getName().equals(oldBean.getName())) {
                    isUpdate = true;
                }
                if (formBean.getOrganizationId() != oldBean.getOrganizationId()) {
                    isUpdate = true;
                }
            }
        } catch (Exception ex) {
        }
        FixedAssetGroupBean bean = new FixedAssetGroupBean();
        bean.setId(formBean.getId());
        bean.setName(formBean.getName());
        bean.setOrganizationId(formBean.getOrganizationId());
        try {
            if (bNew) {
                assetDAO.insertFixedAssetGroup(bean);
            } else {
                if (isUpdate) {
                    assetDAO.updateFixedAssetGroup(bean);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}
