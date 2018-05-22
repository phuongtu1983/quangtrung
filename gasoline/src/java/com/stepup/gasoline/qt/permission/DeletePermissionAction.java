/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.permission;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.PermissionBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.PermissionDAO;
import com.stepup.gasoline.qt.gui.GenerateMenu;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class DeletePermissionAction extends SpineAction {

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
        String id = request.getParameter("perId");
        try {
            PermissionDAO permissionDAO = new PermissionDAO();
            PermissionBean bean = permissionDAO.getPermission(NumberUtil.parseInt(id, 0));
            permissionDAO.deletePermission(bean.getId() + "");
            generateMenu(bean.getUsers());
        } catch (Exception ex) {
        }
        return true;
    }

    private void generateMenu(String ids) {
        try {
            String[] empId = ids.split(",");
            int length = empId.length;
            GenerateMenu menu = new GenerateMenu();
            int id = 0;
            for (int i = 0; i < length; i++) {
                id = NumberUtil.parseInt(empId[i], 0);
                if (id > 0) {
                    menu.generate(id);
                }
            }
        } catch (Exception ex) {
        }
    }
}
