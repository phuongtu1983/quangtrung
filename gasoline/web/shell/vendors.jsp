<%@ page import="com.stepup.gasoline.qt.bean.VehicleOutEmployeeDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table class="its" id="shellVendorTbl">
    <logic:iterate id="vendor" name="<%=Constants.SHELL_VENDOR%>">
        <tr>
            <td>
                <input type="checkbox" name="shellVendorChk" tabindex="-1" value="<bean:write name="vendor" property="id"/>">
                <input type="hidden" name="shellVendorDetailId" value='0'/>
                <input type="hidden" name="shellVendorId" value='<bean:write name="vendor" property="id"/>'/>
            </td>
            <td><span><bean:write name="vendor" property="name"/></span></td>
        </tr>
    </logic:iterate>
</table>