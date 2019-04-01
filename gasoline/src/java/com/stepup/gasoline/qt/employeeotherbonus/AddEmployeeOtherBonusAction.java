/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.employeeotherbonus;

import com.stepup.gasoline.qt.bean.EmployeeOtherBonusBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.EmployeeDAO;
import com.stepup.gasoline.qt.util.QTUtil;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class AddEmployeeOtherBonusAction extends SpineAction {

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
        EmployeeOtherBonusFormBean formBean = (EmployeeOtherBonusFormBean) form;
        EmployeeDAO employeeDAO = new EmployeeDAO();

        boolean bNew = true;
        if (formBean.getId() != 0) {
            bNew = false;
        }
        EmployeeOtherBonusBean bean = new EmployeeOtherBonusBean();
        bean.setId(formBean.getId());
        bean.setCreatedDate(formBean.getCreatedDate());
        bean.setOtherBonusId(formBean.getOtherBonusId());
        bean.setEmployeeId(formBean.getEmployeeId());
        bean.setAmount(formBean.getAmount());
        bean.setCode(formBean.getCode());
        bean.setNote(formBean.getNote());
        bean.setCreatedEmployeeId(QTUtil.getEmployeeId(request.getSession()));
        try {
            if (bNew) {
                employeeDAO.insertEmployeeOtherBonus(bean);
            } else {
                employeeDAO.updateEmployeeOtherBonus(bean);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}
