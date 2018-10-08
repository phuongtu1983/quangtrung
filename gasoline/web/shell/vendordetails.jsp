<%@ page import="com.stepup.gasoline.qt.bean.ShellVendorDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<table id="shellVendorDetailTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="30px"><bean:message key="message.del"/></td>
            <td width="170px"><bean:message key="vendor.title"/></td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <logic:iterate id="shellVendor" name="<%=Constants.SHELL_VENDOR%>">
            <tr>
                <td>
                    <input type="checkbox" name="shellVendorChk" tabindex="-1" value="<%=((ShellVendorDetailBean) pageContext.getAttribute("shellVendor")).getId()%>">
                    <input type="hidden" name="shellVendorDetailId" value='<bean:write name="shellVendor" property="id"/>'/>
                    <input type="hidden" name="shellVendorId" value='<bean:write name="shellVendor" property="vendorId"/>'/>
                </td>
                <td><span><bean:write name="shellVendor" property="vendorName"/></span></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>