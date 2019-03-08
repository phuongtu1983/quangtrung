<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="debtWholesaleFormshowHelpHideDivContent">
    <form name="debtWholesaleForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="code.title"/></td>
                            <td><html:text property="code" size="30" name="<%=Constants.DEBT_WHOLESALE%>" readonly="true" tabindex="-1"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="date.title"/></td>
                            <td><html:text property="createdDate" styleId="debtWholesaleDate" size="30" name="<%=Constants.DEBT_WHOLESALE%>" tabindex="-1"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="paid.title"/></td>
                            <td><html:text property="paid" size="30" name="<%=Constants.DEBT_WHOLESALE%>" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);" tabindex="0"/></td>
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
                            <td height="30" style="padding-right: 20px"><bean:message key="kind.title"/></td>
                            <td>
                                <html:select property="kind" name="<%=Constants.DEBT_WHOLESALE%>" style="width:195px">
                                    <html:options collection="<%=Constants.KIND_LIST%>" property="value" labelProperty="label"/>
                                </html:select>
                            </td>
                            <td><bean:message key="account.title"/></td>
                            <td>
                                <html:select property="accountId" name="<%=Constants.DEBT_WHOLESALE%>" style="width:195px">
                                    <html:options collection="<%=Constants.ACCOUNT_LIST%>" property="id" labelProperty="number"/>
                                </html:select>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="note.title"/></td>
                            <td colspan="3"><html:text property="note" size="82" name="<%=Constants.DEBT_WHOLESALE%>" /></td>
                        </tr>
                    </table>
                </td></tr>
            <tr>
                <td align="center">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <logic:equal name="<%=Constants.DEBT_WHOLESALE%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_DEBT_WHOLESALE)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveDebtWholesale();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:equal>
                        <logic:notEqual name="<%=Constants.DEBT_WHOLESALE%>" property="id" value="0">
                            <logic:equal name="<%=Constants.DEBT_WHOLESALE%>" property="canEdit" value="1">
                                <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_DEBT_WHOLESALE)) {%> 
                                <button class="i_create_write icon small green" onclick="return saveDebtWholesale();"><bean:message key="message.save"/></button>
                                <%}%>
                                <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_DEBT_WHOLESALE)) {%> 
                                <button class="i_trashcan icon small red" onclick="return delDebtWholesale();"><bean:message key="message.del"/></button>
                                <%}%>
                            </logic:equal>
                        </logic:notEqual>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('debtWholesaleFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.DEBT_WHOLESALE%>" />
        <input type="hidden" id="callbackFunc"/>
        <html:hidden property="customerId" name="<%=Constants.DEBT_WHOLESALE%>" />
        <input type="hidden" name="customerSelectedHidden" value="0"/>
    </form>
    <div name="debtWholesaleFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('debtWholesaleFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveDebtWholesale()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('debtWholesaleFormshowHelpHideDiv')</div>
</div>