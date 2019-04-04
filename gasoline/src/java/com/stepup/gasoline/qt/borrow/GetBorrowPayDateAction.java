/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.borrow;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.BorrowDetailBean;
import com.stepup.gasoline.qt.bean.GasImportDetailBean;
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
public class GetBorrowPayDateAction extends SpineAction {

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
        String payDate = request.getParameter("payDate");
        ArrayList arrDetail = new ArrayList();
        BorrowDetailBean bean = new BorrowDetailBean();
        bean.setPayDate(payDate);
        bean.setBorrowId(NumberUtil.parseInt(request.getParameter("borrowId"), 0));
        arrDetail.add(bean);
        request.setAttribute(Constants.BORROW_PAY_DATE, arrDetail);

        return true;
    }
}
