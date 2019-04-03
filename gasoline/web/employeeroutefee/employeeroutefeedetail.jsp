<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="employeeRouteFeeFormshowHelpHideDivContent">
    <form name="employeeRouteFeeForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="code.title"/></td>
                            <td><html:text property="code" size="30" name="<%=Constants.EMPLOYEE_ROUTE_FEE%>" readonly="true" tabindex="-1"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="date.title"/></td>
                            <td><html:text property="createdDate" styleId="employeeRouteFeeDate" size="30" name="<%=Constants.EMPLOYEE_ROUTE_FEE%>" tabindex="-1"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="employee.title"/></td>
                            <td>
                                <select style="width: 200px;" name="employeeIdCombobox" id="employeeIdCombobox">
                                    <logic:iterate id="employee_iter" name="<%=Constants.EMPLOYEE_LIST%>">
                                        <option  value="${employee_iter.id}">${employee_iter.fullname}</option>
                                    </logic:iterate>
                                </select>
                            </td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="vehicle.title"/></td>
                            <td>
                                <html:select property="vehicleId" name="<%=Constants.EMPLOYEE_ROUTE_FEE%>" style="width:195px">
                                    <html:options collection="<%=Constants.VEHICLE_LIST%>" property="id" labelProperty="plate"/>
                                </html:select>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="route.title"/></td>
                            <td colspan="3">
                                <select style="width: 560px;" name="routeIdCombobox" id="routeIdCombobox">
                                    <logic:iterate id="route_iter" name="<%=Constants.ROUTE_LIST%>">
                                        <option  value="${route_iter.id}">${route_iter.name}</option>
                                    </logic:iterate>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="employeeRouteFee.detail.inQuantity"/></td>
                            <td><html:text property="inQuantity" size="30" name="<%=Constants.EMPLOYEE_ROUTE_FEE%>" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="employeeRouteFee.detail.outQuantity"/></td>
                            <td><html:text property="outQuantity" size="30" name="<%=Constants.EMPLOYEE_ROUTE_FEE%>" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="price.title"/></td>
                            <td><html:text property="price" size="30" name="<%=Constants.EMPLOYEE_ROUTE_FEE%>" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="employeeRouteFee.detail.store"/></td>
                            <td><html:text property="store" size="30" name="<%=Constants.EMPLOYEE_ROUTE_FEE%>"/></td>
                        </tr>                     
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="note.title"/></td>
                            <td colspan="3"><html:text property="note" size="93" name="<%=Constants.EMPLOYEE_ROUTE_FEE%>" /></td>
                        </tr>
                    </table>
                </td></tr>
            <tr>
                <td align="center">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <logic:equal name="<%=Constants.EMPLOYEE_ROUTE_FEE%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_EMPLOYEE_ROUTE_FEE)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveEmployeeRouteFee();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:equal>
                        <logic:notEqual name="<%=Constants.EMPLOYEE_ROUTE_FEE%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_EMPLOYEE_ROUTE_FEE)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveEmployeeRouteFee();"><bean:message key="message.save"/></button>
                            <%}%>
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_EMPLOYEE_ROUTE_FEE)) {%> 
                            <button class="i_trashcan icon small red" onclick="return delEmployeeRouteFee();"><bean:message key="message.del"/></button>
                            <%}%>
                        </logic:notEqual>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('employeeRouteFeeFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.EMPLOYEE_ROUTE_FEE%>" />
        <input type="hidden" id="callbackFunc"/>
        <html:hidden property="routeId" name="<%=Constants.EMPLOYEE_ROUTE_FEE%>" />
        <input type="hidden" name="routeSelectedHidden" value="0"/>
        <html:hidden property="employeeId" name="<%=Constants.EMPLOYEE_ROUTE_FEE%>" />
        <input type="hidden" name="employeeSelectedHidden" value="0"/>
    </form>
    <div name="employeeRouteFeeFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('employeeRouteFeeFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveEmployeeRouteFee()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('employeeRouteFeeFormshowHelpHideDiv')</div>
</div>