<%@page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<form name='monthlyReportSearchForm' id='monthlyReportSearchForm'>
    <fieldset>
        <legend class="lbl10b"><bean:message key="search.title"/></legend>
        <table>
            <tr>
                <td style="padding-right: 20px">Thời gian</td>
                <td colspan="2">
                    <select id="monthlyReportSearchFormTime" style="width:200px" onchange="return reportTimeChange(this, 'monthlyReportSearchForm')">
                        <option value="2">Tháng</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td style="padding-right: 20px">Từ</td>
                <td colspan="2">
                    <input type="text" name="fromDate" id="fromDate" size="10"> Đến <input type="text" name="toDate" id="toDate" size="10">
                </td>
            </tr>
            <tr>
                <td colspan="3" align="center">
                    <button class="i_printer icon small" onclick="return printMonthlyReport(document.forms['monthlyReportSearchForm'].fromDate.value, document.forms['monthlyReportSearchForm'].toDate.value);">In</button>
                    <button class="i_access_denied icon small yellow" onclick="return hidePopupForm();"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table>
    </fieldset>
    <input id="monthlyReportSearchFormHeader" value='<bean:write name="<%=Constants.REPORT_BEAN%>" property="header"/>' type="hidden">
    <input id="monthlyReportSearchFormName" value='<bean:write name="<%=Constants.REPORT_BEAN%>" property="name"/>' type="hidden">
</form>