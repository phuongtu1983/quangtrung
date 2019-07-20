<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table class="its" id="invoiceOilSaleTbl">
    <logic:iterate id="detail" name="<%=Constants.INVOICE_DETAIL%>">
        <tr>
            <td>
                <input type="checkbox" name="invoiceDetailChk" tabindex="-1" value="<bean:write name="detail" property="oilSaleDetailId"/>">
                <input type="hidden" name="invoiceDetailId" value='0'/>
                <input type="hidden" name="oilSaleDetailId" value='<bean:write name="detail" property="oilSaleDetailId"/>'/>
            </td>
            <td><span><bean:write name="detail" property="oilName"/></span></td>
            <td><span><bean:write name="detail" property="oilSaleCode"/></span></td>
            <td><span><bean:write name="detail" property="oilSaleDate"/></span></td>
            <td><input type="text" size="20" name="oilSaleDetailAmount" value="${detail.oilSaleDetailAmount}" readonly="readonly" tabindex="-1"/></td>
            <td><input type="checkbox" name="oilSaleDetailPaid" value="<bean:write name="detail" property="oilSaleDetailId"/>"></td>
        </tr>
    </logic:iterate>
</table>