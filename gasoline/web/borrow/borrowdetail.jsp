<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div class="header"><bean:message key="borrow.detail.add.title"/></div>
<form name="borrowForm">
    <table style="width: 100%">
        <tr>
            <td width="160" height="30"><bean:message key="code.title"/></td>
            <td width="160"><html:text property="code" size="30" name="<%=Constants.BORROW%>" readonly="true" tabindex="-1"/></td>
            <td width="170"  style="padding-right: 20px;padding-left: 10px"><bean:message key="date.title"/></td>
            <td><html:text property="createdDate" size="30" name="<%=Constants.BORROW%>" styleId="borrowCreatedDate" tabindex="-1"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="employee.title"/></td>
            <td>
                <select style="width: 195px;" name="employeeIdCombobox" id="employeeIdCombobox">
                    <logic:iterate id="employee_iter" name="<%=Constants.EMPLOYEE_LIST%>">
                        <option  value="${employee_iter.id}">${employee_iter.fullname}</option>
                    </logic:iterate>
                </select>
            </td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="account.title"/></td>
            <td>
                <html:select property="accountId" name="<%=Constants.BORROW%>" style="width:195px">
                    <html:options collection="<%=Constants.ACCOUNT_LIST%>" property="id" labelProperty="number"/>
                </html:select>
            </td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="total.title"/></td>
            <td colspan="3"><html:text property="total" size="30" name="<%=Constants.BORROW%>" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
        </tr>
        <tr>
            <td height="30"><bean:message key="note.title"/></td>
            <td colspan="3"><html:textarea rows="3" cols="93" property="note" name="<%=Constants.BORROW%>"/></td>
        </tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="borrow.detail.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <button class="i_cross icon small red" onclick="return delTableRow('borrowForm', 'borrowPayDateChk', 'borrowDetailTbl');" tabindex="-1"><bean:message key="message.del"/></button>
                                <button class="i_plus icon small green" onclick="return addBorrowPayDate();" tabindex="-1"><bean:message key="message.add"/></button>
                            </td>
                            <td><input type="text" value="" id="payDateSelected" onkeypress="return onBorrowPayDateKeyPress();"></td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td colspan="4"><div><%@include  file="/borrow/details.jsp" %></div></td>
        </tr>
        <tr>
            <td colspan="4" align="center" height="50">
                <logic:equal name="<%=Constants.BORROW%>" property="id" value="0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_BORROW)) {%> 
                    <button class="i_create_write icon small green" onclick="return saveBorrow();"><bean:message key="message.save"/></button>
                    <%}%>
                </logic:equal>
                <logic:notEqual name="<%=Constants.BORROW%>" property="id" value="0">
                    <logic:equal name="<%=Constants.BORROW%>" property="canEdit" value="1">
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_BORROW)) {%> 
                        <button class="i_create_write icon small green" onclick="return saveBorrow();"><bean:message key="message.save"/></button>
                        <%}%>
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_BORROW)) {%> 
                        <button class="i_trashcan icon small red" onclick="return delBorrow();"><bean:message key="message.del"/></button>
                        <%}%>
                    </logic:equal>
                </logic:notEqual>
                <button class="i_access_denied icon small yellow" onclick="return loadBorrowPanel();"><bean:message key="message.close"/></button>
            </td>
        </tr>
    </table>
    <html:hidden property="id" name="<%=Constants.BORROW%>" />
    <input type="hidden" id="callbackFunc"/>
    <html:hidden property="employeeId" name="<%=Constants.BORROW%>" />
    <input type="hidden" name="employeeSelectedHidden" value="0"/>
</form>
<div name="borrowFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
    Ctrl+C : Đóng
    Ctrl+S : Lưu
</div>
<div id="shiftCFunctionHideDiv" style="display:none">loadBorrowPanel()</div>
<div id="shiftSFunctionHideDiv" style="display:none">saveBorrow()</div>
<div id="borrowPayDateHideDiv" style="display:none"></div>