<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table id="searchOilSaleResultTbl" class="table-scroll small-first-col" style="width:1000px">
    <thead>
        <tr>
            <td width="30px"><bean:message key="message.select"/></td>
            <td width="20px"><bean:message key="code.title"/></td>
            <td width="100px"><bean:message key="date.title"/></td>
            <td width="500px"><bean:message key="oil.detail.name"/></td>
            <td width="170px"><bean:message key="amount.title"/></td>
        </tr>
    </thead>
    <tbody class="body-half-screen">
        <logic:iterate id="detail" name="<%=Constants.INVOICE_SEARCHED_DETAIL%>">
            <tr>
                <td width="30px"><input type="checkbox" name="invoiceSearchedDetailChk" tabindex="-1" value="<bean:write name="detail" property="id"/>"></td>
                <td width="200px"><span><bean:write name="detail" property="oilSaleCode"/></span></td>
                <td width="100px"><span><bean:write name="detail" property="oilSaleDate"/></span></td>
                <td width="500px"><span><bean:write name="detail" property="oilName"/></span></td>
                <td width="170px"><span><bean:write name="detail" property="amountText"/></span></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>