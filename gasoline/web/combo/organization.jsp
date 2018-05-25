<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<logic:present name="<%=Constants.SELECTED%>">
    <logic:iterate id="organization_iter" name="<%=Constants.ORGANIZATION_LIST%>">
        <logic:equal name="<%=Constants.SELECTED%>" value="${organization_iter.id}">
            <option selected value="${organization_iter.id}">${organization_iter.name}</option>
        </logic:equal>
        <logic:notEqual name="<%=Constants.SELECTED%>" value="${organization_iter.id}">
            <option  value="${organization_iter.id}">${organization_iter.name}</option>
        </logic:notEqual>
    </logic:iterate>
</logic:present>
<logic:notPresent name="<%=Constants.SELECTED%>">
    <logic:iterate id="organization_iter" name="<%=Constants.ORGANIZATION_LIST%>">
        <option  value="${organization_iter.id}">${organization_iter.name}</option>
    </logic:iterate>
</logic:notPresent>