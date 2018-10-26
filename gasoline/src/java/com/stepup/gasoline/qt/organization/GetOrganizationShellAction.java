/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.organization;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.OrganizationShellDetailBean;
import com.stepup.gasoline.qt.bean.ShellBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.GoodDAO;
import com.stepup.gasoline.qt.util.Constants;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class GetOrganizationShellAction extends SpineAction {

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
        int shellId = NumberUtil.parseInt(request.getParameter("shellId"), 0);
        ArrayList arrDetail = new ArrayList();
        OrganizationShellDetailBean shellDetailBean = new OrganizationShellDetailBean();
        try {
            GoodDAO goodDAO = new GoodDAO();
            ShellBean shellBean = goodDAO.getShell(shellId);
            if (shellBean != null) {
                shellDetailBean.setShellName(shellBean.getName());
                shellDetailBean.setShellId(shellBean.getId());
            }
        } catch (Exception ex) {
        }
        arrDetail.add(shellDetailBean);
        request.setAttribute(Constants.ORGANIZATION_SHELL, arrDetail);

        return true;
    }
}
