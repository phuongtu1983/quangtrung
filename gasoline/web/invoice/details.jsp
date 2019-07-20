<%@ page import="com.stepup.gasoline.qt.bean.InvoiceDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table id="invoiceDetailTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="30px"><bean:message key="message.del"/></td>
            <td width="300px"><bean:message key="oil.detail.name"/></td>
            <td width="200px"><bean:message key="code.title"/></td>
            <td width="150px"><bean:message key="date.title"/></td>
            <td width="150px"><bean:message key="amount.title"/></td>
            <td width="150px"><bean:message key="invoice.detail.paid"/></td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <logic:iterate id="detail" name="<%=Constants.INVOICE_DETAIL%>">
            <tr>
                <td>
                    <input type="checkbox" name="invoiceDetailChk" tabindex="-1" value="<%=((InvoiceDetailBean) pageContext.getAttribute("detail")).getOilSaleDetailId()%>">
                    <input type="hidden" name="invoiceDetailId" value='<bean:write name="detail" property="id"/>'/>
                    <input type="hidden" name="oilSaleDetailId" value='<bean:write name="detail" property="oilSaleDetailId"/>'/>
                </td>
                <td><span><bean:write name="detail" property="oilName"/></span></td>
                <td><span><bean:write name="detail" property="oilSaleCode"/></span></td>
                <td><span><bean:write name="detail" property="oilSaleDate"/></span></td>
                <td><input type="text" size="20" name="oilSaleDetailAmount" value="${detail.oilSaleDetailAmount}" readonly="readonly" tabindex="-1"/></td>
                <td>
                    <logic:equal name="detail" property="oilSaleDetailPaid" value="0">
                        <input type="checkbox" name="oilSaleDetailPaid" value="<bean:write name="detail" property="oilSaleDetailId"/>">
                    </logic:equal>
                    <logic:notEqual name="detail" property="oilSaleDetailPaid" value="0">
                        <input type="checkbox" name="oilSaleDetailPaid" value="<bean:write name="detail" property="oilSaleDetailId"/>" checked="checked">
                    </logic:notEqual>
                </td>
            </tr>
        </logic:iterate>
    </tbody>
</table>