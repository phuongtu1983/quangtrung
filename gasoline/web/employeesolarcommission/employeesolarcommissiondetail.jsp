<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div class="header"><bean:message key="employeeSolarCommission.detail.add.title"/></div>
<form name="employeeSolarCommissionForm">
    <table width="100%" cellspacing="0" cellpadding="0">
        <tr>
            <td width="180" height="30" style="padding-right: 20px"><bean:message key="employeeSolarCommission.detail.name"/></td>
            <td width="200"><html:text property="name" size="20" name="<%=Constants.EMPLOYEE_SOLAR_COMMISSION%>"/></td>
            <td width="180" height="30" style="padding-left: 10px; padding-right: 20px"><bean:message key="employeeSolarCommission.detail.code"/></td>
            <td><html:text property="code" size="20" name="<%=Constants.EMPLOYEE_SOLAR_COMMISSION%>"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="note.title"/></td>
            <td colspan="3"><html:text property="note" size="107" name="<%=Constants.EMPLOYEE_SOLAR_COMMISSION%>"/></td>
        </tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="agency.commission.list.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <button class="i_cross icon small red" onclick="return delTableRow('employeeSolarCommissionForm', 'employeeSolarCommissionCommissionChk', 'employeeSolarCommissionCommissionDetailTbl');" tabindex="-1"><bean:message key="message.del"/></button>
                                <button class="i_plus icon small green" onclick="return addEmployeeSolarCommissionCommission();" tabindex="-1"><bean:message key="message.add"/></button>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td colspan="4"><div><%@include  file="/employeesolarcommission/commissiondetails.jsp" %></div></td>
        </tr>
        <tr>
            <td align="center" colspan="4">
                <p style="margin-top: 0; margin-bottom: 0">
                    <logic:equal name="<%=Constants.EMPLOYEE_SOLAR_COMMISSION%>" property="id" value="0">
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_EMPLOYEE_SOLAR_COMMISSION)) {%> 
                        <button class="i_create_write icon small green" onclick="return saveEmployeeSolarCommission();"><bean:message key="message.save"/></button>
                        <%}%>
                    </logic:equal>
                    <logic:notEqual name="<%=Constants.EMPLOYEE_SOLAR_COMMISSION%>" property="id" value="0">
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_EMPLOYEE_SOLAR_COMMISSION)) {%> 
                        <button class="i_create_write icon small green" onclick="return saveEmployeeSolarCommission();"><bean:message key="message.save"/></button>
                        <%}%>
                    </logic:notEqual>
                    <logic:greaterThan name="<%=Constants.EMPLOYEE_SOLAR_COMMISSION%>" property="id" value="0">
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_EMPLOYEE_SOLAR_COMMISSION)) {%> 
                        <button class="i_trashcan icon small red" onclick="return delEmployeeSolarCommission();"><bean:message key="message.del"/></button>
                        <%}%>
                    </logic:greaterThan>
                    <button class="i_access_denied icon small yellow" onclick="return loadEmployeeSolarCommissionPanel();"><bean:message key="message.close"/></button>
                </p>
            </td>
        </tr>
    </table> 
    <html:hidden property="id" name="<%=Constants.EMPLOYEE_SOLAR_COMMISSION%>" />
    <input type="hidden" id="callbackFunc"/>
</form>
<div name="employeeSolarCommissionFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
    Ctrl+C : Đóng
    Ctrl+S : Lưu
</div>
<div id="shiftCFunctionHideDiv" style="display:none">loadAgencyPanel()</div>
<div id="shiftSFunctionHideDiv" style="display:none">saveDiscount()</div>
<div id="shiftEscFunctionHideDiv" style="display:none">loadDiscountPanel()</div>
<div id="employeeSolarCommissionCommissionHideDiv" style="display:none"></div>
<div id="employeeSolarCommissionCustomerHideDiv" style="display:none"></div>