<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div class="header"><bean:message key="salary.title"/></div>
<form name="salaryForm">
    <table width="100%">
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="code.title"/></td>
            <td><html:text property="code" size="30" name="<%=Constants.SALARY%>" readonly="true"/></td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="employeeOff.detail.total"/></td>
            <td><html:text property="total" size="30" name="<%=Constants.SALARY%>" readonly="true"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="employee.title"/></td>
            <td><html:text property="employeeName" size="30" name="<%=Constants.SALARY%>" readonly="true"/></td>
            <td height="30" style="padding-left: 10px; padding-right: 20px"><bean:message key="date.title"/></td>
            <td><html:text property="createdDate" size="30" name="<%=Constants.SALARY%>" readonly="true"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="employeeOff.detail.monthDay"/></td>
            <td><html:text property="monthDay" size="30" name="<%=Constants.SALARY%>" readonly="true"/></td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="employeeOff.detail.workingDay"/></td>
            <td><html:text property="workingDay" size="30" name="<%=Constants.SALARY%>" readonly="true"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="employeeOff.detail.basicSalary"/></td>
            <td><html:text property="basicSalary" size="30" name="<%=Constants.SALARY%>" readonly="true"/></td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="employeeOff.detail.realSalary"/></td>
            <td><html:text property="realSalary" size="30" name="<%=Constants.SALARY%>" readonly="true"/></td>
        </tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="salary.field.title"/></legend>
                    <%@include  file="/salary/fielddetails.jsp" %>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <div>
                    <fieldset>
                        <legend><bean:message key="timesheet.field.title"/></legend>
                        <%@include  file="/salary/timesheets.jsp" %>
                    </fieldset>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="4" align="center">
                <p style="margin-top: 0; margin-bottom: 0">
                    <logic:notEqual name="<%=Constants.SALARY%>" property="id" value="0">
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_SALARY)) {%> 
                        <button class="i_create_write icon small green" onclick="return saveSalary();"><bean:message key="message.save"/></button>
                        <%}%>
                    </logic:notEqual>
                    <button class="i_access_denied icon small yellow" onclick="return loadSalaryPanel();"><bean:message key="message.close"/></button></p>
            </td>
        </tr>
    </table>
    <html:hidden property="id" name="<%=Constants.SALARY%>"/>
    <input type="hidden" id="callbackFunc"/>
</form>
<div id="showHelpHideDiv" style="display:none">
    Ctrl+C : Đóng
    Ctrl+S : Lưu
</div>
<div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('salaryFormshowHelpHideDiv')</div>
<div id="shiftSFunctionHideDiv" style="display:none">saveSalary()</div>
<div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('salaryFormshowHelpHideDiv')</div>