<%@ page import="com.stepup.gasoline.qt.bean.VehicleInAccessoryDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table class="its" id="vehicleInAccessoryTbl">
    <logic:iterate id="accessory" name="<%=Constants.VEHICLE_IN_ACCESSORY%>">
        <tr>
            <td>
                <input type="checkbox" name="vehicleInAccessoryChk" tabindex="-1" value="<bean:write name="accessory" property="id"/>">
                <input type="hidden" name="vehicleInAccessoryDetailId" value='0'/>
                <input type="hidden" name="accessoryId" value='<bean:write name="accessory" property="id"/>'/>
            </td>
            <td><span><bean:write name="accessory" property="name"/></span></td>
            <td><span><bean:write name="accessory" property="unitName"/></span></td>
            <td><input type="text" size="20" name="accessoryQuantity" id="accessorydetquantity${accessory.id}" value="0" onblur="return caculateVehicleInAccessoryListDetail('${accessory.id}');" onkeyup="try2FloatFormatOnKeyUp(this, event);" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="accessoryPrice" id="accessorydetprice${accessory.id}" value="${accessory.price}" onblur="return caculateVehicleInAccessoryListDetail('${accessory.id}');" onkeyup="try2FloatFormatOnKeyUp(this,event);" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="accessoryAmount" id="accessorydetamount${accessory.id}" value="0" readonly="readonly"/></td>
        </tr>
    </logic:iterate>
</table>