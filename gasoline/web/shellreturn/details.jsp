<%@ page import="com.stepup.gasoline.qt.bean.ShellReturnDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<table id="shellReturnDetailTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="30px"><bean:message key="message.del"/></td>
            <td width="170px"><bean:message key="shell.detail.name"/></td>
            <td width="170px"><bean:message key="unit.title"/></td>
            <td width="200px"><bean:message key="quantity.title"/></td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <logic:iterate id="shell" name="<%=Constants.SHELL_RETURN_SHELL%>">
            <tr>
                <td>
                    <input type="checkbox" name="shellReturnShellChk" tabindex="-1" value="<%=((ShellReturnDetailBean) pageContext.getAttribute("shell")).getId()%>">
                    <input type="hidden" name="shellReturnDetailId" value='<bean:write name="shell" property="id"/>'/>
                    <input type="hidden" name="shellId" value='<bean:write name="shell" property="shellId"/>'/>
                </td>
                <td><span><bean:write name="shell" property="shellName"/></span></td>
                <td><span><bean:write name="shell" property="unitName"/></span></td>
                <td><input type="text" size="20" name="quantity" value="${shell.quantity}" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>