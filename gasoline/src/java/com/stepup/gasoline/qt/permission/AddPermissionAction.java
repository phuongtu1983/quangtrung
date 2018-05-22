/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.permission;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.PermissionBean;
import com.stepup.gasoline.qt.bean.PermissionDetailBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.PermissionDAO;
import com.stepup.gasoline.qt.gui.GenerateMenu;
import com.stepup.gasoline.qt.util.PermissionUtil;
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
public class AddPermissionAction extends SpineAction {

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
        PermissionFormBean formBean = (PermissionFormBean) form;
        PermissionDAO permissionDAO = new PermissionDAO();
        PermissionBean bean = null;
        boolean bNew = false;
        boolean isExist = false;
        try {
            bean = permissionDAO.getPermissionByName(formBean.getName());
        } catch (Exception ex) {
        }
        int perId = formBean.getPerId();
        if (perId == 0) {
            bNew = true;
            if (bean != null) {
                isExist = true;
            }
        } else {
            bNew = false;
            if (bean != null && bean.getId() != perId) {
                isExist = true;
            }
        }
        if (isExist) {
            ActionMessages errors = new ActionMessages();
            errors.add("permissionExisted", new ActionMessage("errors.permission.existed"));
            saveErrors(request, errors);
            return false;
        }
        bean = new PermissionBean();
        bean.setId(perId);
        bean.setName(formBean.getName());
        bean.setNote(formBean.getNote());

        String empIds = "";
        if (formBean.getPermissionEmpId() != null) {
            int length = formBean.getPermissionEmpId().length;
            empIds = formBean.getPermissionEmpId()[0];
            for (int i = 1; i < length; i++) {
                empIds += "," + formBean.getPermissionEmpId()[i];
            }
        }
        bean.setUsers(empIds);

        try {
            if (bNew) {
                perId = permissionDAO.insertPermission(bean);
            } else {
                permissionDAO.updatePermission(bean);
            }
            String funcLists = "";
            if (formBean.getFuncList() != null) {
                int length = formBean.getFuncList().length;
                funcLists = formBean.getFuncList()[0];
                for (int i = 1; i < length; i++) {
                    funcLists += "," + formBean.getFuncList()[i];
                }
            }

            String funcAdds = "";
            if (formBean.getFuncAdd() != null) {
                int length = formBean.getFuncAdd().length;
                funcAdds = formBean.getFuncAdd()[0];
                for (int i = 1; i < length; i++) {
                    funcAdds += "," + formBean.getFuncAdd()[i];
                }
            }

            String funcDeletes = "";
            if (formBean.getFuncDelete() != null) {
                int length = formBean.getFuncDelete().length;
                funcDeletes = formBean.getFuncDelete()[0];
                for (int i = 1; i < length; i++) {
                    funcDeletes += "," + formBean.getFuncDelete()[i];
                }
            }

            String funcEdits = "";
            if (formBean.getFuncEdit() != null) {
                int length = formBean.getFuncEdit().length;
                funcEdits = formBean.getFuncEdit()[0];
                for (int i = 1; i < length; i++) {
                    funcEdits += "," + formBean.getFuncEdit()[i];
                }
            }

            String funcPrints = "";
            if (formBean.getFuncPrint() != null) {
                int length = formBean.getFuncPrint().length;
                funcPrints = formBean.getFuncPrint()[0];
                for (int i = 1; i < length; i++) {
                    funcPrints += "," + formBean.getFuncPrint()[i];
                }
            }

            if (bNew) {
                PermissionDetailBean detailBean = null;
                detailBean = new PermissionDetailBean(PermissionUtil.OPERATION_LIST, funcLists);
                detailBean.setPerId(perId);
                permissionDAO.insertPermissionDetail(detailBean);
                detailBean = new PermissionDetailBean(PermissionUtil.OPERATION_ADD, funcAdds);
                detailBean.setPerId(perId);
                permissionDAO.insertPermissionDetail(detailBean);
                detailBean = new PermissionDetailBean(PermissionUtil.OPERATION_DELETE, funcDeletes);
                detailBean.setPerId(perId);
                permissionDAO.insertPermissionDetail(detailBean);
                detailBean = new PermissionDetailBean(PermissionUtil.OPERATION_EDIT, funcEdits);
                detailBean.setPerId(perId);
                permissionDAO.insertPermissionDetail(detailBean);
                detailBean = new PermissionDetailBean(PermissionUtil.OPERATION_PRINT, funcPrints);
                detailBean.setPerId(perId);
                permissionDAO.insertPermissionDetail(detailBean);
            } else {
                PermissionDetailBean detailBean = null;
                detailBean = new PermissionDetailBean(PermissionUtil.OPERATION_LIST, funcLists);
                detailBean.setPerId(perId);
                permissionDAO.updatePermissionDetail(detailBean);
                detailBean = new PermissionDetailBean(PermissionUtil.OPERATION_ADD, funcAdds);
                detailBean.setPerId(perId);
                permissionDAO.updatePermissionDetail(detailBean);
                detailBean = new PermissionDetailBean(PermissionUtil.OPERATION_DELETE, funcDeletes);
                detailBean.setPerId(perId);
                permissionDAO.updatePermissionDetail(detailBean);
                detailBean = new PermissionDetailBean(PermissionUtil.OPERATION_EDIT, funcEdits);
                detailBean.setPerId(perId);
                permissionDAO.updatePermissionDetail(detailBean);
                detailBean = new PermissionDetailBean(PermissionUtil.OPERATION_PRINT, funcPrints);
                detailBean.setPerId(perId);
                permissionDAO.updatePermissionDetail(detailBean);
            }
            generateMenu(formBean);
        } catch (Exception ex) {
        }
        return true;
    }

    private void generateMenu(PermissionFormBean formBean) {
        try {
            String[] empId = formBean.getPermissionEmpId();
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
