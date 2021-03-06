<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div class="header"><bean:message key="vehicleIn.detail.add.title"/></div>
<form name="vehicleInForm">
    <table style="width: 100%">
        <tr>
            <td width="150" height="30"><bean:message key="code.title"/></td>
            <td width="160"><html:text property="code" size="30" name="<%=Constants.VEHICLE_IN%>" readonly="true" tabindex="-1"/></td>
            <td width="170"  style="padding-right: 20px;padding-left: 10px"><bean:message key="date.title"/></td>
            <td><html:text property="createdDate" size="30" name="<%=Constants.VEHICLE_IN%>" styleId="vehicleInCreatedDate" tabindex="-1"/></td>
        </tr>
        <tr>
            <td><bean:message key="vehicleOut.detail.date.title"/></td>
            <td width="200"><input type="text" size="30" tabindex="-1" id="vehicleInVehicleOutCreatedDate"></td>
            <td style="padding-right: 50px;padding-left: 10px"><bean:message key="vehicleOut.title"/></td>
            <td>
                <select style="width: 195px;" name="vehicleOutIdCombobox" id="vehicleOutIdCombobox" tabindex="-1">
                    <logic:iterate id="vehicle_iter" name="<%=Constants.VEHICLE_OUT_LIST%>">
                        <option  value="${vehicle_iter.id}">${vehicle_iter.code}</option>
                    </logic:iterate>
                </select>
            </td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="note.title"/></td>
            <td colspan="3"><html:text property="note" size="100" name="<%=Constants.VEHICLE_IN%>" tabindex="-1"/></td>
        </tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="detail.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <button class="i_cross icon small red" onclick="return delTableRow('vehicleInForm', 'vehicleInGoodChk', 'vehicleInDetailTbl');" tabindex="-1"><bean:message key="message.del"/></button>
                                <button class="i_plus icon small green" onclick="return addVehicleInGood();" tabindex="-1"><bean:message key="message.add"/></button>
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
        <tr><td colspan="4"><div><%@include  file="/vehiclein/details.jsp" %></div></td></tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="accessory.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <button class="i_cross icon small red" onclick="return delTableRow('vehicleInForm', 'vehicleInAccessoryChk', 'vehicleInAccessoryDetailTbl');" tabindex="-1"><bean:message key="message.del"/></button>
                                <button class="i_plus icon small green" onclick="return addVehicleInAccessory();" tabindex="-1"><bean:message key="message.add"/></button>
                            </td>
                            <td>
                                <select style="width: 260px;" name="accessoryIdCombobox" id="accessoryIdCombobox">
                                    <logic:iterate id="accessory_iter" name="<%=Constants.ACCESSORY_LIST%>">
                                        <option  value="${accessory_iter.id}">${accessory_iter.name}</option>
                                    </logic:iterate>
                                </select>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr><td colspan="4"><div><%@include  file="/vehiclein/accessorydetails.jsp" %></div></td></tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="oilExport.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <button class="i_cross icon small red" onclick="return delTableRow('vehicleInForm', 'vehicleInOilExportChk', 'vehicleInOilExportDetailTbl');" tabindex="-1"><bean:message key="message.del"/></button>
                                <button class="i_plus icon small green" onclick="return addVehicleInOilExport();" tabindex="-1"><bean:message key="message.add"/></button>
                            </td>
                            <td>
                                <select style="width: 260px;" name="oilExportIdCombobox" id="oilExportIdCombobox">
                                    <logic:iterate id="oil_export_iter" name="<%=Constants.OIL_EXPORT_LIST%>">
                                        <option  value="${oil_export_iter.id}">${oil_export_iter.code} (${oil_export_iter.customerName})</option>
                                    </logic:iterate>
                                </select>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr><td colspan="4"><div><%@include  file="/vehiclein/oilexportdetails.jsp" %></div></td></tr>
        <tr>
            <td colspan="4" align="center" height="50">
                <logic:equal name="<%=Constants.VEHICLE_IN%>" property="id" value="0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_VEHICLE_IN)) {%> 
                    <button class="i_create_write icon small green" onclick="return saveVehicleIn();"><bean:message key="message.save"/></button>
                    <%}%>
                </logic:equal>
                <logic:notEqual name="<%=Constants.VEHICLE_IN%>" property="id" value="0">
                    <logic:equal name="<%=Constants.VEHICLE_IN%>" property="canEdit" value="1">
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_VEHICLE_IN)) {%> 
                        <button class="i_create_write icon small green" onclick="return saveVehicleIn();"><bean:message key="message.save"/></button>
                        <%}%>
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_VEHICLE_IN)) {%> 
                        <button class="i_trashcan icon small red" onclick="return delVehicleIn();"><bean:message key="message.del"/></button>
                        <%}%>
                    </logic:equal>
                </logic:notEqual>
                <button class="i_access_denied icon small yellow" onclick="return loadVehicleInPanel();"><bean:message key="message.close"/></button>
            </td>
        </tr>
    </table>
    <html:hidden property="id" name="<%=Constants.VEHICLE_IN%>" />
    <html:hidden property="vehicleOutId" name="<%=Constants.VEHICLE_IN%>" />
    <input type="hidden" id="callbackFunc"/>
    <input type="hidden" name="shellSelectedHidden" value="0"/>
    <input type="hidden" name="accessorySelectedHidden" value="0"/>
    <input type="hidden" name="oilExportSelectedHidden" value="0"/>
    <input type="hidden" name="returnShellSelectedHidden" value="0"/>
    <input type="hidden" name="vehicleSelectedHidden" value="0"/>
</form>
<div name="vehicleInFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
    Ctrl+C : Đóng
    Ctrl+S : Lưu
</div>
<div id="shiftCFunctionHideDiv" style="display:none">loadVehicleInPanel()</div>
<div id="shiftSFunctionHideDiv" style="display:none">saveVehicleIn()</div>
<div id="vehicleInGoodHideDiv" style="display:none"></div>
<div id="vehicleInAccessoryHideDiv" style="display:none"></div>
<div id="vehicleInOilExportHideDiv" style="display:none"></div>
<div id="vehicleInReturnShellHideDiv" style="display:none"></div>