<%@ page import="com.stepup.gasoline.qt.bean.AgencyCommissionDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<table id="agencyCommissionDetailTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="30px"><bean:message key="message.del"/></td>
            <td width="100px"><bean:message key="agency.commission.commissionFrom"/></td>
            <td width="110px"><bean:message key="agency.commission.commissionTo"/></td>
            <td width="110px"><bean:message key="customer.detail.percentage"/></td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <logic:iterate id="commission" name="<%=Constants.AGENCY_COMMISSION%>">
            <tr>
                <td>
                    <input type="checkbox" name="agencyCommissionChk" tabindex="-1" value="<%=((AgencyCommissionDetailBean) pageContext.getAttribute("commission")).getId()%>">
                    <input type="hidden" name="agencyCommissionDetailId" value='<bean:write name="commission" property="id"/>'/>
                </td>
                <td><input type="text" size="20" name="agencyCommissionCommissionFrom" value="${commission.commissionFrom}" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="agencyCommissionCommissionTo" value="${commission.commissionTo}" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="agencyCommissionCommission" value="${commission.commission}" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>