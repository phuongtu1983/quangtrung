<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div class="header"><bean:message key="gasRetail.detail.add.title"/></div>
<form name="gasRetailForm">
    <table style="width: 100%">
        <tr>
            <td width="160" height="30"><bean:message key="code.title"/></td>
            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_CUSTOMER)) {%> 
            <td width="260">
                <%} else {%>
            <td width="160">
                <%}%>
                <html:text property="code" size="30" name="<%=Constants.GAS_RETAIL%>" readonly="true"/></td>
            <td width="170"  style="padding-right: 20px;padding-left: 10px"><bean:message key="date.title"/></td>
            <td><html:text property="createdDate" size="30" name="<%=Constants.GAS_RETAIL%>" styleId="gasRetailCreatedDate" readonly="true"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="customer.title"/></td>
            <td>
                <html:select property="customerId" name="<%=Constants.GAS_RETAIL%>" style="width:195px" styleId="gasRetailCustomerId">
                    <html:options collection="<%=Constants.CUSTOMER_LIST%>" property="id" labelProperty="name"/>
                </html:select>
                <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_CUSTOMER)) {%> 
                <button class="i_create_write icon small green" onclick="return addCustomerRetail()"><bean:message key="message.add"/></button>
                <%}%>
            </td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="total.title"/></td>
            <td><html:text property="total" size="30" name="<%=Constants.GAS_RETAIL%>" readonly="true"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="discount.title"/></td>
            <td><html:text property="discount" size="30" name="<%=Constants.GAS_RETAIL%>" onblur="return formPaidDiscountChanged('gasRetailForm');" onkeyup="try2FloatFormatOnKeyUp(this,event);" onkeypress="return readonlyFloat(event);"/></td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="amount.title"/></td>
            <td><html:text property="totalPay" size="30" name="<%=Constants.GAS_RETAIL%>" readonly="true"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="paid.title"/></td>
            <td><html:text property="paid" size="30" name="<%=Constants.GAS_RETAIL%>" onblur="return formPaidDiscountChanged('gasRetailForm');" onkeyup="try2FloatFormatOnKeyUp(this,event);" onkeypress="return readonlyFloat(event);"/></td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="debt.title"/></td>
            <td><html:text property="debt" size="30" name="<%=Constants.GAS_RETAIL%>" readonly="true"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px""><bean:message key="account.title"/></td>
            <td colspan="3">
                <html:select property="accountId" name="<%=Constants.GAS_RETAIL%>" style="width:195px">
                    <html:options collection="<%=Constants.ACCOUNT_LIST%>" property="id" labelProperty="number"/>
                </html:select>
            </td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="vehicle.title"/></td>
            <td>
                <html:select property="vehicleId" name="<%=Constants.GAS_RETAIL%>" style="width:195px">
                    <html:options collection="<%=Constants.VEHICLE_LIST%>" property="id" labelProperty="plate"/>
                </html:select>
            </td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="note.title"/></td>
            <td><html:text property="note" size="30" name="<%=Constants.GAS_RETAIL%>"/></td>
        </tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="detail.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <logic:equal name="<%=Constants.GAS_RETAIL%>" property="id" value="0">
                                    <button class="i_cross icon small red" onclick="return delTableRow('gasRetailForm', 'gasRetailShellChk', 'gasRetailDetailTbl');"><bean:message key="message.del"/></button>
                                </logic:equal>
                                <button class="i_plus icon small green" onclick="return addGasRetailShell();"><bean:message key="message.add"/></button>
                            </td>
                            <td>
                                <select style="width: 260px;" name="shellIdCombobox" id="shellIdCombobox">
                                    <logic:iterate id="shell_iter" name="<%=Constants.SHELL_LIST%>">
                                        <option  value="${shell_iter.id}">${shell_iter.name}</option>
                                    </logic:iterate>
                                </select>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td colspan="4"><div><%@include  file="/gasretail/details.jsp" %></div></td>
        </tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="promotionMaterial.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <logic:equal name="<%=Constants.GAS_RETAIL%>" property="id" value="0">
                                    <button class="i_cross icon small red" onclick="return delTableRow('gasRetailForm', 'gasRetailPromotionMaterialChk', 'gasRetailPromotionMaterialDetailTbl');"><bean:message key="message.del"/></button>
                                </logic:equal>
                                <button class="i_plus icon small green" onclick="return addGasRetailPromotionMaterial();"><bean:message key="message.add"/></button>
                            </td>
                            <td>
                                <select style="width: 260px;" name="promotionMaterialIdCombobox" id="promotionMaterialIdCombobox">
                                    <logic:iterate id="promotion_material_iter" name="<%=Constants.PROMOTION_MATERIAL_LIST%>">
                                        <option  value="${promotion_material_iter.id}">${promotion_material_iter.name}</option>
                                    </logic:iterate>
                                </select>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td colspan="4"><div><%@include  file="/gasretail/promotionmaterialdetails.jsp" %></div></td>
        </tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="gasRetail.detail.returnShell.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <logic:equal name="<%=Constants.GAS_RETAIL%>" property="id" value="0">
                                    <button class="i_cross icon small red" onclick="return delTableRow('gasRetailForm', 'gasRetailReturnShellChk', 'gasRetailReturnShellDetailTbl');"><bean:message key="message.del"/></button>
                                </logic:equal>
                                <button class="i_plus icon small green" onclick="return addGasRetailReturnShell();"><bean:message key="message.add"/></button>
                            </td>
                            <td>
                                <select style="width: 260px;" name="returnShellIdCombobox" id="returnShellIdCombobox">
                                    <logic:iterate id="return_shell_iter" name="<%=Constants.SHELL_LIST%>">
                                        <option  value="${return_shell_iter.id}">${return_shell_iter.name}</option>
                                    </logic:iterate>
                                </select>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td colspan="4"><div><%@include  file="/gasretail/returnshelldetails.jsp" %></div></td>
        </tr>
        <tr>
            <td colspan="4" align="center" height="50">
                <logic:equal name="<%=Constants.GAS_RETAIL%>" property="id" value="0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_GAS_RETAIL)) {%> 
                    <button class="i_create_write icon small green" onclick="return saveGasRetail();"><bean:message key="message.save"/></button>
                    <%}%>
                </logic:equal>
                <logic:notEqual name="<%=Constants.GAS_RETAIL%>" property="id" value="0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_GAS_RETAIL)) {%> 
                    <logic:equal name="<%=Constants.GAS_RETAIL%>" property="canEdit" value="1">
                        <button class="i_create_write icon small green" onclick="return saveGasRetail();"><bean:message key="message.save"/></button>
                    </logic:equal>
                    <%}%>
                </logic:notEqual>
                <logic:greaterThan name="<%=Constants.GAS_RETAIL%>" property="id" value="0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_GAS_RETAIL)) {%> 
                    <logic:equal name="<%=Constants.GAS_RETAIL%>" property="canEdit" value="1">
                        <button class="i_trashcan icon small red" onclick="return delGasRetail();"><bean:message key="message.del"/></button>
                    </logic:equal>
                    <%}%>
                </logic:greaterThan>
                <button class="i_access_denied icon small yellow" onclick="return loadGasRetailPanel();"><bean:message key="message.close"/></button>
            </td>
        </tr>
    </table>
    <html:hidden property="id" name="<%=Constants.GAS_RETAIL%>" />
    <input type="hidden" id="callbackFunc"/>
    <input type="hidden" name="foodSelectedHidden" value="0"/>
</form>
<div name="gasRetailFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
    Ctrl+C : Đóng
    Ctrl+S : Lưu
</div>
<div id="shiftCFunctionHideDiv" style="display:none">loadGasRetailPanel()</div>
<div id="shiftSFunctionHideDiv" style="display:none">saveGasRetail()</div>
<div id="gasRetailShellHideDiv" style="display:none"></div>
<div id="gasRetailPromotionMaterialHideDiv" style="display:none"></div>
<div id="gasRetailReturnShellHideDiv" style="display:none"></div>