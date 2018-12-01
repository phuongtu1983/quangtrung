<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="shellImportFormshowHelpHideDivContent">
    <form name="shellImportForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="code.title"/></td>
                            <td><html:text property="code" size="40" name="<%=Constants.SHELL_IMPORT%>" readonly="true"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="date.title"/></td>
                            <td><html:text property="createdDate" styleId="shellImportDate" size="40" name="<%=Constants.SHELL_IMPORT%>"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="shell.title"/></td>
                            <td>
                                <select style="width: 250px;" name="shellIdCombobox" id="shellIdCombobox">
                                    <logic:iterate id="shell_iter" name="<%=Constants.SHELL_LIST%>">
                                        <option  value="${shell_iter.id}">${shell_iter.name}</option>
                                    </logic:iterate>
                                </select>
                            </td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="vendor.title"/></td>
                            <td><html:select property="vendorId" name="<%=Constants.SHELL_IMPORT%>" style="width:255px">
                                    <html:options collection="<%=Constants.VENDOR_LIST%>" property="id" labelProperty="name"/>
                                </html:select></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="quantity.title"/></td>
                            <td><html:text property="quantity" size="40" name="<%=Constants.SHELL_IMPORT%>" onblur="return formCaculateAmount('shellImportForm');" onkeypress="return readonlyFloat(event);"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="price.import.title"/></td>
                            <td><html:text property="price" size="40" name="<%=Constants.SHELL_IMPORT%>" onblur="return formCaculateAmount('shellImportForm');" onkeypress="return readonlyFloat(event);"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="amount.title"/></td>
                            <td><html:text property="amount" size="40" name="<%=Constants.SHELL_IMPORT%>" readonly="true"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="account.title"/></td>
                            <td>
                                <html:select property="accountId" name="<%=Constants.SHELL_IMPORT%>" style="width:255px">
                                    <html:options collection="<%=Constants.ACCOUNT_LIST%>" property="id" labelProperty="number"/>
                                </html:select>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="note.title"/></td>
                            <td colspan="3"><html:text property="note" size="113" name="<%=Constants.SHELL_IMPORT%>" /></td>
                        </tr>
                    </table>
                </td></tr>
            <tr>
                <td align="center">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <logic:equal name="<%=Constants.SHELL_IMPORT%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_SHELL_IMPORT)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveShellImport();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:equal>
                        <logic:notEqual name="<%=Constants.SHELL_IMPORT%>" property="id" value="0">
                            <logic:equal name="<%=Constants.SHELL_IMPORT%>" property="canEdit" value="1">
                                <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_SHELL_IMPORT)) {%> 
                                <button class="i_create_write icon small green" onclick="return saveShellImport();"><bean:message key="message.save"/></button>
                                <%}%>
                                <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_SHELL_IMPORT)) {%> 
                                <button class="i_trashcan icon small red" onclick="return delShellImport();"><bean:message key="message.del"/></button>
                                <%}%>
                            </logic:equal>
                        </logic:notEqual>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('shellImportFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.SHELL_IMPORT%>" />
        <input type="hidden" id="callbackFunc"/>
        <html:hidden property="shellId" name="<%=Constants.SHELL_IMPORT%>" />
        <input type="hidden" name="shellSelectedHidden" value="0"/>
    </form>
    <div name="shellImportFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('shellImportFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveShellImport()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('shellImportFormshowHelpHideDiv')</div>
</div>