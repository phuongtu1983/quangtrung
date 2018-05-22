function tryNumberFormat(obj)
{
    //obj.value = new NumberFormat(obj.value).toFormatted();
    var num = new NumberFormat();
    num.setInputDecimal('.');
    num.setNumber(obj.value); // obj.value is '1100.23'
    var temp=obj.value.split(".");
    if(temp.length>1){
        temp=obj.value.split(".")[1]*1;
        if(temp>10) num.setPlaces('2', false);
        else if(temp==0)num.setPlaces('0', false);
        else num.setPlaces('1', false);
    }else num.setPlaces('0', false);
    num.setCurrencyValue('$');
    num.setCurrency(false);
    num.setCurrencyPosition(num.LEFT_OUTSIDE);
    num.setNegativeFormat(num.LEFT_DASH);
    num.setNegativeRed(false);
    num.setSeparators(true, ',', ',');
    obj.value = num.toFormatted();
}
function tryNumberFormatCurrentcy(obj,currency)
{
    //obj.value = new NumberFormat(obj.value).toFormatted();
    var num = new NumberFormat();
    num.setInputDecimal('.');
    num.setNumber(obj.value); // obj.value is '1100.23'
    if(currency==null) currency="";
    if(currency.indexOf('VN')>-1){
        num.setPlaces('0', false);
    }else{
        if(obj.value.split(".")[1]/1 > 0){
            num.setPlaces('2', false);
        }else{
            num.setPlaces('0', false);
        }
    }
    num.setCurrencyValue('$');
    num.setCurrency(false);
    num.setCurrencyPosition(num.LEFT_OUTSIDE);
    num.setNegativeFormat(num.LEFT_DASH);
    num.setNegativeRed(false);
    num.setSeparators(true, ',', ',');
    var t = num.toFormatted();
    if(t.indexOf('.00')>-1) {
        num.setPlaces('0', false);
        t = num.toFormatted();
    }
    if(t.indexOf('.')>-1) {
        var ind=t.lastIndexOf('0');
        while(ind==t.length-1){
            t=t.substring(0,ind);
            ind=t.lastIndexOf('.');
        }
    }
    obj.value = t;
}
function NumberFormat(num, inputDecimal)
{
    this.VERSION = 'Number Format v1.5.4';
    this.COMMA = ',';
    this.PERIOD = '.';
    this.DASH = '-'; 
    this.LEFT_PAREN = '('; 
    this.RIGHT_PAREN = ')'; 
    this.LEFT_OUTSIDE = 0; 
    this.LEFT_INSIDE = 1;  
    this.RIGHT_INSIDE = 2;  
    this.RIGHT_OUTSIDE = 3;  
    this.LEFT_DASH = 0; 
    this.RIGHT_DASH = 1; 
    this.PARENTHESIS = 2; 
    this.NO_ROUNDING = -1 
    this.num;
    this.numOriginal;
    this.hasSeparators = false;  
    this.separatorValue;  
    this.inputDecimalValue; 
    this.decimalValue;  
    this.negativeFormat; 
    this.negativeRed; 
    this.hasCurrency;  
    this.currencyPosition;  
    this.currencyValue;  
    this.places;
    this.roundToPlaces; 
    this.truncate; 
    this.setNumber = setNumberNF;
    this.toUnformatted = toUnformattedNF;
    this.setInputDecimal = setInputDecimalNF; 
    this.setSeparators = setSeparatorsNF; 
    this.setCommas = setCommasNF;
    this.setNegativeFormat = setNegativeFormatNF; 
    this.setNegativeRed = setNegativeRedNF; 
    this.setCurrency = setCurrencyNF;
    this.setCurrencyPrefix = setCurrencyPrefixNF;
    this.setCurrencyValue = setCurrencyValueNF; 
    this.setCurrencyPosition = setCurrencyPositionNF; 
    this.setPlaces = setPlacesNF;
    this.toFormatted = toFormattedNF;
    this.toPercentage = toPercentageNF;
    this.getOriginal = getOriginalNF;
    this.moveDecimalRight = moveDecimalRightNF;
    this.moveDecimalLeft = moveDecimalLeftNF;
    this.getRounded = getRoundedNF;
    this.preserveZeros = preserveZerosNF;
    this.justNumber = justNumberNF;
    this.expandExponential = expandExponentialNF;
    this.getZeros = getZerosNF;
    this.moveDecimalAsString = moveDecimalAsStringNF;
    this.moveDecimal = moveDecimalNF;
    this.addSeparators = addSeparatorsNF;
    if (inputDecimal == null) {
        this.setNumber(num, this.PERIOD);
    } else {
        this.setNumber(num, inputDecimal); 
    }
    this.setCommas(true);
    this.setNegativeFormat(this.LEFT_DASH); 
    this.setNegativeRed(false); 
    this.setCurrency(false); 
    this.setCurrencyPrefix('$');
    this.setPlaces(2);
}
function setInputDecimalNF(val)
{
    this.inputDecimalValue = val;
}
function setNumberNF(num, inputDecimal)
{
    if (inputDecimal != null) {
        this.setInputDecimal(inputDecimal); 
    }
    this.numOriginal = num;
    this.num = this.justNumber(num);
}
function toUnformattedNF()
{
    return (this.num);
}
function getOriginalNF()
{
    return (this.numOriginal);
}
function setNegativeFormatNF(format)
{
    this.negativeFormat = format;
}
function setNegativeRedNF(isRed)
{
    this.negativeRed = isRed;
}
function setSeparatorsNF(isC, separator, decimal)
{
    this.hasSeparators = isC;
    if (separator == null) separator = this.COMMA;
    if (decimal == null) decimal = this.PERIOD;
    if (separator == decimal) {
        this.decimalValue = (decimal == this.PERIOD) ? this.COMMA : this.PERIOD;
    } else {
        this.decimalValue = decimal;
    }
    this.separatorValue = separator;
}
function setCommasNF(isC)
{
    this.setSeparators(isC, this.COMMA, this.PERIOD);
}
function setCurrencyNF(isC)
{
    this.hasCurrency = isC;
}
function setCurrencyValueNF(val)
{
    this.currencyValue = val;
}
function setCurrencyPrefixNF(cp)
{
    this.setCurrencyValue(cp);
    this.setCurrencyPosition(this.LEFT_OUTSIDE);
}
function setCurrencyPositionNF(cp)
{
    this.currencyPosition = cp
}
function setPlacesNF(p, tr)
{
    this.roundToPlaces = !(p == this.NO_ROUNDING); 
    this.truncate = (tr != null && tr); 
    this.places = (p < 0) ? 0 : p; 
}
function addSeparatorsNF(nStr, inD, outD, sep)
{
    nStr += '';
    var dpos = nStr.indexOf(inD);
    var nStrEnd = '';
    if (dpos != -1) {
        nStrEnd = outD + nStr.substring(dpos + 1, nStr.length);
        nStr = nStr.substring(0, dpos);
    }
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(nStr)) {
        nStr = nStr.replace(rgx, '$1' + sep + '$2');
    }
    return nStr + nStrEnd;
}
function toFormattedNF()
{	
    var pos;
    var nNum = this.num; 
    var nStr;            
    var splitString = new Array(2);   
    if (this.roundToPlaces) {
        nNum = this.getRounded(nNum);
        nStr = this.preserveZeros(Math.abs(nNum)); 
    } else {
        nStr = this.expandExponential(Math.abs(nNum)); 
    }
    if (this.hasSeparators) {
        nStr = this.addSeparators(nStr, this.PERIOD, this.decimalValue, this.separatorValue);
    } else {
        nStr = nStr.replace(new RegExp('\\' + this.PERIOD), this.decimalValue); 
    }
    var c0 = '';
    var n0 = '';
    var c1 = '';
    var n1 = '';
    var n2 = '';
    var c2 = '';
    var n3 = '';
    var c3 = '';
    var negSignL = (this.negativeFormat == this.PARENTHESIS) ? this.LEFT_PAREN : this.DASH;
    var negSignR = (this.negativeFormat == this.PARENTHESIS) ? this.RIGHT_PAREN : this.DASH;
    if (this.currencyPosition == this.LEFT_OUTSIDE) {
        if (nNum < 0) {
            if (this.negativeFormat == this.LEFT_DASH || this.negativeFormat == this.PARENTHESIS) n1 = negSignL;
            if (this.negativeFormat == this.RIGHT_DASH || this.negativeFormat == this.PARENTHESIS) n2 = negSignR;
        }
        if (this.hasCurrency) c0 = this.currencyValue;
    } else if (this.currencyPosition == this.LEFT_INSIDE) {
        if (nNum < 0) {
            if (this.negativeFormat == this.LEFT_DASH || this.negativeFormat == this.PARENTHESIS) n0 = negSignL;
            if (this.negativeFormat == this.RIGHT_DASH || this.negativeFormat == this.PARENTHESIS) n3 = negSignR;
        }
        if (this.hasCurrency) c1 = this.currencyValue;
    }
    else if (this.currencyPosition == this.RIGHT_INSIDE) {
        if (nNum < 0) {
            if (this.negativeFormat == this.LEFT_DASH || this.negativeFormat == this.PARENTHESIS) n0 = negSignL;
            if (this.negativeFormat == this.RIGHT_DASH || this.negativeFormat == this.PARENTHESIS) n3 = negSignR;
        }
        if (this.hasCurrency) c2 = this.currencyValue;
    }
    else if (this.currencyPosition == this.RIGHT_OUTSIDE) {
        if (nNum < 0) {
            if (this.negativeFormat == this.LEFT_DASH || this.negativeFormat == this.PARENTHESIS) n1 = negSignL;
            if (this.negativeFormat == this.RIGHT_DASH || this.negativeFormat == this.PARENTHESIS) n2 = negSignR;
        }
        if (this.hasCurrency) c3 = this.currencyValue;
    }
    nStr = c0 + n0 + c1 + n1 + nStr + n2 + c2 + n3 + c3;
    if (this.negativeRed && nNum < 0) {
        nStr = '<font color="red">' + nStr + '</font>';
    }
    return (nStr);
}
function toPercentageNF()
{
    nNum = this.num * 100;
    nNum = this.getRounded(nNum);
    return nNum + '%';
}
function getZerosNF(places)
{
    var extraZ = '';
    var i;
    for (i=0; i<places; i++) {
        extraZ += '0';
    }
    return extraZ;
}
function expandExponentialNF(origVal)
{
    if (isNaN(origVal)) return origVal;
    var newVal = parseFloat(origVal) + ''; 
    var eLoc = newVal.toLowerCase().indexOf('e');
    if (eLoc != -1) {
        var plusLoc = newVal.toLowerCase().indexOf('+');
        var negLoc = newVal.toLowerCase().indexOf('-', eLoc); 
        var justNumber = newVal.substring(0, eLoc);
        if (negLoc != -1) {
            var places = newVal.substring(negLoc + 1, newVal.length);
            justNumber = this.moveDecimalAsString(justNumber, true, parseInt(places));
        } else {
            if (plusLoc == -1) plusLoc = eLoc;
            var places = newVal.substring(plusLoc + 1, newVal.length);
            justNumber = this.moveDecimalAsString(justNumber, false, parseInt(places));
        }
        newVal = justNumber;
    }
    return newVal;
} 
function moveDecimalRightNF(val, places)
{
    var newVal = '';
    if (places == null) {
        newVal = this.moveDecimal(val, false);
    } else {
        newVal = this.moveDecimal(val, false, places);
    }
    return newVal;
}
function moveDecimalLeftNF(val, places)
{
    var newVal = '';
    if (places == null) {
        newVal = this.moveDecimal(val, true);
    } else {
        newVal = this.moveDecimal(val, true, places);
    }
    return newVal;
}
function moveDecimalAsStringNF(val, left, places)
{
    var spaces = (arguments.length < 3) ? this.places : places;
    if (spaces <= 0) return val; 
    var newVal = val + '';
    var extraZ = this.getZeros(spaces);
    var re1 = new RegExp('([0-9.]+)');
    if (left) {
        newVal = newVal.replace(re1, extraZ + '$1');
        var re2 = new RegExp('(-?)([0-9]*)([0-9]{' + spaces + '})(\\.?)');		
        newVal = newVal.replace(re2, '$1$2.$3');
    } else {
        var reArray = re1.exec(newVal); 
        if (reArray != null) {
            newVal = newVal.substring(0,reArray.index) + reArray[1] + extraZ + newVal.substring(reArray.index + reArray[0].length); 
        }
        var re2 = new RegExp('(-?)([0-9]*)(\\.?)([0-9]{' + spaces + '})');
        newVal = newVal.replace(re2, '$1$2$4.');
    }
    newVal = newVal.replace(/\.$/, ''); 
    return newVal;
}
function moveDecimalNF(val, left, places)
{
    var newVal = '';
    if (places == null) {
        newVal = this.moveDecimalAsString(val, left);
    } else {
        newVal = this.moveDecimalAsString(val, left, places);
    }
    return parseFloat(newVal);
}
function getRoundedNF(val)
{
    val = this.moveDecimalRight(val);
    if (this.truncate) {
        val = val >= 0 ? Math.floor(val) : Math.ceil(val); 
    } else {
        val = Math.round(val);
    }
    val = this.moveDecimalLeft(val);
    return val;
}
function preserveZerosNF(val)
{
    var i;
    val = this.expandExponential(val);
    if (this.places <= 0) return val; 
    var decimalPos = val.indexOf('.');
    if (decimalPos == -1) {
        val += '.';
        for (i=0; i<this.places; i++) {
            val += '0';
        }
    } else {
        var actualDecimals = (val.length - 1) - decimalPos;
        var difference = this.places - actualDecimals;
        for (i=0; i<difference; i++) {
            val += '0';
        }
    }
    return val;
}
function justNumberNF(val)
{
    newVal = val + '';
    var isPercentage = false;
    if (newVal.indexOf('%') != -1) {
        newVal = newVal.replace(/\%/g, '');
        isPercentage = true; 
    }
    var re = new RegExp('[^\\' + this.inputDecimalValue + '\\d\\-\\+\\(\\)eE]', 'g');	
    newVal = newVal.replace(re, '');
    var tempRe = new RegExp('[' + this.inputDecimalValue + ']', 'g');
    var treArray = tempRe.exec(newVal); 
    if (treArray != null) {
        var tempRight = newVal.substring(treArray.index + treArray[0].length); 
        newVal = newVal.substring(0,treArray.index) + this.PERIOD + tempRight.replace(tempRe, ''); 
    }
    if (newVal.charAt(newVal.length - 1) == this.DASH ) {
        newVal = newVal.substring(0, newVal.length - 1);
        newVal = '-' + newVal;
    }
    else if (newVal.charAt(0) == this.LEFT_PAREN
        && newVal.charAt(newVal.length - 1) == this.RIGHT_PAREN) {
        newVal = newVal.substring(1, newVal.length - 1);
        newVal = '-' + newVal;
    }
    newVal = parseFloat(newVal);
    if (!isFinite(newVal)) {
        newVal = 0;
    }
    if (isPercentage) {
        newVal = this.moveDecimalLeft(newVal, 2);
    }
    return newVal;
}

