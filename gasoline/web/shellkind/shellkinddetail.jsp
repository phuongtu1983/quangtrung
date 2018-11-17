<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="shellKindFormshowHelpHideDivContent">
    <form name="shellKindForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="shellKind.detail.code"/></td>
                            <td><html:text property="code" size="40" name="<%=Constants.SHELL_KIND%>"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="shellKind.detail.name"/></td>
                            <td><html:text property="name" size="40" name="<%=Constants.SHELL_KIND%>"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="shellKind.detail.weight"/></td>
                            <td><html:text property="weight" size="40" name="<%=Constants.SHELL_KIND%>" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="shellKind.detail.commission"/></td>
                            <td><html:text property="commission" size="40" name="<%=Constants.SHELL_KIND%>" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="employee.detail.status"/></td>
                            <td colspan="3">
                                <html:select property="status" name="<%=Constants.SHELL_KIND%>" style="width: 190px;">
                                    <html:options collection="<%=Constants.STATUS_LIST%>" property="value" labelProperty="label"/>
                                </html:select>
                            </td>
                        </tr>
                    </table>
                </td></tr>
            <tr>
                <td align="center">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <logic:equal name="<%=Constants.SHELL_KIND%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_SHELL_KIND)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveShellKind();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:equal>
                        <logic:notEqual name="<%=Constants.SHELL_KIND%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_SHELL_KIND)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveShellKind();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:notEqual>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('shellKindFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.SHELL_KIND%>" />
        <input type="hidden" id="callbackFunc"/>
    </form>
    <div name="shellKindFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('shellKindFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveShellKind()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('shellKindFormshowHelpHideDiv')</div>
</div>