/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.fixedasset;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.FixedAssetBean;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.FixedAssetDAO;
import com.stepup.gasoline.qt.dao.UnitDAO;
import com.stepup.gasoline.qt.util.Constants;
import com.stepup.gasoline.qt.util.QTUtil;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.validator.GenericValidator;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.util.LabelValueBean;

/**
 *
 * @author phuongtu
 */
public class FixedAssetFormAction extends SpineAction {

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
        FixedAssetBean bean = null;
        String fixedAssetId = request.getParameter("fixedAssetId");
        if (!GenericValidator.isBlankOrNull(fixedAssetId)) {
            FixedAssetDAO assetDAO = new FixedAssetDAO();
            try {
                bean = assetDAO.getFixedAsset(NumberUtil.parseInt(fixedAssetId, 0));
            } catch (Exception ex) {
            }
        }
        if (bean == null) {
            bean = new FixedAssetBean();
        }
        request.setAttribute(Constants.FIXED_ASSET, bean);

        ArrayList arrStatus = new ArrayList();
        LabelValueBean value;
        value = new LabelValueBean();
        value.setLabel(QTUtil.getBundleString("employee.detail.status.active"));
        value.setValue(EmployeeBean.STATUS_ACTIVE + "");
        arrStatus.add(value);
        value = new LabelValueBean();
        value.setLabel(QTUtil.getBundleString("employee.detail.status.inactive"));
        value.setValue(EmployeeBean.STATUS_INACTIVE + "");
        arrStatus.add(value);
        request.setAttribute(Constants.STATUS_LIST, arrStatus);

        ArrayList arrUnit = null;
        try {
            UnitDAO unitDAO = new UnitDAO();
            arrUnit = unitDAO.getUnits(EmployeeBean.STATUS_ACTIVE);
        } catch (Exception ex) {
        }
        if (arrUnit == null) {
            arrUnit = new ArrayList();
        }
        request.setAttribute(Constants.UNIT_LIST, arrUnit);

        ArrayList arrFixedAssetGroup = null;
        try {
            FixedAssetDAO assetDAO = new FixedAssetDAO();
            arrFixedAssetGroup = assetDAO.getFixedAssetGroups(QTUtil.getOrganizationManageds(request.getSession()));
        } catch (Exception ex) {
        }
        if (arrFixedAssetGroup == null) {
            arrFixedAssetGroup = new ArrayList();
        }
        request.setAttribute(Constants.FIXED_ASSET_GROUP_LIST, arrFixedAssetGroup);

        return true;
    }
}
