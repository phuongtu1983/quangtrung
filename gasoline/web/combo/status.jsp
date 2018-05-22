<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<option value="0"><bean:message key="empty.title"/></option>
<logic:present name="<%=Constants.SELECTED%>">
    <logic:iterate id="status_iter" name="<%=Constants.STATUS_LIST%>">
        <logic:equal name="<%=Constants.SELECTED%>" value="${status_iter.value}">
            <option selected value="${status_iter.value}">${status_iter.label}</option>
        </logic:equal>
        <logic:notEqual name="<%=Constants.SELECTED%>" value="${status_iter.value}">
            <option  value="${status_iter.value}">${status_iter.label}</option>
        </logic:notEqual>
    </logic:iterate>
</logic:present>
<logic:notPresent name="<%=Constants.SELECTED%>">
    <logic:iterate id="status_iter" name="<%=Constants.STATUS_LIST%>">
        <option  value="${status_iter.value}">${status_iter.label}</option>
    </logic:iterate>
</logic:notPresent>