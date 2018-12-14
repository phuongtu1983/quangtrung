<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="incomeFormshowHelpHideDivContent">
    <form name="incomeForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="code.title"/></td>
                            <td><html:text property="code" size="30" name="<%=Constants.INCOME%>" readonly="true" tabindex="-1"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="date.title"/></td>
                            <td><html:text property="createdDate" styleId="incomeDate" size="30" name="<%=Constants.INCOME%>" tabindex="-1"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="income.detail.type.title"/></td>
                            <td>
                                <html:select property="type" name="<%=Constants.INCOME%>" style="width:195px" tabindex="-1">
                                    <html:options collection="<%=Constants.INCOME_TYPE_LIST%>" property="value" labelProperty="label"/>
                                </html:select>
                            </td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="content.title"/></td>
                            <td><html:text property="content" size="30" name="<%=Constants.INCOME%>" tabindex="0"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="amount.title"/></td>
                            <td><html:text property="amount" size="30" name="<%=Constants.INCOME%>" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="account.title"/></td>
                            <td>
                                <html:select property="accountId" name="<%=Constants.INCOME%>" style="width:195px">
                                    <html:options collection="<%=Constants.ACCOUNT_LIST%>" property="id" labelProperty="number"/>
                                </html:select>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="note.title"/></td>
                            <td colspan="3"><html:text property="note" size="93" name="<%=Constants.INCOME%>" /></td>
                        </tr>
                    </table>
                </td></tr>
            <tr>
                <td align="center">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <logic:equal name="<%=Constants.INCOME%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_INCOME)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveIncome();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:equal>
                        <logic:notEqual name="<%=Constants.INCOME%>" property="id" value="0">
                            <logic:equal name="<%=Constants.INCOME%>" property="canEdit" value="1">
                                <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_INCOME)) {%> 
                                <button class="i_create_write icon small green" onclick="return saveIncome();"><bean:message key="message.save"/></button>
                                <%}%>
                                <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_INCOME)) {%> 
                                <button class="i_trashcan icon small red" onclick="return delIncome();"><bean:message key="message.del"/></button>
                                <%}%>
                            </logic:equal>
                        </logic:notEqual>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('incomeFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.INCOME%>" />
        <input type="hidden" id="callbackFunc"/>
    </form>
    <div name="incomeFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('incomeFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveIncome()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('incomeFormshowHelpHideDiv')</div>
</div>