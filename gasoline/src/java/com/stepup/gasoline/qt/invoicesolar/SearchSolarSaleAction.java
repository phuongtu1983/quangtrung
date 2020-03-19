/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.invoicesolar;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.GoodDAO;
import com.stepup.gasoline.qt.util.Constants;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class SearchSolarSaleAction extends SpineAction {

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
        ArrayList arrDetail = new ArrayList();
        try {
            GoodDAO goodDAO = new GoodDAO();
            arrDetail = goodDAO.getSaleSolarDetail(request.getParameter("code"), request.getParameter("fromDate"), request.getParameter("toDate"),
                    request.getParameter("solarName"), NumberUtil.parseInt(request.getParameter("customerId"), 0));
        } catch (Exception ex) {
        }
        request.setAttribute(Constants.INVOICE_SOLAR_SEARCHED_DETAIL, arrDetail);

        return true;
    }
}
