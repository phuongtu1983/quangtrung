<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="debtVendorFormshowHelpHideDivContent">
    <form name="debtVendorForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="code.title"/></td>
                            <td><html:text property="code" size="30" name="<%=Constants.DEBT_VENDOR%>" readonly="true"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="date.title"/></td>
                            <td><html:text property="createdDate" styleId="debtVendorDate" size="30" name="<%=Constants.DEBT_VENDOR%>"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="vendor.title"/></td>
                            <td>
                                <select style="width: 195px;" name="vendorIdCombobox" id="vendorIdCombobox">
                                    <logic:iterate id="vendor_iter" name="<%=Constants.VENDOR_LIST%>">
                                        <option  value="${vendor_iter.id}">${vendor_iter.name}</option>
                                    </logic:iterate>
                                </select>
                            </td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="paid.title"/></td>
                            <td><html:text property="paid" size="30" name="<%=Constants.DEBT_VENDOR%>" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="account.title"/></td>
                            <td colspan="3">
                                <html:select property="accountId" name="<%=Constants.DEBT_VENDOR%>" style="width:195px">
                                    <html:options collection="<%=Constants.ACCOUNT_LIST%>" property="id" labelProperty="number"/>
                                </html:select>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="note.title"/></td>
                            <td colspan="3"><html:text property="note" size="93" name="<%=Constants.DEBT_VENDOR%>" /></td>
                        </tr>
                    </table>
                </td></tr>
            <tr>
                <td align="center">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <logic:equal name="<%=Constants.DEBT_VENDOR%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_DEBT_VENDOR)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveDebtVendor();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:equal>
                        <logic:notEqual name="<%=Constants.DEBT_VENDOR%>" property="id" value="0">
                            <logic:equal name="<%=Constants.DEBT_VENDOR%>" property="canEdit" value="1">
                                <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_DEBT_VENDOR)) {%> 
                                <button class="i_create_write icon small green" onclick="return saveDebtVendor();"><bean:message key="message.save"/></button>
                                <%}%>
                                <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_DEBT_VENDOR)) {%> 
                                <button class="i_trashcan icon small red" onclick="return delDebtVendor();"><bean:message key="message.del"/></button>
                                <%}%>
                            </logic:equal>
                        </logic:notEqual>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('debtVendorFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.DEBT_VENDOR%>" />
        <input type="hidden" id="callbackFunc"/>
        <html:hidden property="vendorId" name="<%=Constants.DEBT_VENDOR%>" />
        <input type="hidden" name="vendorSelectedHidden" value="0"/>
    </form>
    <div name="debtVendorFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('debtVendorFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveDebtVendor()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('debtVendorFormshowHelpHideDiv')</div>
</div>