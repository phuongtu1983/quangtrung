/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.invoicesolar;

import com.stepup.gasoline.qt.bean.InvoiceSolarDetailBean;
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
public class GetInvoiceSolarSolarSaleDetailAction extends SpineAction {

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
            ArrayList arrSaleSolarDetail = goodDAO.getSaleSolarDetails(request.getParameter("ids"));
            InvoiceSolarDetailBean invoiceSolarDetailBean = null;
            for (int i = 0; i < arrSaleSolarDetail.size(); i++) {
                SearchedSaleSolarBean bean = (SearchedSaleSolarBean) arrSaleSolarDetail.get(i);
                invoiceSolarDetailBean = new InvoiceSolarDetailBean();
                invoiceSolarDetailBean.setSolarName(bean.getSolarName());
                invoiceSolarDetailBean.setSolarSaleCode(bean.getSolarSaleCode());
                invoiceSolarDetailBean.setSolarSaleDate(bean.getSolarSaleDate());
                invoiceSolarDetailBean.setSolarSaleDetailId(bean.getId());
                invoiceSolarDetailBean.setSolarSaleDetailAmount(bean.getAmount());
                invoiceSolarDetailBean.setSolarSalePaidDetailAmount(bean.getAmount());
                arrDetail.add(invoiceSolarDetailBean);
            }
        } catch (Exception ex) {
        }
        request.setAttribute(Constants.INVOICE_SOLAR_DETAIL, arrDetail);

        return true;
    }
}
