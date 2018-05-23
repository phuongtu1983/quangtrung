<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<logic:present name="<%=Constants.DYNAMIC_FIELD_VALUE%>">
    <fieldset>
        <legend><bean:message key="dynamicField.title"/></legend>
        <table>
            <logic:iterate id="value_iter" name="<%=Constants.DYNAMIC_FIELD_VALUE%>">
                <tr>
                    <input type="hidden" name="fieldValueId" value='${value_iter.id}'/>
                    <input type="hidden" name="fieldId" value='${value_iter.fieldId}'/>
                    <td height="30" style="padding-right: 20px">${value_iter.name}</td>
                    <td><input name="fieldValue" size="40" value="${value_iter.value}" type="text"></td>
                </tr>
            </logic:iterate>
        </table>
    </fieldset>
</logic:present>