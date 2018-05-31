<%@ page import="com.stepup.gasoline.qt.bean.PromotionMaterialImportDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<table id="promotionMaterialImportDetailTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="30px"><bean:message key="message.del"/></td>
            <td width="170px"><bean:message key="promotionMaterial.title"/></td>
            <td width="170px"><bean:message key="unit.title"/></td>
            <td width="200px"><bean:message key="quantity.title"/></td>
            <td width="200px"><bean:message key="price.title"/></td>
            <td width="200px"><bean:message key="amount.title"/></td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <logic:iterate id="promotionMaterial" name="<%=Constants.PROMOTION_MATERIAL_IMPORT_PROMOTION_MATERIAL%>">
            <tr>
                <td>
                    <input type="checkbox" name="promotionMaterialImportPromotionMaterialChk" tabindex="-1" value="<%=((PromotionMaterialImportDetailBean) pageContext.getAttribute("promotionMaterial")).getId()%>">
                    <input type="hidden" name="promotionMaterialImportDetailId" value='<bean:write name="promotionMaterial" property="id"/>'/>
                    <input type="hidden" name="promotionMaterialId" value='<bean:write name="promotionMaterial" property="promotionMaterialId"/>'/>
                </td>
                <td><span><bean:write name="promotionMaterial" property="promotionMaterialName"/></span></td>
                <td><span><bean:write name="promotionMaterial" property="unitName"/></span></td>
                <td><input type="text" size="20" name="quantity" value="${promotionMaterial.quantity}" id="detquantity${promotionMaterial.promotionMaterialId}" onblur="return caculatePromotionMaterialImportDetail('${promotionMaterial.promotionMaterialId}');" onkeyup="try2FloatFormatOnKeyUp(this,event);" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="price" value="${promotionMaterial.price}" id="detprice${promotionMaterial.promotionMaterialId}" onblur="return caculatePromotionMaterialImportDetail('${promotionMaterial.promotionMaterialId}');" onkeyup="try2FloatFormatOnKeyUp(this,event);" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="amount" value="${promotionMaterial.amount}" id="detamount${promotionMaterial.promotionMaterialId}" readonly="readonly"/></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>