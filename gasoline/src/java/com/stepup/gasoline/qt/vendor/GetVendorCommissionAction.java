/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.vendor;

import com.stepup.core.util.NumberUtil;
import com.stepup.core.util.OutputUtil;
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
public class GetVendorCommissionAction extends SpineAction {

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
        try {
            VendorDAO vendorDAO = new VendorDAO();
            int vendorId = NumberUtil.parseInt(request.getParameter("vendorId"), 0);
            VendorFormBean vendorBean = vendorDAO.getVendor(vendorId);
            String json = "{\"commission\":\"" + vendorBean.getCommissionOnImport()+ "\"}";
            OutputUtil.sendStringToOutput(response, json);
        } catch (Exception ex) {
        }
        return true;
    }

    @Override
    protected boolean isReturnStream() {
        return true;
    }
}
