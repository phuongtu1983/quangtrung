<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div class="header"><bean:message key="vendor.title"/></div>
<form name="vendorOilForm">
    <table style="width: 100%">
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="vendor.detail.code"/></td>
            <td><html:text property="code" size="40" readonly="true" name="<%=Constants.VENDOR_OIL%>"/></td>
            <td height="30" style="padding-left: 10px; padding-right: 20px"><bean:message key="vendor.detail.name"/></td>
            <td><html:text property="name" size="40" readonly="true" name="<%=Constants.VENDOR_OIL%>"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="vendor.detail.add.commissionOnImport.title"/></td>
            <td><html:text property="commissionOnImport" size="40" name="<%=Constants.VENDOR_OIL%>" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
            <td style="padding-left: 10px; padding-right: 20px"><bean:message key="vendor.detail.add.maxDebt.title"/></td>
            <td><html:text property="maxDebt" size="40" name="<%=Constants.VENDOR_OIL%>" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
        </tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="store.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <button class="i_cross icon small red" onclick="return delTableRow('vendorOilForm', 'vendorOilStoreChk', 'vendorOilStoreDetailTbl');" tabindex="-1"><bean:message key="message.del"/></button>
                                <button class="i_plus icon small green" onclick="return addVendorOilStore();" tabindex="-1"><bean:message key="message.add"/></button>
                            </td>
                            <td>
                                <select style="width: 260px;" name="storeIdCombobox" id="storeIdCombobox">
                                    <logic:iterate id="store_iter" name="<%=Constants.STORE_LIST%>">
                                        <option  value="${store_iter.id}">${store_iter.name}</option>
                                    </logic:iterate>
                                </select>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr><td colspan="4"><div><%@include  file="/vendor/oil/storedetails.jsp" %></div></td></tr>
        <tr>
            <td align="center" height="30" colspan="4">
                <p style="margin-top: 0; margin-bottom: 0">
                    <logic:equal name="<%=Constants.VENDOR_OIL%>" property="id" value="0">
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_VENDOR)) {%> 
                        <button class="i_create_write icon small green" onclick="return saveVendorOil();"><bean:message key="message.save"/></button>
                        <%}%>
                    </logic:equal>
                    <logic:notEqual name="<%=Constants.VENDOR_OIL%>" property="id" value="0">
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_VENDOR)) {%> 
                        <button class="i_create_write icon small green" onclick="return saveVendorOil();"><bean:message key="message.save"/></button>
                        <%}%>
                    </logic:notEqual>
                    <button class="i_access_denied icon small yellow" onclick="return loadVendorOilPanel();"><bean:message key="message.close"/></button>
            </td>
        </tr>
    </table>
    <html:hidden property="id" name="<%=Constants.VENDOR_OIL%>" />
    <input type="hidden" id="callbackFunc"/>
</form>
<div name="vendorOilFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
    Ctrl+C : Đóng
    Ctrl+S : Lưu
</div>
<div id="shiftCFunctionHideDiv" style="display:none">loadVendorOilPanel()</div>
<div id="shiftSFunctionHideDiv" style="display:none">saveVendorOil()</div>
<div id="shiftEscFunctionHideDiv" style="display:none">loadVendorOilPanel()</div>
<div id="vendorOilStoreHideDiv" style="display:none"></div>