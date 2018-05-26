<%@ page import="com.stepup.gasoline.qt.salary.EmployeeSalaryFieldDetailFormBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<table id="salaryFieldTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="30px"><bean:message key="message.del"/></td>
            <td width="400px"><bean:message key="salary.field.title"/></td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <logic:iterate id="field" name="<%=Constants.SALARY_FIELD_LIST%>">
            <tr>
                <td>
                    <div align="center">
                        <input type="checkbox" name="salaryFieldChk" value="<%=((EmployeeSalaryFieldDetailFormBean) pageContext.getAttribute("field")).getId()%>">
                        <input type="hidden" name="salaryFieldId" value='<bean:write name="field" property="fieldId"/>'/>
                    </div>
                </td>
                <td><span name="salaryField"><bean:write name="field" property="fieldName"/></span></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>