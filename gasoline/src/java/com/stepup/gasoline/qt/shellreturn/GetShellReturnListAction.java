/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.shellreturn;

import com.stepup.core.util.OutputUtil;
import com.stepup.core.util.StringUtil;
import com.stepup.gasoline.qt.dao.GasDAO;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class GetShellReturnListAction extends Action {

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
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        StringBuilder buff = new StringBuilder();
        buff.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
        buff.append("<rows>");
        try {
            GasDAO gasDAO = new GasDAO();
            ArrayList importList = gasDAO.searchShellReturn(request.getParameter("fromDate"), request.getParameter("toDate"));
            if (importList != null) {
                int length = importList.size();
                for (int i = 0; i < length; i++) {
                    ShellReturnFormBean bean = (ShellReturnFormBean) importList.get(i);
                    buff.append("<row id=\"").append(bean.getId()).append("\">");
                    buff.append("<cell>").append(bean.getCode()).append("^javascript:getShellReturn(").append(bean.getId()).append(")^_self</cell>");
                    buff.append("<cell>").append(bean.getCreatedDate()).append("</cell>");
                    buff.append("<cell>").append(StringUtil.encodeString(bean.getCustomerName())).append("</cell>");
                    buff.append("<cell>").append(StringUtil.encodeString(bean.getNote())).append("</cell>");
                    buff.append("</row>");
                }
            }
        } catch (Exception ex) {
        }
        buff.append("</rows>");

        OutputUtil.sendXmlStringToOutput(response, buff.toString());
        return null;
    }
}
