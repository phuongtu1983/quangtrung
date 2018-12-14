/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.lovo;

import com.stepup.core.util.DateUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.LoVoBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.EmployeeDAO;
import com.stepup.gasoline.qt.dao.GasDAO;
import com.stepup.gasoline.qt.util.Constants;
import com.stepup.gasoline.qt.util.QTUtil;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.validator.GenericValidator;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class LoVoFormAction extends SpineAction {

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
        LoVoBean bean = null;
        String id = request.getParameter("loVoId");
        ArrayList arrEmployeeDetail = null;
        GasDAO gasDAO = new GasDAO();
        if (!GenericValidator.isBlankOrNull(id)) {
            try {
                int gasImportId = NumberUtil.parseInt(id, 0);
                bean = gasDAO.getLoVo(gasImportId);
                arrEmployeeDetail = gasDAO.getLoVoEmployeeDetail(gasImportId);
            } catch (Exception ex) {
            }
        }
        LoVoFormBean formBean = null;
        if (bean != null) {
            formBean = new LoVoFormBean(bean);
        } else {
            formBean = new LoVoFormBean();
            try {
                String prefix = "";
                if (formBean.getId() == 0) {
                    prefix = DateUtil.today("yyyyMMdd") + "-LV-";
                    String number = gasDAO.getNextLoVoNumber(prefix, 4);
                    prefix += number;
                }
                formBean.setCode(prefix);
            } catch (Exception ex) {
            }
        }

        request.setAttribute(Constants.LO_VO, formBean);

        if (arrEmployeeDetail == null) {
            arrEmployeeDetail = new ArrayList();
        }
        request.setAttribute(Constants.LO_VO_EMPLOYEE, arrEmployeeDetail);

        ArrayList arrEmployee = null;
        try {
            String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
            EmployeeDAO employeeDAO = new EmployeeDAO();
            arrEmployee = employeeDAO.getEmployees(EmployeeBean.STATUS_ACTIVE, organizationIds);
        } catch (Exception ex) {
        }
        if (arrEmployee == null) {
            arrEmployee = new ArrayList();
        }
        request.setAttribute(Constants.EMPLOYEE_LIST, arrEmployee);

        return true;
    }
}
