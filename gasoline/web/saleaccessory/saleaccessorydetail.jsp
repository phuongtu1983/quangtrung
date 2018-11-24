<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div class="header"><bean:message key="saleAccessory.detail.add.title"/></div>
<form name="saleAccessoryForm">
    <table style="width: 100%">
        <tr>
            <td width="160" height="30"><bean:message key="code.title"/></td>
            <td width="160"><html:text property="code" size="30" name="<%=Constants.SALE_ACCESSORY%>" readonly="true"/></td>
            <td width="170"  style="padding-right: 20px;padding-left: 10px"><bean:message key="date.title"/></td>
            <td>
                <logic:equal name="<%=Constants.SALE_ACCESSORY%>" property="id" value="0">
                    <html:text property="createdDate" size="30" name="<%=Constants.SALE_ACCESSORY%>" styleId="saleAccessoryCreatedDate"/>
                </logic:equal>
                <logic:notEqual name="<%=Constants.SALE_ACCESSORY%>" property="id" value="0">
                    <html:text property="createdDate" size="30" name="<%=Constants.SALE_ACCESSORY%>" styleId="saleAccessoryCreatedDate" readonly="true"/>
                </logic:notEqual>
            </td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px""><bean:message key="account.title"/></td>
            <td>
                <html:select property="accountId" name="<%=Constants.SALE_ACCESSORY%>" style="width:195px">
                    <html:options collection="<%=Constants.ACCOUNT_LIST%>" property="id" labelProperty="number"/>
                </html:select>
            </td>
            <td width="170"  style="padding-right: 20px;padding-left: 10px"><bean:message key="total.title"/></td>
            <td><html:text property="total" size="30" name="<%=Constants.SALE_ACCESSORY%>" readonly="true"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="discount.title"/></td>
            <td><html:text property="discount" size="30" name="<%=Constants.SALE_ACCESSORY%>" onblur="return formPaidDiscountChanged('saleAccessoryForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="amount.title"/></td>
            <td><html:text property="totalPay" size="30" name="<%=Constants.SALE_ACCESSORY%>" readonly="true"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="paid.title"/></td>
            <td><html:text property="paid" size="30" name="<%=Constants.SALE_ACCESSORY%>" onblur="return formPaidDiscountChanged('saleAccessoryForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="debt.title"/></td>
            <td><html:text property="debt" size="30" name="<%=Constants.SALE_ACCESSORY%>" readonly="true"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="note.title"/></td>
            <td colspan="3"><html:text property="note" size="100" name="<%=Constants.SALE_ACCESSORY%>"/></td>
        </tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="detail.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <logic:equal name="<%=Constants.SALE_ACCESSORY%>" property="id" value="0">
                                    <button class="i_cross icon small red" onclick="return delTableRow('saleAccessoryForm', 'saleAccessoryGoodChk', 'saleAccessoryDetailTbl');"><bean:message key="message.del"/></button>
                                </logic:equal>
                                <button class="i_plus icon small green" onclick="return addSaleAccessoryGood();"><bean:message key="message.add"/></button>
                            </td>
                            <td>
                                <select style="width: 260px;" name="accessoryIdCombobox" id="accessoryIdCombobox">
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
        <tr><td colspan="4"><div><%@include  file="/saleaccessory/details.jsp" %></div></td></tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="saleAccessory.detail.changeGood.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <logic:equal name="<%=Constants.SALE_ACCESSORY%>" property="id" value="0">
                                    <button class="i_cross icon small red" onclick="return delTableRow('saleAccessoryForm', 'saleAccessoryChangeGoodChk', 'saleAccessoryChangeGoodDetailTbl');"><bean:message key="message.del"/></button>
                                </logic:equal>
                                <button class="i_plus icon small green" onclick="return addSaleAccessoryChangeGood();"><bean:message key="message.add"/></button>
                            </td>
                            <td>
                                <select style="width: 260px;" name="changeGoodIdCombobox" id="changeGoodIdCombobox">
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
        <tr><td colspan="4"><div><%@include  file="/saleaccessory/changedetails.jsp" %></div></td></tr>
        <tr>
            <td colspan="4" align="center" height="50">
                <logic:equal name="<%=Constants.SALE_ACCESSORY%>" property="id" value="0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_SALE_ACCESSORY)) {%> 
                    <button class="i_create_write icon small green" onclick="return saveSaleAccessory();"><bean:message key="message.save"/></button>
                    <%}%>
                </logic:equal>
                <logic:notEqual name="<%=Constants.SALE_ACCESSORY%>" property="id" value="0">
                    <logic:equal name="<%=Constants.SALE_ACCESSORY%>" property="canEdit" value="1">
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_SALE_ACCESSORY)) {%> 
                        <button class="i_create_write icon small green" onclick="return saveSaleAccessory();"><bean:message key="message.save"/></button>
                        <%}%>
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_SALE_ACCESSORY)) {%> 
                        <button class="i_trashcan icon small red" onclick="return delSaleAccessory();"><bean:message key="message.del"/></button>
                        <%}%>
                    </logic:equal>
                </logic:notEqual>
                <button class="i_access_denied icon small yellow" onclick="return loadSaleAccessoryPanel();"><bean:message key="message.close"/></button>
            </td>
        </tr>
    </table>
    <html:hidden property="id" name="<%=Constants.SALE_ACCESSORY%>" />
    <input type="hidden" id="callbackFunc"/>
    <input type="hidden" name="accessorySelectedHidden" value="0"/>
    <input type="hidden" name="changeGoodSelectedHidden" value="0"/>
</form>
<div name="saleAccessoryFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
    Ctrl+C : Đóng
    Ctrl+S : Lưu
</div>
<div id="shiftCFunctionHideDiv" style="display:none">loadSaleAccessoryPanel()</div>
<div id="shiftSFunctionHideDiv" style="display:none">saveSaleAccessory()</div>
<div id="saleAccessoryGoodHideDiv" style="display:none"></div>
<div id="saleAccessoryChangeGoodHideDiv" style="display:none"></div>