UTF8 = {
    encode: function(s){
        for(var c, i = -1, l = (s = s.split("")).length, o = String.fromCharCode; ++i < l;
            s[i] = (c = s[i].charCodeAt(0)) >= 127 ? o(0xc0 | (c >>> 6)) + o(0x80 | (c & 0x3f)) : s[i]
        );
        return s.join("");
    },
    decode: function(s){
        for(var a, b, i = -1, l = (s = s.split("")).length, o = String.fromCharCode, c = "charCodeAt"; ++i < l;
            ((a = s[i][c](0)) & 0x80) &&
            (s[i] = (a & 0xfc) == 0xc0 && ((b = s[i + 1][c](0)) & 0xc0) == 0x80 ?
                o(((a & 0x03) << 6) + (b & 0x3f)) : o(128), s[++i] = "")
        );
        return s.join("");
    }
};
function textMoney(money, currency) {
    var s = "";
    if (money < 0) {
        money = -money;
    }
    try {
        var s1 = "";
        var l = money;
        var m2 = 0;
        if (!currency.indexOf("VN")==0) {
            m2 = parseInt((money * 100) % 100);
        } else {
            var t = parseInt((money * 100) % 100);
            if (t > 50) {
                l += 1;
            }
        }
        var m = l+"";
        for (var i = 0; i < m.length; i++) {
            switch (m.charAt(i)) {
                case '0':
                    s1 = s1 + "kh\u00F4ng";
                    break;
                case '1':
                    s1 = s1 + "m\u1ED9t";
                    break;
                case '2':
                    s1 = s1 + "hai";
                    break;
                case '3':
                    s1 = s1 + "ba";
                    break;
                case '4':
                    s1 = s1 + "b\u1ED1n";
                    break;
                case '5':
                    s1 = s1 + "n\u0103m";
                    break;
                case '6':
                    s1 = s1 + "s\u00E1u";
                    break;
                case '7':
                    s1 = s1 + "b\u1EA3y";
                    break;
                case '8':
                    s1 = s1 + "t\u00E1m";
                    break;
                case '9':
                    s1 = s1 + "ch\u00EDn";
                    break;
            }
            switch (m.length - i) {
                case 2:
                    s1 = s1 + " m\u01B0\u01A1i ";
                    break;
                case 5:
                    s1 = s1 + " m\u01B0\u01A1i ";
                    break;
                case 8:
                    s1 = s1 + " m\u01B0\u01A1i ";
                    break;
                case 11:
                    s1 = s1 + " m\u01B0\u01A1i ";
                    break;

                case 3:
                    s1 = s1 + " tr\u0103m ";
                    break;
                case 6:
                    s1 = s1 + " tr\u0103m ";
                    break;
                case 9:
                    s1 = s1 + " tr\u0103m ";
                    break;
                case 12:
                    s1 = s1 + " tr\u0103m ";
                    break;

                case 4:
                    s1 = s1 + " ng\u00E0n ";
                    break;
                case 7:
                    s1 = s1 + " tri\u1EC7u, ";
                    break;
                case 10:
                    s1 = s1 + " t\u1EF7, ";
                    break;
            }
        }
        s = s1.trim();
        s = s.replace(/ kh\u00F4ng m\u01B0\u01A1i kh\u00F4ng/g, "");
        s = s.replace(/ kh\u00F4ng tr\u0103m/g, "");
        s = s.replace(/kh\u00F4ng ng\u00E0n/g, "ng\u00E0n");
        s = s.replace(/ kh\u00F4ngkh\u00F4ngkh\u00F4ng/g, "");
        s = s.replace(/, tri\u1EC7u/g, "");
        s = s.replace(/, ng\u00E0n/g, "");
        s = s.replace(/m\u01B0\u01A1i m\u1ED9t/g, "m\u01B0\u01A1i m\u1ED1t");
        s = s.replace(/kh\u00F4ng m\u01B0\u01A1i/g, "l\u1EBB");
        s = s.replace(/m\u1ED9t m\u01B0\u01A1i/g, "m\u01B0\u1EDDi");
        s = s.replace(/m\u01B0\u1EDDi m\u1ED1t/g, "m\u01B0\u1EDDi m\u1ED9t");
        s = s.replace(/m\u01B0\u1EDDi n\u0103m/g, "m\u01B0\u1EDDi l\u0103m");
        s = s.replace(/m\u01B0\u01A1i n\u0103m/g, "m\u01B0\u01A1i l\u0103m");
        s = s.replace(/ kh\u00F4ngkh\u00F4ng/g, "");
        s = s.replace(/Kh\u00F4ngkh\u00F4ng/g, "Kh\u00F4ng");
        s = s.replace(/kh\u00F4ng tri\u1EC7u/g, "tri\u1EC7u");
        s = s.replace(/kh\u00F4ng t\u1EF7/g, "t\u1EF7");
        s = s.replace(/kh\u00F4ng/g, "m\u01B0\u01A1i");
        if (s==" m\u01B0\u01A1i") {
            s = "Kh\u00F4ng";
        }
        if (s=="m\u01B0\u01A1i") {
            s = "Kh\u00F4ng";
        }
        s = s.replace(/m\u01B0\u1EDDi m\u01B0\u01A1i/g, "m\u01B0\u1EDDi");
        s = s.replace(/m\u01B0\u01A1i m\u01B0\u01A1i/g, "m\u01B0\u01A1i");
        s = s.replace(/l\u1EBB m\u1ED1t/g, "l\u1EBB m\u1ED9t");
        if (currency.indexOf("VN")==0) {
            s = s.charAt(0).toUpperCase() + s.substring(1) + " \u0111\u1ED3ng";
        }
        else if (currency=="USD") {
            s = s.charAt(0).toUpperCase() + s.substring(1) + " \u0111\u00F4 la M\u1EF9";
        }
        else if (currency=="AUD") {
            s = s.charAt(0).toUpperCase() + s.substring(1) + " \u0111\u00F4 la \u00DAc";
        }
        else if (currency=="CAD") {
            s = s.charAt(0).toUpperCase() + s.substring(1) + " \u0111\u00F4 la Canada";
        }
        else if (currency=="CHF") {
            s = s.charAt(0).toUpperCase() + s.substring(1) + " SWISS FRANCE";
        }
        else if (currency=="DKK") {
            s = s.charAt(0).toUpperCase() + s.substring(1) + " DANISH KRONE";
        }
        else if (currency=="EUR") {
            s = s.charAt(0).toUpperCase() + s.substring(1) + " \u0111\u1ED3ng Euro";
        }
        else if (currency=="GBP") {
            s = s.charAt(0).toUpperCase() + s.substring(1) + " BRITISH POUND";
        }
        else if (currency=="HKD") {
            s = s.charAt(0).toUpperCase() + s.substring(1) + " \u0111\u00F4 la H\u1ED3ng K\u00F4ng";
        }
        else if (currency=="INR") {
            s = s.charAt(0).toUpperCase() + s.substring(1) + " INDIAN RUPEE";
        }
        else if (currency=="JPY") {
            s = s.charAt(0).toUpperCase() + s.substring(1) + " Y\u00EAn Nh\u1EADt";
        }
        else if (currency=="KRW") {
            s = s.charAt(0).toUpperCase() + s.substring(1) + " SOUTH KOREAN WON	";
        }
        else if (currency=="KWD") {
            s = s.charAt(0).toUpperCase() + s.substring(1) + " KUWAITI DINAR";
        }
        else if (currency=="MYR") {
            s = s.charAt(0).toUpperCase() + s.substring(1) + " MALAYSIAN RINGGIT";
        }
        else if (currency=="NOK") {
            s = s.charAt(0).toUpperCase() + s.substring(1) + " NORWEGIAN KRONER";
        }
        else if (currency=="RUB") {
            s = s.charAt(0).toUpperCase() + s.substring(1) + " RUSSIAN RUBLE";
        }
        else if (currency=="SEK") {
            s = s.charAt(0).toUpperCase() + s.substring(1) + " SWEDISH KRONA";
        }
        else if (currency=="SGD") {
            s = s.charAt(0).toUpperCase() + s.substring(1) + " \u0111\u00F4 la Singapore";
        }
        else if (currency=="THB") {
            s = s.charAt(0).toUpperCase() + s.substring(1) + " THAI BAHT";
        }
        if (m2 > 0) {
//            s = s + " và " + textMoneyUSD(m2, currency);
        }
        if (s=="m\u01B0\u01A1i") {
            s = "kh\u00F4ng";
        }
    } catch (ex) {
        s = "";
    }
    return s;
}
function tryPercentFormat(obj)
{
    //obj.value = new NumberFormat(obj.value).toFormatted();
    var num = new NumberFormat();
    num.setInputDecimal('.');
    num.setNumber(obj.value); // obj.value is '1100.23'
    if(obj.value.split(".")[1]/1 > 0){
        num.setPlaces('2', false);
    }else{
        num.setPlaces('0', false);
    }
    num.setCurrencyValue('$');
    num.setCurrency(false);
    num.setCurrencyPosition(num.LEFT_OUTSIDE);
    num.setNegativeFormat(num.LEFT_DASH);
    num.setNegativeRed(false);
    num.setSeparators(true, ',', ',');
    obj.value = num.toFormatted()+"%";
}
function tryPercentFormat(obj,currency)
{
    obj.value=obj.value.replace(/%/g,'');
    //obj.value = new NumberFormat(obj.value).toFormatted();
    var num = new NumberFormat();
    num.setInputDecimal('.');
    num.setNumber(obj.value); // obj.value is '1100.23'
    if(currency==null) currency="";
    if(currency.indexOf('VN')>-1){
        num.setPlaces('0', false);
    }else{
        if(obj.value.split(".")[1]/1 > 0){
            num.setPlaces('2', false);
        }else{
            num.setPlaces('0', false);
        }
    }
    num.setCurrencyValue('$');
    num.setCurrency(false);
    num.setCurrencyPosition(num.LEFT_OUTSIDE);
    num.setNegativeFormat(num.LEFT_DASH);
    num.setNegativeRed(false);
    num.setSeparators(true, ',', ',');
    var t = num.toFormatted();
    if(t.indexOf('.00')>-1) {
        num.setPlaces('0', false);
        t = num.toFormatted();
    }
    obj.value = t;
    obj.value +="%";
}