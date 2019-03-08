/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.lpgsale;

import com.stepup.core.util.DateUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.core.util.StringUtil;
import com.stepup.gasoline.qt.bean.LpgImportBean;
import com.stepup.gasoline.qt.bean.LpgSaleBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.GasDAO;
import com.stepup.gasoline.qt.dao.VendorDAO;
import com.stepup.gasoline.qt.util.QTUtil;
import com.stepup.gasoline.qt.vendor.VendorFormBean;
import com.stepup.gasoline.qt.vendorcustomer.VendorCustomerFormBean;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class CreateLpgImportAutoAction extends SpineAction {

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
        String lpgSaleId = request.getParameter("lpgSaleId");
        try {
            if (!StringUtil.isBlankOrNull(lpgSaleId)) {
                GasDAO gasDAO = new GasDAO();
                LpgSaleBean saleBean = gasDAO.getLpgSale(NumberUtil.parseInt(lpgSaleId, 0));
                if (saleBean != null) {
                    VendorDAO vendorDAO = new VendorDAO();
                    VendorCustomerFormBean vendorCustomerFormBean = vendorDAO.getVendorCustomerByCustomer(saleBean.getCustomerId());
                    if (vendorCustomerFormBean != null) {
                        VendorFormBean vendorFormBean = vendorDAO.getVendor(vendorCustomerFormBean.getVendorId());
                        if (vendorFormBean != null && vendorFormBean.getEqualOrganizationId() != -1) {
                            LpgImportBean importBean = new LpgImportBean();
                            String prefix = "";
                            prefix = DateUtil.today("yyyyMMdd") + "-LI-";
                            String number = gasDAO.getNextLpgImportNumber(prefix, 4);
                            prefix += number;
                            importBean.setCode(prefix);

                            importBean.setImportDate(saleBean.getSaleDate());
                            importBean.setVendorId(vendorFormBean.getId());
                            int kind = NumberUtil.parseInt(request.getParameter("kind"), 0);
                            switch (kind) {
                                case LpgSaleBean.KIND_RETURN:
                                    importBean.setKind(LpgImportBean.KIND_BACK);
                                    break;
                                case LpgSaleBean.KIND_LEND:
                                    importBean.setKind(LpgImportBean.KIND_BORROW);
                                    break;
                            }

                            importBean.setPaperQuantity(saleBean.getQuantity());
                            importBean.setActualQuantity(saleBean.getQuantity());
                            importBean.setPrice(saleBean.getPrice());
                            importBean.setVat(saleBean.getVat());
                            importBean.setInvoiceTotal(saleBean.getTotal());
                            importBean.setTotal(saleBean.getTotal());
                            importBean.setPaid(saleBean.getPaid());
                            importBean.setDebt(saleBean.getDebt());
                            importBean.setRate(saleBean.getRate());
                            importBean.setNote(saleBean.getCode());
                            importBean.setCreatedEmployeeId(QTUtil.getEmployeeId(request.getSession()));

                            gasDAO.insertLpgImport(importBean);
                        }
                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}
