<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div class="header"><bean:message key="invoiceSolar.header.add.title"/></div>
<form name="invoiceSolarForm">
    <table width="100%" cellspacing="0" cellpadding="0" >
        <tr>
            <td height="30" style="padding-right: 20px; width: 150px"><bean:message key="code.title"/></td>
            <td style="width: 200px"><html:text property="code" size="30" name="<%=Constants.INVOICE_SOLAR%>" readonly="true" tabindex="-1"/></td>
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
            <td height="30" style="padding-right: 20px"><bean:message key="invoiceSolar.detail.number"/></td>
            <td><html:text property="number" size="30" name="<%=Constants.INVOICE_SOLAR%>"/></td>
            <td style="padding-right: 20px;padding-left: 10px;"><bean:message key="date.title"/></td>
            <td><html:text property="createdDate" styleId="invoiceSolarDate" size="30" name="<%=Constants.INVOICE_SOLAR%>" tabindex="-1"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="invoiceSolar.detail.amount"/></td>
            <td><html:text property="amount" size="30" name="<%=Constants.INVOICE_SOLAR%>" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="invoiceSolar.detail.amountPaid"/></td>
            <td><html:text property="amountPaid" size="30" name="<%=Constants.INVOICE_SOLAR%>" readonly="true"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="note.title"/></td>
            <td colspan="3"><html:text property="note" size="97" name="<%=Constants.INVOICE_SOLAR%>" /></td>
        </tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="invoiceSolar.solar.list.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <button class="i_cross icon small red" onclick="return delTableRow('invoiceSolarForm', 'invoiceSolarDetailChk', 'invoiceSolarDetailTbl');" tabindex="-1"><bean:message key="message.del"/></button>
                                <button class="i_plus icon small green" onclick="return showSearchSolarSale();" tabindex="-1"><bean:message key="message.add"/></button>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td colspan="4"><div><%@include  file="/invoicesolar/details.jsp" %></div></td>
        </tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="invoiceSolar.paid.list.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <button class="i_cross icon small red" onclick="return delTableRow('invoiceSolarForm', 'invoiceSolarPaidDetailChk', 'invoiceSolarPaidDetailTbl');" tabindex="-1"><bean:message key="message.del"/></button>
                                <button class="i_plus icon small green" onclick="return addInvoiceSolarPaidDetail();" tabindex="-1"><bean:message key="message.add"/></button>
                            </td>
                            <td><input type="text" size="20" id="invoiceSolarPaidDate"/></td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td colspan="4"><div><%@include  file="/invoicesolar/paydetails.jsp" %></div></td>
        </tr>
        <tr>
            <td align="center" colspan="4">
                <p style="margin-top: 0; margin-bottom: 0">
                    <logic:equal name="<%=Constants.INVOICE_SOLAR%>" property="id" value="0">
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_INVOICE_SOLAR)) {%> 
                        <button class="i_create_write icon small green" onclick="return saveInvoiceSolar();"><bean:message key="message.save"/></button>
                        <%}%>
                    </logic:equal>
                    <logic:greaterThan name="<%=Constants.INVOICE_SOLAR%>" property="id" value="0">
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_INVOICE_SOLAR)) {%> 
                        <button class="i_create_write icon small green" onclick="return saveInvoiceSolar();"><bean:message key="message.save"/></button>
                        <%}%>
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_INVOICE_SOLAR)) {%> 
                        <button class="i_trashcan icon small red" onclick="return delInvoiceSolar();"><bean:message key="message.del"/></button>
                        <%}%>
                    </logic:greaterThan>
                    <button class="i_access_denied icon small yellow" onclick="return loadInvoiceSolarPanel();"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.INVOICE_SOLAR%>" />
        <html:hidden property="customerId" name="<%=Constants.INVOICE_SOLAR%>" />
        <input type="hidden" name="customerSelectedHidden" value="0"/>
    </form>
    <div name="invoiceSolarFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
            Ctrl+C : Đóng
            Ctrl+S : Lưu
        </div>
        <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('invoiceSolarFormshowHelpHideDiv')</div>
        <div id="shiftSFunctionHideDiv" style="display:none">saveInvoiceSolar()</div>
        <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('invoiceSolarFormshowHelpHideDiv')</div>
        <div id="invoiceSolarDetailHideDiv" style="display:none"></div>
        <div id="invoiceSolarPaidHideDiv" style="display:none"></div>