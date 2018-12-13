<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table class="its" id="accessoryImportAccessoryTbl">
    <logic:iterate id="accessory" name="<%=Constants.ACCESSORY_IMPORT_ACCESSORY%>">
        <tr>
            <td>
                <input type="checkbox" name="accessoryImportAccessoryChk" tabindex="-1" value="<bean:write name="accessory" property="accessoryId"/>">
                <input type="hidden" name="accessoryImportDetailId" value='0'/>
                <input type="hidden" name="accessoryId" value='<bean:write name="accessory" property="accessoryId"/>'/>
            </td>
            <td><span><bean:write name="accessory" property="accessoryName"/></span></td>
            <td><span><bean:write name="accessory" property="unitName"/></span></td>
            <td><input type="text" size="20" name="quantity" id="detquantity${accessory.accessoryId}" value="0" onblur="return caculateFormListDetail('${accessory.accessoryId}','accessoryImportForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="price" id="detprice${accessory.accessoryId}" value="0" onblur="return caculateFormListDetail('${accessory.accessoryId}','accessoryImportForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="amount" id="detamount${accessory.accessoryId}" value="0" readonly="readonly"/></td>
        </tr>
    </logic:iterate>
</table>