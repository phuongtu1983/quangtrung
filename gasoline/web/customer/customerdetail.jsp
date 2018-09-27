<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="customerFormshowHelpHideDivContent">
    <form name="customerForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="customer.detail.code"/></td>
                            <td><html:text property="code" size="40" name="<%=Constants.CUSTOMER%>"/></td>
                            <td height="30" style="padding-left: 10px; padding-right: 20px"><bean:message key="customer.detail.name"/></td>
                            <td><html:text property="name" size="40" name="<%=Constants.CUSTOMER%>"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="organization.title"/></td>
                            <td>
                                <html:select property="organizationId" name="<%=Constants.CUSTOMER%>" style="width:255px" onchange="return dynamicFieldOrganizationChanged(this,'customer','customerDynamicField')">
                                    <html:options collection="<%=Constants.ORGANIZATION_LIST%>" property="id" labelProperty="name"/>
                                </html:select>
                            </td>
                            <td style="padding-left: 10px; padding-right: 20px"><bean:message key="employee.detail.status"/></td>
                            <td>
                                <html:select property="status" name="<%=Constants.CUSTOMER%>" style="width:255px">
                                    <html:options collection="<%=Constants.STATUS_LIST%>" property="value" labelProperty="label"/>
                                </html:select>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="customer.detail.phone"/></td>
                            <td><html:text property="phone" size="40" name="<%=Constants.CUSTOMER%>"/></td>
                            <td height="30" style="padding-left: 10px; padding-right: 20px"><bean:message key="customer.detail.tax"/></td>
                            <td><html:text property="tax" size="40" name="<%=Constants.CUSTOMER%>"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="customer.detail.presenter"/></td>
                            <td><html:text property="presenter" size="40" name="<%=Constants.CUSTOMER%>"/></td>
                            <td height="30" style="padding-left: 10px; padding-right: 20px"><bean:message key="customer.detail.presenterPosition"/></td>
                            <td><html:text property="presenterPosition" size="40" name="<%=Constants.CUSTOMER%>"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="customer.detail.bankAccount"/></td>
                            <td colspan="3"><html:text property="bankAccount" size="90" name="<%=Constants.CUSTOMER%>"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="customer.detail.address"/></td>
                            <td colspan="3"><html:text property="address" size="90" name="<%=Constants.CUSTOMER%>"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="customer.detail.kind"/></td>
                            <td colspan="3">
                                <html:select property="kind" name="<%=Constants.CUSTOMER%>" style="width:255px">
                                    <html:options collection="<%=Constants.CUSTOMER_KIND_LIST%>" property="value" labelProperty="label"/>
                                </html:select>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px" colspan="4">
                                <div id="customerDocuments"><%@include  file="/customer/documents.jsp"%></div>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px" colspan="4">
                                <div id="customerDynamicField"><%@include  file="/dynamicfield/fieldvalues.jsp"%></div>
                            </td>
                        </tr>
                    </table>
                </td></tr>
            <tr>
                <td align="center" height="30" colspan="4">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <logic:equal name="<%=Constants.CUSTOMER%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_CUSTOMER)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveCustomer();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:equal>
                        <logic:notEqual name="<%=Constants.CUSTOMER%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_CUSTOMER)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveCustomer();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:notEqual>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('customerFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.CUSTOMER%>" />
        <input type="hidden" id="callbackFunc"/>
    </form>
    <div name="customerFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('customerFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveCustomer()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('customerFormshowHelpHideDiv')</div>
</div>