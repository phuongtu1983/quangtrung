<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table class="its" id="agencyCommissionTbl">
    <logic:iterate id="commission" name="<%=Constants.AGENCY_COMMISSION%>">
        <tr>
            <td>
                <input type="checkbox" name="agencyCommissionChk" tabindex="-1" value="0">
                <input type="hidden" name="agencyCommissionDetailId" value='0'/>
            </td>
            <td><input type="text" size="20" name="agencyCommissionCommissionFrom" value="${commission.commissionFrom}" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="agencyCommissionCommissionTo" value="${commission.commissionTo}" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="agencyCommissionCommission" value="${commission.commission}" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
        </tr>
    </logic:iterate>
</table>