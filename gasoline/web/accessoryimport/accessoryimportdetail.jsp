<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div class="header"><bean:message key="accessoryImport.detail.add.title"/></div>
<form name="accessoryImportForm">
    <table style="width: 100%">
        <tr>
            <td width="160" height="30"><bean:message key="code.title"/></td>
            <td width="160"><html:text property="code" size="30" name="<%=Constants.ACCESSORY_IMPORT%>" readonly="true" tabindex="-1"/></td>
            <td width="170"  style="padding-right: 20px;padding-left: 10px"><bean:message key="date.title"/></td>
            <td><html:text property="createdDate" size="30" name="<%=Constants.ACCESSORY_IMPORT%>" styleId="accessoryImportCreatedDate" tabindex="-1"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="vendor.title"/></td>
            <td>
                <html:select property="vendorId" name="<%=Constants.ACCESSORY_IMPORT%>" style="width:195px" tabindex="0">
                    <html:options collection="<%=Constants.VENDOR_LIST%>" property="id" labelProperty="name"/>
                </html:select>
            </td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="total.title"/></td>
            <td><html:text property="total" size="30" name="<%=Constants.ACCESSORY_IMPORT%>" readonly="true" tabindex="-1"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="paid.title"/></td>
            <td><html:text property="paid" size="30" name="<%=Constants.ACCESSORY_IMPORT%>" onblur="return formPaidChanged('accessoryImportForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="debt.title"/></td>
            <td><html:text property="debt" size="30" name="<%=Constants.ACCESSORY_IMPORT%>" readonly="true" tabindex="-1"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px""><bean:message key="account.title"/></td>
            <td colspan="3">
                <html:select property="accountId" name="<%=Constants.ACCESSORY_IMPORT%>" style="width:195px">
                    <html:options collection="<%=Constants.ACCOUNT_LIST%>" property="id" labelProperty="number"/>
                </html:select>
            </td>
        </tr>
        <tr>
            <td height="30"><bean:message key="note.title"/></td>
            <td colspan="3"><html:textarea rows="3" cols="93" property="note" name="<%=Constants.ACCESSORY_IMPORT%>"/></td>
        </tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="detail.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <button class="i_cross icon small red" onclick="return delTableRow('accessoryImportForm', 'accessoryImportAccessoryChk', 'accessoryImportDetailTbl');" tabindex="-1"><bean:message key="message.del"/></button>
                                <button class="i_plus icon small green" onclick="return addAccessoryImportAccessory();" tabindex="-1"><bean:message key="message.add"/></button>
                            </td>
                            <td>
                                <select style="width: 260px;" name="accessoryIdCombobox" id="accessoryIdCombobox">
                                    <logic:iterate id="accessory_iter" name="<%=Constants.ACCESSORY_LIST%>">
                                        <option  value="${accessory_iter.id}">${accessory_iter.name}</option>
                                    </logic:iterate>
                                </select>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td colspan="4"><div><%@include  file="/accessoryimport/details.jsp" %></div></td>
        </tr>
        <tr>
            <td colspan="4" align="center" height="50">
                <logic:equal name="<%=Constants.ACCESSORY_IMPORT%>" property="id" value="0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_ACCESSORY_IMPORT)) {%> 
                    <button class="i_create_write icon small green" onclick="return saveAccessoryImport();"><bean:message key="message.save"/></button>
                    <%}%>
                </logic:equal>
                <logic:notEqual name="<%=Constants.ACCESSORY_IMPORT%>" property="id" value="0">
                    <logic:equal name="<%=Constants.ACCESSORY_IMPORT%>" property="canEdit" value="1">
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_ACCESSORY_IMPORT)) {%> 
                        <button class="i_create_write icon small green" onclick="return saveAccessoryImport();"><bean:message key="message.save"/></button>
                        <%}%>
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_ACCESSORY_IMPORT)) {%> 
                        <button class="i_trashcan icon small red" onclick="return delAccessoryImport();"><bean:message key="message.del"/></button>
                        <%}%>
                    </logic:equal>
                </logic:notEqual>
                <button class="i_access_denied icon small yellow" onclick="return loadAccessoryImportPanel();"><bean:message key="message.close"/></button>
            </td>
        </tr>
    </table>
    <html:hidden property="id" name="<%=Constants.ACCESSORY_IMPORT%>" />
    <input type="hidden" id="callbackFunc"/>
    <input type="hidden" name="accessorySelectedHidden" value="0"/>
</form>
<div name="accessoryImportFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
    Ctrl+C : Đóng
    Ctrl+S : Lưu
</div>
<div id="shiftCFunctionHideDiv" style="display:none">loadAccessoryImportPanel()</div>
<div id="shiftSFunctionHideDiv" style="display:none">saveAccessoryImport()</div>
<div id="accessoryImportAccessoryHideDiv" style="display:none"></div>