<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div class="header"><bean:message key="goodImport.detail.add.title"/></div>
<form name="goodImportForm">
    <table style="width: 100%">
        <tr>
            <td width="160" height="30"><bean:message key="code.title"/></td>
            <td width="160"><html:text property="code" size="30" name="<%=Constants.GOOD_IMPORT%>" readonly="true"/></td>
            <td width="170"  style="padding-right: 20px;padding-left: 10px"><bean:message key="date.title"/></td>
            <td><html:text property="createdDate" size="30" name="<%=Constants.GOOD_IMPORT%>" styleId="goodImportCreatedDate" readonly="true"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="vendor.title"/></td>
            <td>
                <html:select property="vendorId" name="<%=Constants.GOOD_IMPORT%>" style="width:195px">
                    <html:options collection="<%=Constants.VENDOR_LIST%>" property="id" labelProperty="name"/>
                </html:select>
            </td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="store.title"/></td>
            <td>
                <html:select property="storeId" name="<%=Constants.GOOD_IMPORT%>" style="width:195px">
                    <html:options collection="<%=Constants.STORE_LIST%>" property="id" labelProperty="name"/>
                </html:select>
            </td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="rate.title"/></td>
            <td><html:text property="rate" size="30" name="<%=Constants.GOOD_IMPORT%>" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="total.title"/></td>
            <td><html:text property="total" size="30" name="<%=Constants.GOOD_IMPORT%>" readonly="true"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="paid.title"/></td>
            <td><html:text property="paid" size="30" name="<%=Constants.GOOD_IMPORT%>" onblur="return formPaidChanged('goodImportForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="debt.title"/></td>
            <td><html:text property="debt" size="30" name="<%=Constants.GOOD_IMPORT%>" readonly="true"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="account.title"/></td>
            <td colspan="3">
                <html:select property="accountId" name="<%=Constants.GOOD_IMPORT%>" style="width:195px">
                    <html:options collection="<%=Constants.ACCOUNT_LIST%>" property="id" labelProperty="number"/>
                </html:select>
            </td>
        </tr>
        <tr>
            <td height="30"><bean:message key="note.title"/></td>
            <td colspan="3"><html:textarea rows="3" cols="93" property="note" name="<%=Constants.GOOD_IMPORT%>"/></td>
        </tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="detail.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <logic:equal name="<%=Constants.GOOD_IMPORT%>" property="id" value="0">
                                    <button class="i_cross icon small red" onclick="return delTableRow('goodImportForm', 'goodImportGoodChk', 'goodImportDetailTbl');"><bean:message key="message.del"/></button>
                                </logic:equal>
                                <button class="i_plus icon small green" onclick="return addGoodImportGood();"><bean:message key="message.add"/></button>
                            </td>
                            <td>
                                <select style="width: 260px;" name="goodIdCombobox" id="goodIdCombobox">
                                    <logic:iterate id="good_iter" name="<%=Constants.GOOD_LIST%>">
                                        <option  value="${good_iter.id}">${good_iter.name}</option>
                                    </logic:iterate>
                                </select>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td colspan="4"><div><%@include  file="/goodimport/details.jsp" %></div></td>
        </tr>
        <tr>
            <td colspan="4" align="center" height="50">
                <logic:equal name="<%=Constants.GOOD_IMPORT%>" property="id" value="0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_GOOD_IMPORT)) {%> 
                    <button class="i_create_write icon small green" onclick="return saveGoodImport();"><bean:message key="message.save"/></button>
                    <%}%>
                </logic:equal>
                <logic:notEqual name="<%=Constants.GOOD_IMPORT%>" property="id" value="0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_GOOD_IMPORT)) {%> 
                    <logic:equal name="<%=Constants.GOOD_IMPORT%>" property="canEdit" value="1">
                        <button class="i_create_write icon small green" onclick="return saveGoodImport();"><bean:message key="message.save"/></button>
                    </logic:equal>
                    <%}%>
                </logic:notEqual>
                <logic:greaterThan name="<%=Constants.GOOD_IMPORT%>" property="id" value="0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_GOOD_IMPORT)) {%> 
                    <logic:equal name="<%=Constants.GOOD_IMPORT%>" property="canEdit" value="1">
                        <button class="i_trashcan icon small red" onclick="return delGoodImport();"><bean:message key="message.del"/></button>
                    </logic:equal>
                    <%}%>
                </logic:greaterThan>
                <button class="i_access_denied icon small yellow" onclick="return loadGoodImportPanel();"><bean:message key="message.close"/></button>
            </td>
        </tr>
    </table>
    <html:hidden property="id" name="<%=Constants.GOOD_IMPORT%>" />
    <input type="hidden" id="callbackFunc"/>
    <input type="hidden" name="foodSelectedHidden" value="0"/>
</form>
<div name="goodImportFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
    Ctrl+C : Đóng
    Ctrl+S : Lưu
</div>
<div id="shiftCFunctionHideDiv" style="display:none">loadGoodImportPanel()</div>
<div id="shiftSFunctionHideDiv" style="display:none">saveGoodImport()</div>
<div id="goodImportGoodHideDiv" style="display:none"></div>