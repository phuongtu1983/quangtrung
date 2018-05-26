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
            <td height="30" style="padding-right: 20px"><bean:message key="employeeOff.detail.code"/></td>
            <td><html:text property="code" size="30" name="<%=Constants.SALARY%>" readonly="true"/></td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="employeeOff.detail.total"/></td>
            <td><html:text property="total" size="30" name="<%=Constants.SALARY%>" readonly="true"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="employee.title"/></td>
            <td><html:text property="code" size="30" name="<%=Constants.SALARY%>" readonly="true"/></td>
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
            <td colspan="2">
                <fieldset>
                    <legend><bean:message key="salary.field.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <button class="i_cross icon small red" onclick="return delTableRow('salaryForm', 'salaryFieldChk', 'salaryFieldTbl');"><bean:message key="message.del"/></button>
                                <button class="i_plus icon small green" onclick="return addSalaryFieldOrg();"><bean:message key="message.add"/></button>
                            </td>
                            <td>
                                <select style="width: 290px;" name="fieldCombobox" id="fieldCombobox">
                                    <%@include  file="/salary/field.jsp"%>
                                </select>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td colspan="2"><div><%@include  file="/salary/fielddetails.jsp" %></div></td>
        </tr>
        <tr>
            <td colspan="2">
                <div>
                    <fieldset>
                        <legend><bean:message key="timesheet.field.title"/></legend>
                        <%@include  file="/salary/timesheets.jsp" %>
                    </fieldset>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <p style="margin-top: 0; margin-bottom: 0">
                    <logic:equal name="<%=Constants.PERMISSION%>" property="perId" value="0">
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_PERMISSION)) {%> 
                        <button class="i_create_write icon small green" onclick="return savePermission();"><bean:message key="message.save"/></button>
                        <%}%>
                    </logic:equal>
                    <logic:notEqual name="<%=Constants.PERMISSION%>" property="perId" value="0">
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_PERMISSION)) {%> 
                        <button class="i_create_write icon small green" onclick="return savePermission();"><bean:message key="message.save"/></button>
                        <%}%>
                    </logic:notEqual>
                    <logic:greaterThan name="<%=Constants.PERMISSION%>" property="perId" value="0">
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_PERMISSION)) {%> 
                        <button class="i_trashcan icon small red" onclick="return delPermission();"><bean:message key="message.del"/></button>
                        <%}%>
                    </logic:greaterThan>
                    <button class="i_access_denied icon small yellow" onclick="return loadPermissionPanel();"><bean:message key="message.close"/></button></p>
            </td>
        </tr>
    </table>
    <html:hidden property="perId" name="<%=Constants.PERMISSION%>"/>
    <input type="hidden" name="userSelectedHidden" value="0"/>
    <input type="hidden" name="userSelectedTextHidden" value="0"/>
    <input type="hidden" name="organizationSelectedHidden" value="0"/>
    <input type="hidden" name="organizationSelectedTextHidden" value="0"/>
</form>
<div id="showHelpHideDiv" style="display:none">
    Ctrl+C : Đóng
    Ctrl+S : Lưu
</div>
<div id="shiftCFunctionHideDiv" style="display:none">loadPermissionPanel()</div>
<div id="shiftSFunctionHideDiv" style="display:none">savePermission()</div>