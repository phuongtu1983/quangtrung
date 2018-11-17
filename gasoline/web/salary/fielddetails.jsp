<%@ page import="com.stepup.gasoline.qt.salary.EmployeeSalaryFieldDetailFormBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table id="salaryFieldTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="400px"><bean:message key="content.title"/></td>
            <td width="200px"><bean:message key="amount.title"/></td>
            <td width="400px"><bean:message key="note.title"/></td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <logic:iterate id="field" name="<%=Constants.SALARY_FIELD_LIST%>">
            <tr>
                <td>
                    <input type="hidden" name="salaryFieldId" value='<bean:write name="field" property="id"/>'/>
                    <span><bean:write name="field" property="fieldName"/></span>
                </td>
                <td><html:text name="field" property="amount" size="10" onblur="caculateSalaryTotal();" onkeypress="return readonlyFloat(event);"/></td>
                <td><html:text name="field" property="note" size="10"/></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>