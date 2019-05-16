<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div class="header"><bean:message key="agency.detail.add.title"/></div>
<form name="agencyForm">
    <table width="100%">
        <tr>
            <td width="200" height="30"><bean:message key="agency.detail.name"/></td>
            <td colspan="3"><html:text property="name" size="85" name="<%=Constants.AGENCY%>"/></td>
        </tr>
        <tr>
            <td width="200" height="30"><bean:message key="agency.detail.phone"/></td>
            <td width="200"><html:text property="phone" size="40" name="<%=Constants.AGENCY%>"/></td>
            <td width="70" style="padding-right: 50px;padding-left: 10px"><bean:message key="employee.detail.status"/></td>
            <td>
                <html:select property="status" name="<%=Constants.AGENCY%>">
                    <html:options collection="<%=Constants.STATUS_LIST%>" property="value" labelProperty="label"/>
                </html:select>
            </td>
        </tr>
        <tr>
            <td height="30"><bean:message key="agency.detail.address"/></td>
            <td colspan="3"><html:text property="address" size="85" name="<%=Constants.AGENCY%>"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="note.title"/></td>
            <td colspan="3"><html:text property="note" size="85" name="<%=Constants.AGENCY%>"/></td>
        </tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="agency.commission.list.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <button class="i_cross icon small red" onclick="return delTableRow('agencyForm', 'agencyCommissionChk', 'agencyCommissionDetailTbl');" tabindex="-1"><bean:message key="message.del"/></button>
                                <button class="i_plus icon small green" onclick="return addAgencyCommission();" tabindex="-1"><bean:message key="message.add"/></button>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td colspan="4"><div><%@include  file="/agency/commissiondetails.jsp" %></div></td>
        </tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="customer.list.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <button class="i_cross icon small red" onclick="return delTableRow('agencyForm', 'agencyCustomerChk', 'agencyCustomerDetailTbl');" tabindex="-1"><bean:message key="message.del"/></button>
                                <button class="i_plus icon small green" onclick="return addAgencyCustomer();" tabindex="-1"><bean:message key="message.add"/></button>
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
            <td colspan="4"><div><%@include  file="/agency/customerdetails.jsp" %></div></td>
        </tr>
        <tr>
            <td align="center" colspan="4">
                <p style="margin-top: 0; margin-bottom: 0">
                    <logic:equal name="<%=Constants.AGENCY%>" property="id" value="0">
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_AGENCY)) {%> 
                        <button class="i_create_write icon small green" onclick="return saveAgency();"><bean:message key="message.save"/></button>
                        <%}%>
                    </logic:equal>
                    <logic:notEqual name="<%=Constants.AGENCY%>" property="id" value="0">
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_AGENCY)) {%> 
                        <button class="i_create_write icon small green" onclick="return saveAgency();"><bean:message key="message.save"/></button>
                        <%}%>
                    </logic:notEqual>
                    <button class="i_access_denied icon small yellow" onclick="return loadAgencyPanel();"><bean:message key="message.close"/></button>
                </p>
            </td>
        </tr>
    </table> 
    <html:hidden property="id" name="<%=Constants.AGENCY%>" />
    <input type="hidden" id="callbackFunc"/>
    <input type="hidden" name="customerSelectedHidden" value="0"/>
</form>
<div name="agencyFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
    Ctrl+S : Lưu
</div>
<div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('agencyFormshowHelpHideDiv')</div>
<div id="shiftSFunctionHideDiv" style="display:none">saveAgency()</div>
<div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('agencyFormshowHelpHideDiv')</div>
<div id="agencyCustomerHideDiv" style="display:none"></div>
<div id="agencyCommissionHideDiv" style="display:none"></div>