<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<logic:present name="<%=Constants.CUSTOMER_DOCUMENT_LIST%>">
    <fieldset>
        <legend><bean:message key="customerDocument.list.title"/></legend>
        <table>
            <logic:iterate id="value_iter" name="<%=Constants.CUSTOMER_DOCUMENT_LIST%>">
                <tr>
                    <input type="hidden" name="customerDocumentId" value='${value_iter.id}'/>
                    <input type="hidden" name="documentId" value='${value_iter.documentId}'/>
                    <td height="30" style="padding-right: 20px">${value_iter.name}</td>
                    <td><input name="customerDocumentExpiredDate" id="customerDocumentExpiredDate${value_iter.documentId}" size="15" value="${value_iter.expiredDate}" type="text"></td>
                </tr>
            </logic:iterate>
        </table>
    </fieldset>
</logic:present>