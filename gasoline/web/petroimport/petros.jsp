<%@ page import="com.stepup.gasoline.qt.bean.PetroImportDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table class="its" id="petroImportPetroTbl">
    <logic:iterate id="petro" name="<%=Constants.PETRO_IMPORT_PETRO%>">
        <tr>
            <td>
                <input type="checkbox" name="petroImportPetroChk" tabindex="-1" value="<bean:write name="petro" property="petroId"/>">
                <input type="hidden" name="petroImportDetailId" value='0'/>
                <input type="hidden" name="petroId" value='<bean:write name="petro" property="petroId"/>'/>
            </td>
            <td><span><bean:write name="petro" property="petroName"/></span></td>
            <td><span><bean:write name="petro" property="unitName"/></span></td>
            <td><input type="text" size="20" name="quantity" id="detquantity${petro.petroId}" value="0" onblur="return caculateFormListDetail('${petro.petroId}','petroImportForm');" onkeyup="try2FloatFormatOnKeyUp(this, event);" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="price" id="detprice${petro.petroId}" value="0" onblur="return caculateFormListDetail('${petro.petroId}','petroImportForm');" onkeyup="try2FloatFormatOnKeyUp(this,event);" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="amount" id="detamount${petro.petroId}" value="0" readonly="readonly"/></td>
        </tr>
    </logic:iterate>
</table>