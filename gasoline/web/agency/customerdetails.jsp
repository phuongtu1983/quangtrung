<%@ page import="com.stepup.gasoline.qt.bean.AgencyCustomerDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<table id="agencyCustomerDetailTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="30px"><bean:message key="message.del"/></td>
            <td width="300px"><bean:message key="customer.detail.name"/></td>
            <td width="100px"><bean:message key="agency.customer.commissionFrom"/></td>
            <td width="110px"><bean:message key="agency.customer.commissionTo"/></td>
            <td width="110px"><bean:message key="customer.detail.percentage"/></td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <logic:iterate id="customer" name="<%=Constants.AGENCY_CUSTOMER%>">
            <tr>
                <td>
                    <input type="checkbox" name="agencyCustomerChk" tabindex="-1" value="<%=((AgencyCustomerDetailBean) pageContext.getAttribute("customer")).getId()%>">
                    <input type="hidden" name="agencyCustomerDetailId" value='<bean:write name="customer" property="id"/>'/>
                    <input type="hidden" name="customerId" value='<bean:write name="customer" property="customerId"/>'/>
                </td>
                <td><span><bean:write name="customer" property="customerName"/></span></td>
                <td><input type="text" size="20" name="agencyCustomerCommissionFrom" value="${customer.commissionFrom}" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="agencyCustomerCommissionTo" value="${customer.commissionTo}" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="agencyCustomerCommission" value="${customer.commission}" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>