<%@ page import="com.stepup.gasoline.qt.bean.VehicleOutEmployeeDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<table id="vehicleOutEmployeeDetailTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="30px"><bean:message key="message.del"/></td>
            <td width="170px"><bean:message key="employee.title"/></td>
            <td width="400px"><bean:message key="note.title"/></td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <logic:iterate id="employee" name="<%=Constants.VEHICLE_OUT_EMPLOYEE%>">
            <tr>
                <td>
                    <input type="checkbox" name="vehicleOutEmployeeChk" tabindex="-1" value="<%=((VehicleOutEmployeeDetailBean) pageContext.getAttribute("employee")).getId()%>">
                    <input type="hidden" name="vehicleOutEmployeeDetailId" value='<bean:write name="employee" property="id"/>'/>
                    <input type="hidden" name="employeeId" value='<bean:write name="employee" property="id"/>'/>
                </td>
                <td><span><bean:write name="employee" property="employeeName"/></span></td>
                <td><input type="text" size="50" name="employeeNote" value="${employee.note}"/></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>