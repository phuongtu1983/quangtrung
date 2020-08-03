<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table class="its" id="employeeSolarCommissionCommissionTbl">
    <logic:iterate id="commission" name="<%=Constants.EMPLOYEE_SOLAR_COMMISSION%>">
        <tr>
            <td>
                <input type="checkbox" name="employeeSolarCommissionCommissionChk" tabindex="-1" value="0">
                <input type="hidden" name="employeeSolarCommissionCommissionDetailId" value='0'/>
            </td>
            <td><input type="text" size="20" name="employeeSolarCommissionCommissionFrom" value="${commission.from}" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="employeeSolarCommissionCommissionTo" value="${commission.to}" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="employeeSolarCommissionCommissionCommission" value="${commission.commission}" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
        </tr>
    </logic:iterate>
</table>