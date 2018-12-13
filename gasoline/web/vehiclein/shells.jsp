<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table class="its" id="vehicleInReturnShellTbl">
    <logic:iterate id="returnShell" name="<%=Constants.VEHICLE_IN_RETURN%>">
        <tr>
            <td>
                <input type="checkbox" name="vehicleInReturnShellChk" tabindex="-1" value="<bean:write name="returnShell" property="id"/>">
                <input type="hidden" name="vehicleInReturnShellDetailId" value='0'/>
                <input type="hidden" name="returnShellId" value='<bean:write name="returnShell" property="id"/>'/>
            </td>
            <td><span><bean:write name="returnShell" property="name"/></span></td>
            <td><span><bean:write name="returnShell" property="unitName"/></span></td>
            <td><input type="text" size="20" name="returnShellQuantity" value="0" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
        </tr>
    </logic:iterate>
</table>