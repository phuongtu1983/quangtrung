<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="vendorFormshowHelpHideDivContent">
    <form name="vendorForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="vendor.detail.code"/></td>
                            <td><html:text property="code" size="40" name="<%=Constants.VENDOR%>"/></td>
                            <td height="30" style="padding-left: 10px; padding-right: 20px"><bean:message key="vendor.detail.name"/></td>
                            <td><html:text property="name" size="40" name="<%=Constants.VENDOR%>"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="organization.title"/></td>
                            <td>
                                <html:select property="organizationId" name="<%=Constants.VENDOR%>" style="width:255px" onchange="return dynamicFieldOrganizationChanged(this,'vendor','vendorDynamicField')">
                                    <html:options collection="<%=Constants.ORGANIZATION_LIST%>" property="id" labelProperty="name"/>
                                </html:select>
                            </td>
                            <td style="padding-left: 10px; padding-right: 20px"><bean:message key="employee.detail.status"/></td>
                            <td>
                                <html:select property="status" name="<%=Constants.VENDOR%>" style="width:255px">
                                    <html:options collection="<%=Constants.STATUS_LIST%>" property="value" labelProperty="label"/>
                                </html:select>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="vendor.detail.organization"/></td>
                            <td>
                                <html:select property="equalOrganizationId" name="<%=Constants.VENDOR%>" style="width:255px">
                                    <html:options collection="<%=Constants.EQUAL_ORGANIZATION_LIST%>" property="id" labelProperty="name"/>
                                </html:select>
                            </td>
                            <td style="padding-left: 10px; padding-right: 20px"><bean:message key="vendor.detail.hasStock"/></td>
                            <td><html:checkbox property="hasStock" name="<%=Constants.VENDOR%>"></html:checkbox></td>
                            </tr>
                            <tr>
                                <td height="30" style="padding-right: 20px"><bean:message key="vendor.detail.isGas"/></td>
                            <td><html:checkbox property="isGas" name="<%=Constants.VENDOR%>"></html:checkbox></td>
                            <td style="padding-left: 10px; padding-right: 20px"><bean:message key="vendor.detail.isPetro"/></td>
                            <td><html:checkbox property="isPetro" name="<%=Constants.VENDOR%>"></html:checkbox></td>
                            </tr>
                            <tr>
                                <td height="30" style="padding-right: 20px"><bean:message key="vendor.detail.isGood"/></td>
                            <td colspan="3"><html:checkbox property="isGood" name="<%=Constants.VENDOR%>"></html:checkbox></td>
                            </tr>
                            <tr>
                                <td height="30" style="padding-right: 20px" colspan="4">
                                    <div id="vendorDynamicField"><%@include  file="/dynamicfield/fieldvalues.jsp"%></div>
                            </td>
                        </tr>
                    </table>
                </td></tr>
            <tr>
                <td align="center" height="30" colspan="4">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <logic:equal name="<%=Constants.VENDOR%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_VENDOR)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveVendor();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:equal>
                        <logic:notEqual name="<%=Constants.VENDOR%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_VENDOR)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveVendor();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:notEqual>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('vendorFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.VENDOR%>" />
        <input type="hidden" id="callbackFunc"/>
    </form>
    <div name="vendorFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('vendorFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveVendor()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('vendorFormshowHelpHideDiv')</div>
</div>