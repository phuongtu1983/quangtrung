<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div class="header"><bean:message key="saleInner.detail.add.title"/></div>
<form name="saleInnerForm">
    <table style="width: 100%">
        <tr>
            <td width="160" height="30"><bean:message key="code.title"/></td>
            <td width="160"><html:text property="code" size="30" name="<%=Constants.SALE_INNER%>" readonly="true" tabindex="-1"/></td>
            <td width="170"  style="padding-right: 20px;padding-left: 10px"><bean:message key="date.title"/></td>
            <td><html:text property="createdDate" size="30" name="<%=Constants.SALE_INNER%>" styleId="saleInnerCreatedDate" tabindex="-1"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px""><bean:message key="account.title"/></td>
            <td>
                <html:select property="accountId" name="<%=Constants.SALE_INNER%>" style="width:195px" tabindex="0">
                    <html:options collection="<%=Constants.ACCOUNT_LIST%>" property="id" labelProperty="number"/>
                </html:select>
            </td>
            <td width="170"  style="padding-right: 20px;padding-left: 10px"><bean:message key="total.title"/></td>
            <td><html:text property="total" size="30" name="<%=Constants.SALE_INNER%>" readonly="true" tabindex="-1"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="employee.title"/></td>
            <td colspan="3">
                <select style="width: 195px;" name="employeeIdCombobox" id="employeeIdCombobox">
                    <logic:iterate id="employee_iter" name="<%=Constants.EMPLOYEE_LIST%>">
                        <option  value="${employee_iter.id}">${employee_iter.fullname}</option>
                    </logic:iterate>
                </select>
            </td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="discount.title"/></td>
            <td><html:text property="discount" size="30" name="<%=Constants.SALE_INNER%>" onblur="return formPaidDiscountChanged('saleInnerForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="amount.title"/></td>
            <td><html:text property="totalPay" size="30" name="<%=Constants.SALE_INNER%>" readonly="true" tabindex="-1"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="paid.title"/></td>
            <td><html:text property="paid" size="30" name="<%=Constants.SALE_INNER%>" onblur="return formPaidDiscountChanged('saleInnerForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="debt.title"/></td>
            <td><html:text property="debt" size="30" name="<%=Constants.SALE_INNER%>" readonly="true" tabindex="-1"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="note.title"/></td>
            <td colspan="3"><html:text property="note" size="100" name="<%=Constants.SALE_INNER%>"/></td>
        </tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="detail.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <button class="i_cross icon small red" onclick="return delTableRow('saleInnerForm', 'saleInnerGoodChk', 'saleInnerDetailTbl');" tabindex="-1"><bean:message key="message.del"/></button>
                                <button class="i_plus icon small green" onclick="return addSaleInnerGood();" tabindex="-1"><bean:message key="message.add"/></button>
                            </td>
                            <td>
                                <select style="width: 260px;" name="goodIdCombobox" id="goodIdCombobox">
                                    <logic:iterate id="good_iter" name="<%=Constants.SHELL_LIST%>">
                                        <option  value="${good_iter.id}">${good_iter.name}</option>
                                    </logic:iterate>
                                </select>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr><td colspan="4"><div><%@include  file="/saleinner/details.jsp" %></div></td></tr>
        <tr>
            <td colspan="4" align="center" height="50">
                <logic:equal name="<%=Constants.SALE_INNER%>" property="id" value="0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_SALE_INNER)) {%> 
                    <button class="i_create_write icon small green" onclick="return saveSaleInner();"><bean:message key="message.save"/></button>
                    <%}%>
                </logic:equal>
                <logic:notEqual name="<%=Constants.SALE_INNER%>" property="id" value="0">
                    <logic:equal name="<%=Constants.SALE_INNER%>" property="canEdit" value="1">
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_SALE_INNER)) {%> 
                        <button class="i_create_write icon small green" onclick="return saveSaleInner();"><bean:message key="message.save"/></button>
                        <%}%>
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_SALE_INNER)) {%> 
                        <button class="i_trashcan icon small red" onclick="return delSaleInner();"><bean:message key="message.del"/></button>
                        <%}%>
                    </logic:equal>
                </logic:notEqual>
                <button class="i_access_denied icon small yellow" onclick="return loadSaleInnerPanel();"><bean:message key="message.close"/></button>
            </td>
        </tr>
    </table>
    <html:hidden property="id" name="<%=Constants.SALE_INNER%>" />
    <input type="hidden" id="callbackFunc"/>
    <input type="hidden" name="shellSelectedHidden" value="0"/>
    <html:hidden property="employeeId" name="<%=Constants.SALE_INNER%>" />
    <input type="hidden" name="employeeSelectedHidden" value="0"/>
</form>
<div name="saleInnerFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
    Ctrl+C : Đóng
    Ctrl+S : Lưu
</div>
<div id="shiftCFunctionHideDiv" style="display:none">loadSaleInnerPanel()</div>
<div id="shiftSFunctionHideDiv" style="display:none">saveSaleInner()</div>
<div id="saleInnerGoodHideDiv" style="display:none"></div>
<div id="saleInnerChangeGoodHideDiv" style="display:none"></div>