/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.vehiclein;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.VehicleInAccessoryDetailBean;
import com.stepup.gasoline.qt.bean.VehicleInBean;
import com.stepup.gasoline.qt.bean.VehicleInDetailBean;
import com.stepup.gasoline.qt.bean.VehicleInReturnShellDetailBean;
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
public class AddVehicleInAction extends SpineAction {

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
        VehicleInFormBean formBean = (VehicleInFormBean) form;
        GasDAO gasDAO = new GasDAO();
        VehicleInBean bean = null;
        int vehicleInId = formBean.getId();
        try {
            bean = gasDAO.getVehicleIn(vehicleInId);
        } catch (Exception ex) {
        }
        boolean bNew = false;
        if (vehicleInId == 0) {
            bNew = true;
        } else {
            bNew = false;
        }
        if (bean == null) {
            bean = new VehicleInBean();
        }

        bean.setId(formBean.getId());
        bean.setCode(formBean.getCode());
        bean.setNote(formBean.getNote());
        bean.setCreatedDate(formBean.getCreatedDate());
        bean.setVehicleOutId(formBean.getVehicleOutId());
        bean.setCreatedEmployeeId(QTUtil.getEmployeeId(request.getSession()));
        try {
            if (bNew) {
                int id = gasDAO.insertVehicleIn(bean);
                formBean.setId(id);
                addVehicleInDetail(formBean);
                addVehicleInAccessoryDetail(formBean);
                addVehicleInReturnShell(formBean);
            } else {
                addVehicleInDetail(formBean);
                addVehicleInAccessoryDetail(formBean);
                addVehicleInReturnShell(formBean);
                gasDAO.updateVehicleIn(bean);
            }
        } catch (Exception ex) {
        }
        return true;
    }

    private void addVehicleInDetail(VehicleInFormBean formBean) {
        try {
            GasDAO gasDAO = new GasDAO();
            ArrayList arrDetail = gasDAO.getVehicleInDetail(formBean.getId());
            if (formBean.getShellId() != null) {
                int length = formBean.getShellId().length;
                int id = 0;
                boolean isUpdate = false;
                for (int i = 0; i < length; i++) {
                    id = NumberUtil.parseInt(formBean.getVehicleInDetailId()[i], 0);
                    if (id == 0) {
                        VehicleInDetailBean bean = new VehicleInDetailBean();
                        bean.setShellId(NumberUtil.parseInt(formBean.getShellId()[i], 0));
                        bean.setQuantity(NumberUtil.parseInt(formBean.getQuantity()[i], 0));
                        bean.setPrice(NumberUtil.parseDouble(formBean.getPrice()[i], 0));
                        bean.setAmount(NumberUtil.parseDouble(formBean.getAmount()[i], 0));
                        bean.setVehicleInId(formBean.getId());
                        gasDAO.insertVehicleInDetail(bean);
                    } else {
                        isUpdate = false;
                        int j = 0;
                        VehicleInDetailBean oldBean = null;
                        for (; j < arrDetail.size(); j++) {
                            oldBean = (VehicleInDetailBean) arrDetail.get(j);
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
                                gasDAO.updateVehicleInDetail(oldBean, formBean.getCreatedDate());
                            }
                        }
                    }
                }
            }
            String ids = "0,";
            VehicleInDetailBean oldBean = null;
            for (int i = 0; i < arrDetail.size(); i++) {
                oldBean = (VehicleInDetailBean) arrDetail.get(i);
                ids += oldBean.getId() + ",";
            }
            ids += "0";
            gasDAO.deleteVehicleInDetails(ids);
        } catch (Exception ex) {
        }
    }

    private void addVehicleInAccessoryDetail(VehicleInFormBean formBean) {
        try {
            GasDAO gasDAO = new GasDAO();
            ArrayList arrDetail = gasDAO.getVehicleInAccessoryDetail(formBean.getId());
            if (formBean.getAccessoryId() != null) {
                int length = formBean.getAccessoryId().length;
                int id = 0;
                boolean isUpdate = false;
                for (int i = 0; i < length; i++) {
                    id = NumberUtil.parseInt(formBean.getVehicleInAccessoryDetailId()[i], 0);
                    if (id == 0) {
                        VehicleInAccessoryDetailBean bean = new VehicleInAccessoryDetailBean();
                        bean.setAccessoryId(NumberUtil.parseInt(formBean.getAccessoryId()[i], 0));
                        bean.setQuantity(NumberUtil.parseInt(formBean.getAccessoryQuantity()[i], 0));
                        bean.setPrice(NumberUtil.parseDouble(formBean.getAccessoryPrice()[i], 0));
                        bean.setAmount(NumberUtil.parseDouble(formBean.getAccessoryAmount()[i], 0));
                        bean.setVehicleInId(formBean.getId());
                        gasDAO.insertVehicleInAccessoryDetail(bean);
                    } else {
                        isUpdate = false;
                        int j = 0;
                        VehicleInAccessoryDetailBean oldBean = null;
                        for (; j < arrDetail.size(); j++) {
                            oldBean = (VehicleInAccessoryDetailBean) arrDetail.get(j);
                            if (oldBean.getId() == id) {
                                break;
                            }
                        }
                        if (j < arrDetail.size()) {
                            arrDetail.remove(j);
                            if (oldBean.getQuantity() != NumberUtil.parseInt(formBean.getAccessoryQuantity()[i], 0)) {
                                isUpdate = true;
                                oldBean.setQuantity(NumberUtil.parseInt(formBean.getAccessoryQuantity()[i], 0));
                            }
                            if (oldBean.getPrice() != NumberUtil.parseDouble(formBean.getAccessoryPrice()[i], 0)) {
                                isUpdate = true;
                                oldBean.setPrice(NumberUtil.parseDouble(formBean.getAccessoryPrice()[i], 0));
                            }
                            if (oldBean.getAmount() != NumberUtil.parseDouble(formBean.getAccessoryAmount()[i], 0)) {
                                isUpdate = true;
                                oldBean.setAmount(NumberUtil.parseDouble(formBean.getAccessoryAmount()[i], 0));
                            }
                            if (isUpdate) {
                                gasDAO.updateVehicleInAccessoryDetail(oldBean, formBean.getCreatedDate());
                            }
                        }
                    }
                }
            }
            String ids = "0,";
            VehicleInAccessoryDetailBean oldBean = null;
            for (int i = 0; i < arrDetail.size(); i++) {
                oldBean = (VehicleInAccessoryDetailBean) arrDetail.get(i);
                ids += oldBean.getId() + ",";
            }
            ids += "0";
            gasDAO.deleteVehicleInAccessoryDetails(ids);
        } catch (Exception ex) {
        }
    }

    private void addVehicleInReturnShell(VehicleInFormBean formBean) {
        try {
            GasDAO gasDAO = new GasDAO();
            ArrayList arrDetail = gasDAO.getVehicleInReturnShellDetail(formBean.getId());
            if (formBean.getReturnShellId() != null) {
                int length = formBean.getReturnShellId().length;
                int id = 0;
                boolean isUpdate = false;
                for (int i = 0; i < length; i++) {
                    id = NumberUtil.parseInt(formBean.getVehicleInReturnShellDetailId()[i], 0);
                    if (id == 0) {
                        VehicleInReturnShellDetailBean bean = new VehicleInReturnShellDetailBean();
                        bean.setShellId(NumberUtil.parseInt(formBean.getReturnShellId()[i], 0));
                        bean.setQuantity(NumberUtil.parseInt(formBean.getReturnShellQuantity()[i], 0));
                        bean.setVehicleInId(formBean.getId());
                        gasDAO.insertVehicleInReturnShellDetail(bean);
                    } else {
                        isUpdate = false;
                        int j = 0;
                        VehicleInReturnShellDetailBean oldBean = null;
                        for (; j < arrDetail.size(); j++) {
                            oldBean = (VehicleInReturnShellDetailBean) arrDetail.get(j);
                            if (oldBean.getId() == id) {
                                break;
                            }
                        }
                        if (j < arrDetail.size()) {
                            arrDetail.remove(j);
                            if (oldBean.getShellId() != NumberUtil.parseInt(formBean.getReturnShellId()[i], 0)) {
                                isUpdate = true;
                                oldBean.setShellId(NumberUtil.parseInt(formBean.getReturnShellId()[i], 0));
                            }
                            if (oldBean.getQuantity() != NumberUtil.parseInt(formBean.getReturnShellQuantity()[i], 0)) {
                                isUpdate = true;
                                oldBean.setQuantity(NumberUtil.parseInt(formBean.getReturnShellQuantity()[i], 0));
                            }
                            if (isUpdate) {
                                gasDAO.updateVehicleInReturnShellDetail(oldBean, formBean.getCreatedDate());
                            }
                        }
                    }
                }
            }
            String ids = "0,";
            VehicleInReturnShellDetailBean oldBean = null;
            for (int i = 0; i < arrDetail.size(); i++) {
                oldBean = (VehicleInReturnShellDetailBean) arrDetail.get(i);
                ids += oldBean.getId() + ",";
            }
            ids += "0";
            gasDAO.deleteVehicleInReturnShellDetails(ids);
        } catch (Exception ex) {
        }
    }

}
