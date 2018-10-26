<%@ page import="com.stepup.gasoline.qt.bean.OrganizationShellDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<table id="organizationShellDetailTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="30px"><bean:message key="message.del"/></td>
            <td width="170px"><bean:message key="shell.detail.name"/></td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <logic:iterate id="shell" name="<%=Constants.ORGANIZATION_SHELL%>">
            <tr>
                <td>
                    <input type="checkbox" name="organizationShellChk" tabindex="-1" value="<%=((OrganizationShellDetailBean) pageContext.getAttribute("shell")).getId()%>">
                    <input type="hidden" name="organizationShellDetailId" value='<bean:write name="shell" property="id"/>'/>
                    <input type="hidden" name="shellId" value='<bean:write name="shell" property="shellId"/>'/>
                </td>
                <td><span><bean:write name="shell" property="shellName"/></span></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>