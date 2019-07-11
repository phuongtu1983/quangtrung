<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table class="its" id="vehicleInOilExportTbl">
    <logic:iterate id="oilExport" name="<%=Constants.VEHICLE_IN_OIL_EXPORT%>">
        <tr>
            <td>
                <input type="checkbox" name="vehicleInOilExportChk" tabindex="-1" value="<bean:write name="oilExport" property="id"/>">
                <input type="hidden" name="vehicleInOilExportDetailId" value='0'/>
                <input type="hidden" name="oilExportId" value='<bean:write name="oilExport" property="id"/>'/>
            </td>
            <td><span><bean:write name="oilExport" property="code"/></span></td>
            <td><span><bean:write name="oilExport" property="customerName"/></span></td>
            <td><span><bean:write name="oilExport" property="createdDate"/></span></td>
            <td><span><bean:write name="oilExport" property="totalText"/></span></td>
        </tr>
    </logic:iterate>
</table>