/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.vendororganization;

import com.stepup.gasoline.qt.bean.VendorOrganizationBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.VendorDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class AddVendorOrganizationAction extends SpineAction {

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
        VendorOrganizationFormBean formBean = (VendorOrganizationFormBean) form;
        VendorDAO vendorDAO = new VendorDAO();
        VendorOrganizationBean bean = new VendorOrganizationBean();
        bean.setId(formBean.getId());
        bean.setOrganizationId(formBean.getOrganizationId());
        bean.setVendorId(formBean.getVendorId());
        try {
            vendorDAO.insertVendorOrganization(bean);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}
