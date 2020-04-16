<%@page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<form name='yearlyReportSearchForm' id='yearlyReportSearchForm'>
    <fieldset>
        <legend class="lbl10b"><bean:message key="search.title"/></legend>
        <table>
            <tr>
                <td style="padding-right: 20px">Thời gian</td>
                <td colspan="2">
                    <select id="yearlyReportSearchFormTime" style="width:200px" onchange="return reportTimeChange(this, 'yearlyReportSearchForm')">
                        <option value="3">Năm</option>
                    </select>
                </td>
                <td>
                    <input type="text" name="fromDate" id="fromDate" size="10">
                    <input type="text" name="toDate" id="toDate" size="10" style="visibility: hidden">
                </td>
            </tr>
            <tr>
                <td colspan="3" align="center">
                    <button class="i_printer icon small" onclick="return printYearlyReport(document.forms['yearlyReportSearchForm'].fromDate.value, document.forms['yearlyReportSearchForm'].toDate.value);"><bean:message key="message.permission.permit.download"/></button>
                    <button class="i_access_denied icon small yellow" onclick="return hidePopupForm();"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table>
    </fieldset>
    <input id="yearlyReportSearchFormHeader" value='<bean:write name="<%=Constants.REPORT_BEAN%>" property="header"/>' type="hidden">
    <input id="yearlyReportSearchFormName" value='<bean:write name="<%=Constants.REPORT_BEAN%>" property="name"/>' type="hidden">
</form>