<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<logic:iterate id="customer_iter" name="<%=Constants.CUSTOMER_LIST%>">
    <option  value="${customer_iter.id}">${customer_iter.name}</option>
</logic:iterate>