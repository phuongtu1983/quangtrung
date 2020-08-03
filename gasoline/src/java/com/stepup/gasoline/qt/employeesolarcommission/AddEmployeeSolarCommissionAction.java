/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.employeesolarcommission;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.EmployeeSolarCommissionBean;
import com.stepup.gasoline.qt.bean.EmployeeSolarCommissionDetailBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.EmployeeDAO;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

/**
 *
 * @author phuongtu
 */
public class AddEmployeeSolarCommissionAction extends SpineAction {

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
        EmployeeSolarCommissionFormBean formBean = (EmployeeSolarCommissionFormBean) form;
        EmployeeDAO employeeDAO = new EmployeeDAO();
        EmployeeSolarCommissionBean bean = null;
        boolean bNew = false;
        boolean isExist = false;
        try {
            bean = employeeDAO.getEmployeeSolarCommissionByName(formBean.getName());
        } catch (Exception ex) {
        }
        int employeeSolarCommissionId = formBean.getId();
        if (employeeSolarCommissionId == 0) {
            bNew = true;
            if (bean != null) {
                isExist = true;
            }
        } else {
            bNew = false;
            if (bean != null && bean.getId() != employeeSolarCommissionId) {
                isExist = true;
            }
            try {
                if (bean == null) {
                    bean = employeeDAO.getEmployeeSolarCommission(employeeSolarCommissionId);
                }
            } catch (Exception ex) {
            }
        }
        if (isExist) {
            ActionMessages errors = new ActionMessages();
            errors.add("employeeSolarCommissionExisted", new ActionMessage("employeeSolarCommission.save.error"));
            saveErrors(request, errors);
            return false;
        }

        bean = new EmployeeSolarCommissionBean();
        bean.setId(formBean.getId());
        bean.setName(formBean.getName());
        bean.setCode(formBean.getCode());
        bean.setNote(formBean.getNote());
        try {
            if (bNew) {
                int id = employeeDAO.insertEmployeeSolarCommission(bean);
                formBean.setId(id);
                addDiscountCommission(formBean);
            } else {
                addDiscountCommission(formBean);
                employeeDAO.updateEmployeeSolarCommission(bean);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }

    private void addDiscountCommission(EmployeeSolarCommissionFormBean formBean) {
        try {
            EmployeeDAO employeeDAO = new EmployeeDAO();
            ArrayList arrDetail = employeeDAO.getEmployeeSolarCommissionDetail(formBean.getId());
            if (formBean.getEmployeeSolarCommissionCommissionCommission()!= null) {
                int length = formBean.getEmployeeSolarCommissionCommissionCommission().length;
                int id = 0;
                boolean isUpdate = false;
                for (int i = 0; i < length; i++) {
                    id = NumberUtil.parseInt(formBean.getEmployeeSolarCommissionCommissionDetailId()[i], 0);
                    if (id == 0) {
                        EmployeeSolarCommissionDetailBean bean = new EmployeeSolarCommissionDetailBean();
                        bean.setFrom(NumberUtil.parseDouble(formBean.getEmployeeSolarCommissionCommissionFrom()[i], 0));
                        bean.setTo(NumberUtil.parseDouble(formBean.getEmployeeSolarCommissionCommissionTo()[i], 0));
                        bean.setCommission(NumberUtil.parseDouble(formBean.getEmployeeSolarCommissionCommissionCommission()[i], 0));
                        bean.setEmployeeSolarComissionId(formBean.getId());
                        employeeDAO.insertEmployeeSolarCommissionDetail(bean);
                    } else {
                        isUpdate = false;
                        int j = 0;
                        EmployeeSolarCommissionDetailBean oldBean = null;
                        for (; j < arrDetail.size(); j++) {
                            oldBean = (EmployeeSolarCommissionDetailBean) arrDetail.get(j);
                            if (oldBean.getId() == id) {
                                break;
                            }
                        }
                        if (j < arrDetail.size()) {
                            arrDetail.remove(j);
                            if (oldBean.getFrom() != NumberUtil.parseDouble(formBean.getEmployeeSolarCommissionCommissionFrom()[i], 0)) {
                                isUpdate = true;
                                oldBean.setFrom(NumberUtil.parseDouble(formBean.getEmployeeSolarCommissionCommissionFrom()[i], 0));
                            }
                            if (oldBean.getTo() != NumberUtil.parseDouble(formBean.getEmployeeSolarCommissionCommissionTo()[i], 0)) {
                                isUpdate = true;
                                oldBean.setTo(NumberUtil.parseDouble(formBean.getEmployeeSolarCommissionCommissionTo()[i], 0));
                            }
                            if (oldBean.getCommission() != NumberUtil.parseDouble(formBean.getEmployeeSolarCommissionCommissionCommission()[i], 0)) {
                                isUpdate = true;
                                oldBean.setCommission(NumberUtil.parseDouble(formBean.getEmployeeSolarCommissionCommissionCommission()[i], 0));
                            }
                            if (isUpdate) {
                                employeeDAO.updateEmployeeSolarCommissionDetail(oldBean);
                            }
                        }
                    }
                }
            }
            String ids = "0,";
            EmployeeSolarCommissionDetailBean oldBean = null;
            for (int i = 0; i < arrDetail.size(); i++) {
                oldBean = (EmployeeSolarCommissionDetailBean) arrDetail.get(i);
                ids += oldBean.getId() + ",";
            }
            ids += "0";
            employeeDAO.deleteEmployeeSolarCommissionDetails(ids);
        } catch (Exception ex) {
        }
    }
}
