<%@ page import="com.stepup.gasoline.qt.bean.EmployeeBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<table id="permissionEmpDetailTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="30px"><bean:message key="message.del"/></td>
            <td width="400px"><bean:message key="employee.title"/></td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <logic:iterate id="emp" name="<%=Constants.PERMISSION_EMP_LIST%>">
            <tr>
                <td>
                    <input type="checkbox" name="permissionEmpChk" tabindex="-1" value="<bean:write name="emp" property="userId"/>">
                    <input type="hidden" name="permissionEmpId" value='<bean:write name="emp" property="userId"/>'/>
                    <input type="hidden" name="userId" value='<bean:write name="emp" property="userId"/>'/>
                </td>
                <td><span name="permissionEmp"><bean:write name="emp" property="fullname"/></span></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>