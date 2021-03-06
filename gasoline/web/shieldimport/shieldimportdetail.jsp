<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="shieldImportFormshowHelpHideDivContent">
    <form name="shieldImportForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="code.title"/></td>
                            <td><html:text property="code" size="30" name="<%=Constants.SHIELD_IMPORT%>" readonly="true" tabindex="-1"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="date.title"/></td>
                            <td><html:text property="createdDate" styleId="shieldImportDate" size="30" name="<%=Constants.SHIELD_IMPORT%>" tabindex="-1"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="quantity.title"/></td>
                            <td><html:text property="quantity" size="30" name="<%=Constants.SHIELD_IMPORT%>" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);" tabindex="0"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="vendor.title"/></td>
                            <td>
                                <html:select property="vendorId" name="<%=Constants.SHIELD_IMPORT%>" style="width:195px">
                                    <html:options collection="<%=Constants.VENDOR_LIST%>" property="id" labelProperty="name"/>
                                </html:select>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="note.title"/></td>
                            <td colspan=""><html:text property="note" size="30" name="<%=Constants.SHIELD_IMPORT%>"/></td>
                        </tr>
                    </table>
                </td></tr>
            <tr>
                <td align="center">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <logic:equal name="<%=Constants.SHIELD_IMPORT%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_SHIELD_IMPORT)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveShieldImport();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:equal>
                        <logic:notEqual name="<%=Constants.SHIELD_IMPORT%>" property="id" value="0">
                            <logic:equal name="<%=Constants.SHIELD_IMPORT%>" property="canEdit" value="1">
                                <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_SHIELD_IMPORT)) {%> 
                                <button class="i_create_write icon small green" onclick="return saveShieldImport();"><bean:message key="message.save"/></button>
                                <%}%>
                                <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_SHIELD_IMPORT)) {%> 
                                <button class="i_trashcan icon small red" onclick="return delShieldImport();"><bean:message key="message.del"/></button>
                                <%}%>
                            </logic:equal>
                        </logic:notEqual>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('shieldImportFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.SHIELD_IMPORT%>" />
        <input type="hidden" id="callbackFunc"/>
    </form>
    <div name="shieldImportFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('shieldImportFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveShieldImport()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('shieldImportFormshowHelpHideDiv')</div>
</div>