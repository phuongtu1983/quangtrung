/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.otherbonus;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.OrganizationDAO;
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
public class OtherBonusFormAction extends SpineAction {

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
        OtherBonusFormBean formBean = null;
        String otherBonusId = request.getParameter("otherBonusId");
        OrganizationDAO organizationDAO = new OrganizationDAO();
        if (!GenericValidator.isBlankOrNull(otherBonusId)) {
            try {
                formBean = organizationDAO.getOtherBonus(NumberUtil.parseInt(otherBonusId, 0));
            } catch (Exception ex) {
            }
        }
        if (formBean == null) {
            formBean = new OtherBonusFormBean();
        }
        request.setAttribute(Constants.OTHER_BONUS, formBean);

        ArrayList arrOrganization = null;
        try {
            arrOrganization = organizationDAO.getOrganizations(EmployeeBean.STATUS_ACTIVE, QTUtil.getOrganizationManageds(request.getSession()));
        } catch (Exception ex) {
        }
        if (arrOrganization == null) {
            arrOrganization = new ArrayList();
        }
        request.setAttribute(Constants.ORGANIZATION_LIST, arrOrganization);

        return true;
    }
}
