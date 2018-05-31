<%@ page import="com.stepup.gasoline.qt.bean.AccessoryImportDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<table id="accessoryImportDetailTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="30px"><bean:message key="message.del"/></td>
            <td width="170px"><bean:message key="accessory.title"/></td>
            <td width="170px"><bean:message key="unit.title"/></td>
            <td width="200px"><bean:message key="quantity.title"/></td>
            <td width="200px"><bean:message key="price.title"/></td>
            <td width="200px"><bean:message key="amount.title"/></td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <logic:iterate id="accessory" name="<%=Constants.ACCESSORY_IMPORT_ACCESSORY%>">
            <tr>
                <td>
                    <input type="checkbox" name="accessoryImportAccessoryChk" tabindex="-1" value="<%=((AccessoryImportDetailBean) pageContext.getAttribute("accessory")).getId()%>">
                    <input type="hidden" name="accessoryImportDetailId" value='<bean:write name="accessory" property="id"/>'/>
                    <input type="hidden" name="accessoryId" value='<bean:write name="accessory" property="accessoryId"/>'/>
                </td>
                <td><span><bean:write name="accessory" property="accessoryName"/></span></td>
                <td><span><bean:write name="accessory" property="unitName"/></span></td>
                <td><input type="text" size="20" name="quantity" value="${accessory.quantity}" id="detquantity${accessory.accessoryId}" onblur="return caculateAccessoryImportDetail('${accessory.accessoryId}');" onkeyup="try2FloatFormatOnKeyUp(this,event);" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="price" value="${accessory.price}" id="detprice${accessory.accessoryId}" onblur="return caculateAccessoryImportDetail('${accessory.accessoryId}');" onkeyup="try2FloatFormatOnKeyUp(this,event);" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="amount" value="${accessory.amount}" id="detamount${accessory.accessoryId}" readonly="readonly"/></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>