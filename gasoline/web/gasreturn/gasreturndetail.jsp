<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div class="header"><bean:message key="gasReturn.detail.add.title"/></div>
<form name="gasReturnForm">
    <table style="width: 100%">
        <tr>
            <td width="160" height="30"><bean:message key="code.title"/></td>
            <td width="160"><html:text property="code" size="30" name="<%=Constants.GAS_RETURN%>" readonly="true"/></td>
            <td width="170"  style="padding-right: 20px;padding-left: 10px"><bean:message key="date.title"/></td>
            <td><html:text property="createdDate" size="30" name="<%=Constants.GAS_RETURN%>" styleId="gasReturnCreatedDate" readonly="true"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px""><bean:message key="account.title"/></td>
            <td>
                <html:select property="accountId" name="<%=Constants.GAS_RETURN%>" style="width:195px">
                    <html:options collection="<%=Constants.ACCOUNT_LIST%>" property="id" labelProperty="number"/>
                </html:select>
            </td>
            <td width="170"  style="padding-right: 20px;padding-left: 10px"><bean:message key="total.title"/></td>
            <td><html:text property="total" size="30" name="<%=Constants.GAS_RETURN%>" readonly="true"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px""><bean:message key="customer.title"/></td>
            <td colspan="3">
                <html:select property="customerId" name="<%=Constants.GAS_RETURN%>" style="width:195px">
                    <html:options collection="<%=Constants.CUSTOMER_LIST%>" property="id" labelProperty="name"/>
                </html:select>
            </td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="discount.title"/></td>
            <td><html:text property="discount" size="30" name="<%=Constants.GAS_RETURN%>" onblur="return formPaidDiscountChanged('gasReturnForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="amount.title"/></td>
            <td><html:text property="totalPay" size="30" name="<%=Constants.GAS_RETURN%>" readonly="true"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="paid.title"/></td>
            <td><html:text property="paid" size="30" name="<%=Constants.GAS_RETURN%>" onblur="return formPaidDiscountChanged('gasReturnForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="debt.title"/></td>
            <td><html:text property="debt" size="30" name="<%=Constants.GAS_RETURN%>" readonly="true"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="note.title"/></td>
            <td colspan="3"><html:text property="note" size="100" name="<%=Constants.GAS_RETURN%>"/></td>
        </tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="detail.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <logic:equal name="<%=Constants.GAS_RETURN%>" property="id" value="0">
                                    <button class="i_cross icon small red" onclick="return delTableRow('gasReturnForm', 'gasReturnGoodChk', 'gasReturnDetailTbl');"><bean:message key="message.del"/></button>
                                </logic:equal>
                                <button class="i_plus icon small green" onclick="return addGasReturnGood();"><bean:message key="message.add"/></button>
                            </td>
                            <td>
                                <select style="width: 260px;" name="goodIdCombobox" id="goodIdCombobox">
                                    <logic:iterate id="good_iter" name="<%=Constants.GOOD_LIST%>">
                                        <option  value="${good_iter.id}">${good_iter.name}</option>
                                    </logic:iterate>
                                </select>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr><td colspan="4"><div><%@include  file="/gasreturn/details.jsp" %></div></td></tr>
        <tr>
            <td colspan="4" align="center" height="50">
                <logic:equal name="<%=Constants.GAS_RETURN%>" property="id" value="0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_GAS_RETURN)) {%> 
                    <button class="i_create_write icon small green" onclick="return saveGasReturn();"><bean:message key="message.save"/></button>
                    <%}%>
                </logic:equal>
                <logic:notEqual name="<%=Constants.GAS_RETURN%>" property="id" value="0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_GAS_RETURN)) {%> 
                    <logic:equal name="<%=Constants.GAS_RETURN%>" property="canEdit" value="1">
                        <button class="i_create_write icon small green" onclick="return saveGasReturn();"><bean:message key="message.save"/></button>
                    </logic:equal>
                    <%}%>
                </logic:notEqual>
                <logic:greaterThan name="<%=Constants.GAS_RETURN%>" property="id" value="0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_GAS_RETURN)) {%> 
                    <logic:equal name="<%=Constants.GAS_RETURN%>" property="canEdit" value="1">
                        <button class="i_trashcan icon small red" onclick="return delGasReturn();"><bean:message key="message.del"/></button>
                    </logic:equal>
                    <%}%>
                </logic:greaterThan>
                <button class="i_access_denied icon small yellow" onclick="return loadGasReturnPanel();"><bean:message key="message.close"/></button>
            </td>
        </tr>
    </table>
    <html:hidden property="id" name="<%=Constants.GAS_RETURN%>" />
    <input type="hidden" id="callbackFunc"/>
    <input type="hidden" name="foodSelectedHidden" value="0"/>
</form>
<div name="gasReturnFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
    Ctrl+C : Đóng
    Ctrl+S : Lưu
</div>
<div id="shiftCFunctionHideDiv" style="display:none">loadGasReturnPanel()</div>
<div id="shiftSFunctionHideDiv" style="display:none">saveGasReturn()</div>
<div id="gasReturnGoodHideDiv" style="display:none"></div>
<div id="gasReturnChangeGoodHideDiv" style="display:none"></div>