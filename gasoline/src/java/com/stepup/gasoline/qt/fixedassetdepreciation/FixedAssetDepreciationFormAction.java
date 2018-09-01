/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.fixedassetdepreciation;

import com.stepup.core.util.DateUtil;
import com.stepup.gasoline.qt.bean.FixedAssetDepreciationBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.FixedAssetDAO;
import com.stepup.gasoline.qt.util.Constants;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.validator.GenericValidator;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class FixedAssetDepreciationFormAction extends SpineAction {

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
        FixedAssetDepreciationBean bean = null;
        String id = request.getParameter("fixedAssetDepreciationId");
        ArrayList arrDetail = null;
        FixedAssetDAO assetDAO = new FixedAssetDAO();
        if (!GenericValidator.isBlankOrNull(id)) {
            try {
                int depreciationId = Integer.parseInt(id);
                bean = assetDAO.getFixedAssetDepreciation(depreciationId);
                arrDetail = assetDAO.getFixedAssetDepreciationDetail(depreciationId);
            } catch (Exception ex) {
            }
        }
        FixedAssetDepreciationFormBean formBean = null;
        if (bean != null) {
            formBean = new FixedAssetDepreciationFormBean(bean);
        } else {
            formBean = new FixedAssetDepreciationFormBean();
            try {
                String prefix = "";
                if (formBean.getId() == 0) {
                    prefix = DateUtil.today("yyyyMMdd") + "-FD-";
                    String number = assetDAO.getNextFixedAssetDepreciationNumber(prefix, 4);
                    prefix += number;
                }
                formBean.setCode(prefix);
            } catch (Exception ex) {
            }
        }

        request.setAttribute(Constants.FIXED_ASSET_DEPRECIATION, formBean);
        if (arrDetail == null) {
            arrDetail = new ArrayList();
        }
        request.setAttribute(Constants.FIXED_ASSET_DEPRECIATION_GOOD, arrDetail);

        return true;
    }
}
