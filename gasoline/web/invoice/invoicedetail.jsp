<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div class="header"><bean:message key="invoice.header.add.title"/></div>
<form name="invoiceForm">
    <table width="100%" cellspacing="0" cellpadding="0" >
        <tr>
            <td height="30" style="padding-right: 20px; width: 150px"><bean:message key="code.title"/></td>
            <td style="width: 200px"><html:text property="code" size="30" name="<%=Constants.INVOICE%>" readonly="true" tabindex="-1"/></td>
            <td style="padding-right: 20px;padding-left: 10px;width: 160px"><bean:message key="customer.title"/></td>
            <td>
                <select style="width: 195px;" name="customerIdCombobox" id="customerIdCombobox" tabindex="0">
                    <logic:iterate id="customer_iter" name="<%=Constants.CUSTOMER_LIST%>">
                        <option  value="${customer_iter.id}">${customer_iter.name}</option>
                    </logic:iterate>
                </select>
            </td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="invoice.detail.number"/></td>
            <td><html:text property="number" size="30" name="<%=Constants.INVOICE%>"/></td>
            <td style="padding-right: 20px;padding-left: 10px;"><bean:message key="date.title"/></td>
            <td><html:text property="createdDate" styleId="invoiceDate" size="30" name="<%=Constants.INVOICE%>" tabindex="-1"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="invoice.detail.amount"/></td>
            <td><html:text property="amount" size="30" name="<%=Constants.INVOICE%>" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="invoice.detail.amountPaid"/></td>
            <td><html:text property="amountPaid" size="30" name="<%=Constants.INVOICE%>" readonly="true"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="note.title"/></td>
            <td colspan="3"><html:text property="note" size="97" name="<%=Constants.INVOICE%>" /></td>
        </tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="invoice.oil.list.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <button class="i_cross icon small red" onclick="return delTableRow('invoiceForm', 'invoiceDetailChk', 'invoiceDetailTbl');" tabindex="-1"><bean:message key="message.del"/></button>
                                <button class="i_plus icon small green" onclick="return showSearchOilSale();" tabindex="-1"><bean:message key="message.add"/></button>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td colspan="4"><div><%@include  file="/invoice/details.jsp" %></div></td>
        </tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="invoice.paid.list.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <button class="i_cross icon small red" onclick="return delTableRow('invoiceForm', 'invoicePaidDetailChk', 'invoicePaidDetailTbl');" tabindex="-1"><bean:message key="message.del"/></button>
                                <button class="i_plus icon small green" onclick="return addInvoicePaidDetail();" tabindex="-1"><bean:message key="message.add"/></button>
                            </td>
                            <td><input type="text" size="20" id="invoicePaidDate"/></td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td colspan="4"><div><%@include  file="/invoice/paydetails.jsp" %></div></td>
        </tr>
        <tr>
            <td align="center" colspan="4">
                <p style="margin-top: 0; margin-bottom: 0">
                    <logic:equal name="<%=Constants.INVOICE%>" property="id" value="0">
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_INVOICE)) {%> 
                        <button class="i_create_write icon small green" onclick="return saveInvoice();"><bean:message key="message.save"/></button>
                        <%}%>
                    </logic:equal>
                    <logic:greaterThan name="<%=Constants.INVOICE%>" property="id" value="0">
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_INVOICE)) {%> 
                        <button class="i_create_write icon small green" onclick="return saveInvoice();"><bean:message key="message.save"/></button>
                        <%}%>
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_INVOICE)) {%> 
                        <button class="i_trashcan icon small red" onclick="return delInvoice();"><bean:message key="message.del"/></button>
                        <%}%>
                    </logic:greaterThan>
                    <button class="i_access_denied icon small yellow" onclick="return loadInvoicePanel();"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.INVOICE%>" />
        <html:hidden property="customerId" name="<%=Constants.INVOICE%>" />
        <input type="hidden" name="customerSelectedHidden" value="0"/>
    </form>
    <div name="invoiceFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
            Ctrl+C : Đóng
            Ctrl+S : Lưu
        </div>
        <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('invoiceFormshowHelpHideDiv')</div>
        <div id="shiftSFunctionHideDiv" style="display:none">saveInvoice()</div>
        <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('invoiceFormshowHelpHideDiv')</div>
        <div id="invoiceDetailHideDiv" style="display:none"></div>
        <div id="invoicePaidHideDiv" style="display:none"></div>