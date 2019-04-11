<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="employeeOilCommissionFormshowHelpHideDivContent">
    <form name="employeeOilCommissionForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30"><bean:message key="employeeOilCommission.detail.name"/></td>
                            <td><html:text property="name" size="40" name="<%=Constants.EMPLOYEE_OIL_COMMISSION%>"/></td>
                        </tr>
                        <tr>
                            <td height="30"><bean:message key="employeeOilCommission.detail.amount"/></td>
                            <td><html:text property="amount" size="40" name="<%=Constants.EMPLOYEE_OIL_COMMISSION%>" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
                        </tr>
                        <tr>
                            <td height="30"><bean:message key="note.title"/></td>
                            <td><html:text property="note" size="40" name="<%=Constants.EMPLOYEE_OIL_COMMISSION%>"/></td>
                        </tr>
                    </table>
                </td></tr>
            <tr>
                <td align="center">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <logic:equal name="<%=Constants.EMPLOYEE_OIL_COMMISSION%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_EMPLOYEE_OIL_COMMISSION)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveEmployeeOilCommission();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:equal>
                        <logic:notEqual name="<%=Constants.EMPLOYEE_OIL_COMMISSION%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_EMPLOYEE_OIL_COMMISSION)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveEmployeeOilCommission();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:notEqual>
                        <logic:greaterThan name="<%=Constants.EMPLOYEE_OIL_COMMISSION%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_EMPLOYEE_OIL_COMMISSION)) {%> 
                            <button class="i_trashcan icon small red" onclick="return delEmployeeOilCommission();"><bean:message key="message.del"/></button>
                            <%}%>
                        </logic:greaterThan>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('employeeOilCommissionFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                    </p>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.EMPLOYEE_OIL_COMMISSION%>" />
        <input type="hidden" id="callbackFunc"/>
    </form>
    <div name="employeeOilCommissionFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('employeeOilCommissionFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveEmployeeOilCommission()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('employeeOilCommissionFormshowHelpHideDiv')</div>
</div>