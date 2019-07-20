/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.vendor.oil;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.VendorBean;
import com.stepup.gasoline.qt.bean.VendorOilStoreDetailBean;
import com.stepup.gasoline.qt.core.AddDynamicFieldValueAction;
import com.stepup.gasoline.qt.dao.VendorDAO;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class AddVendorAction extends AddDynamicFieldValueAction {

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
    public boolean doMainAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        VendorOilFormBean formBean = (VendorOilFormBean) form;
        VendorDAO vendorDAO = new VendorDAO();
        VendorBean bean = new VendorBean();
        bean.setId(formBean.getId());
        bean.setCommissionOnImport(formBean.getCommissionOnImport());
        bean.setMaxDebt(formBean.getMaxDebt());
        try {
            addVendorOilStore(formBean);
            vendorDAO.updateVendorOil(bean);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }

    private void addVendorOilStore(VendorOilFormBean formBean) {
        try {
            VendorDAO vendorDAO = new VendorDAO();
            ArrayList arrDetail = vendorDAO.getVendorOilStoreDetail(formBean.getId());
            if (formBean.getStoreId() != null) {
                int length = formBean.getStoreId().length;
                int id = 0;
                for (int i = 0; i < length; i++) {
                    id = NumberUtil.parseInt(formBean.getVendorOilStoreDetailId()[i], 0);
                    if (id == 0) {
                        VendorOilStoreDetailBean bean = new VendorOilStoreDetailBean();
                        bean.setStoreId(NumberUtil.parseInt(formBean.getStoreId()[i], 0));
                        bean.setVendorId(formBean.getId());
                        vendorDAO.insertVendorOiStoreDetail(bean);
                    } else {
                        int j = 0;
                        VendorOilStoreDetailBean oldBean = null;
                        for (; j < arrDetail.size(); j++) {
                            oldBean = (VendorOilStoreDetailBean) arrDetail.get(j);
                            if (oldBean.getId() == id) {
                                break;
                            }
                        }
                        if (j < arrDetail.size()) {
                            arrDetail.remove(j);
                        }
                    }
                }
            }
            String ids = "0,";
            VendorOilStoreDetailBean oldBean = null;
            for (int i = 0; i < arrDetail.size(); i++) {
                oldBean = (VendorOilStoreDetailBean) arrDetail.get(i);
                ids += oldBean.getId() + ",";
            }
            ids += "0";
            vendorDAO.deleteVendorOilStoreDetails(ids);
        } catch (Exception ex) {
        }
    }
}
