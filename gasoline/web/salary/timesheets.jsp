<%@ page import="com.stepup.gasoline.qt.salary.EmployeeSalaryTimesheetDetailFormBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<table id="salaryTimesheetTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="400px"><bean:message key="content.title"/></td>
            <td width="200px"><bean:message key="employeeTimesheet.detail.count"/></td>
            <td width="200px"><bean:message key="price.title"/></td>
            <td width="200px"><bean:message key="amount.title"/></td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <logic:iterate id="timesheet" name="<%=Constants.SALARY_TIMESHEET_LIST%>">
            <tr>
                <td><span><bean:write name="timesheet" property="fieldName"/></span></td>
                <td><span><input name="timesheetQuantity" size="10" value="<bean:write name="timesheet" property="quantity"/>" type="text" readonly="readonly" tabindex="-1"></span></td>
                <td><span><input name="timesheetPrice" size="10" value="<bean:write name="timesheet" property="price"/>" type="text" readonly="readonly" tabindex="-1"></span></td>
                <td><span><input name="timesheetAmount" size="10" value="<bean:write name="timesheet" property="amount"/>" type="text" readonly="readonly" tabindex="-1"></span></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>