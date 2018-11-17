<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="employeeSalaryFormshowHelpHideDivContent">
    <form name="employeeSalaryForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="employee.detail.fullname"/></td>
                            <td><html:text property="fullname" size="40" name="<%=Constants.EMPLOYEE_SALARY%>"/></td>
                            <td height="30" style="padding-left: 10px; padding-right: 20px"><bean:message key="organization.title"/></td>
                            <td><html:text property="organizationName" size="40" name="<%=Constants.EMPLOYEE_SALARY%>" readonly="true"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="employee.detail.salary"/></td>
                            <td colspan="3"><html:text property="salary" size="40" name="<%=Constants.EMPLOYEE_SALARY%>" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px" colspan="4">
                                <div id="employeeSalaryDynamicField"><%@include  file="/dynamicfield/fieldvalues.jsp"%></div>
                            </td>
                        </tr>
                    </table>
                </td></tr>
            <tr>
                <td align="center" height="30" colspan="4">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <logic:notEqual name="<%=Constants.EMPLOYEE_SALARY%>" property="employeeId" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_DYNAMIC_FIELD)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveEmployeeSalary();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:notEqual>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('employeeSalaryFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table> 
        <html:hidden property="employeeId" name="<%=Constants.EMPLOYEE_SALARY%>" />
        <html:hidden property="organizationId" name="<%=Constants.EMPLOYEE_SALARY%>" />
        <input type="hidden" id="callbackFunc"/>
    </form>
    <div name="employeeSalaryFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('employeeSalaryFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveEmployeeSalary()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('employeeSalaryFormshowHelpHideDiv')</div>
</div>