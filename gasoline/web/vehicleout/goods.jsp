<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table class="its" id="vehicleOutGoodTbl">
    <logic:iterate id="good" name="<%=Constants.VEHICLE_OUT_GOOD%>">
        <tr>
            <td>
                <input type="checkbox" name="vehicleOutGoodChk" tabindex="-1" value="<bean:write name="good" property="id"/>">
                <input type="hidden" name="vehicleOutDetailId" value='0'/>
                <input type="hidden" name="shellId" value='<bean:write name="good" property="id"/>'/>
            </td>
            <td><span><bean:write name="good" property="name"/></span></td>
            <td><span><bean:write name="good" property="unitName"/></span></td>
            <td><input type="text" size="20" name="quantity" id="detquantity${good.id}" value="0" onkeypress="return readonlyFloat(event);"/></td>
        </tr>
    </logic:iterate>
</table>