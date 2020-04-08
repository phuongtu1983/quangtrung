/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.employeetimesheet;

import com.stepup.core.util.NumberUtil;
import com.stepup.core.util.OutputUtil;
import com.stepup.core.util.StringUtil;
import com.stepup.gasoline.qt.core.BaseAction;
import com.stepup.gasoline.qt.dao.EmployeeDAO;
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
public class GetEmployeeTimesheetListAction extends BaseAction {

    @Override
    public boolean doAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        StringBuilder buff = new StringBuilder();
        buff.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
        buff.append("<rows>");
        try {
            EmployeeDAO employeeDAO = new EmployeeDAO();
            ArrayList list = employeeDAO.searchEmployeeTimesheet(request.getParameter("fromDate"), request.getParameter("toDate"), QTUtil.getOrganizationManageds(request.getSession()));
            if (list != null) {
                int length = list.size();
                for (int i = 0; i < length; i++) {
                    EmployeeTimesheetFormBean bean = (EmployeeTimesheetFormBean) list.get(i);
                    buff.append("<row id=\"").append(bean.getId()).append("\">");
                    buff.append("<cell>").append(bean.getCode()).append("^javascript:getEmployeeTimesheet(").append(bean.getId()).append(",\"loadEmployeeTimesheetPanel\")^_self</cell>");
                    buff.append("<cell>").append(StringUtil.encodeString(bean.getEmployeeName())).append("</cell>");
                    buff.append("<cell>").append(bean.getTimesheetDate()).append("</cell>");
                    buff.append("<cell>").append(StringUtil.encodeString(bean.getFieldName())).append("</cell>");
                    buff.append("<cell>").append(NumberUtil.formatMoneyDefault(bean.getQuantity(), "VND")).append("</cell>");
                    buff.append("<cell>").append(StringUtil.encodeString(bean.getNote())).append("</cell>");
                    buff.append("</row>");
                }
            }
        } catch (Exception ex) {
        }
        buff.append("</rows>");

        OutputUtil.sendXmlStringToOutput(response, buff.toString());
        return true;
    }

    @Override
    protected boolean isReturnStream() {
        return true;
    }

    @Override
    protected String getActionName() {
        return this.getClass().getName();
    }
}
