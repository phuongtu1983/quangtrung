<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="transportServiceFormshowHelpHideDivContent">
    <form name="transportServiceForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="code.title"/></td>
                            <td><html:text property="code" size="30" name="<%=Constants.TRANSPORT_SERVICE%>" readonly="true" tabindex="-1"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="date.title"/></td>
                            <td><html:text property="createdDate" styleId="transportServiceDate" size="30" name="<%=Constants.TRANSPORT_SERVICE%>" tabindex="-1"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="transportService.detail.vendor"/></td>
                            <td>
                                <html:select property="vendorId" name="<%=Constants.TRANSPORT_SERVICE%>" style="width:195px">
                                    <html:options collection="<%=Constants.VENDOR_LIST%>" property="id" labelProperty="name"/>
                                </html:select>
                            </td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="transportService.detail.customer"/></td>
                            <td>
                                <select style="width: 195px;" name="customerIdCombobox" id="customerIdCombobox">
                                    <logic:iterate id="customer_iter" name="<%=Constants.CUSTOMER_LIST%>">
                                        <option  value="${customer_iter.id}">${customer_iter.name}</option>
                                    </logic:iterate>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="transportService.detail.transporter"/></td>
                            <td>
                                <html:select property="transporterId" name="<%=Constants.TRANSPORT_SERVICE%>" style="width:195px">
                                    <html:options collection="<%=Constants.TRANSPORTER_LIST%>" property="id" labelProperty="name"/>
                                </html:select>
                            </td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="transportService.detail.chargeFor"/></td>
                            <td>
                                <html:select property="chargeFor" name="<%=Constants.TRANSPORT_SERVICE%>" style="width:195px">
                                    <html:options collection="<%=Constants.TRANSPORTER_CHARGE_FOR_LIST%>" property="value" labelProperty="label"/>
                                </html:select>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="transportService.detail.inQuantity"/></td>
                            <td><html:text property="inQuantity" size="30" name="<%=Constants.TRANSPORT_SERVICE%>" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="transportService.detail.outQuantity"/></td>
                            <td><html:text property="outQuantity" size="30" name="<%=Constants.TRANSPORT_SERVICE%>" onblur="return transportServiceCaculateAmount();" onkeypress="return readonlyFloat(event);"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="price.title"/></td>
                            <td><html:text property="price" size="30" name="<%=Constants.TRANSPORT_SERVICE%>" onblur="return transportServiceCaculateAmount();" onkeypress="return readonlyFloat(event);"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="transportService.detail.priceDiff"/></td>
                            <td><html:text property="priceDiff" size="30" name="<%=Constants.TRANSPORT_SERVICE%>" onblur="return transportServiceCaculateAmount();" onkeypress="return readonlyFloat(event);"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="rate.title"/></td>
                            <td><html:text property="rate" size="30" name="<%=Constants.TRANSPORT_SERVICE%>" onblur="return transportServiceCaculateAmount();" onkeypress="return readonlyFloat(event);"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="transportService.detail.rateDiff"/></td>
                            <td><html:text property="rateDiff" size="30" name="<%=Constants.TRANSPORT_SERVICE%>" onblur="return transportServiceCaculateAmount();" onkeypress="return readonlyFloat(event);"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="amount.title"/></td>
                            <td><html:text property="amount" size="30" name="<%=Constants.TRANSPORT_SERVICE%>" readonly="true" tabindex="-1"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="paid.title"/></td>
                            <td><html:text property="paid" size="30" name="<%=Constants.TRANSPORT_SERVICE%>" onblur="return transportServicePaidChanged();" onkeypress="return readonlyFloat(event);"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="debt.title"/></td>
                            <td><html:text property="debt" size="30" name="<%=Constants.TRANSPORT_SERVICE%>" readonly="true" tabindex="-1"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="account.title"/></td>
                            <td>
                                <html:select property="accountId" name="<%=Constants.TRANSPORT_SERVICE%>" style="width:195px">
                                    <html:options collection="<%=Constants.ACCOUNT_LIST%>" property="id" labelProperty="number"/>
                                </html:select>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="note.title"/></td>
                            <td colspan="3"><html:text property="note" size="93" name="<%=Constants.TRANSPORT_SERVICE%>" /></td>
                        </tr>
                    </table>
                </td></tr>
            <tr>
                <td align="center">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <logic:equal name="<%=Constants.TRANSPORT_SERVICE%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_TRANSPORT_SERVICE)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveTransportService();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:equal>
                        <logic:greaterThan name="<%=Constants.TRANSPORT_SERVICE%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_TRANSPORT_SERVICE)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveTransportService();"><bean:message key="message.save"/></button>
                            <%}%>
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_TRANSPORT_SERVICE)) {%> 
                            <button class="i_trashcan icon small red" onclick="return delTransportService();"><bean:message key="message.del"/></button>
                            <%}%>
                        </logic:greaterThan>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('transportServiceFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.TRANSPORT_SERVICE%>" />
        <input type="hidden" id="callbackFunc"/>
        <html:hidden property="customerId" name="<%=Constants.TRANSPORT_SERVICE%>" />
        <input type="hidden" name="customerSelectedHidden" value="0"/>
    </form>
    <div name="transportServiceFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('transportServiceFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveTransportService()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('transportServiceFormshowHelpHideDiv')</div>
</div>