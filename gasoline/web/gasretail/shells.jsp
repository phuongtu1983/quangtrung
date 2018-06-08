<%@ page import="com.stepup.gasoline.qt.bean.GasRetailDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table class="its" id="gasRetailShellTbl">
    <logic:iterate id="shell" name="<%=Constants.GAS_RETAIL_SHELL%>">
        <tr>
            <td>
                <input type="checkbox" name="gasRetailShellChk" tabindex="-1" value="<bean:write name="shell" property="shellId"/>">
                <input type="hidden" name="gasRetailDetailId" value='0'/>
                <input type="hidden" name="shellId" value='<bean:write name="shell" property="shellId"/>'/>
            </td>
            <td><span><bean:write name="shell" property="shellName"/></span></td>
            <td><span><bean:write name="shell" property="unitName"/></span></td>
            <td><input type="text" size="20" name="quantity" id="detquantity${shell.shellId}" value="0" onblur="return caculateFormListDetail('${shell.shellId}','gasRetailForm');" onkeyup="try2FloatFormatOnKeyUp(this, event);" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="price" id="detprice${shell.shellId}" value="0" onblur="return caculateFormListDetail('${shell.shellId}','gasRetailForm');" onkeyup="try2FloatFormatOnKeyUp(this,event);" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="amount" id="detamount${shell.shellId}" value="0" readonly="readonly"/></td>
        </tr>
    </logic:iterate>
</table>