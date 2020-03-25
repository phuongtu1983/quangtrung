<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div class="header"><bean:message key="customerDiscount.detail.add.title"/></div>
<form name="discountForm">
    <table width="100%" cellspacing="0" cellpadding="0">
        <tr>
            <td width="100" height="30" style="padding-right: 20px"><bean:message key="customerDiscount.detail.name"/></td>
            <td width="200"><html:text property="name" size="40" name="<%=Constants.DISCOUNT%>"/></td>
            <td width="100" height="30" style="padding-left: 10px; padding-right: 20px"><bean:message key="customerDiscount.detail.code"/></td>
            <td><html:text property="code" size="40" name="<%=Constants.DISCOUNT%>"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px" colspan="3"><bean:message key="customerDiscount.detail.shellGasComission"/></td>
            <td><html:text property="shellGasComission" size="40" name="<%=Constants.DISCOUNT%>" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="note.title"/></td>
            <td colspan="3"><html:text property="note" size="107" name="<%=Constants.DISCOUNT%>"/></td>
        </tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="agency.commission.list.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <button class="i_cross icon small red" onclick="return delTableRow('discountForm', 'discountCommissionChk', 'discountCommissionDetailTbl');" tabindex="-1"><bean:message key="message.del"/></button>
                                <button class="i_plus icon small green" onclick="return addDiscountCommission();" tabindex="-1"><bean:message key="message.add"/></button>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td colspan="4"><div><%@include  file="/discount/commissiondetails.jsp" %></div></td>
        </tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="customer.list.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <button class="i_cross icon small red" onclick="return delTableRow('discountForm', 'discountCustomerChk', 'discountCustomerDetailTbl');" tabindex="-1"><bean:message key="message.del"/></button>
                                <button class="i_plus icon small green" onclick="return addDiscountCustomer();" tabindex="-1"><bean:message key="message.add"/></button>
                            </td>
                            <td>
                                <select style="width: 260px;" name="customerIdCombobox" id="customerIdCombobox">
                                    <logic:iterate id="customer_iter" name="<%=Constants.CUSTOMER_LIST%>">
                                        <option  value="${customer_iter.id}">${customer_iter.name}</option>
                                    </logic:iterate>
                                </select>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td colspan="4"><div><%@include  file="/discount/customerdetails.jsp" %></div></td>
        </tr>
        <tr>
            <td align="center" colspan="4">
                <p style="margin-top: 0; margin-bottom: 0">
                    <logic:equal name="<%=Constants.DISCOUNT%>" property="id" value="0">
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_CUSTOMER_DISCOUNT)) {%> 
                        <button class="i_create_write icon small green" onclick="return saveDiscount();"><bean:message key="message.save"/></button>
                        <%}%>
                    </logic:equal>
                    <logic:notEqual name="<%=Constants.DISCOUNT%>" property="id" value="0">
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_CUSTOMER_DISCOUNT)) {%> 
                        <button class="i_create_write icon small green" onclick="return saveDiscount();"><bean:message key="message.save"/></button>
                        <%}%>
                    </logic:notEqual>
                    <logic:greaterThan name="<%=Constants.DISCOUNT%>" property="id" value="0">
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_CUSTOMER_DISCOUNT)) {%> 
                        <button class="i_trashcan icon small red" onclick="return delDiscount();"><bean:message key="message.del"/></button>
                        <%}%>
                    </logic:greaterThan>
                    <button class="i_access_denied icon small yellow" onclick="return loadDiscountPanel();"><bean:message key="message.close"/></button>
                </p>
            </td>
        </tr>
    </table> 
    <html:hidden property="id" name="<%=Constants.DISCOUNT%>" />
    <input type="hidden" id="callbackFunc"/>
    <input type="hidden" name="customerSelectedHidden" value="0"/>
</form>
<div name="discountFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
    Ctrl+C : Đóng
    Ctrl+S : Lưu
</div>
<div id="shiftCFunctionHideDiv" style="display:none">loadAgencyPanel()</div>
<div id="shiftSFunctionHideDiv" style="display:none">saveDiscount()</div>
<div id="shiftEscFunctionHideDiv" style="display:none">loadDiscountPanel()</div>
<div id="discountCommissionHideDiv" style="display:none"></div>
<div id="discountCustomerHideDiv" style="display:none"></div>