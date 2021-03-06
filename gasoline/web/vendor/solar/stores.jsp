<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table class="its" id="vendorSolarStoreTbl">
    <logic:iterate id="store" name="<%=Constants.VENDOR_SOLAR_STORE%>">
        <tr>
            <td>
                <input type="checkbox" name="vendorSolarStoreChk" tabindex="-1" value="<bean:write name="store" property="id"/>">
                <input type="hidden" name="vendorSolarStoreDetailId" value='0'/>
                <input type="hidden" name="storeId" value='<bean:write name="store" property="id"/>'/>
            </td>
            <td><span><bean:write name="store" property="name"/></span></td>
        </tr>
    </logic:iterate>
</table>