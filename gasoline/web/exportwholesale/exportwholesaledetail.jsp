<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div class="header"><bean:message key="exportWholesale.detail.add.title"/></div>
<form name="exportWholesaleForm">
    <table style="width: 100%">
        <tr>
            <td width="160" height="30"><bean:message key="code.title"/></td>
            <td width="260"><html:text property="code" size="30" name="<%=Constants.EXPORT_WHOLESALE%>" readonly="true"/></td>
            <td width="170"  style="padding-right: 20px;padding-left: 10px"><bean:message key="date.title"/></td>
            <td><html:text property="createdDate" size="30" name="<%=Constants.EXPORT_WHOLESALE%>" styleId="exportWholesaleCreatedDate"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="customer.title"/></td>
            <td>
                <html:select property="customerId" name="<%=Constants.EXPORT_WHOLESALE%>" style="width:195px" styleId="exportWholesaleCustomerId">
                    <html:options collection="<%=Constants.CUSTOMER_LIST%>" property="id" labelProperty="name"/>
                </html:select>
            </td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="total.title"/></td>
            <td colspan="3"><html:text property="total" size="30" name="<%=Constants.EXPORT_WHOLESALE%>" readonly="true"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="discount.title"/></td>
            <td><html:text property="discount" size="30" name="<%=Constants.EXPORT_WHOLESALE%>" onblur="return formPaidDiscountChanged('exportWholesaleForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="amount.title"/></td>
            <td><html:text property="totalPay" size="30" name="<%=Constants.EXPORT_WHOLESALE%>" readonly="true"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="paid.title"/></td>
            <td><html:text property="paid" size="30" name="<%=Constants.EXPORT_WHOLESALE%>" onblur="return formPaidDiscountChanged('exportWholesaleForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="debt.title"/></td>
            <td><html:text property="debt" size="30" name="<%=Constants.EXPORT_WHOLESALE%>" readonly="true"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px""><bean:message key="account.title"/></td>
            <td colspan="3">
                <html:select property="accountId" name="<%=Constants.EXPORT_WHOLESALE%>" style="width:195px">
                    <html:options collection="<%=Constants.ACCOUNT_LIST%>" property="id" labelProperty="number"/>
                </html:select>
            </td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="note.title"/></td>
            <td colspan="3"><html:text property="note" size="111" name="<%=Constants.EXPORT_WHOLESALE%>"/></td>
        </tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="detail.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <button class="i_cross icon small red" onclick="return delTableRow('exportWholesaleForm', 'exportWholesaleGoodChk', 'exportWholesaleDetailTbl');"><bean:message key="message.del"/></button>
                                <button class="i_plus icon small green" onclick="return addExportWholesaleGood();"><bean:message key="message.add"/></button>
                            </td>
                            <td>
                                <select style="width: 260px;" name="goodIdCombobox" id="goodIdCombobox">
                                    <logic:iterate id="good_iter" name="<%=Constants.SHELL_LIST%>">
                                        <option  value="${good_iter.id}">${good_iter.name}</option>
                                    </logic:iterate>
                                </select>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr><td colspan="4"><div><%@include  file="/exportwholesale/details.jsp" %></div></td></tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="shellReturn.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <button class="i_cross icon small red" onclick="return delTableRow('exportWholesaleForm', 'exportWholesaleReturnShellChk', 'exportWholesaleReturnShellDetailTbl');"><bean:message key="message.del"/></button>
                                <button class="i_plus icon small green" onclick="return addExportWholesaleReturnShell();"><bean:message key="message.add"/></button>
                            </td>
                            <td>
                                <select style="width: 260px;" name="returnShellIdCombobox" id="returnShellIdCombobox">
                                    <logic:iterate id="returnShell_iter" name="<%=Constants.SHELL_RETURN_LIST%>">
                                        <option  value="${returnShell_iter.id}">${returnShell_iter.name}</option>
                                    </logic:iterate>
                                </select>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr><td colspan="4"><div><%@include  file="/exportwholesale/shelldetails.jsp" %></div></td></tr>
        <tr>
            <td colspan="4" align="center" height="50">
                <logic:equal name="<%=Constants.EXPORT_WHOLESALE%>" property="id" value="0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_EXPORT_WHOLESALE)) {%> 
                    <button class="i_create_write icon small green" onclick="return saveExportWholesale();"><bean:message key="message.save"/></button>
                    <%}%>
                </logic:equal>
                <logic:notEqual name="<%=Constants.EXPORT_WHOLESALE%>" property="id" value="0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_EXPORT_WHOLESALE)) {%> 
                    <logic:equal name="<%=Constants.EXPORT_WHOLESALE%>" property="canEdit" value="1">
                        <button class="i_create_write icon small green" onclick="return saveExportWholesale();"><bean:message key="message.save"/></button>
                    </logic:equal>
                    <%}%>
                </logic:notEqual>
                <logic:greaterThan name="<%=Constants.EXPORT_WHOLESALE%>" property="id" value="0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_EXPORT_WHOLESALE)) {%> 
                    <logic:equal name="<%=Constants.EXPORT_WHOLESALE%>" property="canEdit" value="1">
                        <button class="i_trashcan icon small red" onclick="return delExportWholesale();"><bean:message key="message.del"/></button>
                    </logic:equal>
                    <%}%>
                </logic:greaterThan>
                <button class="i_access_denied icon small yellow" onclick="return loadExportWholesalePanel();"><bean:message key="message.close"/></button>
            </td>
        </tr>
    </table>
    <html:hidden property="id" name="<%=Constants.EXPORT_WHOLESALE%>" />
    <input type="hidden" id="callbackFunc"/>
    <input type="hidden" name="shellSelectedHidden" value="0"/>
    <input type="hidden" name="returnShellSelectedHidden" value="0"/>
</form>
<div name="exportWholesaleFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
    Ctrl+C : Đóng
    Ctrl+S : Lưu
</div>
<div id="shiftCFunctionHideDiv" style="display:none">loadExportWholesalePanel()</div>
<div id="shiftSFunctionHideDiv" style="display:none">saveExportWholesale()</div>
<div id="exportWholesaleGoodHideDiv" style="display:none"></div>
<div id="exportWholesaleReturnShellHideDiv" style="display:none"></div>