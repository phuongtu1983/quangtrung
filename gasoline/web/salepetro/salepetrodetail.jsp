<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div class="header"><bean:message key="salePetro.detail.add.title"/></div>
<form name="salePetroForm">
    <table style="width: 100%">
        <tr>
            <td width="160" height="30"><bean:message key="code.title"/></td>
            <td width="160"><html:text property="code" size="30" name="<%=Constants.SALE_PETRO%>" readonly="true"/></td>
            <td width="170"  style="padding-right: 20px;padding-left: 10px"><bean:message key="date.title"/></td>
            <td><html:text property="createdDate" size="30" name="<%=Constants.SALE_PETRO%>" styleId="salePetroCreatedDate" readonly="true"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px""><bean:message key="account.title"/></td>
            <td>
                <html:select property="accountId" name="<%=Constants.SALE_PETRO%>" style="width:195px">
                    <html:options collection="<%=Constants.ACCOUNT_LIST%>" property="id" labelProperty="number"/>
                </html:select>
            </td>
            <td width="170"  style="padding-right: 20px;padding-left: 10px"><bean:message key="total.title"/></td>
            <td><html:text property="total" size="30" name="<%=Constants.SALE_PETRO%>" readonly="true"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px""><bean:message key="customer.title"/></td>
            <td>
                <select style="width: 195px;" name="customerIdCombobox" id="customerIdCombobox">
                    <logic:iterate id="customer_iter" name="<%=Constants.CUSTOMER_LIST%>">
                        <option  value="${customer_iter.id}">${customer_iter.name}</option>
                    </logic:iterate>
                </select>
            </td>
            <td width="170"  style="padding-right: 20px;padding-left: 10px"><bean:message key="store.title"/></td>
            <td>
                <html:select property="storeId" name="<%=Constants.SALE_PETRO%>" style="width:195px">
                    <html:options collection="<%=Constants.STORE_LIST%>" property="id" labelProperty="name"/>
                </html:select>
            </td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="discount.title"/></td>
            <td><html:text property="discount" size="30" name="<%=Constants.SALE_PETRO%>" onblur="return formPaidDiscountChanged('salePetroForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="amount.title"/></td>
            <td><html:text property="totalPay" size="30" name="<%=Constants.SALE_PETRO%>" readonly="true"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="paid.title"/></td>
            <td><html:text property="paid" size="30" name="<%=Constants.SALE_PETRO%>" onblur="return formPaidDiscountChanged('salePetroForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="debt.title"/></td>
            <td><html:text property="debt" size="30" name="<%=Constants.SALE_PETRO%>" readonly="true"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="note.title"/></td>
            <td colspan="3"><html:text property="note" size="100" name="<%=Constants.SALE_PETRO%>"/></td>
        </tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="detail.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <logic:equal name="<%=Constants.SALE_PETRO%>" property="id" value="0">
                                    <button class="i_cross icon small red" onclick="return delTableRow('salePetroForm', 'salePetroGoodChk', 'salePetroDetailTbl');"><bean:message key="message.del"/></button>
                                </logic:equal>
                                <button class="i_plus icon small green" onclick="return addSalePetroGood();"><bean:message key="message.add"/></button>
                            </td>
                            <td>
                                <select style="width: 260px;" name="petroIdCombobox" id="petroIdCombobox">
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
        <tr><td colspan="4"><div><%@include  file="/salepetro/details.jsp" %></div></td></tr>
        <tr>
            <td colspan="4" align="center" height="50">
                <logic:equal name="<%=Constants.SALE_PETRO%>" property="id" value="0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_SALE_PETRO)) {%> 
                    <button class="i_create_write icon small green" onclick="return saveSalePetro();"><bean:message key="message.save"/></button>
                    <%}%>
                </logic:equal>
                <logic:notEqual name="<%=Constants.SALE_PETRO%>" property="id" value="0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_SALE_PETRO)) {%> 
                    <logic:equal name="<%=Constants.SALE_PETRO%>" property="canEdit" value="1">
                        <button class="i_create_write icon small green" onclick="return saveSalePetro();"><bean:message key="message.save"/></button>
                    </logic:equal>
                    <%}%>
                </logic:notEqual>
                <logic:greaterThan name="<%=Constants.SALE_PETRO%>" property="id" value="0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_SALE_PETRO)) {%> 
                    <logic:equal name="<%=Constants.SALE_PETRO%>" property="canEdit" value="1">
                        <button class="i_trashcan icon small red" onclick="return delSalePetro();"><bean:message key="message.del"/></button>
                    </logic:equal>
                    <%}%>
                </logic:greaterThan>
                <button class="i_access_denied icon small yellow" onclick="return loadSalePetroPanel();"><bean:message key="message.close"/></button>
            </td>
        </tr>
    </table>
    <html:hidden property="id" name="<%=Constants.SALE_PETRO%>" />
    <input type="hidden" id="callbackFunc"/>
    <input type="hidden" name="petroSelectedHidden" value="0"/>
    <html:hidden property="customerId" name="<%=Constants.SALE_PETRO%>" />
    <input type="hidden" name="customerSelectedHidden" value="0"/>
</form>
<div name="salePetroFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
    Ctrl+C : Đóng
    Ctrl+S : Lưu
</div>
<div id="shiftCFunctionHideDiv" style="display:none">loadSalePetroPanel()</div>
<div id="shiftSFunctionHideDiv" style="display:none">saveSalePetro()</div>
<div id="salePetroGoodHideDiv" style="display:none"></div>
<div id="salePetroChangeGoodHideDiv" style="display:none"></div>