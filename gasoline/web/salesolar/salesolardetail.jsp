<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div class="header"><bean:message key="saleSolar.detail.add.title"/></div>
<form name="saleSolarForm">
    <table style="width: 100%">
        <tr>
            <td width="250" height="30"><bean:message key="code.title"/></td>
            <td width="160"><html:text property="code" size="30" name="<%=Constants.SALE_SOLAR%>" readonly="true" tabindex="-1"/></td>
            <td width="200"  style="padding-right: 20px;padding-left: 10px"><bean:message key="date.title"/></td>
            <td><html:text property="createdDate" size="30" name="<%=Constants.SALE_SOLAR%>" styleId="saleSolarCreatedDate" tabindex="-1"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="account.title"/></td>
            <td>
                <html:select property="accountId" name="<%=Constants.SALE_SOLAR%>" style="width:195px" tabindex="0">
                    <html:options collection="<%=Constants.ACCOUNT_LIST%>" property="id" labelProperty="number"/>
                </html:select>
            </td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="total.title"/></td>
            <td><html:text property="total" size="30" name="<%=Constants.SALE_SOLAR%>" readonly="true" tabindex="-1"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="customer.title"/></td>
            <td>
                <select style="width: 195px;" name="customerIdCombobox" id="customerIdCombobox">
                    <logic:iterate id="customer_iter" name="<%=Constants.CUSTOMER_LIST%>">
                        <option  value="${customer_iter.id}">${customer_iter.name}</option>
                    </logic:iterate>
                </select>
            </td>
            <td width="170"  style="padding-right: 20px;padding-left: 10px"><bean:message key="customer.detail.percentage"/></td>
            <td><html:text property="commission" size="30" name="<%=Constants.SALE_SOLAR%>" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="saleSolar.detail.commission.kind"/></td>
            <td>
                <html:select property="commissionKind" name="<%=Constants.SALE_SOLAR%>" style="width:195px" tabindex="0" onchange="return saleSolarSetCommission();">
                    <html:options collection="<%=Constants.COMMISSION_KIND_LIST%>" property="value" labelProperty="label"/>
                </html:select>
            </td>
            <td width="170"  style="padding-right: 20px;padding-left: 10px"><bean:message key="saleSolar.detail.commission"/></td>
            <td><html:text property="commissionAmount" size="30" name="<%=Constants.SALE_SOLAR%>" readonly="true" tabindex="-1"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="saleSolar.detail.gapCustomer"/></td>
            <td><html:text property="gapCustomerAmount" size="30" name="<%=Constants.SALE_SOLAR%>" readonly="true" tabindex="-1"/></td>
            <td width="170"  style="padding-right: 20px;padding-left: 10px"><bean:message key="saleSolar.detail.gapAgency"/></td>
            <td><html:text property="gapAgencyAmount" size="30" name="<%=Constants.SALE_SOLAR%>" readonly="true" tabindex="-1"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="discount.title"/></td>
            <td><html:text property="discount" size="30" name="<%=Constants.SALE_SOLAR%>" onblur="return formPaidDiscountChanged('saleSolarForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="amount.title"/></td>
            <td><html:text property="totalPay" size="30" name="<%=Constants.SALE_SOLAR%>" readonly="true" tabindex="-1"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="paid.title"/></td>
            <td><html:text property="paid" size="30" name="<%=Constants.SALE_SOLAR%>" onblur="return formPaidDiscountChanged('saleSolarForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="debt.title"/></td>
            <td><html:text property="debt" size="30" name="<%=Constants.SALE_SOLAR%>" readonly="true" tabindex="-1"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="saleSolar.detail.calculateAgencyCommission"/></td>
            <td><html:checkbox property="isCalculateAgencyCommission" name="<%=Constants.SALE_SOLAR%>"></html:checkbox></td>
            </tr>
            <tr>
                <td height="30" style="padding-right: 20px"><bean:message key="note.title"/></td>
            <td colspan="3"><html:text property="note" size="105" name="<%=Constants.SALE_SOLAR%>"/></td>
        </tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="detail.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <button class="i_cross icon small red" onclick="return delSaleSolarDetail();" tabindex="-1"><bean:message key="message.del"/></button>
                                <button class="i_plus icon small green" onclick="return addSaleSolarSolar();" tabindex="-1"><bean:message key="message.add"/></button>
                            </td>
                            <td>
                                <select style="width: 100px;" name="solarCodeCombobox" id="solarCodeCombobox">
                                    <logic:iterate id="solar_iter" name="<%=Constants.SOLAR_LIST%>">
                                        <option  value="${solar_iter.id}">${solar_iter.code}</option>
                                    </logic:iterate>
                                </select>
                            </td>
                            <td>
                                <select style="width: 300px;" name="solarNameCombobox" id="solarNameCombobox">
                                    <logic:iterate id="solar_iter" name="<%=Constants.SOLAR_LIST%>">
                                        <option  value="${solar_iter.id}">${solar_iter.name}</option>
                                    </logic:iterate>
                                </select>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr><td colspan="4"><div><%@include  file="/salesolar/details.jsp" %></div></td></tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="promotionMaterial.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <button class="i_cross icon small red" onclick="return delTableRow('saleSolarForm', 'saleSolarPromotionMaterialChk', 'saleSolarPromotionMaterialDetailTbl');" tabindex="-1"><bean:message key="message.del"/></button>
                                <button class="i_plus icon small green" onclick="return addSaleSolarPromotionMaterial();" tabindex="-1"><bean:message key="message.add"/></button>
                            </td>
                            <td>
                                <select style="width: 260px;" name="promotionMaterialIdCombobox" id="promotionMaterialIdCombobox">
                                    <logic:iterate id="promotion_material_iter" name="<%=Constants.SOLAR_LIST%>">
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
            <td colspan="4"><div><%@include  file="/salesolar/promotionmaterialdetails.jsp" %></div></td>
        </tr>
        <tr>
            <td colspan="4" align="center" height="50">
                <logic:equal name="<%=Constants.SALE_SOLAR%>" property="id" value="0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_SALE_SOLAR)) {%> 
                    <button class="i_create_write icon small green" onclick="return saveSaleSolar();"><bean:message key="message.save"/></button>
                    <%}%>
                </logic:equal>
                <logic:notEqual name="<%=Constants.SALE_SOLAR%>" property="id" value="0">
                    <logic:equal name="<%=Constants.SALE_SOLAR%>" property="canEdit" value="1">
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_SALE_SOLAR)) {%> 
                        <button class="i_create_write icon small green" onclick="return saveSaleSolar();"><bean:message key="message.save"/></button>
                        <%}%>
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_SOLAR_EXPORT)) {%> 
                        <button class="i_bended_arrow_left icon small green" onclick="return getSaleSolarReturn(0, <bean:write name="<%=Constants.SALE_SOLAR%>" property="id"/>);"><bean:message key="saleSolarReturn.title"/></button>
                        <%}%>
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_SALE_SOLAR_RETURN)) {%> 
                        <button class="i_create_write icon small green" onclick="return getSolarExport(0, <bean:write name="<%=Constants.SALE_SOLAR%>" property="id"/>);"><bean:message key="solarExport.title"/></button>
                        <%}%>
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_SALE_SOLAR)) {%> 
                        <button class="i_trashcan icon small red" onclick="return delSaleSolar();"><bean:message key="message.del"/></button>
                        <%}%>
                    </logic:equal>
                </logic:notEqual>
                <button class="i_access_denied icon small yellow" onclick="return loadSaleSolarPanel();"><bean:message key="message.close"/></button>
            </td>
        </tr>
    </table>
    <html:hidden property="id" name="<%=Constants.SALE_SOLAR%>" />
    <input type="hidden" id="callbackFunc"/>
    <input type="hidden" name="solarSelectedHidden" value="0"/>
    <html:hidden property="customerId" name="<%=Constants.SALE_SOLAR%>" />
    <input type="hidden" name="customerSelectedHidden" value="0"/>
    <input type="hidden" name="promotionMaterialSelectedHidden" value="0"/>
</form>
<div name="saleSolarFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
    Ctrl+C : Đóng
    Ctrl+S : Lưu
</div>
<div id="shiftCFunctionHideDiv" style="display:none">loadSaleSolarPanel()</div>
<div id="shiftSFunctionHideDiv" style="display:none">saveSaleSolar()</div>
<div id="saleSolarSolarHideDiv" style="display:none"></div>
<div id="saleSolarChangeSolarHideDiv" style="display:none"></div>
<div id="saleSolarPromotionMaterialHideDiv" style="display:none"></div>