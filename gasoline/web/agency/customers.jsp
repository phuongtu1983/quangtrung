<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table class="its" id="agencyCustomerTbl">
    <logic:iterate id="customer" name="<%=Constants.AGENCY_CUSTOMER%>">
        <tr>
            <td>
                <input type="checkbox" name="agencyCustomerChk" tabindex="-1" value="<bean:write name="customer" property="customerId"/>">
                <input type="hidden" name="agencyCustomerDetailId" value='0'/>
                <input type="hidden" name="customerId" value='<bean:write name="customer" property="customerId"/>'/>
            </td>
            <td><span><bean:write name="customer" property="customerName"/></span></td>
        </tr>
    </logic:iterate>
</table>