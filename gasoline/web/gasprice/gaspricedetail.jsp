<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="gasPriceFormshowHelpHideDivContent">
    <form name="gasPriceForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="code.title"/></td>
                            <td><html:text property="code" size="30" name="<%=Constants.GAS_PRICE%>" readonly="true" tabindex="-1"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="customer.title"/></td>
                            <td>
                                <select style="width: 195px;" name="customerIdCombobox" id="customerIdCombobox">
                                    <logic:iterate id="customer_iter" name="<%=Constants.CUSTOMER_LIST%>">
                                        <option  value="${customer_iter.id}">${customer_iter.name}</option>
                                    </logic:iterate>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="fromDate.title"/></td>
                            <td><html:text property="fromDate" styleId="gasPriceFromDate" size="30" name="<%=Constants.GAS_PRICE%>"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="toDate.title"/></td>
                            <td><html:text property="toDate" styleId="gasPriceToDate" size="30" name="<%=Constants.GAS_PRICE%>"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="price.sale.title"/></td>
                            <td><html:text property="price" size="30" name="<%=Constants.GAS_PRICE%>" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);" tabindex="0"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="note.title"/></td>
                            <td><html:text property="note" size="30" name="<%=Constants.GAS_PRICE%>"/></td>
                        </tr>
                    </table>
                </td></tr>
            <tr>
                <td align="center">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <logic:equal name="<%=Constants.GAS_PRICE%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_GAS_PRICE)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveGasPrice();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:equal>
                        <logic:notEqual name="<%=Constants.GAS_PRICE%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_GAS_PRICE)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveGasPrice();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:notEqual>
                        <logic:greaterThan name="<%=Constants.GAS_PRICE%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_GAS_PRICE)) {%> 
                            <button class="i_trashcan icon small red" onclick="return delGasPrice();"><bean:message key="message.del"/></button>
                            <%}%>
                        </logic:greaterThan>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('gasPriceFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.GAS_PRICE%>" />
        <input type="hidden" id="callbackFunc"/>
        <input type="hidden" name="customerSelectedHidden" value="0"/>
        <html:hidden property="customerId" name="<%=Constants.GAS_PRICE%>" />
    </form>
    <div name="gasPriceFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('gasPriceFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveGasPrice()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('gasPriceFormshowHelpHideDiv')</div>
</div>