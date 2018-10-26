<%@ page import="com.stepup.gasoline.qt.bean.OrganizationShellDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table class="its" id="organizationShellTbl">
    <logic:iterate id="shell" name="<%=Constants.ORGANIZATION_SHELL%>">
        <tr>
            <td>
                <input type="checkbox" name="organizationShellChk" tabindex="-1" value="<bean:write name="shell" property="shellId"/>">
                <input type="hidden" name="organizationShellDetailId" value='0'/>
                <input type="hidden" name="shellId" value='<bean:write name="shell" property="shellId"/>'/>
            </td>
            <td><span><bean:write name="shell" property="shellName"/></span></td>
        </tr>
    </logic:iterate>
</table>