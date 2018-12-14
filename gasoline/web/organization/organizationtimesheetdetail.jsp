<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="organizationTimesheetFormshowHelpHideDivContent">
    <form name="organizationTimesheetForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="organization.title"/></td>
                            <td><html:text property="organizationName" size="40" name="<%=Constants.ORGANIZATION_TIMESHEET%>" readonly="true" tabindex="-1"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px" colspan="2">
                                <div id="organizationTimesheetDynamicField"><%@include  file="/dynamicfield/fieldvalues.jsp"%></div>
                            </td>
                        </tr>
                    </table>
                </td></tr>
            <tr>
                <td align="center" height="30" colspan="2">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <logic:notEqual name="<%=Constants.ORGANIZATION_TIMESHEET%>" property="organizationId" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_SALARY)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveOrganizationTimesheet();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:notEqual>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('organizationTimesheetFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table> 
        <html:hidden property="organizationId" name="<%=Constants.ORGANIZATION_TIMESHEET%>" />
        <input type="hidden" id="callbackFunc"/>
    </form>
    <div name="organizationTimesheetFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('organizationTimesheetFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveOrganizationTimesheet()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('organizationTimesheetFormshowHelpHideDiv')</div>
</div>