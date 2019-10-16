<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div class="header"><bean:message key="oilImport.detail.add.title"/></div>
<form name="oilImportForm">
    <table style="width: 100%">
        <tr>
            <td width="160" height="30"><bean:message key="code.title"/></td>
            <td width="160"><html:text property="code" size="30" name="<%=Constants.OIL_IMPORT%>" readonly="true" tabindex="-1"/></td>
            <td width="170"  style="padding-right: 20px;padding-left: 10px"><bean:message key="date.title"/></td>
            <td><html:text property="createdDate" size="30" name="<%=Constants.OIL_IMPORT%>" styleId="oilImportCreatedDate" tabindex="-1"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="vendor.title"/></td>
            <td>
                <html:select property="vendorId" name="<%=Constants.OIL_IMPORT%>" style="width:195px" tabindex="0" onchange="return oilImportVendorChanged(this);">
                    <html:options collection="<%=Constants.VENDOR_LIST%>" property="id" labelProperty="name"/>
                </html:select>
            </td>
            <td style="padding-left: 10px; padding-right: 20px"><bean:message key="customer.detail.percentage"/></td>
            <td><html:text property="commission" size="30" name="<%=Constants.OIL_IMPORT%>" readonly="true" tabindex="-1"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="store.title"/></td>
            <td colspan="3">
                <html:select property="storeId" name="<%=Constants.OIL_IMPORT%>" style="width:195px" tabindex="0">
                    <html:options collection="<%=Constants.STORE_LIST%>" property="id" labelProperty="name"/>
                </html:select>
            </td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="rate.title"/></td>
            <td><html:text property="rate" size="30" name="<%=Constants.OIL_IMPORT%>" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="oilImport.detail.add.totalBeforeCommission"/></td>
            <td><html:text property="totalBeforeCommission" size="30" name="<%=Constants.OIL_IMPORT%>" readonly="true" tabindex="-1"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="total.title"/></td>
            <td><html:text property="total" size="30" name="<%=Constants.OIL_IMPORT%>" readonly="true" tabindex="-1"/></td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="paid.title"/></td>
            <td><html:text property="paid" size="30" name="<%=Constants.OIL_IMPORT%>" onblur="return formPaidChanged('oilImportForm');" onkeypress="return readonlyFloat(event);"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="debt.title"/></td>
            <td><html:text property="debt" size="30" name="<%=Constants.OIL_IMPORT%>" readonly="true" tabindex="-1"/></td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="account.title"/></td>
            <td>
                <html:select property="accountId" name="<%=Constants.OIL_IMPORT%>" style="width:195px">
                    <html:options collection="<%=Constants.ACCOUNT_LIST%>" property="id" labelProperty="number"/>
                </html:select>
            </td>
        </tr>
        <tr>
            <td height="30"><bean:message key="note.title"/></td>
            <td colspan="3"><html:textarea rows="3" cols="93" property="note" name="<%=Constants.OIL_IMPORT%>"/></td>
        </tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="detail.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <button class="i_cross icon small red" onclick="return delTableRow('oilImportForm', 'oilImportOilChk', 'oilImportDetailTbl');" tabindex="-1"><bean:message key="message.del"/></button>
                                <button class="i_plus icon small green" onclick="return addOilImportOil();" tabindex="-1"><bean:message key="message.add"/></button>
                            </td>
                            <td>
                                <select style="width: 100px;" name="oilCodeCombobox" id="oilCodeCombobox">
                                    <logic:iterate id="oil_iter" name="<%=Constants.OIL_LIST%>">
                                        <option  value="${oil_iter.id}">${oil_iter.code}</option>
                                    </logic:iterate>
                                </select>
                            </td>
                            <td>
                                <select style="width: 300px;" name="oilNameCombobox" id="oilNameCombobox">
                                    <logic:iterate id="oil_iter" name="<%=Constants.OIL_LIST%>">
                                        <option  value="${oil_iter.id}">${oil_iter.name}</option>
                                    </logic:iterate>
                                </select>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td colspan="4"><div><%@include  file="/oilimport/details.jsp" %></div></td>
        </tr>
        <tr>
            <td colspan="4" align="center" height="50">
                <logic:equal name="<%=Constants.OIL_IMPORT%>" property="id" value="0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_OIL_IMPORT)) {%> 
                    <button class="i_create_write icon small green" onclick="return saveOilImport();"><bean:message key="message.save"/></button>
                    <%}%>
                </logic:equal>
                <logic:notEqual name="<%=Constants.OIL_IMPORT%>" property="id" value="0">
                    <logic:equal name="<%=Constants.OIL_IMPORT%>" property="canEdit" value="1">
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_OIL_IMPORT)) {%> 
                        <button class="i_create_write icon small green" onclick="return saveOilImport();"><bean:message key="message.save"/></button>
                        <%}%>
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_OIL_IMPORT)) {%> 
                        <button class="i_trashcan icon small red" onclick="return delOilImport();"><bean:message key="message.del"/></button>
                        <%}%>
                    </logic:equal>
                </logic:notEqual>
                <button class="i_access_denied icon small yellow" onclick="return loadOilImportPanel();"><bean:message key="message.close"/></button>
            </td>
        </tr>
    </table>
    <html:hidden property="id" name="<%=Constants.OIL_IMPORT%>" />
    <input type="hidden" id="callbackFunc"/>
    <input type="hidden" name="oilSelectedHidden" value="0"/>
</form>
<div name="oilImportFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
    Ctrl+C : Đóng
    Ctrl+S : Lưu
</div>
<div id="shiftCFunctionHideDiv" style="display:none">loadOilImportPanel()</div>
<div id="shiftSFunctionHideDiv" style="display:none">saveOilImport()</div>
<div id="oilImportOilHideDiv" style="display:none"></div>