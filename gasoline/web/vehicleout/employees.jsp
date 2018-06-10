<%@ page import="com.stepup.gasoline.qt.bean.VehicleOutEmployeeDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table class="its" id="vehicleOutEmployeeTbl">
    <logic:iterate id="employee" name="<%=Constants.VEHICLE_OUT_EMPLOYEE%>">
        <tr>
            <td>
                <input type="checkbox" name="vehicleOutEmployeeChk" tabindex="-1" value="<bean:write name="employee" property="id"/>">
                <input type="hidden" name="vehicleOutEmployeeDetailId" value='0'/>
                <input type="hidden" name="employeeId" value='<bean:write name="employee" property="id"/>'/>
            </td>
            <td><span><bean:write name="employee" property="fullname"/></span></td>
            <td><input type="text" size="50" name="employeeNote"/></td>
        </tr>
    </logic:iterate>
</table>