/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.vehicleout;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.VehicleOutBean;
import com.stepup.gasoline.qt.bean.VehicleOutDetailBean;
import com.stepup.gasoline.qt.bean.VehicleOutEmployeeDetailBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.GasDAO;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class AddVehicleOutAction extends SpineAction {

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
        VehicleOutFormBean formBean = (VehicleOutFormBean) form;
        GasDAO gasDAO = new GasDAO();
        VehicleOutBean bean = null;
        int vehicleOutId = formBean.getId();
        try {
            bean = gasDAO.getVehicleOut(vehicleOutId);
        } catch (Exception ex) {
        }
        boolean bNew = false;
        if (vehicleOutId == 0) {
            bNew = true;
        } else {
            bNew = false;
        }
        if (bean == null) {
            bean = new VehicleOutBean();
        }

        bean.setId(formBean.getId());
        bean.setCode(formBean.getCode());
        bean.setNote(formBean.getNote());
        bean.setCreatedDate(formBean.getCreatedDate());
        bean.setVehicleId(formBean.getVehicleId());
        try {
            if (bNew) {
                int id = gasDAO.insertVehicleOut(bean);
                formBean.setId(id);
            } else {
                gasDAO.updateVehicleOut(bean);
            }
            addVehicleOutDetail(formBean);
            addVehicleOutEmployee(formBean);
        } catch (Exception ex) {
        }
        return true;
    }

    private void addVehicleOutDetail(VehicleOutFormBean formBean) {
        try {
            GasDAO gasDAO = new GasDAO();
            ArrayList arrDetail = gasDAO.getVehicleOutDetail(formBean.getId());
            int length = formBean.getShellId().length;
            int id = 0;
            boolean isUpdate = false;
            for (int i = 0; i < length; i++) {
                id = NumberUtil.parseInt(formBean.getVehicleOutDetailId()[i], 0);
                if (id == 0) {
                    VehicleOutDetailBean bean = new VehicleOutDetailBean();
                    bean.setShellId(NumberUtil.parseInt(formBean.getShellId()[i], 0));
                    bean.setQuantity(NumberUtil.parseInt(formBean.getQuantity()[i], 0));
                    bean.setPrice(NumberUtil.parseDouble(formBean.getPrice()[i], 0));
                    bean.setAmount(NumberUtil.parseDouble(formBean.getAmount()[i], 0));
                    bean.setVehicleOutId(formBean.getId());
                    gasDAO.insertVehicleOutDetail(bean);
                } else {
                    isUpdate = false;
                    int j = 0;
                    VehicleOutDetailBean oldBean = null;
                    for (; j < arrDetail.size(); j++) {
                        oldBean = (VehicleOutDetailBean) arrDetail.get(j);
                        if (oldBean.getId() == id) {
                            break;
                        }
                    }
                    if (j < arrDetail.size()) {
                        arrDetail.remove(j);
                        if (oldBean.getQuantity() != NumberUtil.parseInt(formBean.getQuantity()[i], 0)) {
                            isUpdate = true;
                            oldBean.setQuantity(NumberUtil.parseInt(formBean.getQuantity()[i], 0));
                        }
                        if (oldBean.getPrice() != NumberUtil.parseDouble(formBean.getPrice()[i], 0)) {
                            isUpdate = true;
                            oldBean.setPrice(NumberUtil.parseDouble(formBean.getPrice()[i], 0));
                        }
                        if (oldBean.getAmount() != NumberUtil.parseDouble(formBean.getAmount()[i], 0)) {
                            isUpdate = true;
                            oldBean.setAmount(NumberUtil.parseDouble(formBean.getAmount()[i], 0));
                        }
                        if (isUpdate) {
                            gasDAO.updateVehicleOutDetail(oldBean);
                        }
                    }
                }
            }
        } catch (Exception ex) {
        }
    }

    private void addVehicleOutEmployee(VehicleOutFormBean formBean) {
        try {
            GasDAO gasDAO = new GasDAO();
            ArrayList arrDetail = gasDAO.getVehicleOutEmployeeDetail(formBean.getId());
            int length = formBean.getEmployeeId().length;
            int id = 0;
            boolean isUpdate = false;
            for (int i = 0; i < length; i++) {
                id = NumberUtil.parseInt(formBean.getVehicleOutEmployeeDetailId()[i], 0);
                if (id == 0) {
                    VehicleOutEmployeeDetailBean bean = new VehicleOutEmployeeDetailBean();
                    bean.setEmployeeId(NumberUtil.parseInt(formBean.getEmployeeId()[i], 0));
                    bean.setNote(formBean.getEmployeeNote()[i] + "");
                    bean.setVehicleOutId(formBean.getId());
                    gasDAO.insertVehicleOutEmployeeDetail(bean);
                } else {
                    isUpdate = false;
                    int j = 0;
                    VehicleOutEmployeeDetailBean oldBean = null;
                    for (; j < arrDetail.size(); j++) {
                        oldBean = (VehicleOutEmployeeDetailBean) arrDetail.get(j);
                        if (oldBean.getId() == id) {
                            break;
                        }
                    }
                    if (j < arrDetail.size()) {
                        arrDetail.remove(j);
                        if (!oldBean.getNote().equals(formBean.getEmployeeNote()[i] + "")) {
                            isUpdate = true;
                            oldBean.setNote(formBean.getEmployeeNote()[i] + "");
                        }
                        if (oldBean.getEmployeeId() != NumberUtil.parseInt(formBean.getEmployeeId()[i], 0)) {
                            isUpdate = true;
                            oldBean.setEmployeeId(NumberUtil.parseInt(formBean.getEmployeeId()[i], 0));
                        }
                        if (isUpdate) {
                            gasDAO.updateVehicleOutEmployeeDetail(oldBean);
                        }
                    }
                }
            }
        } catch (Exception ex) {
        }
    }

}
