<%@ page import="com.stepup.gasoline.qt.bean.OrganizationBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<table id="permissionOrgDetailTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="30px"><bean:message key="message.del"/></td>
            <td width="400px"><bean:message key="organization.title"/></td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <logic:iterate id="org" name="<%=Constants.PERMISSION_ORG_LIST%>">
            <tr>
                <td>
                    <input type="checkbox" name="permissionOrgChk" tabindex="-1" value="<bean:write name="org" property="id"/>">
                    <input type="hidden" name="permissionOrgId" value='<bean:write name="org" property="id"/>'/>
                    <input type="hidden" name="organizationId" value='<bean:write name="org" property="id"/>'/>
                </td>
                <td><span name="permissionOrg"><bean:write name="org" property="name"/></span></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>