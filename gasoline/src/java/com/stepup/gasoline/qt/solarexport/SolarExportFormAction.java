/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.solarexport;

import com.stepup.core.util.DateUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.SolarExportBean;
import com.stepup.gasoline.qt.bean.SolarExportDetailBean;
import com.stepup.gasoline.qt.bean.SaleSolarBean;
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
public class SolarExportFormAction extends SpineAction {

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
        SolarExportFormBean formBean = null;
        int solarExportId = NumberUtil.parseInt(request.getParameter("solarExportId"), 0);
        int solarSaleId = NumberUtil.parseInt(request.getParameter("solarSaleId"), 0);
        ArrayList arrDetail = null;
        GoodDAO goodDAO = new GoodDAO();
        try {
            if (solarExportId != 0) {
                SolarExportBean bean = goodDAO.getSolarExport(solarExportId);
                arrDetail = goodDAO.getSolarExportDetail(solarExportId);
                if (bean != null) {
                    formBean = new SolarExportFormBean(bean);
                    if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT_PAST, PermissionUtil.PER_SOLAR_EXPORT)) {
                        formBean.setCanEdit(1);
                    }
                }
            } else if (solarSaleId != 0) {
                SaleSolarBean saleSolarBean = goodDAO.getSaleSolar(solarSaleId);
                if (saleSolarBean != null) {
                    formBean = new SolarExportFormBean(saleSolarBean);
                    CustomerDAO customerDAO = new CustomerDAO();
                    CustomerFormBean customerBean = customerDAO.getCustomer(formBean.getCustomerId());
                    if (customerBean != null) {
                        formBean.setCustomerName(customerBean.getName());
                    }
                    arrDetail = goodDAO.getSolarExportDetailBySaleSolarId(request.getParameter("saleSolarDetailIds"));
                }
            }
        } catch (Exception ex) {
        }

        if (formBean == null) {
            formBean = new SolarExportFormBean();
        }

        if (arrDetail == null) {
            arrDetail = new ArrayList();
        }
        request.setAttribute(Constants.SOLAR_EXPORT_SOLAR, arrDetail);

        try {
            if (formBean.getId() == 0) {
                String prefix = "";
                prefix = DateUtil.today("yyyyMMdd") + "-OE-";
                String number = goodDAO.getNextSolarExportNumber(prefix, 4);
                prefix += number;
                formBean.setCode(prefix);
            }

            SolarExportDetailBean detailBean = null;
            double total = 0;
            for (int i = 0; i < arrDetail.size(); i++) {
                detailBean = (SolarExportDetailBean) arrDetail.get(i);
                total += detailBean.getAmount();
            }
            formBean.setTotal(total);
        } catch (Exception ex) {
        }

        request.setAttribute(Constants.SOLAR_EXPORT, formBean);

        return true;
    }
}
