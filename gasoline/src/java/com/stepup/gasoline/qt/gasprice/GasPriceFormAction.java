/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.gasprice;

import com.stepup.core.util.DateUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.GasPriceBean;
import com.stepup.gasoline.qt.bean.VendorBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.CustomerDAO;
import com.stepup.gasoline.qt.dao.GasDAO;
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
public class GasPriceFormAction extends SpineAction {

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
        GasPriceBean bean = null;
        String gasPriceId = request.getParameter("gasPriceId");
        GasDAO gasDAO = new GasDAO();
        if (!GenericValidator.isBlankOrNull(gasPriceId)) {
            try {
                bean = gasDAO.getGasPrice(NumberUtil.parseInt(gasPriceId, 0));
            } catch (Exception ex) {
            }
        }
        if (bean == null) {
            bean = new GasPriceBean();
            try {
                String prefix = "";
                prefix = DateUtil.today("yyyyMMdd") + "-GP-";
                String number = gasDAO.getNextGasPriceNumber(prefix, 4);
                prefix += number;
                bean.setCode(prefix);
            } catch (Exception ex) {
            }
        }
        request.setAttribute(Constants.GAS_PRICE, bean);

        ArrayList arrCustomer = null;
        try {
            String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
            CustomerDAO customerDAO = new CustomerDAO();
            arrCustomer = customerDAO.getCustomers(organizationIds, VendorBean.IS_GAS);
        } catch (Exception ex) {
        }
        if (arrCustomer == null) {
            arrCustomer = new ArrayList();
        }
        request.setAttribute(Constants.CUSTOMER_LIST, arrCustomer);

        return true;
    }
}
