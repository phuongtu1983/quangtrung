<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<logic:present name="<%=Constants.SELECTED%>">
    <logic:iterate id="user_iter" name="<%=Constants.USER_LIST%>">
        <logic:equal name="<%=Constants.SELECTED%>" value="${user_iter.id}">
            <option selected value="${user_iter.id}">${user_iter.fullname}</option>
        </logic:equal>
        <logic:notEqual name="<%=Constants.SELECTED%>" value="${user_iter.id}">
            <option  value="${user_iter.id}">${user_iter.fullname}</option>
        </logic:notEqual>
    </logic:iterate>
</logic:present>
<logic:notPresent name="<%=Constants.SELECTED%>">
    <logic:iterate id="user_iter" name="<%=Constants.USER_LIST%>">
        <option  value="${user_iter.id}">${user_iter.fullname}</option>
    </logic:iterate>
</logic:notPresent>

