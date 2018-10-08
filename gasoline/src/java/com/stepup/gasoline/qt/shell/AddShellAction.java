/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.shell;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.ShellBean;
import com.stepup.gasoline.qt.bean.ShellVendorDetailBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.GoodDAO;
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
public class AddShellAction extends SpineAction {

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
        ShellFormBean formBean = (ShellFormBean) form;
        GoodDAO goodDAO = new GoodDAO();
        ShellBean bean = null;
        boolean bNew = false;
        boolean isExist = false;
        try {
            bean = goodDAO.getShellByName(formBean.getName());
        } catch (Exception ex) {
        }
        int shellId = formBean.getId();
        if (shellId == 0) {
            bNew = true;
            if (bean != null) {
                isExist = true;
            }
        } else {
            bNew = false;
            if (bean != null && bean.getId() != shellId) {
                isExist = true;
            }
            try {
                if (bean == null) {
                    bean = goodDAO.getShell(shellId);
                }
            } catch (Exception ex) {
            }
        }
        if (isExist) {
            ActionMessages errors = new ActionMessages();
            errors.add("shellExisted", new ActionMessage("shell.save.error"));
            saveErrors(request, errors);
            return false;
        }
        boolean isUpdate = false;
        try {
            if (bNew) {
            } else {
                if (!formBean.getName().equals(bean.getName())) {
                    isUpdate = true;
                }
                if (!formBean.getCode().equals(bean.getCode())) {
                    isUpdate = true;
                }
                if (formBean.getStatus() != bean.getStatus()) {
                    isUpdate = true;
                }
                if (formBean.getUnitId() != bean.getUnitId()) {
                    isUpdate = true;
                }
                if (formBean.getKindId() != bean.getKindId()) {
                    isUpdate = true;
                }
                if (formBean.getPrice() != bean.getPrice()) {
                    isUpdate = true;
                }
                if (formBean.getVendorId() != bean.getVendorId()) {
                    isUpdate = true;
                }
            }
        } catch (Exception ex) {
        }
        bean = new ShellBean();
        bean.setId(formBean.getId());
        bean.setName(formBean.getName());
        bean.setCode(formBean.getCode());
        bean.setUnitId(formBean.getUnitId());
        bean.setKindId(formBean.getKindId());
        bean.setPrice(formBean.getPrice());
        bean.setStatus(formBean.getStatus());
        bean.setVendorId(formBean.getVendorId());
        try {
            if (bNew) {
                int id = goodDAO.insertShell(bean);
                formBean.setId(id);
            } else {
                if (isUpdate) {
                    goodDAO.updateShell(bean);
                }
            }
            addShellVendor(formBean);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }

    private void addShellVendor(ShellFormBean formBean) {
        try {
            GoodDAO goodDAO = new GoodDAO();
            ArrayList arrDetail = goodDAO.getShellVendorDetail(formBean.getId());
            if (formBean.getShellVendorId() != null) {
                int length = formBean.getShellVendorId().length;
                int id = 0;
                boolean isUpdate = false;
                for (int i = 0; i < length; i++) {
                    id = NumberUtil.parseInt(formBean.getShellVendorDetailId()[i], 0);
                    if (id == 0) {
                        ShellVendorDetailBean bean = new ShellVendorDetailBean();
                        bean.setVendorId(NumberUtil.parseInt(formBean.getShellVendorId()[i], 0));
                        bean.setShellId(formBean.getId());
                        goodDAO.insertShellVendorDetail(bean);
                    } else {
                        isUpdate = false;
                        int j = 0;
                        ShellVendorDetailBean oldBean = null;
                        for (; j < arrDetail.size(); j++) {
                            oldBean = (ShellVendorDetailBean) arrDetail.get(j);
                            if (oldBean.getId() == id) {
                                break;
                            }
                        }
                        if (j < arrDetail.size()) {
                            arrDetail.remove(j);
                            if (oldBean.getVendorId() != NumberUtil.parseInt(formBean.getShellVendorId()[i], 0)) {
                                isUpdate = true;
                                oldBean.setVendorId(NumberUtil.parseInt(formBean.getShellVendorId()[i], 0));
                            }
                            if (isUpdate) {
                                goodDAO.updateShellVendorDetail(oldBean);
                            }
                        }
                    }
                }
            }
            String ids = "0,";
            ShellVendorDetailBean oldBean = null;
            for (int i = 0; i < arrDetail.size(); i++) {
                oldBean = (ShellVendorDetailBean) arrDetail.get(i);
                ids += oldBean.getId() + ",";
            }
            ids += "0";
            goodDAO.deleteShellVendors(ids);
        } catch (Exception ex) {
        }
    }
}
