function clearDefault(el) {
    if (el.defaultValue == el.value)
        el.value = ""
}
function getKeyCode(evt) {
    if (typeof (evt) == 'string')
        return evt.charCodeAt(0);
    return document.all ? event.keyCode : (evt && evt.which) ? evt.which : 0;
}
//function gotoPage(s) {
//    if (s != '') location.href = s;
//    return 1;
//}
//function trimLeft(s) {
//    var whitespaces = " \t\n\r";
//    for(n = 0; n < s.length; n++) if (whitespaces.indexOf(s.charAt(n)) == -1) return (n > 0) ? s.substring(n, s.length) : s;
//    return("");
//}
//function trimRight(s){
//    var whitespaces = " \t\n\r";
//    for(n = s.length - 1; n  > -1; n--) if (whitespaces.indexOf(s.charAt(n)) == -1) return (n < (s.length - 1)) ? s.substring(0, n+1) : s;
//    return("");
//}
//function trim(s) {
//    return ((s == null) ? "" : trimRight(trimLeft(s)));
//}
//function isSelected(field, strBodyHeader) {
//    for(i=0; i < field.length; i++) if (field[i].selected && (trim(field[i].value).length > 0)) return true;
//    alert("\"" + strBodyHeader + "\" is a required field. Please choose a selection.");
//    field.focus();
//    return false;
//}
//// the num should be character or string with length=1
//function isDigit(num) {
//    if (num.length > 1) return false;
//    var string = "1234567890";
//    if (string.indexOf(num) != -1) return true;
//    return false;
//}
//function _IsNumeric(passedVal)
//{
//    var validChars1 = "0123456789.()-";    
//    var c;
//    if (passedVal == "") return false;
//    for (i = 0; i < passedVal.length; i++) {
//        c = passedVal.charAt(i);
//        if (validChars1.indexOf(c) == -1) return false;
//    }
//    return true;
//}
//var emailPat=/^(.+)@(.+)$/;
//var specialChars="\\(\\)><@,;:\\\\\\\"\\.\\[\\]";
//var validChars="\[^" + specialChars + "\]";
//var quotedString="(\"[^\"]*\")";
//var ipDomainPat=/^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})$/;
//var atom=validChars + '+';
//var word="(" + atom + "|" + quotedString + ")";
//var atomPat=new RegExp("^" + atom + "$");
//var localPat=new RegExp("^" + word + "(\\." + word + ")*$");
//var domainPat=new RegExp("^" + atom + "(\\." + atom +")*$");
//var complexPat=/^(.+)<(.+)>$/;
//var commentPat=/(.*)\((.*)\)(.*)$/;
//function simpleEmailCheck (emailStr) {
//    if(emailStr == "") return false;
//    var matchArray=emailStr.match(emailPat);
//    if (matchArray==null) return false;
//    var user=matchArray[1];
//    var domain=matchArray[2];
//    for (i=0; i<user.length; i++) if (user.charCodeAt(i)>127) return false;
//    for (i=0; i<domain.length; i++) if (domain.charCodeAt(i)>127) return false;
//    if( !checkUser(user)) return false;
//    var IPArray=domain.match(ipDomainPat);
//    if (IPArray!=null) {
//        for (var i=1;i<=4;i++) if (IPArray[i]>255) return false;
//        return true;
//    }
//    var domArr=domain.split(".");
//    var len=domArr.length;
//    for (i=0;i<len;i++) if( !checkDomain(domArr[i]) ) return false;
//    return true;
//}
//function checkDomain(domain) {
//    var validDomain = true;
//    var domainArray = domain.match(commentPat);
//    if( domainArray == null ) if( domain.match(atomPat)==-1) validDomain = false;
//    else for(var i=1; i<domainArray.length; i++) if( domainArray[i] != "" && !checkDomain(domainArray[i]) ) validDomain = false;
//    return validDomain;
//}
//function checkUser(user){
//    var validUser = true;
//    var userArray = user.match(commentPat);
//    if( userArray == null ) if (user.match(localPat)==null)  validUser = false;
//    else for(var i=1; i<userArray.length; i++) if( userArray[i] != "" && !checkUser(userArray[i]) ) validUser = false;
//    return validUser;
//}
//function complexEmailCheck(emailStr){
//    if(emailStr == "") return false;
//    if(emailStr.indexOf("@")==-1) return false;
//    var matchArray=emailStr.match(complexPat);
//    if (matchArray==null) {
//        if( simpleEmailCheck(emailStr) ) return true;
//        else return false;
//    }
//    var phrase=matchArray[1];
//    var routeAddr=matchArray[2];
//    if( !simpleEmailCheck(routeAddr) ) return false;
//    else return true;
//}
//function writeEmail(name, domain, subject, body, linkname, classstyle) {
//    if (subject == "") subject = null;
//    if (body == "") body = null;
//    if (linkname == "") linkname = null;
//    if (classstyle == "") classstyle = "";
//    if (subject == null && body == null) document.write("<a href=\"mailto:" + name + "@" + domain + "\" class=\"" + classstyle + "\">");
//    else if (subject != null && body == null) document.write("<a href=\"mailto:" + name + "@" + domain + "?subject=" + subject + "\" class=\"" + classstyle + "\">");
//    else if (subject == null && body != null) document.write("<a href=\"mailto:" + name + "@" + domain + "?body=" + body + "\" class=\"" + classstyle + "\">");
//    else document.write("<a href=\"mailto:" + name + "@" + domain + "?subject=" + subject + "&body=" + body + "\" class=\"" + classstyle + "\">");
//    if (linkname == null) document.write(name + "@" + domain);
//    else document.write(linkname);
//    document.write("</a>")
//}
//function writeDomain(emailstring) {
//    var index;
//    var result;
//    if (!simpleEmailCheck(emailstring)) return emailstring;
//    index = emailstring.indexOf("@");
//    result= emailstring.substring(index+1, emailstring.length);
//    return result;
//}
//function writeEmailTitle(emailstring) {
//    if (!simpleEmailCheck(emailstring)) return emailstring;
//    var index;
//    var result;
//    index = emailstring.indexOf("@");
//    result= emailstring.substring(0, index);
//    return result;
//}
//function popUp(URL)
//{
//    day = new Date();
//    id = day.getTime();
//    eval("page" + id + " = window.open(URL, '" + id + "', 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=280,height=415');");
//}
//function popUpPost(URL)
//{
//    day = new Date();
//    id = day.getTime();
//    eval("page" + id + " = window.open(URL, '" + id + "', 'toolbar=0,scrollbars=1,location=0,statusbar=0,menubar=0,resizable=0,width=280,height=415');");
//} 
//function openWin(dir,name,w,h)
//{
//    var left = (screen.availWidth/2) - (w/2);
//    var top = (screen.availHeight/2) - (h/2);
//    colorWin = window.open(dir, name, 'scrollbars=1, toolbar=0, statusbar=0, width='+w+', height='+h+', left='+left+', top='+top);
//    colorWin.focus()
//}  
//function dodel(gb,gburl){
//    if(confirm(gb)) window.location = gburl
//}
//
//var ie45,ns6,ns4,dom;
//if (navigator.appName=="Microsoft Internet Explorer") ie45=parseInt(navigator.appVersion)>=4;
//else if (navigator.appName=="Netscape") {
//    ns6=parseInt(navigator.appVersion)>=5;
//    ns4=parseInt(navigator.appVersion)<5;
//}
//dom=ie45 || ns6;
//
//function showhide(id) {
//    el = document.all ? document.all[id] : 
//    dom ? document.getElementById(id) : 
//    document.layers[id];
//    els = dom ? el.style : el;
//    if (dom){
//        if (els.display == "none") els.display = "";
//        else els.display = "none";
//    } else if (ns4){
//        if (els.display == "show") els.display = "hide";
//        else els.display = "show";
//    }
//}
//function detectBrowser(){
//    var browserName = 'IE';
//    if (window.XMLHttpRequest) browserName = 'NON-IE';
//    else if (window.ActiveXObject) browserName = 'IE';
//    return browserName;
//}
//function isValidTime(timeStr) {
//    var timePat = /^(\d{1,2}):(\d{1,2})?$/;
//    var matchArray = timeStr.match(timePat);
//    if (matchArray == null) return false;
//    hour = matchArray[1];
//    minute = matchArray[2];
//    if (hour < 0  || hour > 23) return false;
//    if (minute<0 || minute > 59) return false;
//    return true;
//}
//function $defined(A){
//    return(A!=undefined);
//}
//function $type(B){
//    if(!$defined(B)) return false;
//    if(B.htmlElement) return"element";
//    var A=typeof B;
//    if(A=="object"&&B.nodeName){
//        switch(B.nodeType){
//            case 1:
//                return"element";
//            case 3:
//                return(/\S/).test(B.nodeValue)?"textnode":"whitespace";
//        }
//    }
//    if(A=="object"||A=="function"){
//        switch(B.constructor){
//            case Array:
//                return"array";
//            case RegExp:
//                return"regexp";
//        }
//        if(typeof B.length=="number"){
//            if(B.item) return"collection";
//            if(B.callee) return"arguments";
//        }
//    }
//    try{
//        return A;
//    }finally{
//        A=null;
//    }
//}
//var ie45,ns6,ns4,dom;
//if (navigator.appName=="Microsoft Internet Explorer")  ie45=parseInt(navigator.appVersion)>=4;
//else if (navigator.appName=="Netscape") {
//    ns6=parseInt(navigator.appVersion)>=5;
//    ns4=parseInt(navigator.appVersion)<5;
//}
//dom=ie45 || ns6;
//function showhide(id) {
//    el = document.all ? document.all[id] :
//    dom ? document.getElementById(id) :
//    document.layers[id];
//    try{
//        els = dom ? el.style : el;
//        if (dom){
//            if (els.display == "none") els.display = "";
//            else els.display = "none";
//        }
//        else if (ns4){
//            if (els.display == "show") els.display = "hide";
//            else els.display = "show";
//        }
//    }finally{
//        el=null;
//    }
//}
//function isshow(id) {
//    result = false;
//    try{
//        var type = $type(id);
//        var el;
//        if (type=='string'){
//            el = document.all ? document.all[id] :
//            dom ? document.getElementById(id) :
//            document.layers[id];        
//        }    
//        else el=id;
//        els = dom ? el.style : el;
//        if (dom) if(els.display == "") result = true;
//        else if (ns4) if(els.display == "show") result = true;
//        return result;
//    }finally{
//        result=null;
//    }
//}
//function showhide2(id, ishide) {
//    var type = $type(id);
//    var el;
//    if (type=='string'){
//        el = document.all ? document.all[id] :
//        dom ? document.getElementById(id) :
//        document.layers[id];        
//    }    
//    else el=id;
//    els = dom ? el.style : el;
//    if (dom){
//        if (ishide == false) els.display = "";
//        else els.display = "none";//khong hien thi
//    }else if (ns4){
//        if (ishide == true) els.display = "hide";//khong hien thi
//        else els.display = "show";
//    }
//}
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
//function enableButton(id,state){
//    showhide2(id,state);
//}
//function clearDefault(el){
//    if(el.defaultValue==el.value) el.value = ""
//}
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
            dialog.attr('title', 'Phuong Nam Report');
        dialog = null;
    }
    return false;
}
//function showPopupFormLoc(data){
//    var dialog=dijit.byId("popupDialog");
//    if (dialog!=null) {
//        dialog.attr('draggable',true);
//        //mai vinh loc
//        dialog.attr("style", {
//            width: "900px",
//            height: "600px",
//            overflow: "auto"
//        });
//        dialog.attr('content',data);
//        dialog.show();
//        if(popupName!=''){
//            dialog.attr('title',popupName);
//            popupName='';
//        }else dialog.attr('title','PTSC MC');
//        dialog=null;
//    }
//    return false;
//}
//function showPopupFormById(id, data, parentDlg, myFunc){
//    if (parentDlg!=null) parentDlg.hide();
//    var dialog=dijit.byId(id);    
//    if (dialog==null) return false;
//    if (parentDlg!=null) {
//        var handle = dojo.connect(dialog,"hide",function(e) {        
//            dojo.disconnect(handle);
//            handle = null;                  
//            if (myFunc!=null) myFunc();
//            else parentDlg.show();               
//        });
//    }    
//    dialog.attr('draggable',false);
//    dialog.attr('content',data);
//    dialog.show();
//    dialog=null;
//    return false;
//}
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
//var tabHandle;
//function displayTabs(parent,childs,func){
//    var tag;
//    dojo.query("."+childs).forEach(function(n){
//        tag=dijit.byId(n.id);
//        if(tag!=null) tag.destroyRecursive();
//    });
//    dojo.query("."+childs).forEach(function(n){
//        new dijit.layout.ContentPane({
//            title: dojo.attr(n,"title")
//        }, n);
//    });
//    tag=dijit.byId(parent);
//    if(tag!=null){
//        if(tabHandle!=null) dojo.unsubscribe(tabHandle);
//        tag.destroyRecursive();
//    }
//    var style=dojo.attr(parent, "style");
//    var height;
//    if(typeof(style)=='object') height='height:'+style.height;
//    else height=style;
//    var tc = new dijit.layout.TabContainer({
//        style: height
//    },parent);
//    style=null;
//    tag=null;
//    tabHandle=dojo.subscribe(parent+'-selectChild',func);
//    tc.startup();
//}
//function hideTab(parent, childs, child){
//    parent=dijit.byId(parent);
//    var tag;
//    dojo.query("."+childs).forEach(function(n){
//        if(n.id==child){
//            tag=dijit.byId(n.id);
//            if(tag!=null){
//                parent.closeChild(tag);
//                tag.destroyRecursive();
//                tag=null;
//            }
//        }
//    });
//}
//function createDateTextBox(params,id){
//    var box=dijit.byId(id);
//    if(box!=null) box.destroyRecursive();
//    new dijit.form.DateTextBox(params,dojo.byId(id));
//}
//function numbersonly(myfield, e, dec) {
//    var key;
//    var keychar;
//    if (window.event) key = window.event.keyCode;
//    else if (e) key = e.which;
//    else return true;
//    keychar = String.fromCharCode(key);
//    // control keys
//    if ((key==null) || (key==0) || (key==8) || (key==9) || (key==13) || (key==27) ) return true;
//    // numbers
//    else if ((("0123456789").indexOf(keychar) > -1)) return true;
//    // decimal point jump
//    else if (dec && (keychar == ".")) {
//        myfield.form.elements[dec].focus();
//        return false;
//    } else return false;
//}
//function expandDiv(image,divId){
//    var div = document.getElementById(divId);
//    var source = image.src;
//    var index = source.indexOf('icon_minus.gif');
//    if(index != -1){
//        image.src = source.substring(0,index) + 'icon_plus.gif';
//        showhide2(divId,true);//hide
//    }else{
//        index = source.indexOf('icon_plus.gif');
//        if(index != -1){
//            image.src = source.substring(0,index) + 'icon_minus.gif';
//            top.showhide2(divId,false);//show
//        }
//    }
//    div=null;
//    image=null;
//}
//
///**
//type 
//id: parent id
//divData: 
//*/
//function loadAttachFileSystem(ftype, pid, divData) {
//    var url = 'loadAttachFileSystem.do?';
//    url += 'ftype=' + ftype;
//    url += '&pid=' + pid;        
//    if (divData==null) divData = 'divAttachFileSystem';
//    url += '&fdiv=' + divData
//    callAjax(url,divData,null,null);
//    url = null;
//    divData = null;
//    return false;
//}
//function showUploadDialog(ftype, pid, divData) {                
//    var dialog = dijit.byId('dialogUploadFile');
//    var handle = dojo.connect(dialog,"hide",function(e) {
//        loadAttachFileSystem(ftype, pid, divData);        
//        dojo.disconnect(handle);
//        handle = null;
//    });
//    dialog.show();
//    dialog=null;               
//    return false;
//}
//function removeAttachmentFile(fid, ftype, pid, divData) {
//    var url = 'removeFile.do?';
//    url += 'ftype=' + ftype;
//    url += '&fid=' + fid;    
//    callAjax(url,null,null,function(data) {
//        loadAttachFileSystem(ftype,pid,divData);
//    });
//    url = null;
//    return false;
//}
//function getAttachmentFile(fid,ftype,pid) {
//    var url = 'getFile.do?';
//    url += 'ftype=' + ftype;
//    url += '&fid=' + fid; 
//    callAjax(url,null,null,null);    
//    return false;
//}
//function hideUploadDialog() {                
//    var dialog = dijit.byId('dialogUploadFile');    
//    if (dialog!=null) {
//        dialog.show();
//        dialog=null;               
//    }
//    return false;
//}
//function formatNumberMoney(myfield, fs, fv, e, dec){
//    if(numbersonly(myfield, e, dec)){
//        reformatNumberMoney(myfield,fs,fv);
//        var s="";
//        for(i=0;i<myfield.value.length;i++){
//            if(myfield.value.charAt(i)!='0') s=s+ myfield.value.charAt(i);
//            else if(s.length>0) s=s+ myfield.value.charAt(i);
//        }
//        if (s=="") s='0';
//        myfield.value=s;
//        var ind=myfield.value.lastIndexOf('.');
//        var value='';
//        if(ind>-1){
//            value=myfield.value.substring(ind+1);
//            if(parseInt(value)==0) value='';
//            myfield.value=myfield.value.substring(0,ind);
//        }else ind=myfield.value.length-1;
//        var str=myfield.value.substring(ind);
//        n=myfield.value;
//        var i=n.length-3;
//        while(i>0){
//            n=n.substring(0,i)+","+n.substring(i);
//            i-=3;
//        }
//        myfield.value=n;
//        if(value!='') myfield.value+='.'+value;        
//    }
//}
//function formatNumberMoneyString(numstr, e, dec){
//    reformatNumberMoneyString(numstr);
//    var s="";
//    for(i=0;i<numstr.length;i++){
//        if(numstr.charAt(i)!='0') s=s+numstr.charAt(i);
//        else if(s.length>0) s=s+numstr.charAt(i);
//    }
//    if (s=="") s='0';
//    numstr=s;
//    var ind=numstr.lastIndexOf('.');
//    var value='';
//    if(ind>-1){
//        value=numstr.substring(ind+1);
//        if(parseInt(value)==0) value='';
//        numstr=numstr.substring(0,ind);
//    }else ind=numstr.length-1;
//    var str=numstr.substring(ind);
//    n=numstr;
//    var i=n.length-3;
//    while(i>0){
//        n=n.substring(0,i)+","+n.substring(i);
//        i-=3;
//    }
//    numstr=n;
//    if(value!='') numstr+='.'+value;
//    return numstr;
//}
//function reformatNumberMoney(o,fs,fv){
//    if(fs!=null){
//        if(fs==0) o.value=(parseFloat(o.value)).toFixed(fv);
//        else o.value=(parseFloat(o.value)).toPrecision(fv);
//    } 
//    var ind=o.value.lastIndexOf('.');
//    var value='';
//    if(ind>-1){
//        value=o.value.substring(ind+1);
//        if(parseInt(value)==0) value='';
//        o.value=o.value.substring(0,ind);
//    }else ind=o.value.length-1;
//    var str=o.value.substring(ind);
//    ind=o.value.indexOf(',');
//    while (ind>-1){
//        o.value=o.value.replace(',','');
//        ind=o.value.indexOf(',');
//    }
//    if(value!='') o.value+='.'+value;
//    return o.value;
//}
//function reformatNumberMoneyString(numstr){
//    var ind=numstr.lastIndexOf('.');
//    var value='';
//    if(ind>-1){
//        value=numstr.substring(ind+1);
//        if(parseInt(value)==0) value='';
//        numstr=numstr.substring(0,ind);
//    }else ind=numstr.length-1;
//    var str=numstr.substring(ind);
//    ind=numstr.indexOf(',');
//    while (ind>-1){
//        numstr=numstr.replace(',','');
//        ind=numstr.indexOf(',');
//    }
//    if(value!='') numstr+='.'+value;
//    return numstr;
//}
//function checkMaxValue(myfield, value){
//    reformatNumberMoney(myfield);
//    if(myfield.value*1>value){
//        alert('Gi\u00E1 tr\u1ECB kh\u00F4ng th\u1EC3 l\u1EDBn h\u01A1n '+value);
//        myfield.value=value;
//    }
//}
//function formatMoney(o){
//    var ind=o.indexOf(',');
//    while (ind>-1){
//        o=o.replace(',','');
//        ind=o.indexOf(',');
//    }
//    return eval(o);
//}
//
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
//function isGreaterThan(field, dValue) {  
//    var nValue = parseInt(trim(field.value));  
//    if (nValue>dValue) {
//        nValue = null;
//        field=null;
//        return true;
//    }
//    nValue = null;
//    field=null;
//    return false;
//}
//
//function displayTip(spanid){                                
//    var object = document.getElementById(spanid);
//    var innerText = object.innerHTML;
//    if(innerText != ''){
//        var index = innerText.indexOf('[content]');                    
//        var header = innerText.substring(9,index);
//        var content = innerText.substring(index + 10);
//        Tip(content
//            ,TITLE,header
//            ,TITLEALIGN,'left'
//            ,CLICKCLOSE,true
//            ,STICKY,true
//            ,FONTCOLOR,'#000000' 
//            ,BORDERCOLOR,'#CEBA94'
//            ,BGCOLOR,'#FFFBEF'
//            //,TITLEBGCOLOR,'#FFFBEF' 
//            ,TITLEFONTCOLOR,'#000000' 
//            ,SHADOW,false                        
//            ,CENTERMOUSE,false
//            ,OFFSETX,0
//            ,PADDING,10
//            ,DURATION,-1000
//            ,WIDTH,340);
//    }
//}
//function formatPositiveNumberMoney(myfield, fs, fv, e, dec){
//    if(numbersonly(myfield, e, dec)){
//        reformatNumberMoney(myfield,fs,fv);
//        var s="";
//        for(i=0;i<myfield.value.length;i++){
//            if(myfield.value.charAt(i)!='0' && myfield.value.charAt(i)!='-') s=s+ myfield.value.charAt(i);
//            else if(s.length>0) s=s+ myfield.value.charAt(i);
//        }
//        if (s=="") s='0';
//        myfield.value=s;
//        var ind=myfield.value.lastIndexOf('.');
//        var value='';
//        if(ind>-1){
//            value=myfield.value.substring(ind+1);
//            if(parseInt(value)==0) value='';
//            myfield.value=myfield.value.substring(0,ind);
//        }else ind=myfield.value.length-1;
//        var str=myfield.value.substring(ind);
//        n=myfield.value;
//        var i=n.length-3;
//        while(i>0){
//            n=n.substring(0,i)+","+n.substring(i);
//            i-=3;
//        }
//        myfield.value=n;
//        if(value!='') myfield.value+='.'+value;        
//    }
//}
//function readonlyNumber(e){
//    //Hàm dùng để ngăn người dùng nhập các ký tự khác ký tự số vào TextBox
//    var keypressed = null;
//    if (window.event) keypressed = window.event.keyCode; //IE
//    else keypressed = e.which; //NON-IE, Standard
//    if (keypressed < 48 || keypressed > 57){ 
//        // //CharCode của 0 là 48 (Theo bảng mã ASCII)
//        //CharCode của 9 là 57 (Theo bảng mã ASCII)
//        if (keypressed != 8 && keypressed != 127 && keypressed != 0) return false;//Phím Delete và Phím Back
//    }
//}
//function readonlyFloat(e){
//    //Hàm dùng để ngăn người dùng nhập các ký tự khác ký tự số vào TextBox
//    var keypressed = null;
//    if (window.event) keypressed = window.event.keyCode; //IE
//    else keypressed = e.which; //NON-IE, Standard
//    if (keypressed < 48 || keypressed > 57){
//        // //CharCode của 0 là 48 (Theo bảng mã ASCII)
//        //CharCode của 9 là 57 (Theo bảng mã ASCII)
//        if (keypressed != 8 && keypressed != 127 && keypressed != 0 && keypressed != 46) return false;//Phím Delete và Phím Back va phim .
//        
//    }else return true;
//}
//function readonly(e){
//    return false;
//}
//function xGetElementById(e) {
//    if(typeof(e)!='string') return e;
//    if(document.getElementById) e=document.getElementById(e);
//    else if(document.all) e=document.all[e];
//    else e=null;
//    return e;
//}
//function removeChildrenFromNode(e) {
//    if(!e) return false;
//    if(typeof(e)=='string') e = xGetElementById(e);
//    while (e.hasChildNodes()) e.removeChild(e.firstChild);
//    e=null;
//    return true;
//}
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
//function focusSearchText(input){
//    if(input!=null){
//        if(input.focus) input.focus();
//        input=null;
//    }
//}
//function focusDhtmlxSearchText(input){
//    if(input!=null){
//        if(input.parentNode){
//            input=input.parentNode;
//            var childs=input.childNodes;
//            if(childs && childs.length>0){
//                var len=childs.length;
//                for(var i=0;i<len;i++){
//                    var className=childs[i].className;
//                    if (className && className.indexOf('dhx_combo_input')!=-1){
//                        if(childs[i].focus) childs[i].focus();
//                        if(childs[i].select) childs[i].select();
//                        break;
//                    }
//                }
//            }
//            childs=null;
//        }
//        input=null;
//    }
//}
//document.onkeyup=function disableCtrlKeyCombinationKeyUp(e){
//    var key;
//    var isCtrl;
//    if(window.event){
//        key = window.event.keyCode;//IE
//        if(window.event.ctrlKey) isCtrl = true;
//        else isCtrl = false;
//    }else{
//        key = e.which;//firefox
//        if(e.ctrlKey) isCtrl = true;
//        else isCtrl = false;
//    }
//    if(!isCtrl){
//        if(key==112){// F1
//            shiftFunction('shiftSFunctionHideDiv');//luu
//            return false;
//        }else if(key==113){//F2
//            shiftFunction('shiftAIFunctionHideDiv');//goi mon
//            return false;
//        }else if(key==115){//F4
//            shiftFunction('shiftMFunctionHideDiv');//tinh tien
//            return false;
//        }else if(key==117){//F6
//            shiftFunction('shiftPFunctionHideDiv');//in
//            return false;
//        }else if(key==118){//F7
//            return false;
//        }else if(key==119){//F8
//            showHotKeys();
//            return false;
//        }else if(key==27){
//            shiftFunction('shiftEscFunctionHideDiv');//ESC
//            return false;
//        }
//    }
//}
//function showHotKeys(){
//    var div=document.getElementById('showHelpHideDiv');
//    if(div!=null){
//        alert(div.innerHTML);
//        div=null;
//    }
//}
//function shiftFunction(element){
//    var div=document.getElementById(element);
//    if(div!=null){
//        if(div.innerHTML!="") eval(div.innerHTML);
//        div=null;
//    }
//}
//function reformatPercent(o,fs,fv){
//    if(fs!=null){
//        if(fs==0) o.value=(parseFloat(o.value)).toFixed(fv);
//        else o.value=(parseFloat(o.value)).toPrecision(fv);
//    } 
//    var ind=o.value.lastIndexOf('.');
//    var value='';
//    if(ind>-1){
//        value=o.value.substring(ind+1);
//        if(parseInt(value)==0) value='';
//        o.value=o.value.substring(0,ind);
//    }else ind=o.value.length-1;
//    var str=o.value.substring(ind);
//    ind=o.value.indexOf(',');
//    while (ind>-1){
//        o.value=o.value.replace(',','');
//        ind=o.value.indexOf(',');
//    }
//    if(value!='') o.value+='.'+value;
//    o.value=o.value.replace(/%/g,'');
//    return o.value;
//}
//function reformatPercentString(numstr){
//    var ind=numstr.lastIndexOf('.');
//    var value='';
//    if(ind>-1){
//        value=numstr.substring(ind+1);
//        if(parseInt(value)==0) value='';
//        numstr=numstr.substring(0,ind);
//    }else ind=numstr.length-1;
//    var str=numstr.substring(ind);
//    ind=numstr.indexOf(',');
//    while (ind>-1){
//        numstr=numstr.replace(',','');
//        ind=numstr.indexOf(',');
//    }
//    if(value!='') numstr+='.'+value;
//    numstr=numstr.replace(/%/g,'');
//    return numstr;
//}
//function navigateBetweenRows(formName,objName,objId,e){
//    var key;
//    if(window.event) key = window.event.keyCode;//IE
//    else key = e.which;//firefox
//    if(key!=38 && key!=40) return;
//    var obj = eval("document.forms['"+formName+"']."+objName);
//    var nextObj;
//    var id="0";
//    if(obj.length!=null){
//        for(var i=0;i<obj.length;i++){
//            id=obj[i].id;
//            if(id==objId){
//                if(key==38 && i>0) nextObj=obj[i-1]; //up arrow
//                if(key==40 && i<obj.length-1) nextObj=obj[i+1]; //down arrow
//            }
//        }
//    }
//    if(nextObj!=null){
//        nextObj.focus();
//        nextObj=null;
//    }
//    obj=null;
//}
//function tryNumberFormatOnKeyUp(obj,e){
//    var keypressed = null;
//    if (window.event) keypressed = window.event.keyCode; //IE
//    else keypressed = e.which; //NON-IE, Standard
//    if(keypressed >=48 && keypressed <=57){
//        tryNumberFormat(obj);
//    }else if (keypressed < 48 || keypressed > 57){ 
//        // //CharCode của 0 là 48 (Theo bảng mã ASCII)
//        //CharCode của 9 là 57 (Theo bảng mã ASCII)
//        if (keypressed == 8 || keypressed == 46 || keypressed == 190){
//            tryNumberFormat(obj);
//        }else return false;//Phím Delete và Phím Back
//    }
//}
//function tryFloatFormatOnKeyUp(obj,e){
//    var keypressed = null;
//    if (window.event) keypressed = window.event.keyCode; //IE
//    else keypressed = e.which; //NON-IE, Standard
//    if(keypressed >=48 && keypressed <=57){
//        tryNumberFormat(obj);
//    }else if (keypressed < 48 || keypressed > 57){ 
//        // //CharCode của 0 là 48 (Theo bảng mã ASCII)
//        //CharCode của 9 là 57 (Theo bảng mã ASCII)
//        if (keypressed == 8 || keypressed == 46){
//            tryNumberFormat(obj);
//        }else return false;//Phím Delete và Phím Back va phim .
//    }
//}
//function try2FloatFormatOnKeyUp(obj,e){
//    var keypressed = null;
//    if (window.event) keypressed = window.event.keyCode; //IE
//    else keypressed = e.which; //NON-IE, Standard
//    if(keypressed >=48 && keypressed <=57){
//        if(obj.value=="0.0") return;
//        tryNumberFormatCurrentcy(obj,"USD");
//    }else if (keypressed < 48 || keypressed > 57){ 
//        // //CharCode của 0 là 48 (Theo bảng mã ASCII)
//        //CharCode của 9 là 57 (Theo bảng mã ASCII)
//        if (keypressed == 8 || keypressed == 46){
//            if(obj.value=="0.0") return;
//            tryNumberFormatCurrentcy(obj,"USD");
//        }else return false;//Phím Delete và Phím Back va phim .
//    }
//}