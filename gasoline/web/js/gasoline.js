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
    if (id == 'userlist')
        loadUserPanel();
    else if (id == 'useradd')
        getUser(0, 'loadUserPanel');
    else if (id == 'logout')
        logout();
    else if (id == 'parameter')
        loadParameterPanel();
    else if (id == 'resetpassword')
        changePasswordForm();
    else if (id == 'permissionlist')
        loadPermissionPanel();
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
    mygrid.setHeader(",T\u00EAn nh\u00F3m quy\u1EC1n,Ghi ch\u00FA,Nh\u00E2n vi\u00EAn");
    mygrid.attachHeader("&nbsp;,#text_filter,&nbsp;,#text_filter");
    mygrid.setInitWidths("50,150,150,*");
    mygrid.setColTypes("ch,link,ro,ro");
    mygrid.setColSorting("str,str,str,str");
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
function setUserSelectedForm(form,text,value){
    if(value==null){
        if(text!="") value="-1";
        else value="0";
    }
    if(document.forms[form].userSelectedTextHidden!=null) document.forms[form].userSelectedTextHidden.value=text;
    document.forms[form].userSelectedHidden.value=value;
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
    callAjaxCheckError('delPermission.do?ids=' + document.forms['permissionForm'].perId.value, null, null, loadPermissionPanel);
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