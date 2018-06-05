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
                            <td><html:text property="code" size="30" name="<%=Constants.GAS_PRICE%>" readonly="true"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="customer.detail.kind"/></td>
                            <td>
                                <html:select property="kind" name="<%=Constants.GAS_PRICE%>" style="width:195px">
                                    <html:options collection="<%=Constants.CUSTOMER_KIND_LIST%>" property="value" labelProperty="label"/>
                                </html:select>
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
                            <td><html:text property="price" size="30" name="<%=Constants.GAS_PRICE%>" onkeyup="try2FloatFormatOnKeyUp(this,event);" onkeypress="return readonlyFloat(event);"/></td>
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
    </form>
    <div name="gasPriceFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('gasPriceFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveGasPrice()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('gasPriceFormshowHelpHideDiv')</div>
</div>