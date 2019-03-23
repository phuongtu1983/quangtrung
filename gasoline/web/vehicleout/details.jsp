<%@ page import="com.stepup.gasoline.qt.bean.VehicleOutDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<table id="vehicleOutDetailTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="30px"><bean:message key="message.del"/></td>
            <td width="170px"><bean:message key="shell.title"/></td>
            <td width="100px"><bean:message key="unit.title"/></td>
            <td width="100px"><bean:message key="quantity.title"/></td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <logic:iterate id="good" name="<%=Constants.VEHICLE_OUT_GOOD%>">
            <tr>
                <td>
                    <input type="checkbox" name="vehicleOutGoodChk" tabindex="-1" value="<%=((VehicleOutDetailBean) pageContext.getAttribute("good")).getId()%>">
                    <input type="hidden" name="vehicleOutDetailId" value='<bean:write name="good" property="id"/>'/>
                    <input type="hidden" name="shellId" value='<bean:write name="good" property="shellId"/>'/>
                </td>
                <td><span><bean:write name="good" property="shellName"/></span></td>
                <td><span><bean:write name="good" property="unitName"/></span></td>
                <td><input type="text" size="20" name="quantity" value="${good.quantity}" id="detquantity${good.shellId}" onkeypress="return readonlyFloat(event);"/></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>