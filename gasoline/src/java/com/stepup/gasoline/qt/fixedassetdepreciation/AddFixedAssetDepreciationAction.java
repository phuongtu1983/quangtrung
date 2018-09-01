/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.fixedassetdepreciation;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.FixedAssetDepreciationBean;
import com.stepup.gasoline.qt.bean.FixedAssetDepreciationDetailBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.FixedAssetDAO;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class AddFixedAssetDepreciationAction extends SpineAction {

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
        FixedAssetDepreciationFormBean formBean = (FixedAssetDepreciationFormBean) form;
        FixedAssetDAO assetDAO = new FixedAssetDAO();
        FixedAssetDepreciationBean bean = new FixedAssetDepreciationBean();
        bean.setId(formBean.getId());
        bean.setNote(formBean.getNote());
        try {
            assetDAO.updateFixedAssetDepreciation(bean);
            addFixedAssetDepreciationDetail(formBean);
        } catch (Exception ex) {
        }
        return true;
    }

    private void addFixedAssetDepreciationDetail(FixedAssetDepreciationFormBean formBean) {
        try {
            String assetCheckedIds = ",0,";
            if (formBean.getIsCheck() != null) {
                int length = formBean.getIsCheck().length;
                for (int i = 0; i < length; i++) {
                    assetCheckedIds += formBean.getIsCheck()[i] + ",";
                }
            }
            FixedAssetDAO assetDAO = new FixedAssetDAO();
            ArrayList arrDetail = assetDAO.getFixedAssetDepreciationDetail(formBean.getId());
            int length = formBean.getFixedAssetId().length;
            int id = 0;
            boolean isUpdate = false;
            for (int i = 0; i < length; i++) {
                id = NumberUtil.parseInt(formBean.getFixedAssetDepreciationDetailId()[i], 0);
                if (id == 0) {
                    FixedAssetDepreciationDetailBean bean = new FixedAssetDepreciationDetailBean();
                    bean.setFixedAssetId(NumberUtil.parseInt(formBean.getFixedAssetId()[i], 0));
                    int isChecked = EmployeeBean.STATUS_INACTIVE;
                    if (assetCheckedIds.contains("," + bean.getFixedAssetId() + ",")) {
                        isChecked = EmployeeBean.STATUS_ACTIVE;
                    }
                    bean.setIsCalculate(isChecked);
                    bean.setFixedAssetDepreciationId(formBean.getId());
                    assetDAO.insertFixedAssetDepreciationDetail(bean);
                } else {
                    isUpdate = false;
                    int j = 0;
                    FixedAssetDepreciationDetailBean oldBean = null;
                    for (; j < arrDetail.size(); j++) {
                        oldBean = (FixedAssetDepreciationDetailBean) arrDetail.get(j);
                        if (oldBean.getId() == id) {
                            break;
                        }
                    }
                    if (j < arrDetail.size()) {
                        arrDetail.remove(j);
                        int isChecked = EmployeeBean.STATUS_INACTIVE;
                        if (assetCheckedIds.contains("," + oldBean.getFixedAssetId() + ",")) {
                            isChecked = EmployeeBean.STATUS_ACTIVE;
                        }
                        if (oldBean.getIsCalculate() != isChecked) {
                            isUpdate = true;
                            oldBean.setIsCalculate(isChecked);
                        }
                        if (isUpdate) {
                            assetDAO.updateFixedAssetDepreciationDetail(oldBean);
                        }
                    }
                }
            }
        } catch (Exception ex) {
        }
    }
}
