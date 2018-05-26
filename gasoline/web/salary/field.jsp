<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<logic:iterate id="field_iter" name="<%=Constants.DYNAMIC_FIELD_LIST%>">
    <option  value="${field_iter.fieldId}">${field_iter.name}</option>
</logic:iterate>