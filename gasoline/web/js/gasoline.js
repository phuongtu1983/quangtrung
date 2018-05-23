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
    else if (id == 'employeefiellist')
        loadDynamicFieldPanel("employee");
    else if (id == 'employeelist')
        loadEmployeePanel();
    else if (id == 'employeedd')
        getEmployee(0, 'loadEmployeePanel');
    else if (id == 'userlist')
        loadUserPanel();
    else if (id == 'useradd')
        getUser(0, 'loadUserPanel');
    else if (id == 'logout')
        logout();
    else if (id == 'resetpassword')
        changePasswordForm();

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
    var name = document.forms['permissionForm'].name;
    if (name.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp t\u00EAn nh\u00F3m ph\u00E2n quy\u1EC1n");
        name.focus();
        name = null;
        return false;
    }
    callAjaxCheckError("savePermission.do", null, document.forms['permissionForm'], loadPermissionPanel);
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
    mygrid.setInitWidths("150,150,*,150");
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
    mygrid.setHeader("T\u00EAn,\u0110\u01A1n v\u1ECB");
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
function changePasswordForm(){
    popupName='THAY \u0110\u1ED4I M\u1EACT KH\u1EA8U';
    callAjax('passwordForm.do',null,null,function(data){
        showPopupForm(data);
    });
}
function changePassword() {
    var password = document.forms['passwordForm'].password;
    if(password.value==''){
        alert("M\u1EADt kh\u1EA9u kh\u00F4ng \u0111\u01B0\u1EE3c r\u1ED7ng");
        password.focus();
        password=null;
        return false;
    }
    var newpassword = document.forms['passwordForm'].newpassword;
    if(newpassword.value==''){
        alert("M\u1EADt kh\u1EA9u kh\u00F4ng \u0111\u01B0\u1EE3c r\u1ED7ng");
        newpassword.focus();
        newpassword=null;
        return false;
    }
    var retypepassword = document.forms['passwordForm'].retypepassword;
    if (newpassword.value!=retypepassword.value) {
        alert("M\u1EADt kh\u1EA9u kh\u00F4ng kh\u1EDBp");
        newpassword=null;
        retypepassword=null;
        return false;
    }
    var md5 = document.forms['passwordForm'].md5pw; //document.getElementById('main:md5pw');            
    pwtomd5(password, md5);
    password=null;
    newpassword=null;
    retypepassword=null;
    callAjaxCheckError("changePassword.do",null,document.forms['passwordForm'],function(data){
        logout();
        prepareHidePopup('passwordFormshowHelpHideDiv');
    });
    return false;
}