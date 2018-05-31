/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.fraction;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.FractionBean;
import com.stepup.gasoline.qt.bean.FractionDetailBean;
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
public class AddFractionAction extends SpineAction {

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
        FractionFormBean formBean = (FractionFormBean) form;
        GasDAO gasDAO = new GasDAO();
        FractionBean bean = null;
        int fractionId = formBean.getId();
        try {
            bean = gasDAO.getFraction(fractionId);
        } catch (Exception ex) {
        }
        boolean bNew = false;
        if (fractionId == 0) {
            bNew = true;
        } else {
            bNew = false;
        }
        if (bean == null) {
            bean = new FractionBean();
        }

        bean.setId(formBean.getId());
        bean.setCode(formBean.getCode());
        bean.setNote(formBean.getNote());
        bean.setCreatedDate(formBean.getCreatedDate());
        try {
            if (bNew) {
                int id = gasDAO.insertFraction(bean);
                formBean.setId(id);
            } else {
                gasDAO.updateFraction(bean);
            }
            addFractionShell(formBean);
        } catch (Exception ex) {
        }
        return true;
    }

    private void addFractionShell(FractionFormBean formBean) {
        try {
            GasDAO gasDAO = new GasDAO();
            ArrayList arrDetail = gasDAO.getFractionDetail(formBean.getId());
            int length = formBean.getShellId().length;
            int id = 0;
            boolean isUpdate = false;
            for (int i = 0; i < length; i++) {
                id = NumberUtil.parseInt(formBean.getFractionDetailId()[i], 0);
                if (id == 0) {
                    FractionDetailBean bean = new FractionDetailBean();
                    bean.setShellId(NumberUtil.parseInt(formBean.getShellId()[i], 0));
                    bean.setQuantity(NumberUtil.parseFloat(formBean.getQuantity()[i], 0));
                    bean.setFractionId(formBean.getId());
                    gasDAO.insertFractionDetail(bean);
                } else {
                    isUpdate = false;
                    int j = 0;
                    FractionDetailBean oldBean = null;
                    for (; j < arrDetail.size(); j++) {
                        oldBean = (FractionDetailBean) arrDetail.get(j);
                        if (oldBean.getId() == id) {
                            break;
                        }
                    }
                    if (j < arrDetail.size()) {
                        arrDetail.remove(j);
                        if (oldBean.getQuantity() != NumberUtil.parseDouble(formBean.getQuantity()[i], 0)) {
                            isUpdate = true;
                            oldBean.setQuantity(NumberUtil.parseFloat(formBean.getQuantity()[i], 0));
                        }
                        if (isUpdate) {
                            gasDAO.updateFractionDetail(oldBean);
                        }
                    }
                }
            }
        } catch (Exception ex) {
        }
    }
}