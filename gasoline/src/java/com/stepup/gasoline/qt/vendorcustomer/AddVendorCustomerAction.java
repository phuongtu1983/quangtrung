/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.vendorcustomer;

import com.stepup.gasoline.qt.bean.VendorCustomerBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.VendorDAO;
import com.stepup.gasoline.qt.util.QTUtil;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class AddVendorCustomerAction extends SpineAction {

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
        VendorCustomerFormBean formBean = (VendorCustomerFormBean) form;
        VendorDAO vendorDAO = new VendorDAO();
        VendorCustomerBean bean = new VendorCustomerBean();
        bean.setId(formBean.getId());
        bean.setCustomerId(formBean.getCustomerId());
        bean.setVendorId(formBean.getVendorId());
        bean.setCustomerId(formBean.getCustomerId());
        bean.setOrganizationId(QTUtil.getOrganizationId(request.getSession()));
        try {
            vendorDAO.insertVendorCustomer(bean);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}
