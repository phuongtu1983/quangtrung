<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="employeeAdvanceFormshowHelpHideDivContent">
    <form name="employeeAdvanceForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="code.title"/></td>
                            <td><html:text property="code" size="30" name="<%=Constants.EMPLOYEE_ADVANCE%>" readonly="true"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="date.title"/></td>
                            <td><html:text property="advanceDate" styleId="employeeAdvanceDate" size="30" name="<%=Constants.EMPLOYEE_ADVANCE%>"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="employee.title"/></td>
                            <td>
                                <html:select property="employeeId" name="<%=Constants.EMPLOYEE_ADVANCE%>" style="width:195px">
                                    <html:options collection="<%=Constants.EMPLOYEE_LIST%>" property="id" labelProperty="fullname"/>
                                </html:select>
                            </td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="amount.title"/></td>
                            <td><html:text property="amount" size="30" name="<%=Constants.EMPLOYEE_ADVANCE%>" onkeyup="try2FloatFormatOnKeyUp(this,event);" onkeypress="return readonlyFloat(event);"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="account.title"/></td>
                            <td colspan="3">
                                <html:select property="accountId" name="<%=Constants.EMPLOYEE_ADVANCE%>" style="width:195px">
                                    <html:options collection="<%=Constants.ACCOUNT_LIST%>" property="id" labelProperty="number"/>
                                </html:select>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="note.title"/></td>
                            <td colspan="3"><html:text property="note" size="93" name="<%=Constants.EMPLOYEE_ADVANCE%>" /></td>
                        </tr>
                    </table>
                </td></tr>
            <tr>
                <td align="center">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <logic:equal name="<%=Constants.EMPLOYEE_ADVANCE%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_EMPLOYEE_ADVANCE)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveEmployeeAdvance();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:equal>
                        <logic:notEqual name="<%=Constants.EMPLOYEE_ADVANCE%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_EMPLOYEE_ADVANCE)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveEmployeeAdvance();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:notEqual>
                            <logic:greaterThan name="<%=Constants.EMPLOYEE_ADVANCE%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_EMPLOYEE_ADVANCE)) {%> 
                            <button class="i_trashcan icon small red" onclick="return delEmployeeAdvance();"><bean:message key="message.del"/></button>
                            <%}%>
                        </logic:greaterThan>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('employeeAdvanceFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.EMPLOYEE_ADVANCE%>" />
        <input type="hidden" id="callbackFunc"/>
    </form>
    <div name="employeeAdvanceFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('employeeAdvanceFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveEmployeeAdvance()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('employeeAdvanceFormshowHelpHideDiv')</div>
</div>