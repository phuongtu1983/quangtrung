<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table class="its" id="gasImportShellTbl">
    <logic:iterate id="shell" name="<%=Constants.GAS_IMPORT_SHELL%>">
        <tr>
            <td>
                <input type="checkbox" name="gasImportShellChk" tabindex="-1" value="<bean:write name="shell" property="shellId"/>">
                <input type="hidden" name="gasImportDetailId" value='0'/>
                <input type="hidden" name="shellId" value='<bean:write name="shell" property="shellId"/>'/>
            </td>
            <td><span><bean:write name="shell" property="shellName"/></span></td>
            <td><span><bean:write name="shell" property="unitName"/></span></td>
            <td><input type="text" size="20" name="quantity" id="detquantity${shell.shellId}" value="0" onblur="return caculateFormListDetail('${shell.shellId}','gasImportForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="price" id="detprice${shell.shellId}" value="0" onblur="return caculateFormListDetail('${shell.shellId}','gasImportForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="amount" id="detamount${shell.shellId}" value="0" readonly="readonly" tabindex="-1"/></td>
        </tr>
    </logic:iterate>
</table>