<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="accessoryKindFormshowHelpHideDivContent">
    <form name="accessoryKindForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="accessoryKind.detail.name"/></td>
                            <td><html:text property="name" size="40" name="<%=Constants.ACCESSORY_KIND%>"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="accessoryKind.detail.commission"/></td>
                            <td><html:text property="commission" size="40" name="<%=Constants.ACCESSORY_KIND%>" onkeyup="try2FloatFormatOnKeyUp(this,event);" onkeypress="return readonlyFloat(event);"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="note.title"/></td>
                            <td><html:text property="note" size="40" name="<%=Constants.ACCESSORY_KIND%>"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="employee.detail.status"/></td>
                            <td>
                                <html:select property="status" name="<%=Constants.ACCESSORY_KIND%>" style="width: 190px;">
                                    <html:options collection="<%=Constants.STATUS_LIST%>" property="value" labelProperty="label"/>
                                </html:select>
                            </td>
                        </tr>
                    </table>
                </td></tr>
            <tr>
                <td align="center">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <logic:equal name="<%=Constants.ACCESSORY_KIND%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_ACCESSORY_KIND)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveAccessoryKind();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:equal>
                        <logic:notEqual name="<%=Constants.ACCESSORY_KIND%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_ACCESSORY_KIND)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveAccessoryKind();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:notEqual>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('accessoryKindFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.ACCESSORY_KIND%>" />
        <input type="hidden" id="callbackFunc"/>
    </form>
    <div name="accessoryKindFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('accessoryKindFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveAccessoryKind()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('accessoryKindFormshowHelpHideDiv')</div>
</div>