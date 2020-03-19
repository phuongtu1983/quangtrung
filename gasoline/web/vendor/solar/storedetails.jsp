<%@ page import="com.stepup.gasoline.qt.bean.VendorSolarStoreDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<table id="vendorSolarStoreDetailTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="30px"><bean:message key="message.del"/></td>
            <td width="170px"><bean:message key="store.title"/></td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <logic:iterate id="store" name="<%=Constants.VENDOR_SOLAR_STORE%>">
            <tr>
                <td>
                    <input type="checkbox" name="vendorSolarStoreChk" tabindex="-1" value="<%=((VendorSolarStoreDetailBean) pageContext.getAttribute("store")).getId()%>">
                    <input type="hidden" name="vendorSolarStoreDetailId" value='<bean:write name="store" property="id"/>'/>
                    <input type="hidden" name="storeId" value='<bean:write name="store" property="storeId"/>'/>
                </td>
                <td><span><bean:write name="store" property="storeName"/></span></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>