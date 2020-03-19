<%@ page import="com.stepup.gasoline.qt.bean.InvoiceSolarDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table id="invoiceSolarDetailTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="30px"><bean:message key="message.del"/></td>
            <td width="300px"><bean:message key="solar.detail.name"/></td>
            <td width="200px"><bean:message key="code.title"/></td>
            <td width="150px"><bean:message key="date.title"/></td>
            <td width="150px"><bean:message key="amount.invoiceSolar.title"/></td>
            <td width="150px"><bean:message key="paid.title"/></td>
            <td width="150px"><bean:message key="invoiceSolar.detail.paid"/></td>
            <td width="150px"><bean:message key="invoiceSolar.detail.commissioned"/></td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <logic:iterate id="detail" name="<%=Constants.INVOICE_SOLAR_DETAIL%>">
            <tr>
                <td>
                    <input type="checkbox" name="invoiceSolarDetailChk" tabindex="-1" value="<%=((InvoiceSolarDetailBean) pageContext.getAttribute("detail")).getSolarSaleDetailId()%>">
                    <input type="hidden" name="invoiceSolarDetailId" value='<bean:write name="detail" property="id"/>'/>
                    <input type="hidden" name="solarSaleDetailId" value='<bean:write name="detail" property="solarSaleDetailId"/>'/>
                </td>
                <td><span><bean:write name="detail" property="solarName"/></span></td>
                <td><span><bean:write name="detail" property="solarSaleCode"/></span></td>
                <td><span><bean:write name="detail" property="solarSaleDate"/></span></td>
                <td><input type="text" size="20" name="solarSaleDetailAmount" value="${detail.solarSaleDetailAmount}" readonly="readonly" tabindex="-1"/></td>
                <td><input type="text" size="20" name="solarSalePaidDetailAmount" value="${detail.solarSalePaidDetailAmount}" onblur="invoiceSolarDetailPaidAmountChanged(this);" onkeypress="return readonlyFloat(event);"/></td>
                <td>
                    <logic:equal name="detail" property="solarSaleDetailPaid" value="0">
                        <input type="checkbox" name="solarSaleDetailPaid" value="<bean:write name="detail" property="solarSaleDetailId"/>">
                    </logic:equal>
                    <logic:notEqual name="detail" property="solarSaleDetailPaid" value="0">
                        <input type="checkbox" name="solarSaleDetailPaid" value="<bean:write name="detail" property="solarSaleDetailId"/>" checked="checked">
                    </logic:notEqual>
                </td>
                <td>
                    <logic:equal name="detail" property="solarSaleDetailCommissioned" value="0">
                        <input type="checkbox" name="solarSaleDetailCommissioned" value="<bean:write name="detail" property="solarSaleDetailId"/>">
                    </logic:equal>
                    <logic:notEqual name="detail" property="solarSaleDetailCommissioned" value="0">
                        <input type="checkbox" name="solarSaleDetailCommissioned" value="<bean:write name="detail" property="solarSaleDetailId"/>" checked="checked">
                    </logic:notEqual>
                </td>
            </tr>
        </logic:iterate>
    </tbody>
</table>