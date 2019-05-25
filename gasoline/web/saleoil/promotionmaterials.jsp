<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table class="its" id="saleOilPromotionMaterialTbl">
    <logic:iterate id="promotionMaterial" name="<%=Constants.SALE_OIL_PROMOTION_MATERIAL%>">
        <tr>
            <td>
                <input type="checkbox" name="saleOilPromotionMaterialChk" tabindex="-1" value="<bean:write name="promotionMaterial" property="promotionMaterialId"/>">
                <input type="hidden" name="saleOilPromotionMaterialDetailId" value='0'/>
                <input type="hidden" name="promotionMaterialId" value='<bean:write name="promotionMaterial" property="promotionMaterialId"/>'/>
            </td>
            <td><span><bean:write name="promotionMaterial" property="promotionMaterialName"/></span></td>
            <td>
                <html:select property="promotionMaterialUnitId" name="promotionMaterial" style="width:100px">
                    <html:options collection="<%=Constants.UNIT_LIST%>" property="id" labelProperty="name"/>
                </html:select>
            </td>
            <td>
                <html:select property="promotionMaterialStoreId" name="promotionMaterial" style="width:100px">
                    <html:options collection="<%=Constants.STORE_LIST%>" property="id" labelProperty="name"/>
                </html:select>
            </td>
            <td><input type="text" size="20" name="promotionMaterialQuantity" value="0" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
        </tr>
    </logic:iterate>
</table>