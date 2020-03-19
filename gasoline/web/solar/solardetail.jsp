<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="solarFormshowHelpHideDivContent">
    <form name="solarForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="solar.detail.code"/></td>
                            <td><html:text property="code" size="40" name="<%=Constants.SOLAR%>"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="solar.detail.name"/></td>
                            <td><html:text property="name" size="40" name="<%=Constants.SOLAR%>"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="solarGroup.title"/></td>
                            <td>
                                <html:select property="groupId" name="<%=Constants.SOLAR%>" style="width:260px">
                                    <html:options collection="<%=Constants.SOLAR_GROUP_LIST%>" property="id" labelProperty="name"/>
                                </html:select>
                            </td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="employeeSolarCommission.title"/></td>
                            <td>
                                <html:select property="employeeCommissionId" name="<%=Constants.SOLAR%>" style="width:260px">
                                    <html:options collection="<%=Constants.EMPLOYEE_SOLAR_COMMISSION_LIST%>" property="id" labelProperty="name"/>
                                </html:select>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="solar.detail.baseUnit"/></td>
                            <td>
                                <html:select property="baseUnitId" name="<%=Constants.SOLAR%>" style="width:260px">
                                    <html:options collection="<%=Constants.UNIT_LIST%>" property="id" labelProperty="name"/>
                                </html:select>
                            </td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="solar.detail.saleUnit"/></td>
                            <td>
                                <html:select property="saleUnitId" name="<%=Constants.SOLAR%>" style="width:260px">
                                    <html:options collection="<%=Constants.UNIT_LIST%>" property="id" labelProperty="name"/>
                                </html:select>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="solar.detail.weightUnit"/></td>
                            <td>
                                <html:select property="weightUnitId" name="<%=Constants.SOLAR%>" style="width:260px">
                                    <html:options collection="<%=Constants.UNIT_LIST%>" property="id" labelProperty="name"/>
                                </html:select>
                            </td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="solar.detail.weight"/></td>
                            <td><html:text property="weight" size="40" name="<%=Constants.SOLAR%>" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="vendor.title"/></td>
                            <td>
                                <html:select property="vendorId" name="<%=Constants.SOLAR%>" style="width:260px">
                                    <html:options collection="<%=Constants.VENDOR_LIST%>" property="id" labelProperty="name"/>
                                </html:select>
                            </td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="price.title"/></td>
                            <td><html:text property="price" size="40" name="<%=Constants.SOLAR%>" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="employee.detail.status"/></td>
                            <td>
                                <html:select property="status" name="<%=Constants.SOLAR%>" style="width:260px">
                                    <html:options collection="<%=Constants.STATUS_LIST%>" property="value" labelProperty="label"/>
                                </html:select>
                            </td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="organization.title"/></td>
                            <td>
                                <html:select property="organizationId" name="<%=Constants.SOLAR%>" style="width:260px">
                                    <html:options collection="<%=Constants.ORGANIZATION_LIST%>" property="id" labelProperty="name"/>
                                </html:select>
                            </td>
                        </tr>
                    </table>
                </td></tr>
            <tr>
                <td align="center">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <logic:equal name="<%=Constants.SOLAR%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_SOLAR)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveSolar();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:equal>
                        <logic:notEqual name="<%=Constants.SOLAR%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_SOLAR)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveSolar();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:notEqual>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('solarFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.SOLAR%>" />
        <input type="hidden" id="callbackFunc"/>
    </form>
    <div name="solarFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('solarFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveSolar()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('solarFormshowHelpHideDiv')</div>
</div>