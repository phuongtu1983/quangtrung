var contentHeight;
var selectedCombo = '';
var isManuallySeleted = 0;
var scriptFunction = "";
var mainGrid;
function createLayout() {
    dhxLayout = new dhtmlXLayoutObject(document.body, "2E", "dhx_web");
    dhxLayout.setEffect("resize", false);
    dhxLayout.cells("a").hideHeader();
    dhxLayout.cells("b").hideHeader();
    dhxLayout.cells("a").setHeight(45);
    dhxLayout.cells("a").fixSize(true, true);
    dhxLayout.cells("b").fixSize(true, true);
    dhxLayout.cells("a").attachURL("header.jsp", true);
    dhxLayout.cells("b").attachURL("content.jsp", true);
    contentHeight = dhxLayout.cells("b").getHeight();
    var menu = dhxLayout.attachMenu();
    menu.attachEvent("onClick", menuClick);
    callAjax("/gasoline/getMenu.do", null, null, function(data) {
        menu.loadXMLString(data);
    });
}
function menuClick(id) {
    if (id == 'permissionlist')
        loadPermissionPanel();
    else if (id == 'parameter')
        loadParameterPanel();
    else if (id == 'organizationlist')
        loadOrganizationPanel();
    else if (id == 'organizationadd')
        getOrganization(0, 'loadOrganizationPanel');
    else if (id == 'storelist')
        loadStorePanel();
    else if (id == 'storeadd')
        getStore(0, 'loadStorePanel');
    else if (id == 'employeelist')
        loadEmployeePanel();
    else if (id == 'employeeadd')
        getEmployee(0, 'loadEmployeePanel');
    else if (id == 'employeefiellist')
        loadDynamicFieldPanel("employee");
    else if (id == 'userlist')
        loadUserPanel();
    else if (id == 'useradd')
        getUser(0, 'loadUserPanel');
    else if (id == 'logout')
        logout();
    else if (id == 'resetpassword')
        changePasswordForm();
    else if (id == 'unitlist')
        loadUnitPanel();
    else if (id == 'unitadd')
        getUnit(0, 'loadUnitPanel');
    else if (id == 'shellkindlist')
        loadShellKindPanel();
    else if (id == 'shellkindadd')
        getShellKind(0, 'loadShellKindPanel');
    else if (id == 'shelllist')
        loadShellPanel();
    else if (id == 'shelladd')
        getShell(0, 'loadShellPanel');
    else if (id == 'vendorlist')
        loadVendorPanel();
    else if (id == 'vendoradd')
        getVendor(0, 'loadVendorPanel');
    else if (id == 'vendorfiellist')
        loadDynamicFieldPanel("vendor");
    else if (id == 'accountlist')
        loadAccountPanel();
    else if (id == 'accountadd')
        getAccount(0, 'loadAccountPanel');
    else if (id == 'vehiclelist')
        loadVehiclePanel();
    else if (id == 'vehicleadd')
        getVehicle(0, 'loadVehiclePanel');
    else if (id == 'routelist')
        loadRoutePanel();
    else if (id == 'routeadd')
        getRoute(0, 'loadRoutePanel');
    else if (id == 'accessorykindlist')
        loadAccessoryKindPanel();
    else if (id == 'accessorykindadd')
        getAccessoryKind(0, 'loadAccessoryKindPanel');
    else if (id == 'accessorylist')
        loadAccessoryPanel();
    else if (id == 'accessoryadd')
        getAccessory(0, 'loadAccessoryPanel');
    else if (id == 'promotionmateriallist')
        loadPromotionMaterialPanel();
    else if (id == 'promotionmaterialadd')
        getPromotionMaterial(0, 'loadPromotionMaterialPanel');
    else if (id == 'customerlist')
        loadCustomerPanel();
    else if (id == 'customeradd')
        getCustomer(0, 'loadCustomerPanel');
    else if (id == 'customerfiellist')
        loadDynamicFieldPanel("customer");
    else if (id == 'employeeadvancelist')
        loadEmployeeAdvancePanel();
    else if (id == 'employeeadvanceadd')
        getEmployeeAdvance(0, 'loadEmployeeAdvancePanel');
    else if (id == 'employeetimesheetlist')
        loadEmployeeTimesheetPanel();
    else if (id == 'employeetimesheetadd')
        getEmployeeTimesheet(0, 'loadEmployeeTimesheetPanel');
    else if (id == 'salarylist')
        loadSalaryPanel();
    else if (id == 'employeesalarylist')
        loadEmployeeSalaryPanel();
    else if (id == 'organizationtimesheetlist')
        loadOrganizationTimesheetPanel();
    else if (id == 'salaryfiellist')
        loadDynamicFieldPanel("salary");
    else if (id == 'timesheetfiellist')
        loadDynamicFieldPanel("timesheet");
    else if (id == 'employeeofflist')
        loadEmployeeOffPanel();
    else if (id == 'employeeoffadd')
        getEmployeeOff(0, 'loadEmployeeOffPanel');
    else if (id == 'petrolist')
        loadPetroPanel();
    else if (id == 'petroadd')
        getPetro(0, 'loadPetroPanel');
    else if (id == 'tripfeelist')
        loadTripFeePanel();
    else if (id == 'tripfeeadd')
        getTripFee(0, 'loadTripFeePanel');
    else if (id == 'shellimportlist')
        loadShellImportPanel();
    else if (id == 'shellimportadd')
        getShellImport(0, 'loadShellImportPanel');
    else if (id == 'lpgimportlist')
        loadLpgImportPanel();
    else if (id == 'lpgimportadd')
        getLpgImport(0, 'loadLpgImportPanel');
}
function clearContent() {
    var contentDiv = document.getElementById("contentDiv");
    if (contentDiv != null) {
        contentDiv.innerHTML = "";
        contentDiv = null;
    }
    clearPopupForm('');
}
function logout() {
    window.location = "logout.do";
}
function loadPermissionPanel() {
    callAjax("getPermissionPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        var z = dhtmlXComboFromSelect("userCombobox");
        z.enableFilteringMode(true);
        z.attachEvent("onSelectionChange", function() {
            setUserSelectedForm('permissionsForm', z.getComboText(), z.getSelectedValue());
        });
        z.attachEvent("onBlur", function() {
            z.selectOption(z.getIndexByValue(z.getSelectedValue()));
        });
        setUserSelectedForm('permissionsForm', z.getComboText(), z.getSelectedValue());
        loadPermissionList();
    });
    return false;
}
function loadPermissionList(name) {
    var mygrid = new dhtmlXGridObject('permissionList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("T\u00EAn nh\u00F3m quy\u1EC1n,Ghi ch\u00FA,Nh\u00E2n vi\u00EAn");
    mygrid.attachHeader("#text_filter,&nbsp;,#text_filter");
    mygrid.setInitWidths("150,150,*");
    mygrid.setColTypes("link,ro,ro");
    mygrid.setColSorting("str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 170;
    mygrid.al(true, height);//enableAutoHeight
    mygrid.enablePaging(true, 14, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getPermissionList.do?t=1";
    if (name == null) {
        var user = document.forms['permissionsForm'].userSelectedHidden.value;
        url += "&user=" + user;
    } else {
        url += "&name=" + name;
    }
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function setUserSelectedForm(form, text, value) {
    if (value == null) {
        if (text != "")
            value = "-1";
        else
            value = "0";
    }
    if (document.forms[form].userSelectedTextHidden != null)
        document.forms[form].userSelectedTextHidden.value = text;
    document.forms[form].userSelectedHidden.value = value;
}
function setOrganizationSelectedForm(form, text, value) {
    if (value == null) {
        if (text != "")
            value = "-1";
        else
            value = "0";
    }
    if (document.forms[form].organizationSelectedTextHidden != null)
        document.forms[form].organizationSelectedTextHidden.value = text;
    document.forms[form].organizationSelectedHidden.value = value;
}
function getPermission(id) {
    var url = "permissionForm.do";
    if (id != null)
        url = url + "?id=" + id;
    callAjax(url, null, null, function(data) {
        clearContent();
        setAjaxData(data, 'contentDiv');
        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        var z = dhtmlXComboFromSelect("userCombobox");
        z.enableFilteringMode(true);
        z.attachEvent("onSelectionChange", function() {
            setUserSelectedForm('permissionForm', z.getComboText(), z.getSelectedValue());
        });
        z.attachEvent("onBlur", function() {
            z.selectOption(z.getIndexByValue(z.getSelectedValue()));
        });
        setUserSelectedForm('permissionForm', z.getComboText(), z.getSelectedValue());

        var o = dhtmlXComboFromSelect("organizationCombobox");
        o.enableFilteringMode(true);
        o.attachEvent("onSelectionChange", function() {
            setOrganizationSelectedForm('permissionForm', o.getComboText(), o.getSelectedValue());
        });
        o.attachEvent("onBlur", function() {
            o.selectOption(o.getIndexByValue(o.getSelectedValue()));
        });
        setOrganizationSelectedForm('permissionForm', o.getComboText(), o.getSelectedValue());
    });
}
function permissionLevel1Change(srcObject, name) {
    var objs = document.getElementsByName(name);
    var chk = srcObject.checked;
    for (var i = 0; i < objs.length; i++)
        if (objs[i].id == srcObject.id && objs[i] != srcObject)
            objs[i].checked = chk;
    return false;
}
function addPermissionEmp() {
    var user = document.forms['permissionForm'].userSelectedHidden.value;
    if (user == -1)
        return false;
    var permissionEmpId = document.forms['permissionForm'].permissionEmpId;
    var existed = false;
    if (permissionEmpId != null) {
        if (permissionEmpId.length != null) {
            for (i = 0; i < permissionEmpId.length; i++) {
                if (permissionEmpId[i].value == user) {
                    existed = true;
                    break;
                }
            }
        } else if (permissionEmpId.value == user)
            existed = true;
    }
    permissionEmpId = null;
    if (existed == true) {
        alert("Nh\u00E2n vi\u00EAn \u0111\u00E3 t\u1ED3n t\u1EA1i");
        return false;
    }

    var name = document.forms['permissionForm'].userSelectedTextHidden.value;
    var tbl = document.getElementById('permissionEmpTbl');
    var row = document.createElement("tr");
    tbl.tBodies[0].appendChild(row);
    var cell = row.insertCell(0);
    var el = document.createElement('input');
    el.type = 'checkbox';
    el.name = 'permissionEmpChk';
    el.value = user;
    cell.appendChild(el);
    el = document.createElement('input');
    el.type = 'hidden';
    el.name = 'permissionEmpId';
    el.value = user;
    cell.appendChild(el);

    cell = row.insertCell(1);
    el = document.createElement('span');
    el.name = 'permissionEmp';
    el.innerHTML = name;
    cell.appendChild(el);

    el = null
    cell = null;
    row = null;
    tbl = null;
    return false;
}
function addPermissionOrg() {
    var organization = document.forms['permissionForm'].organizationSelectedHidden.value;
    if (organization == -1)
        return false;
    var permissionOrgId = document.forms['permissionForm'].permissionOrgId;
    var existed = false;
    if (permissionOrgId != null) {
        if (permissionOrgId.length != null) {
            for (i = 0; i < permissionOrgId.length; i++) {
                if (permissionOrgId[i].value == organization) {
                    existed = true;
                    break;
                }
            }
        } else if (permissionOrgId.value == organization)
            existed = true;
    }
    permissionOrgId = null;
    if (existed == true) {
        alert("\u0110\u01A1n v\u1ECB \u0111\u00E3 t\u1ED3n t\u1EA1i");
        return false;
    }

    var name = document.forms['permissionForm'].organizationSelectedTextHidden.value;
    var tbl = document.getElementById('permissionOrgTbl');
    var row = document.createElement("tr");
    tbl.tBodies[0].appendChild(row);
    var cell = row.insertCell(0);
    var el = document.createElement('input');
    el.type = 'checkbox';
    el.name = 'permissionOrgChk';
    el.value = organization;
    cell.appendChild(el);
    el = document.createElement('input');
    el.type = 'hidden';
    el.name = 'permissionOrgId';
    el.value = organization;
    cell.appendChild(el);

    cell = row.insertCell(1);
    el = document.createElement('span');
    el.name = 'permissionOrg';
    el.innerHTML = name;
    cell.appendChild(el);

    el = null
    cell = null;
    row = null;
    tbl = null;
    return false;
}
function delTableRow(form, chkbox, table) {
    var detId = eval("document.forms['" + form + "']." + chkbox);
    if (detId == null)
        return false;
    var tbl = document.getElementById(table).tBodies[0];
    var parentNode;
    if (detId.length != null) {
        var len = detId.length;
        for (var i = len - 1; i >= 0; i--) {
            if (detId[i].checked == true) {
                parentNode = null;
                if (detId[i].parentNode)
                    parentNode = detId[i].parentNode;
                if (parentNode) {
                    if (parentNode.parentNode) {
                        parentNode = parentNode.parentNode;
                        tbl.deleteRow(parentNode.rowIndex - 1);
                        deepRemoveChildrenFromNode(parentNode);
                    }
                }
            }
        }
    } else {
        if (detId.checked == true) {
            parentNode = null;
            if (detId.parentNode)
                parentNode = detId.parentNode;
            if (parentNode) {
                if (parentNode.parentNode) {
                    parentNode = parentNode.parentNode;
                    tbl.deleteRow(parentNode.rowIndex - 1);
                    deepRemoveChildrenFromNode(parentNode);
                }
            }
        }
    }
    detId = null;
    parentNode = null;
    tbl = null;
    return false;
}
function savePermission() {
    if (scriptFunction == "savePermission")
        return false;
    var name = document.forms['permissionForm'].name;
    if (name.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp t\u00EAn nh\u00F3m ph\u00E2n quy\u1EC1n");
        name.focus();
        name = null;
        return false;
    }
    name = null;
    scriptFunction = "savePermission";
    callAjaxCheckError("savePermission.do", null, document.forms['permissionForm'], function() {
        scriptFunction = "";
        loadPermissionPanel();
    });
    return false;
}
function delPermission() {
    callAjaxCheckError('delPermission.do?perId=' + document.forms['permissionForm'].perId.value, null, null, loadPermissionPanel);
    return false;
}
function loadParameterPanel() {
    callAjax("getParameterPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        loadParameterList();
    });
}
function loadParameterList() {
    var mygrid = new dhtmlXGridObject('parameterList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("T\u00EAn tham s\u1ED1,Gi\u00E1 tr\u1ECB");
    mygrid.attachHeader("#text_filter,#text_filter");
    mygrid.setInitWidths("300,*");
    mygrid.setColTypes("link,ro");
    mygrid.setColSorting("str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height);//enableAutoHeight
    mygrid.enablePaging(true, 10, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getParameterList.do";
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getParameter(name, handle) {
    popupName = 'TH\u00D4NG TIN THAM S\u1ED0 H\u1EC6 TH\u1ED0NG';
    var url = 'parameterForm.do';
    if (name != 0)
        url += "?parameterName=" + name;
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
    });
}
function saveParameter() {
    if (scriptFunction == "saveParameter")
        return false;
    var field = document.forms['parameterForm'].value;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp gi\u00E1 tr\u1ECB tham s\u1ED1");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    scriptFunction = "saveParameter";
    callAjaxCheckError("addParameter.do", null, document.forms['parameterForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (handle != '')
            eval(handle + "()");
        prepareHidePopup('parameterFormshowHelpHideDiv');
    });
    return false;
}
function loadOrganizationPanel() {
    callAjax("getOrganizationPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        loadOrganizationList();
    });
}
function loadOrganizationList() {
    var mygrid = new dhtmlXGridObject('organizationList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("M\u00E3 \u0111\u01A1n v\u1ECB,T\u00EAn \u0111\u01A1n v\u1ECB,\u0110\u1ECBa ch\u1EC9,T\u00ECnh tr\u1EA1ng");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#select_filter");
    mygrid.setInitWidths("150,250,*,150");
    mygrid.setColTypes("link,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height);//enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var list = document.forms['organizationSearchForm'].statusCombobox;
    if (list != null && list.selectedIndex > -1)
        list = list.options[list.selectedIndex].value;
    else
        list = 0;
    var url = "getOrganizationList.do?status=" + list;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getOrganization(id, handle) {
    popupName = 'TH\u00D4NG TIN \u0110\u01A0N V\u1ECA';
    var url = 'organizationForm.do';
    if (id != 0)
        url += '?organizationId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['organizationForm'].code.focus();
    });
}
function saveOrganization() {
    if (scriptFunction == "saveOrganization")
        return false;
    var field = document.forms['organizationForm'].code;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp m\u00E3 \u0111\u01A1n v\u1ECB");
        field.focus();
        field = null;
        return false;
    }
    field = document.forms['organizationForm'].name;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp t\u00EAn \u0111\u01A1n v\u1ECB");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    scriptFunction = "saveOrganization";
    callAjaxCheckError("addOrganization.do", null, document.forms['organizationForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getOrganization(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('organizationFormshowHelpHideDiv');
    });
    return false;
}
function loadStorePanel() {
    callAjax("getStorePanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        loadStoreList();
    });
}
function loadStoreList() {
    var mygrid = new dhtmlXGridObject('storeList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("M\u00E3 kho,T\u00EAn kho,\u0110\u01A1n v\u1ECB,T\u00ECnh tr\u1EA1ng");
    mygrid.attachHeader("#text_filter,#text_filter,#select_filter,#select_filter");
    mygrid.setInitWidths("100,*,250,150");
    mygrid.setColTypes("link,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height);//enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var list = document.forms['storeSearchForm'].statusCombobox;
    if (list != null && list.selectedIndex > -1)
        list = list.options[list.selectedIndex].value;
    else
        list = 0;
    var url = "getStoreList.do?status=" + list;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getStore(id, handle) {
    popupName = 'TH\u00D4NG TIN KHO';
    var url = 'storeForm.do';
    if (id != 0)
        url += '?storeId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['storeForm'].code.focus();
    });
}
function saveStore() {
    if (scriptFunction == "saveStore")
        return false;
    var field = document.forms['storeForm'].code;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp m\u00E3 kho");
        field.focus();
        field = null;
        return false;
    }
    field = document.forms['storeForm'].name;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp t\u00EAn kho");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    scriptFunction = "saveStore";
    callAjaxCheckError("addStore.do", null, document.forms['storeForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getStore(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('storeFormshowHelpHideDiv');
    });
    return false;
}
function loadDynamicFieldPanel(tableName) {
    if (typeof (tableName) == "undefined" && tableName == null) {
        tableName = document.getElementById("dynamicFieldTableName");
        if (typeof (tableName) == "undefined" && tableName == null) {
            return;
        }
        tableName = tableName.value;
    }
    callAjax("getDynamicFieldPanel.do?tableName=" + tableName, null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        loadDynamicFieldList(tableName);
    });
}
function loadDynamicFieldList(tableName) {
    if (typeof (tableName) == "undefined" && tableName == null) {
        tableName = document.getElementById("dynamicFieldTableName");
        if (typeof (tableName) == "undefined" && tableName == null) {
            return;
        }
        tableName = tableName.value;
    }
    var mygrid = new dhtmlXGridObject('dynamicFieldList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("T\u00EAn,M\u00E3,\u0110\u01A1n v\u1ECB");
    mygrid.attachHeader("#text_filter,#text_filter,#select_filter");
    mygrid.setInitWidths("*,250,250");
    mygrid.setColTypes("link,ro,ro");
    mygrid.setColSorting("str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height);//enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getDynamicFieldList.do?tableName=" + tableName;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getDynamicField(id, handle) {
    popupName = 'TH\u00D4NG TIN D\u1EEE LI\u1EC6U';
    var url = 'dynamicFieldForm.do';
    if (id != 0)
        url += '?fieldId=' + id
    else {
        var tableName = document.getElementById("dynamicFieldTableName");
        if (typeof (tableName) == "undefined" && tableName == null) {
            return;
        }
        tableName = tableName.value;
        url += '?tableName=' + tableName;
    }
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['dynamicFieldForm'].name.focus();
    });
}
function saveDynamicField() {
    if (scriptFunction == "saveDynamicField")
        return false;
    var field = document.forms['dynamicFieldForm'].name;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp t\u00EAn d\u1EEF li\u1EC7u");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    scriptFunction = "saveDynamicField";
    callAjaxCheckError("addDynamicField.do", null, document.forms['dynamicFieldForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getDynamicField(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('dynamicFieldFormshowHelpHideDiv');
    });
    return false;
}
function delDynamicField() {
    var tableName = document.getElementById("dynamicFieldTableName").value;
    callAjaxCheckError('delDynamicField.do?fieldId=' + document.forms['dynamicFieldForm'].id.value, null, null, function() {
        loadDynamicFieldPanel(tableName);
        prepareHidePopup('dynamicFieldFormshowHelpHideDiv');
    });
    return false;
}
function loadEmployeePanel() {
    callAjax("getEmployeePanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        loadEmployeeList();
    });
}
function loadEmployeeList() {
    var mygrid = new dhtmlXGridObject('employeeList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("H\u1ECD t\u00EAn,Email,\u0110\u01A1n v\u1ECB,T\u00ECnh tr\u1EA1ng");
    mygrid.attachHeader("#text_filter,#text_filter,#select_filter,#select_filter");
    mygrid.setInitWidths("200,200,*,150");
    mygrid.setColTypes("link,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height);//enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var list = document.forms['employeeSearchForm'].statusCombobox;
    if (list != null && list.selectedIndex > -1)
        list = list.options[list.selectedIndex].value;
    else
        list = 0;
    var url = "getEmployeeList.do?status=" + list;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getEmployee(id, handle) {
    popupName = 'TH\u00D4NG TIN NH\u00C2N VI\u00CAN';
    var url = 'employeeForm.do';
    if (id != 0)
        url += '?employeeId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['employeeForm'].fullname.focus();
        tryNumberFormatCurrentcy(document.forms['employeeForm'].salary, "VND");
    });
}
function saveEmployee() {
    if (scriptFunction == "saveEmployee")
        return false;
    var field = document.forms['employeeForm'].fullname;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp t\u00EAn nh\u00E2n vi\u00EAn");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    reformatNumberMoney(document.forms['employeeForm'].salary);
    scriptFunction = "saveEmployee";
    callAjaxCheckError("addEmployee.do", null, document.forms['employeeForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getEmployee(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('employeeFormshowHelpHideDiv');
    });
    return false;
}
function loadUserPanel() {
    callAjax("getUserPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        loadUserList();
    });
}
function loadUserList() {
    var mygrid = new dhtmlXGridObject('userList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("T\u00EAn nh\u00E2n vi\u00EAn,T\u00EAm \u0111\u0103ng nh\u1EADp,T\u00ECnh tr\u1EA1ng");
    mygrid.attachHeader("#text_filter,#text_filter,#select_filter");
    mygrid.setInitWidths("250,250,*");
    mygrid.setColTypes("link,ro,ro");
    mygrid.setColSorting("str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height);//enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var list = document.forms['userSearchForm'].statusCombobox;
    if (list != null && list.selectedIndex > -1)
        list = list.options[list.selectedIndex].value;
    else
        list = 0;
    var url = "getUserList.do?status=" + list;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getUser(id, handle) {
    popupName = 'TH\u00D4NG TIN T\u00C0I KHO\u1EA2N';
    callAjax('userForm.do?userId=' + id, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['userForm'].username.focus();
    });
}
function checkConfirmPassword() {
    var password = document.forms['userForm'].password;
    var confirmPassword = document.forms['userForm'].confirmPassword;
    if (password.value != confirmPassword.value) {
        alert('M\u1EADt kh\u1EA9u kh\u00F4ng kh\u1EDBp');
        confirmPassword.value = '';
    }
    password = null;
    confirmPassword = null;
    return false;
}
function saveUser() {
    if (scriptFunction == "saveUser")
        return false;
    var field = document.forms['userForm'].username;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp t\u00EAn t\u00E0i kho\u1EA3n");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    var list = document.forms['userForm'].empId;
    if (list != null && list.selectedIndex > -1) {
        list = list.options[list.selectedIndex].text;
        document.forms['userForm'].fullname.value = list;
    } else {
        alert("Vui l\u00F2ng ch\u1ECDn nh\u00E2n vi\u00EAn");
        list = null;
        return false;
    }
    var id = document.forms['userForm'].id;
    var password = document.forms['userForm'].password;
    var confirmPassword = document.forms['userForm'].confirmPassword;
    if (id == 0) {
        if (password != null && confirmPassword != null) {
            if (password.value == '') {
                alert('Vui l\u00F2ng nh\u1EADp m\u1EADt kh\u1EA9u');
                password.focus();
                password = null;
                confirmPassword = null;
                return false;
            }
            if (confirmPassword.value == '') {
                alert('Vui l\u00F2ng nh\u1EADp m\u1EADt kh\u1EA9u');
                confirmPassword.focus();
                password = null;
                confirmPassword = null;
                return false;
            }
        }
    } else {
        if (password != null && confirmPassword != null) {
            if (password.value != confirmPassword.value) {
                alert('M\u1EADt kh\u1EA9u kh\u00F4ng kh\u1EDBp');
                password.focus();
                password = null;
                confirmPassword = null;
                return false;
            }
        }
    }
    password = null;
    confirmPassword = null;
    scriptFunction = "saveUser";
    callAjaxCheckError("addUser.do", null, document.forms['userForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getUser(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('userFormshowHelpHideDiv');
    });
    return false;
}
function delUser() {
    callAjaxCheckError('delUser.do?userId=' + document.forms['userForm'].id.value, null, null, function() {
        loadUserPanel();
        prepareHidePopup('userFormshowHelpHideDiv');
    });
    return false;
}
function changePasswordForm() {
    popupName = 'THAY \u0110\u1ED4I M\u1EACT KH\u1EA8U';
    callAjax('passwordForm.do', null, null, function(data) {
        showPopupForm(data);
    });
}
function changePassword() {
    var password = document.forms['passwordForm'].password;
    if (password.value == '') {
        alert("M\u1EADt kh\u1EA9u kh\u00F4ng \u0111\u01B0\u1EE3c r\u1ED7ng");
        password.focus();
        password = null;
        return false;
    }
    var newpassword = document.forms['passwordForm'].newpassword;
    if (newpassword.value == '') {
        alert("M\u1EADt kh\u1EA9u kh\u00F4ng \u0111\u01B0\u1EE3c r\u1ED7ng");
        newpassword.focus();
        newpassword = null;
        return false;
    }
    var retypepassword = document.forms['passwordForm'].retypepassword;
    if (newpassword.value != retypepassword.value) {
        alert("M\u1EADt kh\u1EA9u kh\u00F4ng kh\u1EDBp");
        newpassword = null;
        retypepassword = null;
        return false;
    }
    var md5 = document.forms['passwordForm'].md5pw; //document.getElementById('main:md5pw');            
    pwtomd5(password, md5);
    password = null;
    newpassword = null;
    retypepassword = null;
    callAjaxCheckError("changePassword.do", null, document.forms['passwordForm'], function(data) {
        logout();
        prepareHidePopup('passwordFormshowHelpHideDiv');
    });
    return false;
}
function loadUnitPanel() {
    callAjax("getUnitPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        loadUnitList();
    });
}
function loadUnitList() {
    var mygrid = new dhtmlXGridObject('unitList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("T\u00EAn \u0111\u01A1n v\u1ECB t\u00EDnh,T\u00ECnh tr\u1EA1ng");
    mygrid.attachHeader("#text_filter,#select_filter");
    mygrid.setInitWidths("*,250");
    mygrid.setColTypes("link,ro");
    mygrid.setColSorting("str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height);//enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var list = document.forms['unitSearchForm'].statusCombobox;
    if (list != null && list.selectedIndex > -1)
        list = list.options[list.selectedIndex].value;
    else
        list = 0;
    var url = "getUnitList.do?status=" + list;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getUnit(id, handle) {
    popupName = 'TH\u00D4NG TIN \u0110\u01A0N V\u1ECA T\u00CDNH';
    var url = 'unitForm.do';
    if (id != 0)
        url += '?unitId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['unitForm'].name.focus();
    });
}
function saveUnit() {
    if (scriptFunction == "saveUnit")
        return false;
    var field = document.forms['unitForm'].name;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp t\u00EAn \u0111\u01A1n v\u1ECB t\u00EDnh");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    scriptFunction = "saveUnit";
    callAjaxCheckError("addUnit.do", null, document.forms['unitForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getUnit(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('unitFormshowHelpHideDiv');
    });
    return false;
}
function loadShellKindPanel() {
    callAjax("getShellKindPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        loadShellKindList();
    });
}
function loadShellKindList() {
    var mygrid = new dhtmlXGridObject('shellKindList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("M\u00E3 lo\u1EA1i v\u1ECF b\u00ECnh,T\u00EAn lo\u1EA1i v\u1ECF b\u00ECnh,T\u00ECnh tr\u1EA1ng");
    mygrid.attachHeader("#text_filter,#text_filter,#select_filter");
    mygrid.setInitWidths("150,*,150");
    mygrid.setColTypes("link,ro,ro");
    mygrid.setColSorting("str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height);//enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var list = document.forms['shellKindSearchForm'].statusCombobox;
    if (list != null && list.selectedIndex > -1)
        list = list.options[list.selectedIndex].value;
    else
        list = 0;
    var url = "getShellKindList.do?status=" + list;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getShellKind(id, handle) {
    popupName = 'TH\u00D4NG TIN LO\u1EA0I V\u1ECE B\u00CCNH';
    var url = 'shellKindForm.do';
    if (id != 0)
        url += '?kindId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['shellKindForm'].code.focus();
        tryNumberFormatCurrentcy(document.forms['shellKindForm'].weight, "");
        tryNumberFormatCurrentcy(document.forms['shellKindForm'].commission, "VND");
    });
}
function saveShellKind() {
    if (scriptFunction == "saveShellKind")
        return false;
    var field = document.forms['shellKindForm'].code;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp m\u00E3 lo\u1EA1i v\u1ECF b\u00ECnh");
        field.focus();
        field = null;
        return false;
    }
    field = document.forms['shellKindForm'].name;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp t\u00EAn lo\u1EA1i v\u1ECF b\u00ECnh");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    reformatNumberMoney(document.forms['shellKindForm'].weight);
    reformatNumberMoney(document.forms['shellKindForm'].commission);
    scriptFunction = "saveShellKind";
    callAjaxCheckError("addShellKind.do", null, document.forms['shellKindForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getShellKind(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('shellKindFormshowHelpHideDiv');
    });
    return false;
}
function loadShellPanel() {
    callAjax("getShellPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        loadShellList();
    });
}
function loadShellList() {
    var mygrid = new dhtmlXGridObject('shellList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("M\u00E3 v\u1ECF b\u00ECnh,T\u00EAn v\u1ECF b\u00ECnh,Lo\u1EA1i v\u1ECF b\u00ECnh,T\u00ECnh tr\u1EA1ng");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#select_filter");
    mygrid.setInitWidths("150,*,200,150");
    mygrid.setColTypes("link,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height);//enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var list = document.forms['shellSearchForm'].statusCombobox;
    if (list != null && list.selectedIndex > -1)
        list = list.options[list.selectedIndex].value;
    else
        list = 0;
    var url = "getShellList.do?status=" + list;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getShell(id, handle) {
    popupName = 'TH\u00D4NG TIN V\u1ECE B\u00CCNH';
    var url = 'shellForm.do';
    if (id != 0)
        url += '?shellId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['shellForm'].code.focus();
        tryNumberFormatCurrentcy(document.forms['shellForm'].price, "VND");
    });
}
function saveShell() {
    if (scriptFunction == "saveShell")
        return false;
    var field = document.forms['shellForm'].code;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp m\u00E3 v\u1ECF b\u00ECnh");
        field.focus();
        field = null;
        return false;
    }
    field = document.forms['shellForm'].name;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp t\u00EAn v\u1ECF b\u00ECnh");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    reformatNumberMoney(document.forms['shellForm'].price);
    scriptFunction = "saveShell";
    callAjaxCheckError("addShell.do", null, document.forms['shellForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getShell(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('shellFormshowHelpHideDiv');
    });
    return false;
}
function loadVendorPanel() {
    callAjax("getVendorPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        loadVendorList();
    });
}
function loadVendorList() {
    var mygrid = new dhtmlXGridObject('vendorList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("M\u00E3 nh\u00E0 cung c\u1EA5p,T\u00EAn nh\u00E0 cung c\u1EA5p,\u0110\u01A1n v\u1ECB,T\u00ECnh tr\u1EA1ng");
    mygrid.attachHeader("#text_filter,#text_filter,#select_filter,#select_filter");
    mygrid.setInitWidths("100,*,250,150");
    mygrid.setColTypes("link,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height);//enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var list = document.forms['vendorSearchForm'].statusCombobox;
    if (list != null && list.selectedIndex > -1)
        list = list.options[list.selectedIndex].value;
    else
        list = 0;
    var url = "getVendorList.do?status=" + list;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getVendor(id, handle) {
    popupName = 'TH\u00D4NG TIN NH\u00C0 CUNG C\u1EA4P';
    var url = 'vendorForm.do';
    if (id != 0)
        url += '?vendorId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['vendorForm'].code.focus();
    });
}
function saveVendor() {
    if (scriptFunction == "saveVendor")
        return false;
    var field = document.forms['vendorForm'].code;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp m\u00E3 nh\u00E0 cung c\u1EA5p");
        field.focus();
        field = null;
        return false;
    }
    field = document.forms['vendorForm'].name;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp t\u00EAn nh\u00E0 cung c\u1EA5p");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    scriptFunction = "saveVendor";
    callAjaxCheckError("addVendor.do", null, document.forms['vendorForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getVendor(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('vendorFormshowHelpHideDiv');
    });
    return false;
}
function dynamicFieldOrganizationChanged(list, tableName, div) {
    if (list.selectedIndex == -1)
        return false;
    var url = "getDynamicFieldByOrganization.do?tableName=" + tableName + "&organizationId=" + list.options[list.selectedIndex].value;
    callAjax(url, div, null, null);
    list = null;
    return false;
}
function loadAccountPanel() {
    callAjax("getAccountPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        loadAccountList();
    });
}
function loadAccountList() {
    var mygrid = new dhtmlXGridObject('accountList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("S\u1ED1 t\u00E0i kho\u1EA3n,Ch\u1EE7 t\u00E0i kho\u1EA3n,Ng\u00E2n h\u00E0ng,Chi nh\u00E1nh");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,150,250,*");
    mygrid.setColTypes("link,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height);//enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getAccountList.do";
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getAccount(id, handle) {
    popupName = 'TH\u00D4NG TIN T\u00C0I KHO\u1EA2N NG\u00C2N H\u00C0NG';
    var url = 'accountForm.do';
    if (id != 0)
        url += '?accountId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['accountForm'].number.focus();
    });
}
function saveAccount() {
    if (scriptFunction == "saveAccount")
        return false;
    var field = document.forms['accountForm'].number;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp số tài khoản");
        field.focus();
        field = null;
        return false;
    }
    field = document.forms['accountForm'].holder;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp ch\u1EE7 t\u00E0i kho\u1EA3n");
        field.focus();
        field = null;
        return false;
    }
    field = document.forms['accountForm'].bank;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp ng\u00E2n h\u00E0ng");
        field.focus();
        field = null;
        return false;
    }
    field = document.forms['accountForm'].branch;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp chi nh\u00E1nh");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    scriptFunction = "saveAccount";
    callAjaxCheckError("addAccount.do", null, document.forms['accountForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getAccount(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('accountFormshowHelpHideDiv');
    });
    return false;
}
function loadVehiclePanel() {
    callAjax("getVehiclePanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        loadVehicleList();
    });
}
function loadVehicleList() {
    var mygrid = new dhtmlXGridObject('vehicleList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("B\u1EA3ng s\u1ED1 xe,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter");
    mygrid.setInitWidths("150,*");
    mygrid.setColTypes("link,ro");
    mygrid.setColSorting("str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height);//enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getVehicleList.do";
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getVehicle(id, handle) {
    popupName = 'TH\u00D4NG TIN XE';
    var url = 'vehicleForm.do';
    if (id != 0)
        url += '?vehicleId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['vehicleForm'].plate.focus();
    });
}
function saveVehicle() {
    if (scriptFunction == "saveVehicle")
        return false;
    var field = document.forms['vehicleForm'].plate;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp b\u1EA3ng s\u1ED1 xe");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    scriptFunction = "saveVehicle";
    callAjaxCheckError("addVehicle.do", null, document.forms['vehicleForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getVehicle(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('vehicleFormshowHelpHideDiv');
    });
    return false;
}
function delVehicle() {
    callAjaxCheckError('delVehicle.do?vehicleId=' + document.forms['vehicleForm'].id.value, null, null, function() {
        loadVehiclePanel();
        prepareHidePopup('vehicleFormshowHelpHideDiv');
    });
    return false;
}
function loadRoutePanel() {
    callAjax("getRoutePanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        loadRouteList();
    });
}
function loadRouteList() {
    var mygrid = new dhtmlXGridObject('routeList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("B\u1EA3ng s\u1ED1 xe,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter");
    mygrid.setInitWidths("150,*");
    mygrid.setColTypes("link,ro");
    mygrid.setColSorting("str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height);//enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getRouteList.do";
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getRoute(id, handle) {
    popupName = 'TH\u00D4NG TIN XE';
    var url = 'routeForm.do';
    if (id != 0)
        url += '?routeId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['routeForm'].name.focus();
        tryNumberFormatCurrentcy(document.forms['routeForm'].distance, "");
    });
}
function saveRoute() {
    if (scriptFunction == "saveRoute")
        return false;
    var field = document.forms['routeForm'].name;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp b\u1EA3ng s\u1ED1 xe");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    reformatNumberMoney(document.forms['routeForm'].distance);
    scriptFunction = "saveRoute";
    callAjaxCheckError("addRoute.do", null, document.forms['routeForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getRoute(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('routeFormshowHelpHideDiv');
    });
    return false;
}
function delRoute() {
    callAjaxCheckError('delRoute.do?routeId=' + document.forms['routeForm'].id.value, null, null, function() {
        loadRoutePanel();
        prepareHidePopup('routeFormshowHelpHideDiv');
    });
    return false;
}
function loadAccessoryKindPanel() {
    callAjax("getAccessoryKindPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        loadAccessoryKindList();
    });
}
function loadAccessoryKindList() {
    var mygrid = new dhtmlXGridObject('accessoryKindList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("Tên loại phụ kiện,Chiết khấu bán hàng,Tình trạng");
    mygrid.attachHeader("#text_filter,#text_filter,#select_filter");
    mygrid.setInitWidths("*,200,200");
    mygrid.setColTypes("link,ro");
    mygrid.setColSorting("str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height);//enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var list = document.forms['accessoryKindSearchForm'].statusCombobox;
    if (list != null && list.selectedIndex > -1)
        list = list.options[list.selectedIndex].value;
    else
        list = 0;
    var url = "getAccessoryKindList.do?status=" + list;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getAccessoryKind(id, handle) {
    popupName = 'TH\u00D4NG TIN LO\u1EA0I PH\u1EE4 KI\u1EC6N';
    var url = 'accessoryKindForm.do';
    if (id != 0)
        url += '?kindId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['accessoryKindForm'].name.focus();
        tryNumberFormatCurrentcy(document.forms['accessoryKindForm'].commission, "");
    });
}
function saveAccessoryKind() {
    if (scriptFunction == "saveAccessoryKind")
        return false;
    var field = document.forms['accessoryKindForm'].name;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp t\u00EAn lo\u1EA1i ph\u1EE5 ki\u1EC7n");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    reformatNumberMoney(document.forms['accessoryKindForm'].commission);
    scriptFunction = "saveAccessoryKind";
    callAjaxCheckError("addAccessoryKind.do", null, document.forms['accessoryKindForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getAccessoryKind(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('accessoryKindFormshowHelpHideDiv');
    });
    return false;
}
function loadAccessoryPanel() {
    callAjax("getAccessoryPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        loadAccessoryList();
    });
}
function loadAccessoryList() {
    var mygrid = new dhtmlXGridObject('accessoryList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("T\u00EAn ph\u1EE5 ki\u1EC7n,T\u00ECnh tr\u1EA1ng");
    mygrid.attachHeader("#text_filter,#select_filter");
    mygrid.setInitWidths("*,200");
    mygrid.setColTypes("link,ro");
    mygrid.setColSorting("str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height);//enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var list = document.forms['accessorySearchForm'].statusCombobox;
    if (list != null && list.selectedIndex > -1)
        list = list.options[list.selectedIndex].value;
    else
        list = 0;
    var url = "getAccessoryList.do?status=" + list;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getAccessory(id, handle) {
    popupName = 'TH\u00D4NG TIN PH\u1EE4 KI\u1EC6N';
    var url = 'accessoryForm.do';
    if (id != 0)
        url += '?accessoryId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['accessoryForm'].name.focus();
        tryNumberFormatCurrentcy(document.forms['accessoryForm'].price, "VND");
    });
}
function saveAccessory() {
    if (scriptFunction == "saveAccessory")
        return false;
    var field = document.forms['accessoryForm'].name;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp t\u00EAn ph\u1EE5 ki\u1EC7n");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    reformatNumberMoney(document.forms['accessoryForm'].price);
    scriptFunction = "saveAccessory";
    callAjaxCheckError("addAccessory.do", null, document.forms['accessoryForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getAccessory(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('accessoryFormshowHelpHideDiv');
    });
    return false;
}
function loadPromotionMaterialPanel() {
    callAjax("getPromotionMaterialPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        loadPromotionMaterialList();
    });
}
function loadPromotionMaterialList() {
    var mygrid = new dhtmlXGridObject('promotionMaterialList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("T\u00EAn h\u00E0ng khuy\u1EBFn m\u00E3i,T\u00ECnh tr\u1EA1ng");
    mygrid.attachHeader("#text_filter,#select_filter");
    mygrid.setInitWidths("*,200");
    mygrid.setColTypes("link,ro");
    mygrid.setColSorting("str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height);//enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var list = document.forms['promotionMaterialSearchForm'].statusCombobox;
    if (list != null && list.selectedIndex > -1)
        list = list.options[list.selectedIndex].value;
    else
        list = 0;
    var url = "getPromotionMaterialList.do?status=" + list;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getPromotionMaterial(id, handle) {
    popupName = 'TH\u00D4NG TIN H\u00C0NG KHUY\u1EBEN M\u00C3I';
    var url = 'promotionMaterialForm.do';
    if (id != 0)
        url += '?promotionMaterialId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['promotionMaterialForm'].name.focus();
    });
}
function savePromotionMaterial() {
    if (scriptFunction == "savePromotionMaterial")
        return false;
    var field = document.forms['promotionMaterialForm'].name;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp t\u00EAn h\u00E0ng khuy\u1EBFn m\u00E3i");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    scriptFunction = "savePromotionMaterial";
    callAjaxCheckError("addPromotionMaterial.do", null, document.forms['promotionMaterialForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getPromotionMaterial(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('promotionMaterialFormshowHelpHideDiv');
    });
    return false;
}
function loadCustomerPanel() {
    callAjax("getCustomerPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        loadCustomerList();
    });
}
function loadCustomerList() {
    var mygrid = new dhtmlXGridObject('customerList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("M\u00E3 kh\u00E1ch h\u00E0ng,T\u00EAn kh\u00E1ch h\u00E0ng,\u0110\u01A1n v\u1ECB,T\u00ECnh tr\u1EA1ng");
    mygrid.attachHeader("#text_filter,#text_filter,#select_filter,#select_filter");
    mygrid.setInitWidths("100,*,250,150");
    mygrid.setColTypes("link,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height);//enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var list = document.forms['customerSearchForm'].statusCombobox;
    if (list != null && list.selectedIndex > -1)
        list = list.options[list.selectedIndex].value;
    else
        list = 0;
    var url = "getCustomerList.do?status=" + list;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getCustomer(id, handle) {
    popupName = 'TH\u00D4NG TIN KH\u00C1CH H\u00C0NG';
    var url = 'customerForm.do';
    if (id != 0)
        url += '?customerId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['customerForm'].code.focus();
    });
}
function saveCustomer() {
    if (scriptFunction == "saveCustomer")
        return false;
    var field = document.forms['customerForm'].code;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp m\u00E3 kh\u00E1ch h\u00E0ng");
        field.focus();
        field = null;
        return false;
    }
    field = document.forms['customerForm'].name;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp t\u00EAn kh\u00E1ch h\u00E0ng");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    scriptFunction = "saveCustomer";
    callAjaxCheckError("addCustomer.do", null, document.forms['customerForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getCustomer(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('customerFormshowHelpHideDiv');
    });
    return false;
}
function loadEmployeeAdvancePanel() {
    callAjax("getEmployeeAdvancePanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['employeeAdvanceSearchForm'].fromDate.value = currentTime;
        document.forms['employeeAdvanceSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadEmployeeAdvanceList(currentTime, currentTime);
    });
    return false;
}
function loadEmployeeAdvanceList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('employeeAdvanceList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("S\u1ED1 phi\u1EBFu,Nh\u00E2n vi\u00EAn,Ng\u00E0y t\u1EA1m \u1EE9ng,S\u1ED1 ti\u1EC1n,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,200,200,200,*");
    mygrid.setColTypes("link,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height);//enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getEmployeeAdvanceList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getEmployeeAdvance(id, handle) {
    popupName = 'TH\u00D4NG TIN T\u1EA0M \u1EE8NG';
    var url = 'employeeAdvanceForm.do';
    if (id != 0)
        url += '?employeeAdvanceId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['employeeAdvanceForm'].amount.focus();
        tryNumberFormatCurrentcy(document.forms['employeeAdvanceForm'].amount, "VND");
        var myCalendar = new dhtmlXCalendarObject(["employeeAdvanceDate"]);
        myCalendar.setSkin('dhx_web');
        var currentDate = getCurrentDate();
        document.forms['employeeAdvanceForm'].employeeAdvanceDate.value = currentDate;
        myCalendar.setDateFormat("%d/%m/%Y");
    });
}
function saveEmployeeAdvance() {
    if (scriptFunction == "saveEmployeeAdvance")
        return false;
    var field = document.forms['employeeAdvanceForm'].advanceDate;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp ng\u00E0y t\u1EA1m \u1EE9ng");
        field.focus();
        field = null;
        return false;
    }
    field = document.forms['employeeAdvanceForm'].amount;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp s\u1ED1 ti\u1EC1n");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    reformatNumberMoney(document.forms['employeeAdvanceForm'].amount);
    scriptFunction = "saveEmployeeAdvance";
    callAjaxCheckError("addEmployeeAdvance.do", null, document.forms['employeeAdvanceForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getEmployeeAdvance(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('employeeAdvanceFormshowHelpHideDiv');
    });
    return false;
}
function delEmployeeAdvance() {
    callAjaxCheckError('delEmployeeAdvance.do?employeeAdvanceId=' + document.forms['employeeAdvanceForm'].id.value, null, null, function() {
        loadEmployeeAdvancePanel();
        prepareHidePopup('employeeAdvanceFormshowHelpHideDiv');
    });
    return false;
}
function loadEmployeeSalaryPanel() {
    callAjax("getEmployeeSalaryPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        loadEmployeeSalaryList();
    });
}
function loadEmployeeSalaryList() {
    var mygrid = new dhtmlXGridObject('employeeSalaryList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("H\u1ECD t\u00EAn,Email,\u0110\u01A1n v\u1ECB,T\u00ECnh tr\u1EA1ng");
    mygrid.attachHeader("#text_filter,#text_filter,#select_filter,#select_filter");
    mygrid.setInitWidths("200,200,*,150");
    mygrid.setColTypes("link,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height);//enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getEmployeeSalaryList.do";
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getEmployeeSalary(employeeId, handle) {
    if (employeeId == 0)
        return;
    popupName = 'TH\u00D4NG TIN PH\u1EE4 C\u1EA4P NH\u00C2N VI\u00CAN';
    callAjax('employeeSalaryForm.do?employeeId=' + employeeId, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        tryNumberFormatCurrentcy(document.forms['employeeSalaryForm'].salary, "VND");
    });
}
function saveEmployeeSalary() {
    if (scriptFunction == "saveEmployeeSalary")
        return false;
    reformatNumberMoney(document.forms['employeeSalaryForm'].salary);
    scriptFunction = "saveEmployeeSalary";
    callAjaxCheckError("addEmployeeSalary.do", null, document.forms['employeeSalaryForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (handle != '')
            eval(handle + "()");
        prepareHidePopup('employeeSalaryFormshowHelpHideDiv');
    });
    return false;
}
function loadOrganizationTimesheetPanel() {
    callAjax("getOrganizationTimesheetPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        loadOrganizationTimesheetList();
    });
}
function loadOrganizationTimesheetList() {
    var mygrid = new dhtmlXGridObject('organizationTimesheetList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("\u0110\u01A1n v\u1ECB,T\u00ECnh tr\u1EA1ng");
    mygrid.attachHeader("#text_filter,#select_filter");
    mygrid.setInitWidths("*,150");
    mygrid.setColTypes("link,ro");
    mygrid.setColSorting("str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height);//enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getOrganizationTimesheetList.do";
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getOrganizationTimesheet(employeeId, handle) {
    if (employeeId == 0)
        return;
    popupName = 'TH\u00D4NG TIN CHI PH\u00CD';
    callAjax('organizationTimesheetForm.do?organizationId=' + employeeId, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
    });
}
function saveOrganizationTimesheet() {
    if (scriptFunction == "saveOrganizationTimesheet")
        return false;
    scriptFunction = "saveOrganizationTimesheet";
    callAjaxCheckError("addOrganizationTimesheet.do", null, document.forms['organizationTimesheetForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (handle != '')
            eval(handle + "()");
        prepareHidePopup('organizationTimesheetFormshowHelpHideDiv');
    });
    return false;
}
function loadEmployeeTimesheetPanel() {
    callAjax("getEmployeeTimesheetPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['employeeTimesheetSearchForm'].fromDate.value = currentTime;
        document.forms['employeeTimesheetSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadEmployeeTimesheetList(currentTime, currentTime);
    });
    return false;
}
function loadEmployeeTimesheetList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('employeeTimesheetList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("S\u1ED1 phi\u1EBFu,Nh\u00E2n vi\u00EAn,Ng\u00E0y t\u1EA1o,N\u1ED9i dung,S\u1ED1 l\u1EA7n,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,200,200,200,200,*");
    mygrid.setColTypes("link,ro,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height);//enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getEmployeeTimesheetList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getEmployeeTimesheet(id, handle) {
    popupName = 'TH\u00D4NG TIN CH\u1EA4M C\u00D4NG';
    var url = 'employeeTimesheetForm.do';
    if (id != 0)
        url += '?employeeTimesheetId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['employeeTimesheetForm'].quantity.focus();
        tryNumberFormatCurrentcy(document.forms['employeeTimesheetForm'].quantity, "VND");
        var myCalendar = new dhtmlXCalendarObject(["employeeTimesheetDate"]);
        myCalendar.setSkin('dhx_web');
        var currentDate = getCurrentDate();
        document.forms['employeeTimesheetForm'].employeeTimesheetDate.value = currentDate;
        myCalendar.setDateFormat("%d/%m/%Y");
    });
}
function saveEmployeeTimesheet() {
    if (scriptFunction == "saveEmployeeTimesheet")
        return false;
    var field = document.forms['employeeTimesheetForm'].timesheetDate;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp ng\u00E0y ch\u1EA5m c\u00F4ng");
        field.focus();
        field = null;
        return false;
    }
    field = document.forms['employeeTimesheetForm'].quantity;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u1EA7n");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    reformatNumberMoney(document.forms['employeeTimesheetForm'].quantity);
    scriptFunction = "saveEmployeeTimesheet";
    callAjaxCheckError("addEmployeeTimesheet.do", null, document.forms['employeeTimesheetForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getEmployeeTimesheet(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('employeeTimesheetFormshowHelpHideDiv');
    });
    return false;
}
function delEmployeeTimesheet() {
    callAjaxCheckError('delEmployeeTimesheet.do?employeeTimesheetId=' + document.forms['employeeTimesheetForm'].id.value, null, null, function() {
        loadEmployeeTimesheetPanel();
        prepareHidePopup('employeeTimesheetFormshowHelpHideDiv');
    });
    return false;
}
function timesheetOrganizationChanged(list) {
    if (list.selectedIndex == -1)
        return false;
    var url = "getDynamicFieldByOrganizationInTimeSheet.do?employeeId=" + list.options[list.selectedIndex].value;
    callAjax(url, "employeeTimeSheetField", null, null);
    list = null;
    return false;
}
function loadEmployeeOffPanel() {
    callAjax("getEmployeeOffPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['employeeOffSearchForm'].fromDate.value = currentTime;
        document.forms['employeeOffSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadEmployeeOffList(currentTime, currentTime);
    });
    return false;
}
function loadEmployeeOffList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('employeeOffList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("S\u1ED1 phi\u1EBFu,Nh\u00E2n vi\u00EAn,Ng\u00E0y t\u1EA1o,T\u1EEB ng\u00E0y,\u0110\u1EBFn ng\u00E0y,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,200,150,150,150,*");
    mygrid.setColTypes("link,ro,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height);//enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getEmployeeOffList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getEmployeeOff(id, handle) {
    popupName = 'TH\u00D4NG TIN NGH\u1EC8 PH\u00C9P';
    var url = 'employeeOffForm.do';
    if (id != 0)
        url += '?employeeOffId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        var myCalendar = new dhtmlXCalendarObject(["employeeOffFromDate", "employeeOffToDate"]);
        myCalendar.setSkin('dhx_web');
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['employeeOffForm'].fromDate.value = currentDate;
            document.forms['employeeOffForm'].toDate.value = currentDate;
        }
        myCalendar.setDateFormat("%d/%m/%Y");
    });
}
function saveEmployeeOff() {
    if (scriptFunction == "saveEmployeeOff")
        return false;
    var field = document.forms['employeeOffForm'].fromDate;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp ng\u00E0y b\u1EAFt \u0111\u1EA7u");
        field.focus();
        field = null;
        return false;
    }
    field = document.forms['employeeOffForm'].toDate;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp ng\u00E0y k\u1EBFt th\u00FAc");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    scriptFunction = "saveEmployeeOff";
    callAjaxCheckError("addEmployeeOff.do", null, document.forms['employeeOffForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getEmployeeOff(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('employeeOffFormshowHelpHideDiv');
    });
    return false;
}
function delEmployeeOff() {
    callAjaxCheckError('delEmployeeOff.do?employeeOffId=' + document.forms['employeeOffForm'].id.value, null, null, function() {
        loadEmployeeOffPanel();
        prepareHidePopup('employeeOffFormshowHelpHideDiv');
    });
    return false;
}
function loadSalaryPanel() {
    callAjax("getSalaryPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentMonth();
        document.forms['salarySearchForm'].fromDate.value = currentTime;
        myCalendar.setDateFormat("%m/%Y");
        loadSalaryList(currentTime);
    });
    return false;
}
function loadSalaryList(fromDate) {
    var mygrid = new dhtmlXGridObject('salaryList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("S\u1ED1 phi\u1EBFu,Nh\u00E2n vi\u00EAn,Th\u00E1ng,T\u1ED5ng l\u01B0\u01A1ng,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,200,200,200,*");
    mygrid.setColTypes("link,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height);//enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getSalaryList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getSalary(id, handle) {
    var url = 'salaryForm.do';
    if (id != 0)
        url += '?salaryId=' + id
    callAjax(url, null, null, function(data) {
        clearContent();
        setAjaxData(data, 'contentDiv');
        document.getElementById('callbackFunc').value = handle;
        tryNumberFormatCurrentcy(document.forms['salaryForm'].total, "VND");
        tryNumberFormatCurrentcy(document.forms['salaryForm'].monthDay, "VND");
        tryNumberFormatCurrentcy(document.forms['salaryForm'].workingDay, "VND");
        tryNumberFormatCurrentcy(document.forms['salaryForm'].basicSalary, "VND");
        tryNumberFormatCurrentcy(document.forms['salaryForm'].realSalary, "VND");

        var quantity = document.forms['salaryForm'].timesheetQuantity;
        var price = document.forms['salaryForm'].timesheetPrice;
        var amount = document.forms['salaryForm'].timesheetAmount;
        if (quantity != null) {
            if (quantity.length != null) {
                for (var i = 0; i < quantity.length; i++) {
                    tryNumberFormatCurrentcy(quantity[i], "VND");
                    tryNumberFormatCurrentcy(price[i], "VND");
                    tryNumberFormatCurrentcy(amount[i], "VND");
                }
            } else {
                tryNumberFormatCurrentcy(quantity, "VND");
                tryNumberFormatCurrentcy(price, "VND");
                tryNumberFormatCurrentcy(amount, "VND");
            }
        }
        quantity = null;
        price = null;
        amount = null;

        amount = document.forms['salaryForm'].amount;
        if (amount != null) {
            if (amount.length != null) {
                for (var i = 0; i < amount.length; i++) {
                    tryNumberFormatCurrentcy(amount[i], "VND");
                }
            } else {
                tryNumberFormatCurrentcy(amount, "VND");
            }
        }
        amount = null;
    });
}
function caculateSalaryTotal() {
    var amount = document.forms['salaryForm'].amount;
    var sum = 0;
    if (amount != null) {
        if (amount.length != null) {
            for (i = 0; i < amount.length; i++) {
                sum += reformatNumberMoneyString(amount[i].value) * 1;
                tryNumberFormatCurrentcy(amount[i], "VND");
            }
        } else {
            sum += reformatNumberMoneyString(amount.value) * 1;
            tryNumberFormatCurrentcy(amount, "VND");
        }
    }
    amount = null;

    amount = document.forms['salaryForm'].timesheetAmount;
    if (amount != null) {
        if (amount.length != null) {
            for (i = 0; i < amount.length; i++) {
                sum += reformatNumberMoneyString(amount[i].value) * 1;
                tryNumberFormatCurrentcy(amount[i], "VND");
            }
        } else {
            sum += reformatNumberMoneyString(amount.value) * 1;
            tryNumberFormatCurrentcy(amount, "VND");
        }
    }
    amount = null;

    document.forms['salaryForm'].total.value = sum + reformatNumberMoneyString(document.forms['salaryForm'].realSalary.value) * 1;
    tryNumberFormatCurrentcy(document.forms['salaryForm'].total, "VND");
    tryNumberFormatCurrentcy(document.forms['salaryForm'].realSalary, "VND");
    return false;
}
function saveSalary() {
    if (scriptFunction == "saveSalary")
        return false;
    reformatNumberMoney(document.forms['salaryForm'].total);
    var amount = document.forms['salaryForm'].amount;
    if (amount != null) {
        if (amount.length != null) {
            for (i = 0; i < amount.length; i++) {
                reformatNumberMoney(amount[i]);
            }
        } else {
            reformatNumberMoney(amount);
        }
    }
    amount = null;
    scriptFunction = "saveSalary";
    callAjaxCheckError("addSalary.do", null, document.forms['salaryForm'], function() {
        scriptFunction = "";
        loadSalaryPanel();
    });
    return false;
}
function loadPetroPanel() {
    callAjax("getPetroPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        loadPetroList();
    });
}
function loadPetroList() {
    var mygrid = new dhtmlXGridObject('petroList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("M\u00E3 h\u00E0ng h\u00F3a,T\u00EAn h\u00E0ng h\u00F3a,Gi\u00E1 b\u00E1n,\u0110\u01A1n v\u1ECB t\u00EDnh,\u0110\u01A1n v\u1ECB,T\u00ECnh tr\u1EA1ng");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter#select_filter");
    mygrid.setInitWidths("150,*,150,150,300,200");
    mygrid.setColTypes("link,ro,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height);//enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var list = document.forms['petroSearchForm'].statusCombobox;
    if (list != null && list.selectedIndex > -1)
        list = list.options[list.selectedIndex].value;
    else
        list = 0;
    var url = "getPetroList.do?status=" + list;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getPetro(id, handle) {
    popupName = 'TH\u00D4NG TIN H\u00C0NG H\u00D3A';
    var url = 'petroForm.do';
    if (id != 0)
        url += '?petroId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['petroForm'].code.focus();
        tryNumberFormatCurrentcy(document.forms['petroForm'].price, "VND");
    });
}
function savePetro() {
    if (scriptFunction == "savePetro")
        return false;
    var field = document.forms['petroForm'].code;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp m\u00E3 h\u00E0ng h\u00F3a");
        field.focus();
        field = null;
        return false;
    }
    field = document.forms['petroForm'].name;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp t\u00EAn h\u00E0ng h\u00F3a");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    reformatNumberMoney(document.forms['petroForm'].price);
    scriptFunction = "savePetro";
    callAjaxCheckError("addPetro.do", null, document.forms['petroForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getPetro(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('petroFormshowHelpHideDiv');
    });
    return false;
}
function loadTripFeePanel() {
    callAjax("getTripFeePanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['tripFeeSearchForm'].fromDate.value = currentTime;
        document.forms['tripFeeSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadTripFeeList(currentTime, currentTime);
    });
    return false;
}
function loadTripFeeList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('tripFeeList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("S\u1ED1 phi\u1EBFu,Xe,Ng\u00E0y,N\u1ED9i dung,Th\u00E0nh ti\u1EC1n,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,150,200,200,200,*");
    mygrid.setColTypes("link,ro,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height);//enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getTripFeeList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getTripFee(id, handle) {
    popupName = 'TH\u00D4NG TIN CHI PH\u00CD XE';
    var url = 'tripFeeForm.do';
    if (id != 0)
        url += '?tripFeeId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['tripFeeForm'].fee.focus();
        tryNumberFormatCurrentcy(document.forms['tripFeeForm'].quantity, "VND");
        tryNumberFormatCurrentcy(document.forms['tripFeeForm'].price, "VND");
        tryNumberFormatCurrentcy(document.forms['tripFeeForm'].amount, "VND");
        var myCalendar = new dhtmlXCalendarObject(["tripFeeDate"]);
        myCalendar.setSkin('dhx_web');
        var currentDate = getCurrentDate();
        document.forms['tripFeeForm'].tripFeeDate.value = currentDate;
        myCalendar.setDateFormat("%d/%m/%Y");
    });
}
function saveTripFee() {
    if (scriptFunction == "saveTripFee")
        return false;
    var field = document.forms['tripFeeForm'].createdDate;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp ng\u00E0y t\u1EA1o");
        field.focus();
        field = null;
        return false;
    }
    field = document.forms['tripFeeForm'].fee;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp n\u1ED9i dung");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    reformatNumberMoney(document.forms['tripFeeForm'].quantity);
    reformatNumberMoney(document.forms['tripFeeForm'].price);
    reformatNumberMoney(document.forms['tripFeeForm'].amount);
    scriptFunction = "saveTripFee";
    callAjaxCheckError("addTripFee.do", null, document.forms['tripFeeForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getTripFee(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('tripFeeFormshowHelpHideDiv');
    });
    return false;
}
function delTripFee() {
    callAjaxCheckError('delTripFee.do?tripFeeId=' + document.forms['tripFeeForm'].id.value, null, null, function() {
        loadTripFeePanel();
        prepareHidePopup('tripFeeFormshowHelpHideDiv');
    });
    return false;
}
function tripFeeCaculateAmount() {
    var quantity = document.forms['tripFeeForm'].quantity;
    var price = document.forms['tripFeeForm'].price;
    var amount = document.forms['tripFeeForm'].amount;

    amount.value = reformatNumberMoneyString(quantity.value) * 1 * reformatNumberMoneyString(price.value) * 1;
    tryNumberFormatCurrentcy(quantity, "VND");
    tryNumberFormatCurrentcy(price, "VND");
    tryNumberFormatCurrentcy(amount, "VND");
    quantity = null;
    price = null;
    amount = null;
    return false;
}
function loadShellImportPanel() {
    callAjax("getShellImportPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['shellImportSearchForm'].fromDate.value = currentTime;
        document.forms['shellImportSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadShellImportList(currentTime, currentTime);
    });
}
function loadShellImportList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('shellImportList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("S\u1ED1 phi\u1EBFu,Ng\u00E0y nh\u1EADp,Lo\u1EA1i v\u1ECF b\u00ECnh,S\u1ED1 l\u01B0\u1EE3ng,Gi\u00E1 nh\u1EADp,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,150,200,100,100,*");
    mygrid.setColTypes("link,ro,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height);//enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getShellImportList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getShellImport(id, handle) {
    popupName = 'TH\u00D4NG TIN PHI\u1EBEU NH\u1EACP';
    var url = 'shellImportForm.do';
    if (id != 0)
        url += '?shellImportId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        tryNumberFormatCurrentcy(document.forms['shellImportForm'].quantity, "VND");
        tryNumberFormatCurrentcy(document.forms['shellImportForm'].price, "VND");
        var myCalendar = new dhtmlXCalendarObject(["shellImportDate"]);
        myCalendar.setSkin('dhx_web');
        var currentDate = getCurrentDate();
        document.forms['shellImportForm'].shellImportDate.value = currentDate;
        myCalendar.setDateFormat("%d/%m/%Y");
    });
}
function saveShellImport() {
    if (scriptFunction == "saveShellImport")
        return false;
    reformatNumberMoney(document.forms['shellImportForm'].quantity);
    reformatNumberMoney(document.forms['shellImportForm'].price);
    scriptFunction = "saveShellImport";
    callAjaxCheckError("addShellImport.do", null, document.forms['shellImportForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getShellImport(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('shellImportFormshowHelpHideDiv');
    });
    return false;
}
function delShellImport() {
    callAjaxCheckError('delShellImport.do?shellImportId=' + document.forms['shellImportForm'].id.value, null, null, function() {
        loadShellImportPanel();
        prepareHidePopup('shellImportFormshowHelpHideDiv');
    });
    return false;
}
function loadLpgImportPanel() {
    callAjax("getLpgImportPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['lpgImportSearchForm'].fromDate.value = currentTime;
        document.forms['lpgImportSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadLpgImportList(currentTime, currentTime);
    });
    return false;
}
function loadLpgImportList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('lpgImportList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("S\u1ED1 phi\u1EBFu,Nh\u00E0 cung c\u1EA5p,S\u1ED1 l\u01B0\u1EE3ng th\u1EF1c t\u1EBF,\u0110\u01A1n gi\u00E1,Th\u00E0nh ti\u1EC1n,T\u1EF7 gi\u00E1,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,200,150,150,150,150,*");
    mygrid.setColTypes("link,ro,ro,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height);//enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getLpgImportList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getLpgImport(id, handle) {
    popupName = 'TH\u00D4NG TIN PHI\u1EBEU NH\u1EACP';
    var url = 'lpgImportForm.do';
    if (id != 0)
        url += '?lpgImportId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['lpgImportForm'].paperQuantity.focus();
        tryNumberFormatCurrentcy(document.forms['lpgImportForm'].paperQuantity, "VND");
        tryNumberFormatCurrentcy(document.forms['lpgImportForm'].actualQuantity, "VND");
        tryNumberFormatCurrentcy(document.forms['lpgImportForm'].price, "VND");
        tryNumberFormatCurrentcy(document.forms['lpgImportForm'].amount, "VND");
        tryNumberFormatCurrentcy(document.forms['lpgImportForm'].paid, "VND");
        tryNumberFormatCurrentcy(document.forms['lpgImportForm'].debt, "VND");
        tryNumberFormatCurrentcy(document.forms['lpgImportForm'].rate, "VND");
        var myCalendar = new dhtmlXCalendarObject(["lpgImportDate"]);
        myCalendar.setSkin('dhx_web');
        var currentDate = getCurrentDate();
        document.forms['lpgImportForm'].lpgImportDate.value = currentDate;
        myCalendar.setDateFormat("%d/%m/%Y");
    });
}
function saveLpgImport() {
    if (scriptFunction == "saveLpgImport")
        return false;
    reformatNumberMoney(document.forms['lpgImportForm'].paperQuantity);
    reformatNumberMoney(document.forms['lpgImportForm'].actualQuantity);
    reformatNumberMoney(document.forms['lpgImportForm'].price);
    reformatNumberMoney(document.forms['lpgImportForm'].amount);
    reformatNumberMoney(document.forms['lpgImportForm'].paid);
    reformatNumberMoney(document.forms['lpgImportForm'].debt);
    reformatNumberMoney(document.forms['lpgImportForm'].rate);
    scriptFunction = "saveLpgImport";
    callAjaxCheckError("addLpgImport.do", null, document.forms['lpgImportForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getLpgImport(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('lpgImportFormshowHelpHideDiv');
    });
    return false;
}
function delLpgImport() {
    callAjaxCheckError('delLpgImport.do?lpgImportId=' + document.forms['lpgImportForm'].id.value, null, null, function() {
        loadLpgImportPanel();
        prepareHidePopup('lpgImportFormshowHelpHideDiv');
    });
    return false;
}
function lpgImportCaculateAmount() {
    var quantity = document.forms['lpgImportForm'].actualQuantity;
    var price = document.forms['lpgImportForm'].price;
    var amount = document.forms['lpgImportForm'].amount;
    var paid = document.forms['lpgImportForm'].paid;
    var debt = document.forms['lpgImportForm'].debt;

    amount.value = reformatNumberMoneyString(quantity.value) * 1 * reformatNumberMoneyString(price.value) * 1;
    paid.value=0;
    debt.value=amount.value;
    tryNumberFormatCurrentcy(quantity, "VND");
    tryNumberFormatCurrentcy(price, "VND");
    tryNumberFormatCurrentcy(amount, "VND");
    tryNumberFormatCurrentcy(paid, "VND");
    tryNumberFormatCurrentcy(debt, "VND");
    quantity = null;
    price = null;
    amount = null;
    paid = null;
    debt = null;
    return false;
}
function lpgImportCaculateDebt() {
    var amount = document.forms['lpgImportForm'].amount;
    var paid = document.forms['lpgImportForm'].paid;
    var debt = document.forms['lpgImportForm'].debt;

    debt.value = reformatNumberMoneyString(amount.value) * 1 - reformatNumberMoneyString(paid.value) * 1;
    
    tryNumberFormatCurrentcy(amount, "VND");
    tryNumberFormatCurrentcy(paid, "VND");
    tryNumberFormatCurrentcy(debt, "VND");
    amount = null;
    paid = null;
    debt = null;
    return false;
}

