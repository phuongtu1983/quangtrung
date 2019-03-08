<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="debtAdjustmentFormshowHelpHideDivContent">
    <form name="debtAdjustmentForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="code.title"/></td>
                            <td><html:text property="code" size="30" name="<%=Constants.DEBT_ADJUSTMENT%>" readonly="true" tabindex="-1"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="date.title"/></td>
                            <td><html:text property="createdDate" styleId="debtAdjustmentDate" size="30" name="<%=Constants.DEBT_ADJUSTMENT%>"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="vendor.title"/></td>
                            <td>
                                <select style="width: 195px;" name="vendorIdComboboxPopup" id="vendorIdComboboxPopup">
                                    <logic:iterate id="vendor_iter" name="<%=Constants.VENDOR_LIST%>">
                                        <option  value="${vendor_iter.id}">${vendor_iter.name}</option>
                                    </logic:iterate>
                                </select>
                            </td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="customer.title"/></td>
                            <td>
                                <select style="width: 195px;" name="customerIdComboboxPopup" id="customerIdComboboxPopup">
                                    <logic:iterate id="customer_iter" name="<%=Constants.CUSTOMER_LIST%>">
                                        <option  value="${customer_iter.id}">${customer_iter.name}</option>
                                    </logic:iterate>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="amount.title"/></td>
                            <td><html:text property="amount" size="30" name="<%=Constants.DEBT_ADJUSTMENT%>" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"  tabindex="0"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="kind.title"/></td>
                            <td>
                                <html:select property="kind" name="<%=Constants.DEBT_ADJUSTMENT%>" style="width:195px">
                                    <html:options collection="<%=Constants.KIND_LIST%>" property="value" labelProperty="label"/>
                                </html:select>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="note.title"/></td>
                            <td colspan="3"><html:text property="note" size="83" name="<%=Constants.DEBT_ADJUSTMENT%>" /></td>
                        </tr>
                    </table>
                </td></tr>
            <tr>
                <td align="center">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <logic:equal name="<%=Constants.DEBT_ADJUSTMENT%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_DEBT_ADJUSTMENT)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveDebtAdjustment();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:equal>
                        <logic:notEqual name="<%=Constants.DEBT_ADJUSTMENT%>" property="id" value="0">
                            <logic:equal name="<%=Constants.DEBT_ADJUSTMENT%>" property="canEdit" value="1">
                                <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_DEBT_ADJUSTMENT)) {%> 
                                <button class="i_create_write icon small green" onclick="return saveDebtAdjustment();"><bean:message key="message.save"/></button>
                                <%}%>
                                <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_DEBT_ADJUSTMENT)) {%> 
                                <button class="i_trashcan icon small red" onclick="return delDebtAdjustment();"><bean:message key="message.del"/></button>
                                <%}%>
                            </logic:equal>
                        </logic:notEqual>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('debtAdjustmentFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.DEBT_ADJUSTMENT%>" />
        <input type="hidden" id="callbackFunc"/>
        <input type="hidden" name="vendorSelectedHidden" value="0"/>
        <input type="hidden" name="customerSelectedHidden" value="0"/>
        <html:hidden property="customerId" name="<%=Constants.DEBT_ADJUSTMENT%>" />
        <html:hidden property="vendorId" name="<%=Constants.DEBT_ADJUSTMENT%>" />
    </form>
    <div name="debtAdjustmentFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('debtAdjustmentFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveDebtAdjustment()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('debtAdjustmentFormshowHelpHideDiv')</div>
</div>