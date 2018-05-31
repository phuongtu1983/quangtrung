<%@ page import="com.stepup.gasoline.qt.bean.PetroImportDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<table id="petroImportDetailTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="30px"><bean:message key="message.del"/></td>
            <td width="170px"><bean:message key="petro.detail.name"/></td>
            <td width="170px"><bean:message key="unit.title"/></td>
            <td width="200px"><bean:message key="quantity.title"/></td>
            <td width="200px"><bean:message key="price.title"/></td>
            <td width="200px"><bean:message key="amount.title"/></td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <logic:iterate id="petro" name="<%=Constants.PETRO_IMPORT_PETRO%>">
            <tr>
                <td>
                    <input type="checkbox" name="petroImportPetroChk" tabindex="-1" value="<%=((PetroImportDetailBean) pageContext.getAttribute("petro")).getId()%>">
                    <input type="hidden" name="petroImportDetailId" value='<bean:write name="petro" property="id"/>'/>
                    <input type="hidden" name="petroId" value='<bean:write name="petro" property="petroId"/>'/>
                </td>
                <td><span><bean:write name="petro" property="petroName"/></span></td>
                <td><span><bean:write name="petro" property="unitName"/></span></td>
                <td><input type="text" size="20" name="quantity" value="${petro.quantity}" id="detquantity${petro.petroId}" onblur="return caculatePetroImportDetail('${petro.petroId}');" onkeyup="try2FloatFormatOnKeyUp(this,event);" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="price" value="${petro.price}" id="detprice${petro.petroId}" onblur="return caculatePetroImportDetail('${petro.petroId}');" onkeyup="try2FloatFormatOnKeyUp(this,event);" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="amount" value="${petro.amount}" id="detamount${petro.petroId}" readonly="readonly"/></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>