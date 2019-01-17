<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="lpgImportFormshowHelpHideDivContent">
    <form name="lpgImportForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="code.title"/></td>
                            <td><html:text property="code" size="30" name="<%=Constants.LPG_IMPORT%>" readonly="true" tabindex="-1"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="date.title"/></td>
                            <td><html:text property="importDate" styleId="lpgImportDate" size="30" name="<%=Constants.LPG_IMPORT%>" tabindex="-1"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="vendor.title"/></td>
                            <td>
                                <html:select property="vendorId" name="<%=Constants.LPG_IMPORT%>" style="width:195px">
                                    <html:options collection="<%=Constants.VENDOR_LIST%>" property="id" labelProperty="name"/>
                                </html:select>
                            </td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="lpgImport.detail.importVendor"/></td>
                            <td>
                                <html:select property="importVendorId" name="<%=Constants.LPG_IMPORT%>" style="width:195px">
                                    <html:options collection="<%=Constants.STOCK_VENDOR_LIST%>" property="id" labelProperty="name"/>
                                </html:select>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="lpgImport.detail.paperQuantity"/></td>
                            <td><html:text property="paperQuantity" size="30" name="<%=Constants.LPG_IMPORT%>" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="lpgImport.detail.actualQuantity"/></td>
                            <td><html:text property="actualQuantity" size="30" name="<%=Constants.LPG_IMPORT%>" onblur="return lpgImportCaculateAmount();" onkeypress="return readonlyFloat(event);"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="price.title"/></td>
                            <td><html:text property="price" size="30" name="<%=Constants.LPG_IMPORT%>" onblur="return lpgImportCaculateAmount();" onkeypress="return readonlyFloat(event);"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="tax.title"/></td>
                            <td><html:text property="vat" size="30" name="<%=Constants.LPG_IMPORT%>" onblur="return lpgImportCaculateAmount();" onkeypress="return readonlyFloat(event);"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="rate.title"/></td>
                            <td><html:text property="rate" size="30" name="<%=Constants.LPG_IMPORT%>" onblur="return lpgImportCaculateAmount();" onkeypress="return readonlyFloat(event);"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="amount.title"/></td>
                            <td><html:text property="total" size="30" name="<%=Constants.LPG_IMPORT%>" readonly="true" tabindex="-1"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="amount.invoice.title"/></td>
                            <td><html:text property="invoiceTotal" size="30" name="<%=Constants.LPG_IMPORT%>" onblur="return formInvoiceTotalChanged('lpgImportForm');" onkeypress="return readonlyFloat(event);"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="paid.title"/></td>
                            <td><html:text property="paid" size="30" name="<%=Constants.LPG_IMPORT%>" onblur="return lpgImportPaidChanged();" onkeypress="return readonlyFloat(event);"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="debt.title"/></td>
                            <td><html:text property="debt" size="30" name="<%=Constants.LPG_IMPORT%>" readonly="true" tabindex="-1"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="account.title"/></td>
                            <td>
                                <html:select property="accountId" name="<%=Constants.LPG_IMPORT%>" style="width:195px">
                                    <html:options collection="<%=Constants.ACCOUNT_LIST%>" property="id" labelProperty="number"/>
                                </html:select>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="route.title"/></td>
                            <td colspan="3">
                                <select style="width: 560px;" name="routeIdCombobox" id="routeIdCombobox">
                                    <logic:iterate id="route_iter" name="<%=Constants.ROUTE_LIST%>">
                                        <option  value="${route_iter.id}">${route_iter.name}</option>
                                    </logic:iterate>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="note.title"/></td>
                            <td colspan="3"><html:text property="note" size="93" name="<%=Constants.LPG_IMPORT%>" /></td>
                        </tr>
                    </table>
                </td></tr>
            <tr>
                <td align="center">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <logic:equal name="<%=Constants.LPG_IMPORT%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_LPG_IMPORT)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveLpgImport();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:equal>
                        <logic:greaterThan name="<%=Constants.LPG_IMPORT%>" property="id" value="0">
                            <logic:equal name="<%=Constants.LPG_IMPORT%>" property="canEdit" value="1">
                                <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_LPG_IMPORT)) {%> 
                                <button class="i_create_write icon small green" onclick="return saveLpgImport();"><bean:message key="message.save"/></button>
                                <%}%>
                                <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_LPG_IMPORT)) {%> 
                                <button class="i_trashcan icon small red" onclick="return delLpgImport();"><bean:message key="message.del"/></button>
                                <%}%>
                            </logic:equal>
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_LPG_SALE)) {%> 
                            <button class="i_bended_arrow_left icon small blue" onclick="return getLpgSale(0, 'loadLpgSalePanel',<bean:write name="<%=Constants.LPG_IMPORT%>" property="id"/>);"><bean:message key="lpgSale.title"/></button>
                            <%}%>
                        </logic:greaterThan>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('lpgImportFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.LPG_IMPORT%>" />
        <input type="hidden" id="callbackFunc"/>
        <html:hidden property="routeId" name="<%=Constants.LPG_IMPORT%>" />
        <input type="hidden" name="routeSelectedHidden" value="0"/>
    </form>
    <div name="lpgImportFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('lpgImportFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveLpgImport()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('lpgImportFormshowHelpHideDiv')</div>
</div>