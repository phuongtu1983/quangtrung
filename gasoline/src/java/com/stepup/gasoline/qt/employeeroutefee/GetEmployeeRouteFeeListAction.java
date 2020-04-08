/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.employeeroutefee;

import com.stepup.core.util.NumberUtil;
import com.stepup.core.util.OutputUtil;
import com.stepup.core.util.StringUtil;
import com.stepup.gasoline.qt.core.BaseAction;
import com.stepup.gasoline.qt.dao.VehicleDAO;
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
public class GetEmployeeRouteFeeListAction extends BaseAction {

    @Override
    public boolean doAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        StringBuilder buff = new StringBuilder();
        buff.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
        buff.append("<rows>");
        try {
            VehicleDAO vehicleDAO = new VehicleDAO();
            ArrayList list = vehicleDAO.searchEmployeeRouteFee(request.getParameter("fromDate"), request.getParameter("toDate"), QTUtil.getOrganizationManageds(request.getSession()));
            if (list != null) {
                int length = list.size();
                for (int i = 0; i < length; i++) {
                    EmployeeRouteFeeFormBean bean = (EmployeeRouteFeeFormBean) list.get(i);
                    buff.append("<row id=\"").append(bean.getId()).append("\">");
                    buff.append("<cell>").append(bean.getCode()).append("^javascript:getEmployeeRouteFee(").append(bean.getId()).append(",\"loadEmployeeRouteFeePanel\")^_self</cell>");
                    buff.append("<cell>").append(bean.getCreatedDate()).append("</cell>");
                    buff.append("<cell>").append(StringUtil.encodeString(bean.getRouteName())).append("</cell>");
                    buff.append("<cell>").append(NumberUtil.formatMoneyDefault(bean.getDistance(), "VND")).append("</cell>");
                    buff.append("<cell>").append(NumberUtil.formatMoneyDefault(bean.getInQuantity(), "VND")).append("</cell>");
                    buff.append("<cell>").append(NumberUtil.formatMoneyDefault(bean.getOutQuantity(), "VND")).append("</cell>");
                    buff.append("<cell>").append(NumberUtil.formatMoneyDefault(bean.getTotalQuantity(), "VND")).append("</cell>");
                    buff.append("<cell>").append(NumberUtil.formatMoneyDefault(bean.getPrice(), "VND")).append("</cell>");
                    buff.append("<cell>").append(NumberUtil.formatMoneyDefault(bean.getAmount(), "VND")).append("</cell>");
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
