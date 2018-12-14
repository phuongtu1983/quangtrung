/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.fraction;

import com.stepup.core.util.DateUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.FractionBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.GasDAO;
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
public class FractionFormAction extends SpineAction {

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
        FractionBean bean = null;
        String id = request.getParameter("fractionId");
        ArrayList arrDetail = null;
        GasDAO gasDAO = new GasDAO();
        if (!GenericValidator.isBlankOrNull(id)) {
            try {
                int fractionId = NumberUtil.parseInt(id, 0);
                bean = gasDAO.getFraction(fractionId);
                arrDetail = gasDAO.getFractionDetail(fractionId);
            } catch (Exception ex) {
            }
        }
        FractionFormBean formBean = null;
        if (bean != null) {
            formBean = new FractionFormBean(bean);
            if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT_PAST, PermissionUtil.PER_FRACTION)) {
                formBean.setCanEdit(1);
            }
        } else {
            formBean = new FractionFormBean();
            try {
                String prefix = "";
                if (formBean.getId() == 0) {
                    prefix = DateUtil.today("yyyyMMdd") + "-FG-";
                    String number = gasDAO.getNextFractionNumber(prefix, 4);
                    prefix += number;
                }
                formBean.setCode(prefix);
            } catch (Exception ex) {
            }
        }

        request.setAttribute(Constants.FRACTION, formBean);
        if (arrDetail == null) {
            arrDetail = new ArrayList();
        }
        request.setAttribute(Constants.FRACTION_SHELL, arrDetail);

        ArrayList arrShell = null;
        try {
            GoodDAO goodDAO = new GoodDAO();
            String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
            VendorDAO vendorDAO = new VendorDAO();
            String vendorIds = vendorDAO.getVendorOfOrganizations(organizationIds);
            arrShell = goodDAO.getShellVendor(organizationIds, vendorIds);
        } catch (Exception ex) {
        }
        if (arrShell == null) {
            arrShell = new ArrayList();
        }
        request.setAttribute(Constants.SHELL_LIST, arrShell);

        return true;
    }
}
