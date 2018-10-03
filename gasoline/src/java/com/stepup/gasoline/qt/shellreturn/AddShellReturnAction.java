/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.shellreturn;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.ShellReturnBean;
import com.stepup.gasoline.qt.bean.ShellReturnDetailBean;
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
public class AddShellReturnAction extends SpineAction {

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
        ShellReturnFormBean formBean = (ShellReturnFormBean) form;
        GasDAO gasDAO = new GasDAO();
        ShellReturnBean bean = null;
        int shellReturnId = formBean.getId();
        try {
            bean = gasDAO.getShellReturn(shellReturnId);
        } catch (Exception ex) {
        }
        boolean bNew = false;
        if (shellReturnId == 0) {
            bNew = true;
        } else {
            bNew = false;
        }
        if (bean == null) {
            bean = new ShellReturnBean();
        }

        bean.setId(formBean.getId());
        bean.setCode(formBean.getCode());
        bean.setNote(formBean.getNote());
        bean.setCreatedDate(formBean.getCreatedDate());
        bean.setCustomerId(formBean.getCustomerId());
        bean.setVehicleId(formBean.getVehicleId());
        try {
            if (bNew) {
                int id = gasDAO.insertShellReturn(bean);
                formBean.setId(id);
            } else {
                gasDAO.updateShellReturn(bean);
            }
            addShellReturnShell(formBean);
        } catch (Exception ex) {
        }
        return true;
    }

    private void addShellReturnShell(ShellReturnFormBean formBean) {
        try {
            GasDAO gasDAO = new GasDAO();
            ArrayList arrDetail = gasDAO.getShellReturnDetail(formBean.getId());
            int length = formBean.getShellId().length;
            int id = 0;
            boolean isUpdate = false;
            for (int i = 0; i < length; i++) {
                id = NumberUtil.parseInt(formBean.getShellReturnDetailId()[i], 0);
                if (id == 0) {
                    ShellReturnDetailBean bean = new ShellReturnDetailBean();
                    bean.setShellId(NumberUtil.parseInt(formBean.getShellId()[i], 0));
                    bean.setQuantity(NumberUtil.parseInt(formBean.getQuantity()[i], 0));
                    bean.setShellReturnId(formBean.getId());
                    gasDAO.insertShellReturnDetail(bean);
                } else {
                    isUpdate = false;
                    int j = 0;
                    ShellReturnDetailBean oldBean = null;
                    for (; j < arrDetail.size(); j++) {
                        oldBean = (ShellReturnDetailBean) arrDetail.get(j);
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
                            gasDAO.updateShellReturnDetail(oldBean);
                        }
                    }
                }
            }
        } catch (Exception ex) {
        }
    }
}
