<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table class="its" id="invoiceSolarSolarSaleTbl">
    <logic:iterate id="detail" name="<%=Constants.INVOICE_SOLAR_DETAIL%>">
        <tr>
            <td>
                <input type="checkbox" name="invoiceSolarDetailChk" tabindex="-1" value="<bean:write name="detail" property="solarSaleDetailId"/>">
                <input type="hidden" name="invoiceSolarDetailId" value='0'/>
                <input type="hidden" name="solarSaleDetailId" value='<bean:write name="detail" property="solarSaleDetailId"/>'/>
            </td>
            <td><span><bean:write name="detail" property="solarName"/></span></td>
            <td><span><bean:write name="detail" property="solarSaleCode"/></span></td>
            <td><span><bean:write name="detail" property="solarSaleDate"/></span></td>
            <td><input type="text" size="20" name="solarSaleDetailAmount" value="${detail.solarSaleDetailAmount}" readonly="readonly" tabindex="-1"/></td>
            <td><input type="text" size="20" name="solarSalePaidDetailAmount" value="${detail.solarSalePaidDetailAmount}" onblur="invoiceSolarDetailPaidAmountChanged(this);" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="checkbox" name="solarSaleDetailPaid" value="<bean:write name="detail" property="solarSaleDetailId"/>"></td>
            <td><input type="checkbox" name="solarSaleDetailCommissioned" value="<bean:write name="detail" property="solarSaleDetailId"/>"></td>
        </tr>
    </logic:iterate>
</table>