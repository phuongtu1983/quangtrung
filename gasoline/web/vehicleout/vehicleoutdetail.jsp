<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div class="header"><bean:message key="vehicleOut.detail.add.title"/></div>
<form name="vehicleOutForm">
    <table style="width: 100%">
        <tr>
            <td width="100" height="30"><bean:message key="code.title"/></td>
            <td width="160"><html:text property="code" size="30" name="<%=Constants.VEHICLE_OUT%>" readonly="true" tabindex="-1"/></td>
            <td width="70"  style="padding-right: 20px;padding-left: 10px"><bean:message key="date.title"/></td>
            <td><html:text property="createdDate" size="30" name="<%=Constants.VEHICLE_OUT%>" styleId="vehicleOutCreatedDate" tabindex="-1"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px""><bean:message key="vehicle.title"/></td>
            <td colspan="3">
                <html:select property="vehicleId" name="<%=Constants.VEHICLE_OUT%>" style="width:195px" tabindex="-1">
                    <html:options collection="<%=Constants.VEHICLE_LIST%>" property="id" labelProperty="plate"/>
                </html:select>
            </td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="note.title"/></td>
            <td colspan="3"><html:text property="note" size="83" name="<%=Constants.VEHICLE_OUT%>" tabindex="-1"/></td>
        </tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="detail.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <button class="i_cross icon small red" onclick="return delTableRow('vehicleOutForm', 'vehicleOutGoodChk', 'vehicleOutDetailTbl');" tabindex="-1"><bean:message key="message.del"/></button>
                                <button class="i_plus icon small green" onclick="return addVehicleOutGood();" tabindex="-1"><bean:message key="message.add"/></button>
                            </td>
                            <td>
                                <select style="width: 260px;" name="goodIdCombobox" id="goodIdCombobox">
                                    <logic:iterate id="good_iter" name="<%=Constants.SHELL_LIST%>">
                                        <option  value="${good_iter.id}">${good_iter.name}</option>
                                    </logic:iterate>
                                </select>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr><td colspan="4"><div><%@include  file="/vehicleout/details.jsp" %></div></td></tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="employee.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <button class="i_cross icon small red" onclick="return delTableRow('vehicleOutForm', 'vehicleOutEmployeeChk', 'vehicleOutEmployeeDetailTbl');" tabindex="-1"><bean:message key="message.del"/></button>
                                <button class="i_plus icon small green" onclick="return addVehicleOutEmployee();" tabindex="-1"><bean:message key="message.add"/></button>
                            </td>
                            <td>
                                <select style="width: 260px;" name="employeeIdCombobox" id="employeeIdCombobox">
                                    <logic:iterate id="employee_iter" name="<%=Constants.EMPLOYEE_LIST%>">
                                        <option  value="${employee_iter.id}">${employee_iter.fullname}</option>
                                    </logic:iterate>
                                </select>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr><td colspan="4"><div><%@include  file="/vehicleout/employeedetails.jsp" %></div></td></tr>
        <tr>
            <td colspan="4" align="center" height="50">
                <logic:equal name="<%=Constants.VEHICLE_OUT%>" property="id" value="0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_VEHICLE_OUT)) {%> 
                    <button class="i_create_write icon small green" onclick="return saveVehicleOut();"><bean:message key="message.save"/></button>
                    <%}%>
                </logic:equal>
                <logic:notEqual name="<%=Constants.VEHICLE_OUT%>" property="id" value="0">
                    <logic:equal name="<%=Constants.VEHICLE_OUT%>" property="canEdit" value="1">
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_VEHICLE_OUT)) {%> 
                        <button class="i_create_write icon small green" onclick="return saveVehicleOut();"><bean:message key="message.save"/></button>
                        <%}%>
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_VEHICLE_OUT)) {%> 
                        <button class="i_trashcan icon small red" onclick="return delVehicleOut();"><bean:message key="message.del"/></button>
                        <%}%>
                    </logic:equal>
                </logic:notEqual>
                <button class="i_access_denied icon small yellow" onclick="return loadVehicleOutPanel();"><bean:message key="message.close"/></button>
            </td>
        </tr>
    </table>
    <html:hidden property="id" name="<%=Constants.VEHICLE_OUT%>" />
    <input type="hidden" id="callbackFunc"/>
    <input type="hidden" name="shellSelectedHidden" value="0"/>
    <input type="hidden" name="employeeSelectedHidden" value="0"/>
</form>
<div name="vehicleOutFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
    Ctrl+C : Đóng
    Ctrl+S : Lưu
</div>
<div id="shiftCFunctionHideDiv" style="display:none">loadVehicleOutPanel()</div>
<div id="shiftSFunctionHideDiv" style="display:none">saveVehicleOut()</div>
<div id="vehicleOutGoodHideDiv" style="display:none"></div>
<div id="vehicleOutEmployeeHideDiv" style="display:none"></div>