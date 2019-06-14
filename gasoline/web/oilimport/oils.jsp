<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table class="its" id="oilImportOilTbl">
    <logic:iterate id="oil" name="<%=Constants.OIL_IMPORT_OIL%>">
        <tr>
            <td>
                <input type="checkbox" name="oilImportOilChk" tabindex="-1" value="<bean:write name="oil" property="id"/>">
                <input type="hidden" name="oilImportDetailId" value='0'/>
                <input type="hidden" name="oilId" value='<bean:write name="oil" property="oilId"/>'/>
            </td>
            <td><span><bean:write name="oil" property="oilName"/></span></td>
            <td>
                <html:select property="unitId" name="oil" style="width:100px">
                    <html:options collection="<%=Constants.UNIT_LIST%>" property="id" labelProperty="name"/>
                </html:select>
            </td>
            <td><input type="text" size="20" name="quantity" id="detquantity${oil.no}_${oil.oilId}" value="0" onblur="return caculateFormListDetail('${oil.no}_${oil.oilId}', 'oilImportForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="price" id="detprice${oil.no}_${oil.oilId}" value="${oil.price}" onblur="return caculateFormListDetail('${oil.no}_${oil.oilId}', 'oilImportForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="amount" id="detamount${oil.no}_${oil.oilId}" value="0" readonly="readonly" tabindex="-1"/></td>
        </tr>
    </logic:iterate>
</table>