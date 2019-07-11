<%@ page import="com.stepup.gasoline.qt.bean.VehicleInOilExportDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<table id="vehicleInOilExportDetailTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="30px"><bean:message key="message.del"/></td>
            <td width="170px"><bean:message key="code.title"/></td>
            <td width="100px"><bean:message key="customer.title"/></td>
            <td width="100px"><bean:message key="date.title"/></td>
            <td width="100px"><bean:message key="total.title"/></td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <logic:iterate id="oilExport" name="<%=Constants.VEHICLE_IN_OIL_EXPORT%>">
            <tr>
                <td>
                    <input type="checkbox" name="vehicleInOilExportChk" tabindex="-1" value="<%=((VehicleInOilExportDetailBean) pageContext.getAttribute("oilExport")).getId()%>">
                    <input type="hidden" name="vehicleInOilExportDetailId" value='<bean:write name="oilExport" property="id"/>'/>
                    <input type="hidden" name="oilExportId" value='<bean:write name="oilExport" property="oilExportId"/>'/>
                </td>
                <td><span><bean:write name="oilExport" property="code"/></span></td>
                <td><span><bean:write name="oilExport" property="customerName"/></span></td>
                <td><span><bean:write name="oilExport" property="createdDate"/></span></td>
                <td><span><bean:write name="oilExport" property="totalText"/></span></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>