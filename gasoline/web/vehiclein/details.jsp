<%@ page import="com.stepup.gasoline.qt.bean.VehicleInDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<table id="vehicleInDetailTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="30px"><bean:message key="message.del"/></td>
            <td width="170px"><bean:message key="shell.title"/></td>
            <td width="100px"><bean:message key="unit.title"/></td>
            <td width="100px"><bean:message key="quantity.title"/></td>
            <td width="100px"><bean:message key="price.title"/></td>
            <td width="200px"><bean:message key="amount.title"/></td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <logic:iterate id="good" name="<%=Constants.VEHICLE_IN_SHELL%>">
            <tr>
                <td>
                    <input type="checkbox" name="vehicleInGoodChk" tabindex="-1" value="<%=((VehicleInDetailBean) pageContext.getAttribute("good")).getId()%>">
                    <input type="hidden" name="vehicleInDetailId" value='<bean:write name="good" property="id"/>'/>
                    <input type="hidden" name="shellId" value='<bean:write name="good" property="shellId"/>'/>
                </td>
                <td><span><bean:write name="good" property="shellName"/></span></td>
                <td><span><bean:write name="good" property="unitName"/></span></td>
                <td><input type="text" size="20" name="quantity" value="${good.quantity}" id="detquantity${good.id}" onblur="return caculateFormListDetail('${good.id}',null);" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="price" value="${good.price}" id="detprice${good.id}" onblur="return caculateFormListDetail('${good.id}',null);" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="amount" value="${good.amount}" id="detamount${good.id}" readonly="readonly"/></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>