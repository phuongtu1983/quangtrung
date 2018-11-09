/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.lovo;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.LoVoBean;
import com.stepup.gasoline.qt.bean.LoVoEmployeeDetailBean;
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
public class AddLoVoAction extends SpineAction {

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
        LoVoFormBean formBean = (LoVoFormBean) form;
        GasDAO gasDAO = new GasDAO();
        LoVoBean bean = null;
        int loVoId = formBean.getId();
        try {
            bean = gasDAO.getLoVo(loVoId);
        } catch (Exception ex) {
        }
        boolean bNew = false;
        if (loVoId == 0) {
            bNew = true;
        } else {
            bNew = false;
        }
        if (bean == null) {
            bean = new LoVoBean();
        }

        bean.setId(formBean.getId());
        bean.setCode(formBean.getCode());
        bean.setNote(formBean.getNote());
        bean.setCreatedDate(formBean.getCreatedDate());
        bean.setQuantity(formBean.getQuantity());
        bean.setCreatedEmployeeId(QTUtil.getEmployeeId(request.getSession()));
        try {
            if (bNew) {
                int id = gasDAO.insertLoVo(bean);
                formBean.setId(id);
            } else {
                gasDAO.updateLoVo(bean);
            }
            addLoVoEmployee(formBean);
        } catch (Exception ex) {
        }
        return true;
    }

    private void addLoVoEmployee(LoVoFormBean formBean) {
        try {
            GasDAO gasDAO = new GasDAO();
            ArrayList arrDetail = gasDAO.getLoVoEmployeeDetail(formBean.getId());
            if (formBean.getEmployeeId() != null) {
                int length = formBean.getEmployeeId().length;
                int id = 0;
                boolean isUpdate = false;
                for (int i = 0; i < length; i++) {
                    id = NumberUtil.parseInt(formBean.getLoVoEmployeeDetailId()[i], 0);
                    if (id == 0) {
                        LoVoEmployeeDetailBean bean = new LoVoEmployeeDetailBean();
                        bean.setEmployeeId(NumberUtil.parseInt(formBean.getEmployeeId()[i], 0));
                        bean.setNote(formBean.getEmployeeNote()[i] + "");
                        bean.setLoVoId(formBean.getId());
                        gasDAO.insertLoVoEmployeeDetail(bean);
                    } else {
                        isUpdate = false;
                        int j = 0;
                        LoVoEmployeeDetailBean oldBean = null;
                        for (; j < arrDetail.size(); j++) {
                            oldBean = (LoVoEmployeeDetailBean) arrDetail.get(j);
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
                                gasDAO.updateLoVoEmployeeDetail(oldBean);
                            }
                        }
                    }
                }
            }
            String ids = "0,";
            LoVoEmployeeDetailBean oldBean = null;
            for (int i = 0; i < arrDetail.size(); i++) {
                oldBean = (LoVoEmployeeDetailBean) arrDetail.get(i);
                ids += oldBean.getId() + ",";
            }
            ids += "0";
            gasDAO.deleteLoVoEmployeeDetails(ids);
        } catch (Exception ex) {
        }
    }

}
