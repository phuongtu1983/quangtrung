/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.oilexport;

import com.stepup.core.util.DateUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.OilExportBean;
import com.stepup.gasoline.qt.bean.OilExportDetailBean;
import com.stepup.gasoline.qt.bean.SaleOilBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.customer.CustomerFormBean;
import com.stepup.gasoline.qt.dao.CustomerDAO;
import com.stepup.gasoline.qt.dao.GoodDAO;
import com.stepup.gasoline.qt.util.Constants;
import com.stepup.gasoline.qt.util.PermissionUtil;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class OilExportFormAction extends SpineAction {

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
        OilExportFormBean formBean = null;
        int oilExportId = NumberUtil.parseInt(request.getParameter("oilExportId"), 0);
        int oilSaleId = NumberUtil.parseInt(request.getParameter("oilSaleId"), 0);
        ArrayList arrDetail = null;
        GoodDAO goodDAO = new GoodDAO();
        try {
            if (oilExportId != 0) {
                OilExportBean bean = goodDAO.getOilExport(oilExportId);
                arrDetail = goodDAO.getOilExportDetail(oilExportId);
                if (bean != null) {
                    formBean = new OilExportFormBean(bean);
                    if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT_PAST, PermissionUtil.PER_OIL_EXPORT)) {
                        formBean.setCanEdit(1);
                    }
                }
            } else if (oilSaleId != 0) {
                SaleOilBean saleOilBean = goodDAO.getSaleOil(oilSaleId);
                if (saleOilBean != null) {
                    formBean = new OilExportFormBean(saleOilBean);
                    CustomerDAO customerDAO = new CustomerDAO();
                    CustomerFormBean customerBean = customerDAO.getCustomer(formBean.getCustomerId());
                    if (customerBean != null) {
                        formBean.setCustomerName(customerBean.getName());
                    }
                    arrDetail = goodDAO.getOilExportDetailBySaleOilId(request.getParameter("saleOilDetailIds"));
                }
            }
        } catch (Exception ex) {
        }

        if (formBean == null) {
            formBean = new OilExportFormBean();
        }

        if (arrDetail == null) {
            arrDetail = new ArrayList();
        }
        request.setAttribute(Constants.OIL_EXPORT_OIL, arrDetail);

        try {
            if (formBean.getId() == 0) {
                String prefix = "";
                prefix = DateUtil.today("yyyyMMdd") + "-OE-";
                String number = goodDAO.getNextOilExportNumber(prefix, 4);
                prefix += number;
                formBean.setCode(prefix);
            }

            OilExportDetailBean detailBean = null;
            double total = 0;
            for (int i = 0; i < arrDetail.size(); i++) {
                detailBean = (OilExportDetailBean) arrDetail.get(i);
                total += detailBean.getAmount();
            }
            formBean.setTotal(total);
        } catch (Exception ex) {
        }

        request.setAttribute(Constants.OIL_EXPORT, formBean);

        return true;
    }
}
