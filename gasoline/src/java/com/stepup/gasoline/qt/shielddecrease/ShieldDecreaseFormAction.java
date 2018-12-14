/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.shielddecrease;

import com.stepup.core.util.DateUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.ShieldDecreaseBean;
import com.stepup.gasoline.qt.bean.VendorBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.GoodDAO;
import com.stepup.gasoline.qt.dao.VendorDAO;
import com.stepup.gasoline.qt.util.Constants;
import com.stepup.gasoline.qt.util.PermissionUtil;
import com.stepup.gasoline.qt.util.QTUtil;
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
public class ShieldDecreaseFormAction extends SpineAction {

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
        ShieldDecreaseBean bean = null;
        String shieldDecreaseId = request.getParameter("shieldDecreaseId");
        GoodDAO goodDAO = new GoodDAO();
        if (!GenericValidator.isBlankOrNull(shieldDecreaseId)) {
            try {
                bean = goodDAO.getShieldDecrease(NumberUtil.parseInt(shieldDecreaseId, 0));
            } catch (Exception ex) {
            }
        }
        if (bean == null) {
            bean = new ShieldDecreaseBean();
            try {
                String prefix = "";
                prefix = DateUtil.today("yyyyMMdd") + "-SD-";
                String number = goodDAO.getNextShieldDecreaseNumber(prefix, 4);
                prefix += number;
                bean.setCode(prefix);
            } catch (Exception ex) {
            }
        } else {
            if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT_PAST, PermissionUtil.PER_SHIELD_DECREASE)) {
                bean.setCanEdit(1);
            }
        }
        request.setAttribute(Constants.SHIELD_DECREASE, bean);

        String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
        ArrayList arrVendor = null;
        try {
            VendorDAO vendorDAO = new VendorDAO();
            arrVendor = vendorDAO.getVendors(organizationIds, VendorBean.IS_GAS);
        } catch (Exception ex) {
        }
        if (arrVendor == null) {
            arrVendor = new ArrayList();
        }
        request.setAttribute(Constants.VENDOR_LIST, arrVendor);

        return true;
    }
}
