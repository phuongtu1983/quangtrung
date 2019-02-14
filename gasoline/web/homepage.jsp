<%@ page language="java" pageEncoding="UTF-8" %> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.QTUtil"%>
<!DOCTYPE html>
<html>
    <head>
        <title><bean:message key='titlebar.title'/></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content='no-cache' http-equiv='Pragma'/>
        <link rel="stylesheet" type="text/css" href="css/buoctien/styles.css"/>
        <link rel="stylesheet" type="text/css" href="css/pn.css">
        <link rel="stylesheet" type="text/css" href="js/dhtmlx/layout/dhtmlxlayout.css">
        <link rel="stylesheet" type="text/css" href="js/dhtmlx/layout/skins/dhtmlxlayout_dhx_web.css">
        <link rel="stylesheet" type="text/css" href="js/dhtmlx/menu/skins/dhtmlxmenu_dhx_web.css">
        <link rel="stylesheet" type="text/css" href="js/dhtmlx/grid/dhtmlxgrid.css">
        <link rel="stylesheet" type="text/css" href="js/dhtmlx/grid/skins/dhtmlxgrid_dhx_web.css">
        <link rel="stylesheet" type="text/css" href="js/dhtmlx/toolbar/skins/dhtmlxtoolbar_dhx_skyblue.css">
        <link rel="stylesheet" type="text/css" href="js/dhtmlx/calendar/dhtmlxcalendar.css">
        <link rel="stylesheet" type="text/css" href="js/dhtmlx/calendar/skins/dhtmlxcalendar_dhx_web.css">
        <link rel="stylesheet" type="text/css" href="js/dhtmlx/combo/dhtmlxcombo.css">
        <link rel="stylesheet" type="text/css" href="js/dhtmlx/vault/dhtmlxvault.css">
        <link rel="STYLESHEET" type="text/css" href="js/dhtmlx/colorpicker/dhtmlxcolorpicker.css" />
        <link rel="STYLESHEET" type="text/css" href="js/dhtmlx/tree/dhtmlxtree.css" />
        <link rel="STYLESHEET" type="text/css" href="js/dhtmlx/dataview/dhtmlxdataview.css" />
        <link rel="stylesheet" type="text/css" href="js/dojotoolkit/dijit/themes/tundra/tundra.css" />
        <link rel="stylesheet" type="text/css" href="css/ezcalendar.css"/>
        <link rel="stylesheet" type="text/css" href="css/timepicker.css" />

        <script type='text/javascript' src="js/dhtmlx/dhtmlxcommon.js"></script>
        <script type='text/javascript' src="js/dhtmlx/layout/dhtmlxcontainer.js"></script>
        <script type='text/javascript' src="js/dhtmlx/layout/dhtmlxlayout.js"></script>
        <script type='text/javascript' src="js/dhtmlx/layout/patterns/dhtmlxlayout_pattern4c.js"></script>
        <script type='text/javascript' src="js/dhtmlx/menu/dhtmlxmenu.js"></script>
        <script type='text/javascript' src="js/dhtmlx/menu/ext/dhtmlxmenu_ext.js"></script>
        <script type='text/javascript' src="js/dhtmlx/grid/dhtmlxgrid.js"></script>
        <script type='text/javascript' src="js/dhtmlx/grid/ext/dhtmlxgrid_pgn.js"></script>
        <script type='text/javascript' src="js/dhtmlx/grid/dhtmlxgridcell.js"></script>
        <script type='text/javascript' src="js/dhtmlx/grid/excells/dhtmlxgrid_excell_link.js"></script>
        <script type='text/javascript' src="js/dhtmlx/grid/ext/dhtmlxgrid_filter.js"></script>
        <script type='text/javascript' src="js/dhtmlx/grid/ext/dhtmlxgrid_start.js"></script>
        <script type='text/javascript' src="js/dhtmlx/grid/ext/dhtmlxgrid_rowspan.js"></script>
        <script type='text/javascript' src="js/dhtmlx/toolbar/dhtmlxtoolbar.js"></script>
        <script type='text/javascript' src="js/dhtmlx/calendar/dhtmlxcalendar.js"></script>
        <script type='text/javascript' src="js/dhtmlx/combo/dhtmlxcombo.js"></script>
        <script type='text/javascript' src="js/dhtmlx/combo/ext/dhtmlxcombo_extra.js"></script>
        <script type='text/javascript' src="js/dhtmlx/vault/dhtmlxvault.js"></script>
        <script type='text/javascript' src="js/dhtmlx/colorpicker/dhtmlxcolorpicker.js"></script>
        <script type='text/javascript' src="js/dhtmlx/tree/dhtmlxtree.js"></script>
        <script type='text/javascript' src="js/dhtmlx/tree/ext/dhtmlxtree_start.js"></script>
        <script type='text/javascript' src="js/dhtmlx/dataview/dhtmlxdataview_debug.js"></script>
        <script type="text/javascript" src="js/dojotoolkit/dojo/dojo.js" djConfig="parseOnLoad:true"></script>

        <script type='text/javascript' src='js/date.js'></script>
        <script type='text/javascript' src='js/Ajax.js'></script>
        <script type='text/javascript' src='js/common.js'></script>
        <script type='text/javascript' src='js/md5.js'></script>
        <script type='text/javascript' src='js/gasoline.js'></script>
        <script src="js/jquery-1.4.2.min.js"></script>
        <script src="js/jquery.hotkeys.js"></script>
        <script type='text/javascript' src="js/NumberFormat.js"></script>
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/bootstrap-timepicker.min.js"></script>
        <style>
            html, body {
                width: 100%;
                height: 100%;
                margin: 0px;
                overflow: hidden;
            }
        </style>
        <script>
            dojo.require("dijit.Dialog");
            dojo.require("dijit.form.Button");
            dojo.require("dijit.layout.TabContainer");
            dojo.require("dijit.form.DateTextBox");
            sessionId = '<%=session.getAttribute(Constants.SESSION_ID)%>';
            var dhxLayout;
            dhtmlxEvent(window, "load", function() {
                createLayout();
            });
        </script>
    </head>
    <body leftmargin="0" topmargin="0" class="tundra">
        <div id="popupDialog" dojoType="dijit.Dialog" title=""></div>
        <input type="hidden" id="clientIpAddress" value="<% out.print(request.getRemoteHost());%>"/>
        <div style="margin-right: 15px;margin-top: 10px;position: fixed;text-align: right;width: 150px;z-index: 1000;right: 0">
            <font face="Tahoma" size="2"><strong><i><bean:message key='wellcome.title'/>  <font style="color: #FF0000"><%=QTUtil.getMemberFirstName(session)%></font></i></strong></font>
        </div>
    </body>
</html>
