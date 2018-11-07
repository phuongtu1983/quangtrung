<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div class="header"><bean:message key="gasWholesale.detail.add.title"/></div>
<form name="gasWholesaleForm">
    <table style="width: 100%">
        <tr>
            <td width="200" height="30"><bean:message key="code.title"/></td>
            <td width="200"><html:text property="code" size="30" name="<%=Constants.GAS_WHOLESALE%>" readonly="true" tabindex="-1"/></td>
            <td width="70" style="padding-right: 50px;padding-left: 10px"><bean:message key="date.title"/></td>
            <td><html:text property="createdDate" size="30" name="<%=Constants.GAS_WHOLESALE%>" styleId="gasWholesaleCreatedDate" tabindex="1"/></td>
        </tr>
        <tr>
            <td width="200" height="30"><bean:message key="date.title"/></td>
            <td width="200"><input type="text" size="30" tabindex="-1" id="gasWholesaleVehicleOutCreatedDate"></td>
            <td style="padding-right: 50px;padding-left: 10px"><bean:message key="vehicleOut.title"/></td>
            <td>
                <select style="width: 195px;" name="vehicleOutIdCombobox" id="vehicleOutIdCombobox">
                    <logic:iterate id="vehicle_iter" name="<%=Constants.VEHICLE_OUT_LIST%>">
                        <option  value="${vehicle_iter.id}">${vehicle_iter.code}</option>
                    </logic:iterate>
                </select>
            </td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="customer.title"/></td>
            <td colspan="3">
                <select style="width: 530px;" name="customerIdCombobox" id="customerIdCombobox">
                    <logic:iterate id="customer_iter" name="<%=Constants.CUSTOMER_LIST%>">
                        <option  value="${customer_iter.id}">${customer_iter.name}</option>
                    </logic:iterate>
                </select>
            </td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="account.title"/></td>
            <td>
                <html:select property="accountId" name="<%=Constants.GAS_WHOLESALE%>" style="width:195px">
                    <html:options collection="<%=Constants.ACCOUNT_LIST%>" property="id" labelProperty="number"/>
                </html:select>
            </td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="total.title"/></td>
            <td><html:text property="total" size="30" name="<%=Constants.GAS_WHOLESALE%>" readonly="true" tabindex="-1"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="note.title"/></td>
            <td colspan="3"><html:text property="note" size="88" name="<%=Constants.GAS_WHOLESALE%>" tabindex="-1"/></td>
        </tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="detail.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <button class="i_cross icon small red" onclick="return delTableRow('gasWholesaleForm', 'gasWholesaleShellChk', 'gasWholesaleDetailTbl');" tabindex="-1"><bean:message key="message.del"/></button>
                                <button class="i_plus icon small green" onclick="return addGasWholesaleShell();" tabindex="-1"><bean:message key="message.add"/></button>
                            </td>
                            <td>
                                <select style="width: 260px;" name="shellNameCombobox" id="shellNameCombobox">
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
            <td colspan="4"><div><%@include  file="/gaswholesale/details.jsp" %></div></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="gasReturn.title"/></td>
            <td><html:text property="gasReturn" size="30" name="<%=Constants.GAS_WHOLESALE%>" onblur="return gasWholesaleGasReturnChanged();" onkeyup="try2FloatFormatOnKeyUp(this,event);" onkeypress="return readonlyFloat(event);"/></td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="price.title"/></td>
            <td><html:text property="gasReturnPrice" size="30" name="<%=Constants.GAS_WHOLESALE%>" onblur="return gasWholesaleGasReturnChanged();" onkeyup="try2FloatFormatOnKeyUp(this,event);" onkeypress="return readonlyFloat(event);"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="discount.title"/></td>
            <td><html:text property="discount" size="30" name="<%=Constants.GAS_WHOLESALE%>" onblur="return gasWholesalePaidDiscountChanged();" onkeyup="try2FloatFormatOnKeyUp(this,event);" onkeypress="return readonlyFloat(event);"/></td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="amount.title"/></td>
            <td><html:text property="totalPay" size="30" name="<%=Constants.GAS_WHOLESALE%>" readonly="true" tabindex="-1"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="paid.title"/></td>
            <td><html:text property="paid" size="30" name="<%=Constants.GAS_WHOLESALE%>" onblur="return gasWholesalePaidDiscountChanged();" onkeyup="try2FloatFormatOnKeyUp(this,event);" onkeypress="return readonlyFloat(event);"/></td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="debt.title"/></td>
            <td><html:text property="debt" size="30" name="<%=Constants.GAS_WHOLESALE%>" readonly="true" tabindex="-1"/></td>
        </tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="gasWholesale.detail.returnShell.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <button class="i_cross icon small red" onclick="return delTableRow('gasWholesaleForm', 'gasWholesaleReturnShellChk', 'gasWholesaleReturnShellDetailTbl');" tabindex="-1"><bean:message key="message.del"/></button>
                                <button class="i_plus icon small green" onclick="return addGasWholesaleReturnShell();" tabindex="-1"><bean:message key="message.add"/></button>
                            </td>
                            <td>
                                <select style="width: 260px;" name="returnShellIdCombobox" id="returnShellIdCombobox">
                                    <logic:iterate id="return_shell_iter" name="<%=Constants.SHELL_RETURN_LIST%>">
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
            <td colspan="4"><div><%@include  file="/gaswholesale/returnshelldetails.jsp" %></div></td>
        </tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="promotionMaterial.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <button class="i_cross icon small red" onclick="return delTableRow('gasWholesaleForm', 'gasWholesalePromotionMaterialChk', 'gasWholesalePromotionMaterialDetailTbl');" tabindex="-1"><bean:message key="message.del"/></button>
                                <button class="i_plus icon small green" onclick="return addGasWholesalePromotionMaterial();" tabindex="-1"><bean:message key="message.add"/></button>
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
            <td colspan="4"><div><%@include  file="/gaswholesale/promotionmaterialdetails.jsp" %></div></td>
        </tr>
        <tr>
            <td colspan="4" align="center" height="50">
                <logic:equal name="<%=Constants.GAS_WHOLESALE%>" property="id" value="0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_GAS_WHOLESALE)) {%> 
                    <button class="i_create_write icon small green" onclick="return saveGasWholesale();"><bean:message key="message.save"/></button>
                    <%}%>
                </logic:equal>
                <logic:notEqual name="<%=Constants.GAS_WHOLESALE%>" property="id" value="0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_GAS_WHOLESALE)) {%> 
                    <logic:equal name="<%=Constants.GAS_WHOLESALE%>" property="canEdit" value="1">
                        <button class="i_create_write icon small green" onclick="return saveGasWholesale();"><bean:message key="message.save"/></button>
                    </logic:equal>
                    <%}%>
                </logic:notEqual>
                <logic:greaterThan name="<%=Constants.GAS_WHOLESALE%>" property="id" value="0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_GAS_WHOLESALE)) {%> 
                    <logic:equal name="<%=Constants.GAS_WHOLESALE%>" property="canEdit" value="1">
                        <button class="i_trashcan icon small red" onclick="return delGasWholesale();"><bean:message key="message.del"/></button>
                    </logic:equal>
                    <%}%>
                </logic:greaterThan>
                <button class="i_access_denied icon small yellow" onclick="return loadGasWholesalePanel();"><bean:message key="message.close"/></button>
            </td>
        </tr>
    </table>
    <html:hidden property="id" name="<%=Constants.GAS_WHOLESALE%>" />
    <html:hidden property="customerId" name="<%=Constants.GAS_WHOLESALE%>" />
    <html:hidden property="vehicleOutId" name="<%=Constants.GAS_WHOLESALE%>" />
    <html:hidden property="gasReturnAmount" name="<%=Constants.GAS_WHOLESALE%>" />
    <input type="hidden" id="callbackFunc"/>
    <input type="hidden" name="shellSelectedHidden" value="0"/>
    <input type="hidden" name="returnShellSelectedHidden" value="0"/>
    <input type="hidden" name="promotionMaterialSelectedHidden" value="0"/>
    <input type="hidden" name="vehicleSelectedHidden" value="0"/>
    <input type="hidden" name="customerSelectedHidden" value="0"/>
</form>
<div name="gasWholesaleFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
    F1 : Lưu
</div>
<div id="shiftEscFunctionHideDiv" style="display:none">loadGasWholesalePanel()</div>
<div id="shiftSFunctionHideDiv" style="display:none">saveGasWholesale()</div>
<div id="gasWholesaleShellHideDiv" style="display:none"></div>
<div id="gasWholesalePromotionMaterialHideDiv" style="display:none"></div>
<div id="gasWholesaleReturnShellHideDiv" style="display:none"></div>