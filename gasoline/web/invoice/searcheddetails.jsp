<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table class="its" id="searchOilSaleResultTbl">
    <logic:iterate id="detail" name="<%=Constants.INVOICE_SEARCHED_DETAIL%>">
        <tr>
            <td><input type="checkbox" name="invoiceSearchedDetailChk" tabindex="-1" value="<bean:write name="detail" property="id"/>"></td>
            <td><span><bean:write name="detail" property="oilSaleCode"/></span></td>
            <td><span><bean:write name="detail" property="oilSaleDate"/></span></td>
            <td><span><bean:write name="detail" property="oilName"/></span></td>
        </tr>
    </logic:iterate>
</table>