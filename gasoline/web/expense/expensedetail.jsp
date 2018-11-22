<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="expenseFormshowHelpHideDivContent">
    <form name="expenseForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="code.title"/></td>
                            <td><html:text property="code" size="30" name="<%=Constants.EXPENSE%>" readonly="true"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="date.title"/></td>
                            <td>
                                <logic:equal name="<%=Constants.EXPENSE%>" property="id" value="0">
                                    <html:text property="createdDate" styleId="expenseDate" size="30" name="<%=Constants.EXPENSE%>"/>
                                </logic:equal>
                                <logic:notEqual name="<%=Constants.EXPENSE%>" property="id" value="0">
                                    <html:text property="createdDate" styleId="expenseDate" size="30" name="<%=Constants.EXPENSE%>" readonly="true"/>
                                </logic:notEqual>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="expense.detail.type.title"/></td>
                            <td>
                                <html:select property="type" name="<%=Constants.EXPENSE%>" style="width:195px">
                                    <html:options collection="<%=Constants.EXPENSE_TYPE_LIST%>" property="value" labelProperty="label"/>
                                </html:select>
                            </td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="amount.title"/></td>
                            <td><html:text property="amount" size="30" name="<%=Constants.EXPENSE%>" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="content.title"/></td>
                            <td colspan="3"><html:text property="content" size="90" name="<%=Constants.EXPENSE%>"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="fromDate.title"/></td>
                            <td><html:text property="fromDate" styleId="expenseFromDate" size="30" name="<%=Constants.EXPENSE%>"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="toDate.title"/></td>
                            <td><html:text property="toDate" styleId="expenseToDate" size="30" name="<%=Constants.EXPENSE%>"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="account.title"/></td>
                            <td>
                                <html:select property="accountId" name="<%=Constants.EXPENSE%>" style="width:195px">
                                    <html:options collection="<%=Constants.ACCOUNT_LIST%>" property="id" labelProperty="number"/>
                                </html:select>
                            </td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="expense.detail.isusually.title"/></td>
                            <td><html:checkbox property="isUsually" name="<%=Constants.EXPENSE%>"></html:checkbox></td>
                            </tr>
                            <tr>
                                <td height="30" style="padding-right: 20px"><bean:message key="note.title"/></td>
                            <td colspan="3"><html:text property="note" size="90" name="<%=Constants.EXPENSE%>" /></td>
                        </tr>
                    </table>
                </td></tr>
            <tr>
                <td align="center">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <logic:equal name="<%=Constants.EXPENSE%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_EXPENSE)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveExpense();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:equal>
                        <logic:notEqual name="<%=Constants.EXPENSE%>" property="id" value="0">
                            <logic:equal name="<%=Constants.EXPENSE%>" property="canEdit" value="1">
                                <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_EXPENSE)) {%> 
                                <button class="i_create_write icon small green" onclick="return saveExpense();"><bean:message key="message.save"/></button>
                                <%}%>
                                <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_EXPENSE)) {%> 
                                <button class="i_trashcan icon small red" onclick="return delExpense();"><bean:message key="message.del"/></button>
                                <%}%>
                            </logic:equal>
                        </logic:notEqual>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('expenseFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.EXPENSE%>" />
        <input type="hidden" id="callbackFunc"/>
    </form>
    <div name="expenseFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('expenseFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveExpense()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('expenseFormshowHelpHideDiv')</div>
</div>