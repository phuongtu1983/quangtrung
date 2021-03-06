<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div class="header"><bean:message key="oldShell.title"/></div>
<form name="oldShellForm">
    <table width="100%" cellspacing="0" cellpadding="0" >
        <tr><td>
                <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                    <tr>
                        <td height="30" style="padding-right: 20px"><bean:message key="code.title"/></td>
                        <td><html:text property="code" size="40" name="<%=Constants.OLD_SHELL%>" readonly="true" tabindex="-1"/></td>
                        <td style="padding-right: 20px;padding-left: 10px"><bean:message key="date.title"/></td>
                        <td><html:text property="createdDate" styleId="oldShellDate" size="30" name="<%=Constants.OLD_SHELL%>" tabindex="-1"/></td>
                    </tr>
                    <tr>
                        <td height="30" style="padding-right: 20px"><bean:message key="quantity.title"/></td>
                        <td><html:text property="quantity" size="40" name="<%=Constants.OLD_SHELL%>" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);" tabindex="0"/></td>
                        <td style="padding-right: 20px;padding-left: 10px"><bean:message key="shell.title"/></td>
                        <td>
                            <select style="width: 195px;" name="shellIdCombobox" id="shellIdCombobox">
                                <logic:iterate id="shell_iter" name="<%=Constants.SHELL_LIST%>">
                                    <option  value="${shell_iter.id}">${shell_iter.name}</option>
                                </logic:iterate>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td height="30" style="padding-right: 20px"><bean:message key="note.title"/></td>
                        <td colspan="3"><html:text property="note" size="90" name="<%=Constants.OLD_SHELL%>"/></td>
                    </tr>
                </table>
            </td></tr>
        <tr>
            <td align="center">
                <p style="margin-top: 0; margin-bottom: 0">
                    <logic:equal name="<%=Constants.OLD_SHELL%>" property="id" value="0">
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_OLD_SHELL)) {%> 
                        <button class="i_create_write icon small green" onclick="return saveOldShell();"><bean:message key="message.save"/></button>
                        <%}%>
                    </logic:equal>
                    <logic:notEqual name="<%=Constants.OLD_SHELL%>" property="id" value="0">
                        <logic:equal name="<%=Constants.OLD_SHELL%>" property="canEdit" value="1">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_OLD_SHELL)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveOldShell();"><bean:message key="message.save"/></button>
                            <%}%>
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_OLD_SHELL)) {%> 
                            <button class="i_trashcan icon small red" onclick="return delOldShell();"><bean:message key="message.del"/></button>
                            <%}%>
                        </logic:equal>
                    </logic:notEqual>
                    <button class="i_access_denied icon small yellow" onclick="return loadOldShellPanel();"><bean:message key="message.close"/></button>
            </td>
        </tr>
    </table> 
    <html:hidden property="id" name="<%=Constants.OLD_SHELL%>" />
    <html:hidden property="shellId" name="<%=Constants.OLD_SHELL%>" />
    <input type="hidden" name="shellSelectedHidden" value="0"/>
    <input type="hidden" id="callbackFunc"/>
</form>
<div name="oldShellFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
    Ctrl+C : Đóng
    Ctrl+S : Lưu
</div>
<div id="shiftCFunctionHideDiv" style="display:none">loadOldShellPanel()</div>
<div id="shiftSFunctionHideDiv" style="display:none">saveOldShell()</div>
<div id="shiftEscFunctionHideDiv" style="display:none">loadOldShellPanel()</div>