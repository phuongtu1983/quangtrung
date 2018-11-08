function clearDefault(el) {
    if (el.defaultValue == el.value)
        el.value = ""
}
function getKeyCode(evt) {
    if (typeof (evt) == 'string')
        return evt.charCodeAt(0);
    return document.all ? event.keyCode : (evt && evt.which) ? evt.which : 0;
}
function trimLeft(s) {
    var whitespaces = " \t\n\r";
    for (n = 0; n < s.length; n++)
        if (whitespaces.indexOf(s.charAt(n)) == -1)
            return (n > 0) ? s.substring(n, s.length) : s;
    return("");
}
function trimRight(s) {
    var whitespaces = " \t\n\r";
    for (n = s.length - 1; n > - 1; n--)
        if (whitespaces.indexOf(s.charAt(n)) == -1)
            return (n < (s.length - 1)) ? s.substring(0, n + 1) : s;
    return("");
}
function trim(s) {
    return ((s == null) ? "" : trimRight(trimLeft(s)));
}
function clearPopupForm(data) {
    var dialog = dijit.byId("popupDialog");
    if (dialog != null) {
        dialog.attr('content', data);
        dialog = null;
    }
    return false;
}
function showPopupForm(data) {
    var dialog = dijit.byId("popupDialog");
    if (dialog != null) {
        dialog.attr('draggable', true);
        dialog.attr('content', data);
        dialog.show();
        if (popupName != '') {
            dialog.attr('title', popupName);
            popupName = '';
        } else
            dialog.attr('title', 'Quang Trung Cooporation');
        dialog = null;
    }
    return false;
}
function changePopupFormHeader(header){
    var dialog = dijit.byId("popupDialog");
    if (dialog != null) {
        dialog.attr('title', header);
        dialog = null;
    }
    return false;
}
function prepareHidePopup(divName) {
    hidePopupForm();
    var div = document.getElementById(divName + "Content");
    if (div != null) {
        div.innerHTML = "";
        div = null;
    }
    return false;
}
function hidePopupForm(id) {
    if (id == null)
        id = 'popupDialog';
    var dialog = dijit.byId(id);
    if (dialog != null) {
        dialog.hide();
        dialog = null;
    }
    return false;
}
function reformatNumberMoney(o, fs, fv) {
    if (fs != null) {
        if (fs == 0)
            o.value = (parseFloat(o.value)).toFixed(fv);
        else
            o.value = (parseFloat(o.value)).toPrecision(fv);
    }
    var ind = o.value.lastIndexOf('.');
    var value = '';
    if (ind > -1) {
        value = o.value.substring(ind + 1);
        if (parseInt(value) == 0)
            value = '';
        o.value = o.value.substring(0, ind);
    } else
        ind = o.value.length - 1;
    var str = o.value.substring(ind);
    ind = o.value.indexOf(',');
    while (ind > -1) {
        o.value = o.value.replace(',', '');
        ind = o.value.indexOf(',');
    }
    if (value != '')
        o.value += '.' + value;
    return o.value;
}
function reformatNumberMoneyString(numstr) {
    var ind = numstr.lastIndexOf('.');
    var value = '';
    if (ind > -1) {
        value = numstr.substring(ind + 1);
        if (parseInt(value) == 0)
            value = '';
        numstr = numstr.substring(0, ind);
    } else
        ind = numstr.length - 1;
    var str = numstr.substring(ind);
    ind = numstr.indexOf(',');
    while (ind > -1) {
        numstr = numstr.replace(',', '');
        ind = numstr.indexOf(',');
    }
    if (value != '')
        numstr += '.' + value;
    return numstr;
}
function isBlank(field, strAlert) {
    strTrimmed = trim(field.value);
    if (strTrimmed.length > 0) {
        field = null;
        strTrimmed = null;
        return false;
    }
    field.focus();
    field = null;
    strTrimmed = null;
    return true;
}
function readonlyFloat(e) {
    //Hàm dùng để ngăn người dùng nhập các ký tự khác ký tự số vào TextBox
    var keypressed = null;
    if (window.event)
        keypressed = window.event.keyCode; //IE
    else
        keypressed = e.which; //NON-IE, Standard
    if (keypressed < 48 || keypressed > 57) {
        // //CharCode của 0 là 48 (Theo bảng mã ASCII)
        //CharCode của 9 là 57 (Theo bảng mã ASCII)
        if (keypressed != 8 && keypressed != 127 && keypressed != 0 && keypressed != 46)
            return false;//Phím Delete và Phím Back va phim .

    } else
        return true;
}
function readonly(e) {
    return false;
}
function deepRemoveChildrenFromNode(e) {
    if (!e)
        return false;
    if (typeof (e) == 'string')
        e = xGetElementById(e);
    while (e.hasChildNodes()) {
        var child = e.firstChild;
        if (child.hasChildNodes())
            deepRemoveChildrenFromNode(child);
        if (child.type == 'checkbox')
            child.checked = false;
        child.name = '';
        child.id = '';
        child.value = '';
        e.removeChild(child);
        child = null;
    }
    e = null;
    return true;
}
function try2FloatFormatOnKeyUp(obj, e, stillInput) {
    var keypressed = null;
    if (window.event)
        keypressed = window.event.keyCode; //IE
    else
        keypressed = e.which; //NON-IE, Standard
    if ((keypressed >= 48 && keypressed <= 57) || (keypressed >= 96 && keypressed <= 105)) {
        if (obj.value == "0.0")
            return;
        tryNumberFormatCurrentcy(obj, "USD", stillInput);
    } else if (keypressed < 48 || keypressed > 57) {
        // //CharCode của 0 là 48 (Theo bảng mã ASCII)
        // //CharCode của 0 là 96 (Theo bảng mã ASCII)
        //CharCode của 9 là 57 (Theo bảng mã ASCII)
        //CharCode của 9 là 105 (Theo bảng mã ASCII)
        if (keypressed == 8 || keypressed == 46) {
            if (obj.value == "0.0")
                return;
            tryNumberFormatCurrentcy(obj, "USD", stillInput);
        } else
            return false;//Phím Delete và Phím Back va phim .
    }
}
function getCurrentDate() {
    var currentDate = new Date();
    var dd = currentDate.getDate();
    var mm = currentDate.getMonth() + 1;
    var yyyy = currentDate.getFullYear();
    if (dd < 10)
        dd = '0' + dd;
    if (mm < 10)
        mm = '0' + mm;
    currentDate = dd + '/' + mm + '/' + yyyy;
    return currentDate;
}
function getDateString(date) {
    var dd = date.getDate();
    var mm = date.getMonth() + 1;
    var yyyy = date.getFullYear();
    if (dd < 10)
        dd = '0' + dd;
    if (mm < 10)
        mm = '0' + mm;
    date = dd + '/' + mm + '/' + yyyy;
    return date;
}
function getCurrentMonth() {
    var currentDate = new Date();
    var mm = currentDate.getMonth() + 1;
    var yyyy = currentDate.getFullYear();
    if (mm < 10)
        mm = '0' + mm;
    currentDate = mm + '/' + yyyy;
    return currentDate;
}
document.onkeyup=function disableCtrlKeyCombinationKeyUp(e){
    var key;
    var isCtrl;
    if(window.event){
        key = window.event.keyCode;//IE
        if(window.event.ctrlKey) isCtrl = true;
        else isCtrl = false;
    }else{
        key = e.which;//firefox
        if(e.ctrlKey) isCtrl = true;
        else isCtrl = false;
    }
    if(!isCtrl){
        if(key==112){// F1
            shiftFunction('shiftSFunctionHideDiv');//luu
            return false;
        }else if(key==118){//F7
            return false;
        }else if(key==119){//F8
            showHotKeys();
            return false;
        }else if(key==27){
            shiftFunction('shiftEscFunctionHideDiv');//ESC
            return false;
        }
    }
}
function showHotKeys(){
    var div=document.getElementById('showHelpHideDiv');
    if(div!=null){
        alert(div.innerHTML);
        div=null;
    }
}
function shiftFunction(element){
    var div=document.getElementById(element);
    if(div!=null){
        if(div.innerHTML!="") eval(div.innerHTML);
        div=null;
    }
}