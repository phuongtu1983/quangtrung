<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table class="its" id="promotionMaterialImportPromotionMaterialTbl">
    <logic:iterate id="promotionMaterial" name="<%=Constants.PROMOTION_MATERIAL_IMPORT_PROMOTION_MATERIAL%>">
        <tr>
            <td>
                <input type="checkbox" name="promotionMaterialImportPromotionMaterialChk" tabindex="-1" value="<bean:write name="promotionMaterial" property="promotionMaterialId"/>">
                <input type="hidden" name="promotionMaterialImportDetailId" value='0'/>
                <input type="hidden" name="promotionMaterialId" value='<bean:write name="promotionMaterial" property="promotionMaterialId"/>'/>
            </td>
            <td><span><bean:write name="promotionMaterial" property="promotionMaterialName"/></span></td>
            <td><span><bean:write name="promotionMaterial" property="unitName"/></span></td>
            <td><input type="text" size="20" name="quantity" id="detquantity${promotionMaterial.promotionMaterialId}" value="0" onblur="return caculateFormListDetail('${promotionMaterial.promotionMaterialId}','promotionMaterialImportForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="price" id="detprice${promotionMaterial.promotionMaterialId}" value="0" onblur="return caculateFormListDetail('${promotionMaterial.promotionMaterialId}','promotionMaterialImportForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="amount" id="detamount${promotionMaterial.promotionMaterialId}" value="0" readonly="readonly" tabindex="-1"/></td>
        </tr>
    </logic:iterate>
</table>