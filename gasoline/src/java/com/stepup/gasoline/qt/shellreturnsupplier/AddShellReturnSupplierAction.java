/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.shellreturnsupplier;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.ShellReturnSupplierBean;
import com.stepup.gasoline.qt.bean.ShellReturnSupplierDetailBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.GasDAO;
import com.stepup.gasoline.qt.util.QTUtil;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class AddShellReturnSupplierAction extends SpineAction {

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
        ShellReturnSupplierFormBean formBean = (ShellReturnSupplierFormBean) form;
        GasDAO gasDAO = new GasDAO();
        ShellReturnSupplierBean bean = null;
        int shellReturnSupplierId = formBean.getId();
        try {
            bean = gasDAO.getShellReturnSupplier(shellReturnSupplierId);
        } catch (Exception ex) {
        }
        boolean bNew = false;
        if (shellReturnSupplierId == 0) {
            bNew = true;
        } else {
            bNew = false;
        }
        if (bean == null) {
            bean = new ShellReturnSupplierBean();
        }

        bean.setId(formBean.getId());
        bean.setCreatedDate(formBean.getCreatedDate());
        bean.setCode(formBean.getCode());
        bean.setNote(formBean.getNote());
        bean.setVendorId(formBean.getVendorId());
        bean.setVehicleId(formBean.getVehicleId());
        bean.setCreatedEmployeeId(QTUtil.getEmployeeId(request.getSession()));
        try {
            if (bNew) {
                int id = gasDAO.insertShellReturnSupplier(bean);
                formBean.setId(id);
                addShellReturnSupplierShell(formBean);
            } else {
                addShellReturnSupplierShell(formBean);
                gasDAO.updateShellReturnSupplier(bean);
            }
        } catch (Exception ex) {
        }
        return true;
    }

    private void addShellReturnSupplierShell(ShellReturnSupplierFormBean formBean) {
        try {
            GasDAO gasDAO = new GasDAO();
            ArrayList arrDetail = gasDAO.getShellReturnSupplierDetail(formBean.getId());
            if (formBean.getShellId() != null) {
                int length = formBean.getShellId().length;
                int id = 0;
                boolean isUpdate = false;
                for (int i = 0; i < length; i++) {
                    id = NumberUtil.parseInt(formBean.getShellReturnSupplierDetailId()[i], 0);
                    if (id == 0) {
                        ShellReturnSupplierDetailBean bean = new ShellReturnSupplierDetailBean();
                        bean.setShellId(NumberUtil.parseInt(formBean.getShellId()[i], 0));
                        bean.setQuantity(NumberUtil.parseInt(formBean.getQuantity()[i], 0));
                        bean.setShellReturnSupplierId(formBean.getId());
                        gasDAO.insertShellReturnSupplierDetail(bean);
                    } else {
                        isUpdate = false;
                        int j = 0;
                        ShellReturnSupplierDetailBean oldBean = null;
                        for (; j < arrDetail.size(); j++) {
                            oldBean = (ShellReturnSupplierDetailBean) arrDetail.get(j);
                            if (oldBean.getId() == id) {
                                break;
                            }
                        }
                        if (j < arrDetail.size()) {
                            arrDetail.remove(j);
                            if (oldBean.getQuantity() != NumberUtil.parseDouble(formBean.getQuantity()[i], 0)) {
                                isUpdate = true;
                                oldBean.setQuantity(NumberUtil.parseInt(formBean.getQuantity()[i], 0));
                            }
                            if (isUpdate) {
                                gasDAO.updateShellReturnSupplierDetail(oldBean, formBean.getCreatedDate(), formBean.getVendorId());
                            }
                        }
                    }
                }
            }
            String ids = "0,";
            ShellReturnSupplierDetailBean oldBean = null;
            for (int i = 0; i < arrDetail.size(); i++) {
                oldBean = (ShellReturnSupplierDetailBean) arrDetail.get(i);
                ids += oldBean.getId() + ",";
            }
            ids += "0";
            gasDAO.deleteShellReturnSupplierDetails(ids);
        } catch (Exception ex) {
        }
    }
}
