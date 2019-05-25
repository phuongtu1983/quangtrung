<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div class="header"><bean:message key="saleOilReturn.detail.add.title"/></div>
<form name="saleOilReturnForm">
    <table style="width: 100%">
        <tr>
            <td width="250" height="30"><bean:message key="code.title"/></td>
            <td width="160"><html:text property="code" size="30" name="<%=Constants.SALE_OIL_RETURN%>" readonly="true" tabindex="-1"/></td>
            <td width="200"  style="padding-right: 20px;padding-left: 10px"><bean:message key="date.title"/></td>
            <td><html:text property="createdDate" size="30" name="<%=Constants.SALE_OIL_RETURN%>" styleId="saleOilReturnCreatedDate" tabindex="-1"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="account.title"/></td>
            <td>
                <html:select property="accountId" name="<%=Constants.SALE_OIL_RETURN%>" style="width:195px" tabindex="0">
                    <html:options collection="<%=Constants.ACCOUNT_LIST%>" property="id" labelProperty="number"/>
                </html:select>
            </td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="total.title"/></td>
            <td><html:text property="total" size="30" name="<%=Constants.SALE_OIL_RETURN%>" readonly="true" tabindex="-1"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="customer.title"/></td>
            <td>
                <html:select property="customerId" name="<%=Constants.SALE_OIL_RETURN%>" style="width:195px" tabindex="0">
                    <html:options collection="<%=Constants.CUSTOMER_LIST%>" property="id" labelProperty="name"/>
                </html:select>
            </td>
            <td width="170"  style="padding-right: 20px;padding-left: 10px"><bean:message key="customer.detail.percentage"/></td>
            <td><html:text property="commission" size="30" name="<%=Constants.SALE_OIL_RETURN%>" readonly="true" tabindex="-1"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="saleOil.detail.gapCustomer"/></td>
            <td><html:text property="gapCustomerAmount" size="30" name="<%=Constants.SALE_OIL_RETURN%>" readonly="true" tabindex="-1"/></td>
            <td width="170"  style="padding-right: 20px;padding-left: 10px"><bean:message key="saleOil.detail.gapAgency"/></td>
            <td><html:text property="gapAgencyAmount" size="30" name="<%=Constants.SALE_OIL_RETURN%>" readonly="true" tabindex="-1"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="saleOil.detail.commission"/></td>
            <td><html:text property="commissionAmount" size="30" name="<%=Constants.SALE_OIL_RETURN%>" readonly="true" tabindex="-1"/></td>
            <td width="170"  style="padding-right: 20px;padding-left: 10px"><bean:message key="amount.title"/></td>
            <td><html:text property="totalPay" size="30" name="<%=Constants.SALE_OIL_RETURN%>" readonly="true" tabindex="-1"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="paid.title"/></td>
            <td><html:text property="paid" size="30" name="<%=Constants.SALE_OIL_RETURN%>" onblur="return formPaidDiscountChanged('saleOilReturnForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="debt.title"/></td>
            <td><html:text property="debt" size="30" name="<%=Constants.SALE_OIL_RETURN%>" readonly="true" tabindex="-1"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="note.title"/></td>
            <td colspan="3"><html:text property="note" size="105" name="<%=Constants.SALE_OIL_RETURN%>"/></td>
        </tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="detail.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <button class="i_cross icon small red" onclick="return delSaleOilReturnDetail();" tabindex="-1"><bean:message key="message.del"/></button>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr><td colspan="4"><div><%@include  file="/saleoilreturn/details.jsp" %></div></td></tr>
        <tr>
            <td colspan="4" align="center" height="50">
                <logic:equal name="<%=Constants.SALE_OIL_RETURN%>" property="id" value="0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_SALE_OIL_RETURN)) {%> 
                    <button class="i_create_write icon small green" onclick="return saveSaleOilReturn();"><bean:message key="message.save"/></button>
                    <%}%>
                </logic:equal>
                <logic:notEqual name="<%=Constants.SALE_OIL_RETURN%>" property="id" value="0">
                    <logic:equal name="<%=Constants.SALE_OIL_RETURN%>" property="canEdit" value="1">
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_SALE_OIL_RETURN)) {%> 
                        <button class="i_create_write icon small green" onclick="return saveSaleOilReturn();"><bean:message key="message.save"/></button>
                        <%}%>
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_SALE_OIL_RETURN)) {%> 
                        <button class="i_trashcan icon small red" onclick="return delSaleOilReturn();"><bean:message key="message.del"/></button>
                        <%}%>
                    </logic:equal>
                </logic:notEqual>
                <button class="i_access_denied icon small yellow" onclick="return loadSaleOilReturnPanel();"><bean:message key="message.close"/></button>
            </td>
        </tr>
    </table>
    <html:hidden property="id" name="<%=Constants.SALE_OIL_RETURN%>" />
    <input type="hidden" id="callbackFunc"/>
</form>
<div name="saleOilReturnFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
    Ctrl+C : Đóng
    Ctrl+S : Lưu
</div>
<div id="shiftCFunctionHideDiv" style="display:none">loadSaleOilReturnPanel()</div>
<div id="shiftSFunctionHideDiv" style="display:none">saveSaleOilReturn()</div>