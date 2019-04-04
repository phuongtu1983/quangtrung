/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.borrow;

import com.stepup.core.util.NumberUtil;
import com.stepup.core.util.StringUtil;
import com.stepup.gasoline.qt.bean.BorrowBean;
import com.stepup.gasoline.qt.bean.BorrowDetailBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.EmployeeDAO;
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
public class AddBorrowAction extends SpineAction {

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
        BorrowFormBean formBean = (BorrowFormBean) form;
        EmployeeDAO employeeDAO = new EmployeeDAO();
        BorrowBean bean = null;
        int borrowId = formBean.getId();
        try {
            bean = employeeDAO.getBorrow(borrowId);
        } catch (Exception ex) {
        }
        boolean bNew = false;
        if (borrowId == 0) {
            bNew = true;
        } else {
            bNew = false;
        }
        if (bean == null) {
            bean = new BorrowBean();
        }

        boolean needUpdate = false;
        if (StringUtil.isEqual(bean.getCreatedDate(), formBean.getCreatedDate())) {
            needUpdate = true;
        }

        bean.setId(formBean.getId());
        bean.setCreatedDate(formBean.getCreatedDate());
        bean.setCode(formBean.getCode());
        bean.setNote(formBean.getNote());
        bean.setEmployeeId(formBean.getEmployeeId());
        bean.setTotal(formBean.getTotal());
        bean.setAccountId(formBean.getAccountId());
        bean.setCreatedEmployeeId(QTUtil.getEmployeeId(request.getSession()));
        try {
            if (bNew) {
                int id = employeeDAO.insertBorrow(bean);
                formBean.setId(id);
                addBorrowPayDate(formBean, needUpdate);
            } else {
                addBorrowPayDate(formBean, needUpdate);
                employeeDAO.updateBorrow(bean);
            }
        } catch (Exception ex) {
        }
        return true;
    }

    private void addBorrowPayDate(BorrowFormBean formBean, boolean needUpdate) {
        try {
            EmployeeDAO employeeDAO = new EmployeeDAO();
            ArrayList arrDetail = employeeDAO.getBorrowDetail(formBean.getId());
            int length = formBean.getPayDate().length;
            int id = 0;
            boolean isUpdate = false;
            for (int i = 0; i < length; i++) {
                id = NumberUtil.parseInt(formBean.getBorrowDetailId()[i], 0);
                if (id == 0) {
                    BorrowDetailBean bean = new BorrowDetailBean();
                    bean.setPayDate(formBean.getPayDate()[i]);
                    bean.setAmount(NumberUtil.parseInt(formBean.getAmount()[i], 0));
                    bean.setBorrowId(formBean.getId());
                    employeeDAO.insertBorrowDetail(bean, formBean.getCreatedDate());
                } else {
                    isUpdate = false;
                    int j = 0;
                    BorrowDetailBean oldBean = null;
                    for (; j < arrDetail.size(); j++) {
                        oldBean = (BorrowDetailBean) arrDetail.get(j);
                        if (oldBean.getId() == id) {
                            break;
                        }
                    }
                    if (j < arrDetail.size()) {
                        arrDetail.remove(j);
                        if (oldBean.getAmount() != NumberUtil.parseDouble(formBean.getAmount()[i], 0)) {
                            isUpdate = true;
                            oldBean.setAmount(NumberUtil.parseInt(formBean.getAmount()[i], 0));
                        }
                        if (needUpdate) {
                            isUpdate = true;
                        }
                        if (isUpdate) {
                            employeeDAO.updateBorrowDetail(oldBean, formBean.getCreatedDate());
                        }
                    }
                }
            }
        } catch (Exception ex) {
        }
    }
}
