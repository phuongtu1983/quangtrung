<%@page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<form name='reportEmployeeVehicleSalarySearchForm' id='reportEmployeeVehicleSalarySearchForm'>
    <fieldset>
        <legend class="lbl10b"><bean:message key="search.title"/></legend>
        <table>
            <tr>
                <td style="padding-right: 20px">Thời gian</td>
                <td>
                    <select id="reportEmployeeVehicleSalarySearchFormTime" style="width:200px" onchange="return reportTimeChange(this, 'reportEmployeeVehicleSalarySearchForm')">
                        <option value="2">Tháng</option>
                    </select>
                </td>
                <td>
                    <input type="text" name="fromDate" id="fromDate" size="10">
                    <input type="text" name="toDate" id="toDate" size="10" style="visibility: hidden">
                </td>
            </tr>
            <tr>
                <td style="padding-right: 20px"></td>

            </tr>
            <tr>
                <td><bean:message key="employee.title"/></td>
                <td colspan="3">
                    <select style="width: 260px;" name="employeeId" id="employeeIdComboboxPopup">
                        <logic:iterate id="employee_iter" name="<%=Constants.EMPLOYEE_LIST%>">
                            <option  value="${employee_iter.id}">${employee_iter.fullname}</option>
                        </logic:iterate>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="3" align="center">
                    <button class="i_printer icon small" onclick="return printEmployeeVehicleSalaryReport(document.forms['reportEmployeeVehicleSalarySearchForm'].fromDate.value, document.forms['reportEmployeeVehicleSalarySearchForm'].toDate.value);">In</button>
                    <button class="i_access_denied icon small yellow" onclick="return hidePopupForm();"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table>
    </fieldset>
    <input type="hidden" name="employeeSelectedHidden" value="0"/>
</form>