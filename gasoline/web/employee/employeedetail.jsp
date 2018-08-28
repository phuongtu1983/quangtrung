<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="employeeFormshowHelpHideDivContent">
    <form name="employeeForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="employee.detail.fullname"/></td>
                            <td><html:text property="fullname" size="40" name="<%=Constants.EMPLOYEE%>"/></td>
                            <td height="30" style="padding-left: 10px; padding-right: 20px"><bean:message key="employee.detail.email"/></td>
                            <td><html:text property="email" size="40" name="<%=Constants.EMPLOYEE%>"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="organization.title"/></td>
                            <td>
                                <html:select property="organizationId" name="<%=Constants.EMPLOYEE%>" style="width:255px" onchange="return dynamicFieldOrganizationChanged(this,'employee','employeeDynamicField')">
                                    <html:options collection="<%=Constants.ORGANIZATION_LIST%>" property="id" labelProperty="name"/>
                                </html:select>
                            </td>
                            <td style="padding-left: 10px; padding-right: 20px"><bean:message key="employee.detail.status"/></td>
                            <td>
                                <html:select property="status" name="<%=Constants.EMPLOYEE%>" style="width:255px">
                                    <html:options collection="<%=Constants.STATUS_LIST%>" property="value" labelProperty="label"/>
                                </html:select>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="employee.detail.salary"/></td>
                            <td><html:text property="salary" size="40" name="<%=Constants.EMPLOYEE%>" onkeyup="try2FloatFormatOnKeyUp(this,event);" onkeypress="return readonlyFloat(event);"/></td>
                            <td height="30" style="padding-left: 10px; padding-right: 20px"><bean:message key="employee.detail.birthday"/></td>
                            <td><html:text property="birthday" styleId="employeeBirthday" size="30" name="<%=Constants.EMPLOYEE%>"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px" colspan="4">
                                <div id="employeeDynamicField"><%@include  file="/dynamicfield/fieldvalues.jsp"%></div>
                            </td>
                        </tr>
                    </table>
                </td></tr>
            <tr>
                <td align="center" height="30" colspan="4">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <logic:equal name="<%=Constants.EMPLOYEE%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_EMPLOYEE)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveEmployee();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:equal>
                        <logic:notEqual name="<%=Constants.EMPLOYEE%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_EMPLOYEE)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveEmployee();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:notEqual>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('employeeFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.EMPLOYEE%>" />
        <input type="hidden" id="callbackFunc"/>
    </form>
    <div name="employeeFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('employeeFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveEmployee()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('employeeFormshowHelpHideDiv')</div>
</div>