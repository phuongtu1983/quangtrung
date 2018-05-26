<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<div class="header"><bean:message key="employee.list.title"/></div>
<form name='employeeSalarysForm' id='employeeSalarysForm'>
    <div id='employeeSalaryList' style="width:100%; height:768px;"></div>
    <div id="recinfoArea"></div>
</form>