/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.invoice;

import com.stepup.gasoline.qt.bean.InvoiceDetailBean;
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
public class GetInvoiceOilSaleDetailAction extends SpineAction {

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
            ArrayList arrSaleOilDetail = goodDAO.getSaleOilDetails(request.getParameter("ids"));
            InvoiceDetailBean invoiceDetailBean = null;
            for (int i = 0; i < arrSaleOilDetail.size(); i++) {
                SearchedSaleOilBean bean = (SearchedSaleOilBean) arrSaleOilDetail.get(i);
                invoiceDetailBean = new InvoiceDetailBean();
                invoiceDetailBean.setOilName(bean.getOilName());
                invoiceDetailBean.setOilSaleCode(bean.getOilSaleCode());
                invoiceDetailBean.setOilSaleDate(bean.getOilSaleDate());
                invoiceDetailBean.setOilSaleDetailId(bean.getId());
                invoiceDetailBean.setOilSaleDetailAmount(bean.getAmount());
                arrDetail.add(invoiceDetailBean);
            }
        } catch (Exception ex) {
        }
        request.setAttribute(Constants.INVOICE_DETAIL, arrDetail);

        return true;
    }
}
