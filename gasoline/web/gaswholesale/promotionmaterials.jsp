<%@ page import="com.stepup.gasoline.qt.bean.GasWholesalePromotionMaterialDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table class="its" id="gasWholesalePromotionMaterialTbl">
    <logic:iterate id="promotionMaterial" name="<%=Constants.GAS_WHOLESALE_PROMOTION_MATERIAL%>">
        <tr>
            <td>
                <input type="checkbox" name="gasWholesalePromotionMaterialChk" tabindex="-1" value="<bean:write name="promotionMaterial" property="promotionMaterialId"/>">
                <input type="hidden" name="gasWholesalePromotionMaterialDetailId" value='0'/>
                <input type="hidden" name="promotionMaterialId" value='<bean:write name="promotionMaterial" property="promotionMaterialId"/>'/>
            </td>
            <td><span><bean:write name="promotionMaterial" property="promotionMaterialName"/></span></td>
            <td><span><bean:write name="promotionMaterial" property="unitName"/></span></td>
            <td><input type="text" size="20" name="promotionMaterialQuantity" value="0" onkeyup="try2FloatFormatOnKeyUp(this, event);" onkeypress="return readonlyFloat(event);"/></td>
        </tr>
    </logic:iterate>
</table>