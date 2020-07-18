/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.report.cashbookmodule;

import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.util.Constants;
import com.stepup.gasoline.qt.util.QTUtil;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.util.LabelValueBean;

/**
 *
 * @author phuongtu
 */
public class CashBookModuleReportPanelFormAction extends SpineAction {

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
        ArrayList arrModule = new ArrayList();
        try {
            LabelValueBean value;
            value = new LabelValueBean();
            value.setLabel("Gas");
            value.setValue(Constants.MODULE_GAS + "");
            arrModule.add(value);

            value = new LabelValueBean();
            value.setLabel(QTUtil.getBundleString("oil.title"));
            value.setValue(Constants.MODULE_OIL + "");
            arrModule.add(value);

            value = new LabelValueBean();
            value.setLabel("NLMT");
            value.setValue(Constants.MODULE_SOLAR + "");
            arrModule.add(value);

            value = new LabelValueBean();
            value.setLabel(QTUtil.getBundleString("petro.title"));
            value.setValue(Constants.MODULE_PETRO + "");
            arrModule.add(value);
        } catch (Exception ex) {
        }
        request.setAttribute(Constants.MODULE_LIST, arrModule);
        return true;
    }
}
