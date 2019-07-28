var contentHeight;
var selectedCombo = '';
var isManuallySeleted = 0;
var scriptFunction = "";
var mainGrid;
var savedDate = "";
var savedCustomer = 0;
var savedVehicle = 0;
var savedDate2 = '';
var savedFromDate = '';
var savedToDate = '';
var savedDayoff = 0;
var savedQuantityDayoff = 0;
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
    else if (id == 'openingstock')
        loadOpeningStockPanel();
    else if (id == 'organizationlist')
        loadOrganizationPanel();
    else if (id == 'organizationadd')
        getOrganization(0);
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
    else if (id == 'vendoroillist')
        loadVendorOilPanel();
    else if (id == 'vendoroiladd')
        getVendorOil(0);
    else if (id == 'addgasreturnvendor')
        getGasReturnVendor();
    else if (id == 'vendororganizationlist')
        loadVendorOrganizationPanel();
    else if (id == 'vendororganizationadd')
        getVendorOrganization(0, 'loadVendorOrganizationPanel');
    else if (id == 'vendorcustomerlist')
        loadVendorCustomerPanel();
    else if (id == 'vendorcustomeradd')
        getVendorCustomer(0, 'loadVendorCustomerPanel');
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
    else if (id == 'customerdocumentlist')
        loadCustomerDocumentPanel();
    else if (id == 'discountlist')
        loadDiscountPanel();
    else if (id == 'discountadd')
        getDiscount(0, 'loadDiscountPanel');
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
    else if (id == 'goodlist')
        loadGoodPanel();
    else if (id == 'goodadd')
        getGood(0, 'loadGoodPanel');
    else if (id == 'tripfeelist')
        loadTripFeePanel();
    else if (id == 'tripfeeadd')
        getTripFee(0, 'loadTripFeePanel');
    else if (id == 'tripoillist')
        loadTripOilPanel();
    else if (id == 'tripoiladd')
        getTripOil(0, 'loadTripOilPanel');
    else if (id == 'shellimportlist')
        loadShellImportPanel();
    else if (id == 'shellimportadd')
        getShellImport(0, 'loadShellImportPanel');
    else if (id == 'lpgimportlist')
        loadLpgImportPanel();
    else if (id == 'lpgimportadd')
        getLpgImport(0, 'loadLpgImportPanel');
    else if (id == 'lpgsalelist')
        loadLpgSalePanel();
    else if (id == 'lpgsaleadd')
        getLpgSale(0, 'loadLpgSalePanel', 0);
    else if (id == 'fractionlist')
        loadFractionPanel();
    else if (id == 'fractionadd')
        getFraction(0);
    else if (id == 'gaspricelist')
        loadGasPricePanel();
    else if (id == 'gaspriceadd')
        getGasPrice(0, 'loadGasPricePanel');
    else if (id == 'gasimportlist')
        loadGasImportPanel();
    else if (id == 'gasimportadd')
        getGasImport(0);
    else if (id == 'accessoryimportlist')
        loadAccessoryImportPanel();
    else if (id == 'accessoryimportadd')
        getAccessoryImport(0);
    else if (id == 'promotionmaterialimportlist')
        loadPromotionMaterialImportPanel();
    else if (id == 'promotionmaterialimportadd')
        getPromotionMaterialImport(0);
    else if (id == 'petroimportlist')
        loadPetroImportPanel();
    else if (id == 'petroimportadd')
        getPetroImport(0);
    else if (id == 'gaswholesalelist')
        loadGasWholesalePanel();
    else if (id == 'gaswholesaleadd')
        getGasWholesale(0);
    else if (id == 'gaswholesalefeelist')
        loadGasWholeSaleFeePanel();
    else if (id == 'gasretaillist')
        loadGasRetailPanel();
    else if (id == 'gasretailadd')
        getGasRetail(0);
    else if (id == 'saleaccessorylist')
        loadSaleAccessoryPanel();
    else if (id == 'saleaccessoryadd')
        getSaleAccessory(0);
    else if (id == 'salepetrolist')
        loadSalePetroPanel();
    else if (id == 'salepetroadd')
        getSalePetro(0);
    else if (id == 'saleshelllist')
        loadSaleShellPanel();
    else if (id == 'saleshelladd')
        getSaleShell(0);
    else if (id == 'oldshelllist')
        loadOldShellPanel();
    else if (id == 'oldshelladd')
        getOldShell(0);
    else if (id == 'shellreturnlist')
        loadShellReturnPanel();
    else if (id == 'shellreturnadd')
        getShellReturn(0);
    else if (id == 'gasreturnlist')
        loadGasReturnPanel();
    else if (id == 'gasreturnadd')
        getGasReturn(0);
    else if (id == 'shellreturnsupplierlist')
        loadShellReturnSupplierPanel();
    else if (id == 'shellreturnsupplieradd')
        getShellReturnSupplier(0);
    else if (id == 'vehicleoutlist')
        loadVehicleOutPanel();
    else if (id == 'vehicleoutadd')
        getVehicleOut(0);
    else if (id == 'vehicleinlist')
        loadVehicleInPanel();
    else if (id == 'vehicleinadd')
        getVehicleIn(0);
    else if (id == 'exportwholesalelist')
        loadExportWholesalePanel();
    else if (id == 'exportwholesaleadd')
        getExportWholesale(0);
    else if (id == 'debtvendorlist')
        loadDebtVendorPanel();
    else if (id == 'debtvendoradd')
        getDebtVendor(0, 'loadDebtVendorPanel');
    else if (id == 'debtretaillist')
        loadDebtRetailPanel();
    else if (id == 'debtretailadd')
        getDebtRetail(0, 'loadDebtRetailPanel');
    else if (id == 'debtwholesalelist')
        loadDebtWholesalePanel();
    else if (id == 'debtwholesaleadd')
        getDebtWholesale(0, 'loadDebtWholesalePanel');
    else if (id == 'incomelist')
        loadIncomePanel();
    else if (id == 'incomeadd')
        getIncome(0, 'loadIncomePanel');
    else if (id == 'expenselist')
        loadExpensePanel();
    else if (id == 'expenseadd')
        getExpense(0, 'loadExpensePanel');
    else if (id == 'employeeoffincreaselist')
        loadEmployeeOffIncreasePanel();
    else if (id == 'employeeoffincreaseadd')
        getEmployeeOffIncrease(0, 'loadEmployeeOffIncreasePanel');
    else if (id == 'employeeoffmoneylist')
        loadEmployeeOffMoneyPanel();
    else if (id == 'employeeoffmoneyadd')
        getEmployeeOffMoney(0, 'loadEmployeeOffMoneyPanel');
    else if (id == 'fixedassetgrouplist')
        loadFixedAssetGroupPanel();
    else if (id == 'fixedassetgroupadd')
        getFixedAssetGroup(0, 'loadFixedAssetGroupPanel');
    else if (id == 'fixedassetlist')
        loadFixedAssetPanel();
    else if (id == 'fixedassetadd')
        getFixedAsset(0, 'loadFixedAssetPanel');
    else if (id == 'fixedassetdepreciationlist')
        loadFixedAssetDepreciationPanel();
    else if (id == 'fixedassetdepreciationadd')
        getFixedAssetDepreciation(0);
    else if (id == 'contractlist')
        loadContractPanel();
    else if (id == 'contractadd')
        getContract(0);
    else if (id == 'invoicelist')
        loadInvoicePanel();
    else if (id == 'invoiceadd')
        getInvoice(0);
    else if (id == 'reportlpgimport' || id == 'reportlpgstock' || id == 'reportlpgstocksum' || id == 'reportsum' || id == 'reportsalecustomer' || id == 'reportsale'
            || id == 'reportcashbook' || id == 'reportpetroimport' || id == 'reportpetrosale' || id == 'reportpetrostock' || id == 'reportgascommission'
            || id == 'reportgasemployeecommission' || id == 'reportvendordebt' || id == 'reporttransportfee' || id == 'reportvehiclesale' || id == 'reportlpgsale'
            || id == 'reportshell' || id == 'reportoilimport' || id == 'reportoilstocksum' || id == 'reportoilsale' || id == 'reportoilvendordebt')
        showReportPanel(id);
    else if (id == 'reportemployeesalary')
        showMonthlyReportPanel(id);
    else if (id == 'reportemployeeoff')
        showYearlyReportPanel(id);
    else if (id == 'shieldimportlist')
        loadShieldImportPanel();
    else if (id == 'shieldimportadd')
        getShieldImport(0, 'loadShieldImportPanel');
    else if (id == 'shielddecreaselist')
        loadShieldDecreasePanel();
    else if (id == 'shielddecreaseadd')
        getShieldDecrease(0, 'loadShieldDecreasePanel');
    else if (id == 'reportcompare')
        showCompareReportPanel();
    else if (id == 'reportlpgstocksumorganization')
        showLpgStockSumOrganizationReportPanel();
    else if (id == 'reportpetrostockstore')
        showPetroStockStoreReportPanel();
    else if (id == 'goodimportlist')
        loadGoodImportPanel();
    else if (id == 'goodimportadd')
        getGoodImport(0);
    else if (id == 'salegoodlist')
        loadSaleGoodPanel();
    else if (id == 'salegoodadd')
        getSaleGood(0);
    else if (id == 'reportcomparegood')
        showCompareGoodReportPanel();
    else if (id == 'lovolist')
        loadLoVoPanel();
    else if (id == 'lovoadd')
        getLoVo(0);
    else if (id == 'reportvehiclefee')
        showVehicleFeeReportPanel();
    else if (id == 'reportcomparevendor')
        showCompareVendorReportPanel();
    else if (id == 'reportcomparelpg')
        showCompareLPGReportPanel();
    else if (id == 'reportcomparelpgvendorcustomer')
        showCompareLPGVendorCustomerReportPanel();
    else if (id == 'transportservicelist')
        loadTransportServicePanel();
    else if (id == 'transportserviceadd')
        getTransportService(0, 'loadTransportServicePanel');
    else if (id == 'reporttransportservice')
        showTransportServiceReportPanel();
    else if (id == 'reportcomparegas')
        showCompareGasReportPanel();
    else if (id == 'debtadjustmentlist')
        loadDebtAdjustmentPanel();
    else if (id == 'saleinnerlist')
        loadSaleInnerPanel();
    else if (id == 'saleinneradd')
        getSaleInner(0);
    else if (id == 'dayofflist')
        loadDayoffPanel();
    else if (id == 'dayoffadd')
        getDayoff(0, 'loadDayoffPanel');
    else if (id == 'otherbonuslist')
        loadOtherBonusPanel();
    else if (id == 'otherbonusadd')
        getOtherBonus(0, 'loadOtherBonusPanel');
    else if (id == 'paneltylist')
        loadPaneltyPanel();
    else if (id == 'paneltyadd')
        getPanelty(0, 'loadPaneltyPanel');
    else if (id == 'employeeotherbonuslist')
        loadEmployeeOtherBonusPanel();
    else if (id == 'employeeotherbonusadd')
        getEmployeeOtherBonus(0, 'loadEmployeeOtherBonusPanel');
    else if (id == 'employeepaneltylist')
        loadEmployeePaneltyPanel();
    else if (id == 'employeepaneltyadd')
        getEmployeePanelty(0, 'loadEmployeePaneltyPanel');
    else if (id == 'reportemployeesalary')
        showEmployeeSalaryReportPanel();
    else if (id == 'reportemployeeworking')
        printDirectlyReport('reportemployeeworking');
    else if (id == 'employeeroutefeelist')
        loadEmployeeRouteFeePanel();
    else if (id == 'employeeroutefeeadd')
        getEmployeeRouteFee(0, 'loadEmployeeRouteFeePanel', 0);
    else if (id == 'reportemployeevehiclesalary')
        showEmployeeVehicleSalaryReportPanel();
    else if (id == 'borrowlist')
        loadBorrowPanel();
    else if (id == 'borrowadd')
        getBorrow(0);
    else if (id == 'unitratelist')
        loadUnitRatePanel();
    else if (id == 'unitrateadd')
        getUnitRate(0, 'loadUnitRatePanel');
    else if (id == 'agencylist')
        loadAgencyPanel();
    else if (id == 'agencyadd')
        getAgency(0);
    else if (id == 'oilgrouplist')
        loadOilGroupPanel();
    else if (id == 'oilgroupadd')
        getOilGroup(0, 'loadOilGroupPanel');
    else if (id == 'employeeoilcommissionlist')
        loadEmployeeOilCommissionPanel();
    else if (id == 'employeeoilcommissionadd')
        getEmployeeOilCommission(0, 'loadEmployeeOilCommissionPanel');
    else if (id == 'oillist')
        loadOilPanel();
    else if (id == 'oiladd')
        getOil(0, 'loadOilPanel');
    else if (id == 'oilimportlist')
        loadOilImportPanel();
    else if (id == 'oilimportadd')
        getOilImport(0);
    else if (id == 'oilexportlist')
        loadOilExportPanel();
    else if (id == 'saleoillist')
        loadSaleOilPanel();
    else if (id == 'saleoiladd')
        getSaleOil(0);
    else if (id == 'reportoilstock')
        showOilStockStoreReportPanel();
    else if (id == 'reportoilcommissionagency')
        showCompareAgencyCommissionReportPanel();
    else if (id == 'reportoilcommissioncustomer')
        showCompareCustomerCommissionReportPanel();
    else if (id == 'reportoilcompare')
        showOilCompareReportPanel();
    else if (id == 'reportoilvendorstock')
        showOilVendorStockReportPanel();
    else if (id == 'saleoilreturnlist')
        loadSaleOilReturnPanel();
    else if (id == 'saleoilreturnstoreadd')
        getSaleOilReturnStore(0);
    else if (id == 'reportoilcustomerdebt')
        showOilCustomerDebtReportPanel();
}
function clearContent() {
    var contentDiv = document.getElementById("contentDiv");
    if (contentDiv != null) {
        contentDiv.innerHTML = "";
        contentDiv = null;
    }
    clearPopupForm('');
}
function formPaidChanged(formName) {
    var total = document.forms[formName].total;
    var paid = document.forms[formName].paid;
    var debt = document.forms[formName].debt;
    if (total == null || paid == null || debt == null)
        return false;
    debt.value = reformatNumberMoneyString(total.value) * 1 - reformatNumberMoneyString(paid.value) * 1;
    tryNumberFormatCurrentcy(total, "VND");
    tryNumberFormatCurrentcy(paid, "VND");
    tryNumberFormatCurrentcy(debt, "VND");
    total = null;
    paid = null;
    debt = null;
    return false;
}
function formPaidDiscountChanged(formName) {
    var total = document.forms[formName].total;
    var paid = document.forms[formName].paid;
    var debt = document.forms[formName].debt;
    var discount = document.forms[formName].discount;
    var totalPay = document.forms[formName].totalPay;
    if (total == null || paid == null || debt == null || discount == null || totalPay == null)
        return false;
    totalPay.value = reformatNumberMoneyString(total.value) * 1 - reformatNumberMoneyString(discount.value) * 1;
    debt.value = reformatNumberMoneyString(totalPay.value) * 1 - reformatNumberMoneyString(paid.value) * 1;
    tryNumberFormatCurrentcy(total, "VND");
    tryNumberFormatCurrentcy(paid, "VND");
    tryNumberFormatCurrentcy(debt, "VND");
    tryNumberFormatCurrentcy(discount, "VND");
    tryNumberFormatCurrentcy(totalPay, "VND");
    total = null;
    paid = null;
    debt = null;
    discount = null;
    totalPay = null;
    return false;
}
function formatFormDetail(formName) {
    var quantity = document.forms[formName].quantity;
    var price = document.forms[formName].price;
    var amount = document.forms[formName].amount;
    if (quantity != null) {
        if (quantity.length != null) {
            for (var i = 0; i < quantity.length; i++) {
                tryNumberFormatCurrentcy(quantity[i], "VND");
            }
        } else {
            tryNumberFormatCurrentcy(quantity, "VND");
        }
    }
    if (price != null) {
        if (price.length != null) {
            for (var i = 0; i < price.length; i++) {
                tryNumberFormatCurrentcy(price[i], "VND");
            }
        } else {
            tryNumberFormatCurrentcy(price, "VND");
        }
    }
    if (amount != null) {
        if (amount.length != null) {
            for (var i = 0; i < amount.length; i++) {
                tryNumberFormatCurrentcy(amount[i], "VND");
            }
        } else {
            tryNumberFormatCurrentcy(amount, "VND");
        }
    }
    quantity = null;
    price = null;
    amount = null;
}
function reformatFormDetail(formName) {
    var quantity = document.forms[formName].quantity;
    var price = document.forms[formName].price;
    var amount = document.forms[formName].amount;
    if (quantity != null) {
        if (quantity.length != null) {
            for (var i = 0; i < quantity.length; i++) {
                reformatNumberMoney(quantity[i]);
                if (price != null)
                    reformatNumberMoney(price[i]);
                if (amount != null)
                    reformatNumberMoney(amount[i]);
            }
        } else {
            reformatNumberMoney(quantity);
            if (price != null)
                reformatNumberMoney(price);
            if (amount != null)
                reformatNumberMoney(amount);
        }
    }
    quantity = null;
    price = null;
    amount = null;
}
function caculateFormListDetail(goodId, formName) {
    var quantity = document.getElementById("detquantity" + goodId);
    var price = document.getElementById("detprice" + goodId);
    var detTotal = document.getElementById("detamount" + goodId);
    if (quantity == null || price == null || detTotal == null)
        return false;
    detTotal.value = reformatNumberMoneyString(quantity.value) * reformatNumberMoneyString(price.value);
    tryNumberFormatCurrentcy(quantity, "VND");
    tryNumberFormatCurrentcy(price, "VND");
    tryNumberFormatCurrentcy(detTotal, "VND");
    quantity = null;
    price = null;
    detTotal = null;
    if (formName != null)
        caculateListTotal(formName);
    return false;
}
function caculateListTotal(formName) {
    var feeAmount = document.forms[formName].feeAmount;
    var feeKind = document.forms[formName].feeKind;
    var quantity = document.forms[formName].quantity;
    var price = document.forms[formName].price;
    var shellWeight = document.forms[formName].shellWeight;
    var amount = document.forms[formName].amount;
    var sum = 0;
    var minPrice = -1;
    var minPriceWeight = -1;
    var tempPrice = 0;
    var tempPriceWeight = 0;
    var hasGasReturn = false;
    if (document.forms[formName].gasReturnAmount != null) {
        hasGasReturn = true;
    }
    if (quantity != null) {
        if (quantity.length != null) {
            for (i = 0; i < quantity.length; i++) {
                sum += reformatNumberMoneyString(amount[i].value) * 1;
                if (hasGasReturn) {
                    tempPrice = reformatNumberMoneyString(price[i].value) * 1;
                    tempPriceWeight = reformatNumberMoneyString(shellWeight[i].value) * 1;
                    if (minPrice == -1) {
                        minPrice = tempPrice;
                        minPriceWeight = tempPriceWeight;
                    }
                    else if (minPrice > tempPrice) {
                        minPrice = tempPrice;
                        minPriceWeight = tempPriceWeight;
                    }
                }
                tryNumberFormatCurrentcy(quantity[i], "VND");
                tryNumberFormatCurrentcy(price[i], "VND");
                tryNumberFormatCurrentcy(amount[i], "VND");
            }
        } else {
            sum += reformatNumberMoneyString(amount.value) * 1;
            if (hasGasReturn) {
                tempPrice = reformatNumberMoneyString(price.value) * 1;
                tempPriceWeight = reformatNumberMoneyString(shellWeight.value) * 1;
                if (minPrice == -1) {
                    minPrice = tempPrice;
                    minPriceWeight = tempPriceWeight;
                }
                else if (minPrice > tempPrice) {
                    minPrice = tempPrice;
                    minPriceWeight = tempPriceWeight;
                }
            }
            tryNumberFormatCurrentcy(quantity, "VND");
            tryNumberFormatCurrentcy(price, "VND");
            tryNumberFormatCurrentcy(amount, "VND");
        }
    }
    if (feeAmount != null) {
        if (feeAmount.length != null) {
            for (i = 0; i < feeAmount.length; i++) {
                sum += reformatNumberMoneyString(feeAmount[i].value) * feeKind[i].value;
                tryNumberFormatCurrentcy(feeAmount[i], "VND");
            }
        } else {
            sum += reformatNumberMoneyString(feeAmount.value) * feeKind.value;
            tryNumberFormatCurrentcy(feeAmount, "VND");
        }
    }
    feeAmount = null;
    feeKind = null;
    quantity = null;
    price = null;
    shellWeight = null;
    amount = null;
    var totalBeforeCommission = document.forms[formName].totalBeforeCommission;
    if (totalBeforeCommission != null) {
        totalBeforeCommission.value = sum;
        tryNumberFormatCurrentcy(totalBeforeCommission, "VND");
        totalBeforeCommission = null;
        var commission = document.forms[formName].commission;
        if (commission != null) {
            commission = commission.value * sum / 100;
            sum = sum - commission;
        }
    }

    document.forms[formName].total.value = sum;
    if (hasGasReturn) {
        var gasReturnPrice = document.forms[formName].gasReturnPrice;
        var gasReturnAmount = document.forms[formName].gasReturnAmount;
        gasReturnPrice.value = minPrice / minPriceWeight;
        var roundedAmount = reformatNumberMoneyString(document.forms[formName].gasReturn.value) * gasReturnPrice.value;
        var mod = roundedAmount % 1000;
        roundedAmount -= mod;
        if (mod >= 500)
            mod = 1000;
        else
            mod = 0;
        roundedAmount += mod;
        gasReturnAmount.value = roundedAmount;
        sum = sum - gasReturnAmount.value * 1;
        tryNumberFormatCurrentcy(gasReturnPrice, "VND");
        gasReturnPrice = null;
        gasReturnAmount = null;
    }
    if (document.forms[formName].discount != null) {
        document.forms[formName].discount.value = 0;
    }
    if (document.forms[formName].totalPay != null) {
        document.forms[formName].totalPay.value = sum;
        tryNumberFormatCurrentcy(document.forms[formName].totalPay, "VND");
    }
    if (document.forms[formName].paid != null) {
        document.forms[formName].paid.value = 0;
    }
    if (document.forms[formName].debt != null) {
        document.forms[formName].debt.value = sum;
        tryNumberFormatCurrentcy(document.forms[formName].debt, "VND");
    }
    tryNumberFormatCurrentcy(document.forms[formName].total, "VND");
    return false;
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
    mygrid.al(true, height); //enableAutoHeight
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
    mygrid.al(true, height); //enableAutoHeight
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
    return false;
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
    mygrid.al(true, height); //enableAutoHeight
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
function getOrganization(id) {
    var url = 'organizationForm.do';
    if (id != 0)
        url += '?organizationId=' + id
    callAjax(url, null, null, function(data) {
        clearContent();
        setAjaxData(data, 'contentDiv');
        document.forms['organizationForm'].code.focus();

        if (id != 0) {
            window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
            var shellIdCombobox = dhtmlXComboFromSelect("shellIdCombobox");
            shellIdCombobox.enableFilteringMode(true);
            shellIdCombobox.attachEvent("onSelectionChange", function() {
                setShellSelectedForm('organizationForm', shellIdCombobox.getComboText(), shellIdCombobox.getSelectedValue());
            });
            shellIdCombobox.attachEvent("onBlur", function() {
                setShellSelectedForm('organizationForm', shellIdCombobox.getComboText(), shellIdCombobox.getSelectedValue());
            });
            shellIdCombobox.DOMelem_input.onkeypress = function(event) {
                var key;
                if (window.event)
                    key = window.event.keyCode;//IE
                else
                    key = event.which;//firefox
                if (key == 13) {
                    addOrganizationShell();
                    shellIdCombobox.setComboValue("");
                }
            }
            shellIdCombobox.DOMelem_input.onfocus = function(event) {
                if (isManuallySeleted == 1) {
                    shellIdCombobox.openSelect();
                    isManuallySeleted = 0;
                }
            }
            shellIdCombobox.setComboValue("");
        }
    });
}
function addOrganizationShell() {
    var shell = document.forms['organizationForm'].shellSelectedHidden.value;
    if (shell == -1 || shell == 0)
        return false;
    var shellId = document.forms['organizationForm'].shellId;
    var existed = false;
    if (shellId != null) {
        if (shellId.length != null) {
            for (i = 0; i < shellId.length; i++) {
                if (shellId[i].value == shell) {
                    existed = true;
                    break;
                }
            }
        } else if (shellId.value == shell)
            existed = true;
    }
    shellId = null;
    if (existed == true) {
        alert("H\u00E0ng ho\u00E1 \u0111\u00E3 t\u1ED3n t\u1EA1i");
        return false;
    }
    callAjax("getOrganizationShell.do?shellId=" + shell, null, null, function(data) {
        setAjaxData(data, 'organizationShellHideDiv');
        var matTable = document.getElementById('organizationShellTbl');
        var detTable = document.getElementById('organizationShellDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
    });
    return false;
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
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getOrganization(0);
        else
            loadOrganizationPanel();
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
    mygrid.al(true, height); //enableAutoHeight
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
    mygrid.al(true, height); //enableAutoHeight
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
    mygrid.al(true, height); //enableAutoHeight
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
        tryNumberFormatCurrentcy(document.forms['employeeForm'].salaryBhxh, "VND");
        var myCalendar = new dhtmlXCalendarObject(["employeeBirthday", "startDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");
    });
}
function saveEmployee() {
    if (scriptFunction == "saveEmployee")
        return false;
    var field = document.forms['employeeForm'].idcard;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp CMND");
        field.focus();
        field = null;
        return false;
    }
    field = document.forms['employeeForm'].fullname;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp t\u00EAn nh\u00E2n vi\u00EAn");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    reformatNumberMoney(document.forms['employeeForm'].salary);
    reformatNumberMoney(document.forms['employeeForm'].salaryBhxh);
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
    mygrid.al(true, height); //enableAutoHeight
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
    popupName = 'TH\u00D4NG TIN T\u00C0I KHO\u1EA2N H\u1EC6 TH\u1ED0NG';
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
    mygrid.al(true, height); //enableAutoHeight
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
    mygrid.al(true, height); //enableAutoHeight
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
    return false;
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
    mygrid.al(true, height); //enableAutoHeight
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
    var handle = document.getElementById('callbackFunc').value;
    callAjaxCheckError("addShell.do", null, document.forms['shellForm'], function(data) {
        scriptFunction = "";
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
    mygrid.al(true, height); //enableAutoHeight
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
    mygrid.al(true, height); //enableAutoHeight
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
        alert("Vui l\u00F2ng nh\u1EADp s\u1ED1 t\u00E0i kho\u1EA3n");
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
    mygrid.al(true, height); //enableAutoHeight
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
        tryNumberFormatCurrentcy(document.forms['vehicleForm'].allowance, "VND");
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
    reformatNumberMoney(document.forms['vehicleForm'].allowance);
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
    mygrid.al(true, height); //enableAutoHeight
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
        tryNumberFormatCurrentcy(document.forms['routeForm'].distance, "USD");
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
    mygrid.al(true, height); //enableAutoHeight
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
    mygrid.al(true, height); //enableAutoHeight
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
    mygrid.al(true, height); //enableAutoHeight
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
    mygrid.al(true, height); //enableAutoHeight
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
function getCustomer(id, handle, kind) {
    popupName = 'TH\u00D4NG TIN KH\u00C1CH H\u00C0NG';
    var url = 'customerForm.do?temp=1';
    if (id != 0)
        url += '&customerId=' + id;
    if (typeof (kind) != "undefined" && kind != null)
        url += '&kind=' + kind;
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['customerForm'].code.focus();
        tryNumberFormatCurrentcy(document.forms['customerForm'].commissionPercentage, "VND");

        var customerDocumentExpiredDate = document.getElementsByName("customerDocumentExpiredDate");
        var ids = "";
        var i;
        for (i = 0; i < customerDocumentExpiredDate.length; i++) {
            var obj = customerDocumentExpiredDate[i];
            ids += "," + obj.id;
        }
        if (ids != "") {
            ids = ids.substring(1);
            var myCalendar = new dhtmlXCalendarObject(ids.split(","));
            myCalendar.setSkin('dhx_web');
            myCalendar.setDateFormat("%d/%m/%Y");
        }
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
    reformatNumberMoney(document.forms['customerForm'].commissionPercentage);
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
    mygrid.al(true, height); //enableAutoHeight
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

        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        // ============================
        var employeeIdCombobox = dhtmlXComboFromSelect("employeeIdCombobox");
        employeeIdCombobox.enableFilteringMode(true);
        employeeIdCombobox.attachEvent("onSelectionChange", function() {
            setEmployeeSelectedForm('employeeAdvanceForm', employeeIdCombobox.getComboText(), employeeIdCombobox.getSelectedValue());
        });
        employeeIdCombobox.attachEvent("onBlur", function() {
            setEmployeeSelectedForm('employeeAdvanceForm', employeeIdCombobox.getComboText(), employeeIdCombobox.getSelectedValue());
            employeeIdCombobox.setComboText(employeeIdCombobox.getSelectedText());
        });
        employeeIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                employeeIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        if (id == 0) {
            employeeIdCombobox.setComboValue("");
            employeeIdCombobox.openSelect();
            var currentDate = getCurrentDate();
            document.forms['employeeAdvanceForm'].employeeAdvanceDate.value = currentDate;
        } else {
            var employeeId = document.forms['employeeAdvanceForm'].employeeId.value;
            if (employeeId != 0) {
                var ind = employeeIdCombobox.getIndexByValue(employeeId);
                employeeIdCombobox.selectOption(ind);
            } else {
                employeeIdCombobox.unSelectOption();
                employeeIdCombobox.setComboValue("");
            }
        }
        var myCalendar = new dhtmlXCalendarObject(["employeeAdvanceDate"]);
        myCalendar.setSkin('dhx_web');
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

    var employeeId = document.forms['employeeAdvanceForm'].employeeSelectedHidden.value;
    if (employeeId == 0) {
        alert("Vui l\u00F2ng ch\u1ECDn nh\u00E2n vi\u00EAn");
        return false;
    }
    document.forms['employeeAdvanceForm'].employeeId.value = employeeId;
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
    mygrid.al(true, height); //enableAutoHeight
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
    mygrid.al(true, height); //enableAutoHeight
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
    mygrid.al(true, height); //enableAutoHeight
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

        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        // ============================
        var employeeIdCombobox = dhtmlXComboFromSelect("employeeIdCombobox");
        employeeIdCombobox.enableFilteringMode(true);
        employeeIdCombobox.attachEvent("onSelectionChange", function() {
            setEmployeeSelectedForm('employeeTimesheetForm', employeeIdCombobox.getComboText(), employeeIdCombobox.getSelectedValue());
        });
        employeeIdCombobox.attachEvent("onBlur", function() {
            setEmployeeSelectedForm('employeeTimesheetForm', employeeIdCombobox.getComboText(), employeeIdCombobox.getSelectedValue());
            employeeIdCombobox.setComboText(employeeIdCombobox.getSelectedText());
        });
        employeeIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                employeeIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        if (id == 0) {
            employeeIdCombobox.setComboValue("");
            var currentDate = getCurrentDate();
            document.forms['employeeTimesheetForm'].employeeTimesheetDate.value = currentDate;
            employeeIdCombobox.openSelect();
        } else {
            var employeeId = document.forms['employeeTimesheetForm'].employeeId.value;
            if (employeeId != 0) {
                var ind = employeeIdCombobox.getIndexByValue(employeeId);
                employeeIdCombobox.selectOption(ind);
            } else {
                employeeIdCombobox.unSelectOption();
                employeeIdCombobox.setComboValue("");
            }
        }
        var myCalendar = new dhtmlXCalendarObject(["employeeTimesheetDate"]);
        myCalendar.setSkin('dhx_web');
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
    document.forms['employeeTimesheetForm'].employeeId.value = document.forms['employeeTimesheetForm'].employeeSelectedHidden.value;
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
    mygrid.al(true, height); //enableAutoHeight
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

        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        // ============================
        var employeeIdCombobox = dhtmlXComboFromSelect("employeeIdCombobox");
        employeeIdCombobox.enableFilteringMode(true);
        employeeIdCombobox.attachEvent("onSelectionChange", function() {
            setEmployeeSelectedForm('employeeOffForm', employeeIdCombobox.getComboText(), employeeIdCombobox.getSelectedValue());
        });
        employeeIdCombobox.attachEvent("onBlur", function() {
            setEmployeeSelectedForm('employeeOffForm', employeeIdCombobox.getComboText(), employeeIdCombobox.getSelectedValue());
            employeeIdCombobox.setComboText(employeeIdCombobox.getSelectedText());
        });
        employeeIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                employeeIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['employeeOffForm'].fromDate.value = currentDate;
            document.forms['employeeOffForm'].toDate.value = currentDate;
            employeeIdCombobox.setComboValue("");
            employeeIdCombobox.openSelect();
        } else {
            var employeeId = document.forms['employeeOffForm'].employeeId.value;
            if (employeeId != 0) {
                var ind = employeeIdCombobox.getIndexByValue(employeeId);
                employeeIdCombobox.selectOption(ind);
            } else {
                employeeIdCombobox.unSelectOption();
                employeeIdCombobox.setComboValue("");
            }
        }
        var myCalendar = new dhtmlXCalendarObject(["employeeOffFromDate", "employeeOffToDate", "employeeOffCreatedDate"]);
        myCalendar.setSkin('dhx_web');
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
    document.forms['employeeOffForm'].employeeId.value = document.forms['employeeOffForm'].employeeSelectedHidden.value;
    scriptFunction = "saveEmployeeOff";
    callAjaxCheckError("addEmployeeOff.do", null, document.forms['employeeOffForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getEmployeeOff(0, handle);
        else {
            var obj = eval('(' + data + ')');
            getEmployeeOff(obj.id, handle);
        }
//        else if (handle != '')
//            eval(handle + "()");
//        prepareHidePopup('employeeOffFormshowHelpHideDiv');
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
    mygrid.al(true, height); //enableAutoHeight
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
        tryNumberFormatCurrentcy(document.forms['salaryForm'].commission, "VND");
        tryNumberFormatCurrentcy(document.forms['salaryForm'].bonus, "VND");
        tryNumberFormatCurrentcy(document.forms['salaryForm'].bhxh, "VND");
        tryNumberFormatCurrentcy(document.forms['salaryForm'].advance, "VND");
        tryNumberFormatCurrentcy(document.forms['salaryForm'].panelty, "VND");
        tryNumberFormatCurrentcy(document.forms['salaryForm'].seniority, "VND");
        tryNumberFormatCurrentcy(document.forms['salaryForm'].actualReceived, "VND");
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
    mygrid.setHeader("M\u00E3 x\u0103ng,T\u00EAn x\u0103ng,Gi\u00E1 b\u00E1n,\u0110\u01A1n v\u1ECB t\u00EDnh,\u0110\u01A1n v\u1ECB,T\u00ECnh tr\u1EA1ng");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#select_filter");
    mygrid.setInitWidths("150,*,150,150,300,200");
    mygrid.setColTypes("link,ro,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
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
    popupName = 'TH\u00D4NG TIN X\u0102NG';
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
        alert("Vui l\u00F2ng nh\u1EADp m\u00E3 x\u0103ng");
        field.focus();
        field = null;
        return false;
    }
    field = document.forms['petroForm'].name;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp t\u00EAn x\u0103ng");
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
    mygrid.al(true, height); //enableAutoHeight
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

        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        // ============================
        var employeeIdCombobox = dhtmlXComboFromSelect("employeeIdCombobox");
        employeeIdCombobox.enableFilteringMode(true);
        employeeIdCombobox.attachEvent("onSelectionChange", function() {
            setEmployeeSelectedForm('tripFeeForm', employeeIdCombobox.getComboText(), employeeIdCombobox.getSelectedValue());
        });
        employeeIdCombobox.attachEvent("onBlur", function() {
            setEmployeeSelectedForm('tripFeeForm', employeeIdCombobox.getComboText(), employeeIdCombobox.getSelectedValue());
            employeeIdCombobox.setComboText(employeeIdCombobox.getSelectedText());
        });
        employeeIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                employeeIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        if (id == 0) {
            employeeIdCombobox.setComboValue("");
            employeeIdCombobox.openSelect();
        } else {
            var employeeId = document.forms['tripFeeForm'].employeeId.value;
            if (employeeId != 0) {
                var ind = employeeIdCombobox.getIndexByValue(employeeId);
                employeeIdCombobox.selectOption(ind);
            } else {
                employeeIdCombobox.unSelectOption();
                employeeIdCombobox.setComboValue("");
            }
        }

        var myCalendar = new dhtmlXCalendarObject(["tripFeeDate"]);
        myCalendar.setSkin('dhx_web');
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['tripFeeForm'].tripFeeDate.value = currentDate;
        }
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
    document.forms['tripFeeForm'].employeeId.value = document.forms['tripFeeForm'].employeeSelectedHidden.value;
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
function formCaculateAmount(formName) {
    var quantity = document.forms[formName].quantity;
    var price = document.forms[formName].price;
    var amount = document.forms[formName].amount;
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
    mygrid.setInitWidths("150,150,200,100,200,*");
    mygrid.setColTypes("link,ro,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
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
        tryNumberFormatCurrentcy(document.forms['shellImportForm'].amount, "VND");

        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        // ============================
        var shellIdCombobox = dhtmlXComboFromSelect("shellIdCombobox");
        shellIdCombobox.enableFilteringMode(true);
        shellIdCombobox.attachEvent("onSelectionChange", function() {
            setShellSelectedForm('shellImportForm', shellIdCombobox.getComboText(), shellIdCombobox.getSelectedValue());
        });
        shellIdCombobox.attachEvent("onBlur", function() {
            setShellSelectedForm('shellImportForm', shellIdCombobox.getComboText(), shellIdCombobox.getSelectedValue());
            shellIdCombobox.setComboText(shellIdCombobox.getSelectedText());
        });
        shellIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                shellIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        if (id == 0) {
            shellIdCombobox.setComboValue("");
            var currentDate = getCurrentDate();
            document.forms['shellImportForm'].shellImportDate.value = currentDate;
            shellIdCombobox.openSelect();
        } else {
            var shellId = document.forms['shellImportForm'].shellId.value;
            if (shellId != 0) {
                var ind = shellIdCombobox.getIndexByValue(shellId);
                shellIdCombobox.selectOption(ind);
            } else {
                shellIdCombobox.unSelectOption();
                shellIdCombobox.setComboValue("");
            }
        }
        var myCalendar = new dhtmlXCalendarObject(["shellImportDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");
    });
}
function saveShellImport() {
    if (scriptFunction == "saveShellImport")
        return false;
    reformatNumberMoney(document.forms['shellImportForm'].quantity);
    reformatNumberMoney(document.forms['shellImportForm'].price);
    reformatNumberMoney(document.forms['shellImportForm'].amount);
    document.forms['shellImportForm'].shellId.value = document.forms['shellImportForm'].shellSelectedHidden.value;
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
    mygrid.setHeader("S\u1ED1 phi\u1EBFu,Ng\u00E0y,Nh\u00E0 cung c\u1EA5p,S\u1ED1 l\u01B0\u1EE3ng th\u1EF1c t\u1EBF,\u0110\u01A1n gi\u00E1,Th\u00E0nh ti\u1EC1n,T\u1EF7 gi\u00E1,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,150,200,150,150,150,150,*");
    mygrid.setColTypes("link,ro,ro,ro,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
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
        tryNumberFormatCurrentcy(document.forms['lpgImportForm'].paperQuantity, "VND");
        tryNumberFormatCurrentcy(document.forms['lpgImportForm'].actualQuantity, "VND");
        tryNumberFormatCurrentcy(document.forms['lpgImportForm'].price, "USD");
        tryNumberFormatCurrentcy(document.forms['lpgImportForm'].vat, "USD");
        tryNumberFormatCurrentcy(document.forms['lpgImportForm'].invoiceTotal, "USD");
        tryNumberFormatCurrentcy(document.forms['lpgImportForm'].total, "VND");
        tryNumberFormatCurrentcy(document.forms['lpgImportForm'].paid, "VND");
        tryNumberFormatCurrentcy(document.forms['lpgImportForm'].debt, "VND");
        tryNumberFormatCurrentcy(document.forms['lpgImportForm'].rate, "VND");
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['lpgImportForm'].lpgImportDate.value = currentDate;
        }
        var myCalendar = new dhtmlXCalendarObject(["lpgImportDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");

        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        // ============================
        var routeIdCombobox = dhtmlXComboFromSelect("routeIdCombobox");
        routeIdCombobox.enableFilteringMode(true);
        routeIdCombobox.attachEvent("onSelectionChange", function() {
            setRouteSelectedForm('lpgImportForm', routeIdCombobox.getComboText(), routeIdCombobox.getSelectedValue());
        });
        routeIdCombobox.attachEvent("onBlur", function() {
            setRouteSelectedForm('lpgImportForm', routeIdCombobox.getComboText(), routeIdCombobox.getSelectedValue());
            routeIdCombobox.setComboText(routeIdCombobox.getSelectedText());
        });
        routeIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                routeIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        if (id == 0) {
            routeIdCombobox.setComboValue("");
        } else {
            var routeId = document.forms['lpgImportForm'].routeId.value;
            if (routeId != 0) {
                var ind = routeIdCombobox.getIndexByValue(routeId);
                routeIdCombobox.selectOption(ind);
            } else {
                routeIdCombobox.unSelectOption();
                routeIdCombobox.setComboValue("");
            }
        }

    });
}
function setRouteSelectedForm(form, text, value) {
    if (value == null) {
        if (text != "")
            value = "-1";
        else
            value = "0";
    }
    document.forms[form].routeSelectedHidden.value = value;
}
function saveLpgImport() {
    if (scriptFunction == "saveLpgImport")
        return false;
    reformatNumberMoney(document.forms['lpgImportForm'].paperQuantity);
    reformatNumberMoney(document.forms['lpgImportForm'].actualQuantity);
    reformatNumberMoney(document.forms['lpgImportForm'].price);
    reformatNumberMoney(document.forms['lpgImportForm'].vat);
    reformatNumberMoney(document.forms['lpgImportForm'].invoiceTotal);
    reformatNumberMoney(document.forms['lpgImportForm'].total);
    reformatNumberMoney(document.forms['lpgImportForm'].paid);
    reformatNumberMoney(document.forms['lpgImportForm'].debt);
    reformatNumberMoney(document.forms['lpgImportForm'].rate);
    document.forms['lpgImportForm'].routeId.value = document.forms['lpgImportForm'].routeSelectedHidden.value;
    scriptFunction = "saveLpgImport";
    callAjaxCheckError("addLpgImport.do", null, document.forms['lpgImportForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getLpgImport(0, handle);
        else {
            var obj = eval('(' + data + ')');
            getLpgImport(obj.id, handle);
        }
//        else if (handle != '')
//            eval(handle + "()");
//        prepareHidePopup('lpgImportFormshowHelpHideDiv');
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
    var quantity = document.forms['lpgImportForm'].paperQuantity;
    var price = document.forms['lpgImportForm'].price;
    var vat = document.forms['lpgImportForm'].vat;
    var rate = document.forms['lpgImportForm'].rate;
    var invoiceAmount = document.forms['lpgImportForm'].invoiceTotal;
    var amount = document.forms['lpgImportForm'].total;
    var paid = document.forms['lpgImportForm'].paid;
    var debt = document.forms['lpgImportForm'].debt;
    amount.value = reformatNumberMoneyString(quantity.value) * reformatNumberMoneyString(price.value) * (100 + reformatNumberMoneyString(vat.value) * 1) / 100 * reformatNumberMoneyString(rate.value) / 1000;
    invoiceAmount.value = amount.value;
    paid.value = 0;
    debt.value = amount.value;
    tryNumberFormatCurrentcy(quantity, "VND");
    tryNumberFormatCurrentcy(price, "USD");
    tryNumberFormatCurrentcy(vat, "USD");
    tryNumberFormatCurrentcy(rate, "VND");
    tryNumberFormatCurrentcy(invoiceAmount, "VND");
    tryNumberFormatCurrentcy(amount, "VND");
    tryNumberFormatCurrentcy(debt, "VND");
    quantity = null;
    price = null;
    vat = null;
    rate = null;
    amount = null;
    invoiceAmount = null;
    paid = null;
    debt = null;
    return false;
}
function formInvoiceTotalChanged(formName) {
    var total = document.forms[formName].invoiceTotal;
    var paid = document.forms[formName].paid;
    var debt = document.forms[formName].debt;
    if (total == null || paid == null || debt == null)
        return false;
    paid.value = 0;
    debt.value = total.value;
    tryNumberFormatCurrentcy(total, "VND");
    tryNumberFormatCurrentcy(debt, "VND");
    total = null;
    paid = null;
    debt = null;
    return false;
}
function lpgImportPaidChanged() {
//    var total = document.forms['lpgImportForm'].invoiceTotal;
    var total = document.forms['lpgImportForm'].total;
    var paid = document.forms['lpgImportForm'].paid;
    var debt = document.forms['lpgImportForm'].debt;
    if (total == null || paid == null || debt == null)
        return false;
    debt.value = reformatNumberMoneyString(total.value) * 1 - reformatNumberMoneyString(paid.value) * 1;
    tryNumberFormatCurrentcy(total, "VND");
    tryNumberFormatCurrentcy(paid, "VND");
    tryNumberFormatCurrentcy(debt, "VND");
    total = null;
    paid = null;
    debt = null;
    return false;
}
function loadFractionPanel() {
    callAjax("getFractionPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['fractionSearchForm'].fromDate.value = currentTime;
        document.forms['fractionSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadFractionList(currentTime, currentTime);
    });
    return false;
}
function loadFractionList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('fractionList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("S\u1ED1 phi\u1EBFu,Ng\u00E0y,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,100,*");
    mygrid.setColTypes("link,ro,ro");
    mygrid.setColSorting("str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getFractionList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getFraction(id) {
    var url = 'fractionForm.do';
    if (id != 0)
        url += '?fractionId=' + id
    callAjax(url, null, null, function(data) {
        clearContent();
        setAjaxData(data, 'contentDiv');
        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        var shellIdCombobox = dhtmlXComboFromSelect("shellIdCombobox");
        shellIdCombobox.enableFilteringMode(true);
        shellIdCombobox.attachEvent("onSelectionChange", function() {
            setShellSelectedForm('fractionForm', shellIdCombobox.getComboText(), shellIdCombobox.getSelectedValue());
        });
        shellIdCombobox.attachEvent("onBlur", function() {
            setShellSelectedForm('fractionForm', shellIdCombobox.getComboText(), shellIdCombobox.getSelectedValue());
        });
        shellIdCombobox.DOMelem_input.onkeypress = function(event) {
            var key;
            if (window.event)
                key = window.event.keyCode;//IE
            else
                key = event.which;//firefox
            if (key == 13) {
                addFractionShell();
                shellIdCombobox.setComboValue("");
            }
        }
        shellIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                shellIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        shellIdCombobox.setComboValue("");
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['fractionForm'].fractionCreatedDate.value = currentDate;
            shellIdCombobox.openSelect();
        }
        var myCalendar = new dhtmlXCalendarObject(["fractionCreatedDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");
        formatFractionDetail();
    });
}
function formatFractionDetail() {
    var quantity = document.forms['fractionForm'].quantity;
    if (quantity != null) {
        if (quantity.length != null) {
            for (var i = 0; i < quantity.length; i++) {
                tryNumberFormatCurrentcy(quantity[i], "VND");
            }
        } else {
            tryNumberFormatCurrentcy(quantity, "VND");
        }
    }
    quantity = null;
}
function saveFraction() {
    if (scriptFunction == "saveFraction")
        return false;
    var quantity = document.forms['fractionForm'].quantity;
    if (quantity == null) {
        alert('Vui l\u00F2ng ch\u1ECDn h\u00E0ng h\u00F3a');
        return false;
    }
    if (quantity.length != null) {
        for (var i = 0; i < quantity.length; i++) {
            var number = Number(quantity[i].value);
            if (number == 0) {
                alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
                quantity[i].focus();
                quantity = null;
                return false;
            }
            reformatNumberMoney(quantity[i]);
        }
    } else {
        if (quantity.value == "0") {
            alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
            quantity.focus();
            quantity = null;
            return false;
        }
        reformatNumberMoney(quantity);
    }
    quantity = null;
    scriptFunction = "saveFraction";
    callAjaxCheckError("addFraction.do", null, document.forms['fractionForm'], function(data) {
        scriptFunction = "";
        loadFractionPanel();
    });
    return false;
}
function addFractionShell() {
    var shell = document.forms['fractionForm'].shellSelectedHidden.value;
    if (shell == -1 || shell == 0)
        return false;
    var shellId = document.forms['fractionForm'].shellId;
    var existed = false;
    if (shellId != null) {
        if (shellId.length != null) {
            for (i = 0; i < shellId.length; i++) {
                if (shellId[i].value == shell) {
                    existed = true;
                    break;
                }
            }
        } else if (shellId.value == shell)
            existed = true;
    }
    shellId = null;
    if (existed == true) {
        alert("H\u00E0ng ho\u00E1 \u0111\u00E3 t\u1ED3n t\u1EA1i");
        return false;
    }
    callAjax("getFractionShell.do?shellId=" + shell, null, null, function(data) {
        setAjaxData(data, 'fractionShellHideDiv');
        var matTable = document.getElementById('fractionShellTbl');
        var detTable = document.getElementById('fractionDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
        formatFractionDetail();
    });
    return false;
}
function delFraction() {
    callAjaxCheckError('delFraction.do?fractionId=' + document.forms['fractionForm'].id.value, null, null, function() {
        loadFractionPanel();
    });
    return false;
}
function loadGasPricePanel() {
    callAjax("getGasPricePanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['gasPriceSearchForm'].fromDate.value = currentTime;
        document.forms['gasPriceSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadGasPriceList(currentTime, currentTime);
    });
    return false;
}
function loadGasPriceList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('gasPriceList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("M\u00E3 phi\u1EBFu,Kh\u00E1ch h\u00E0ng,T\u1EEB ng\u00E0y,\u0110\u1EBFn ng\u00E0y,Gi\u00E1 b\u00E1n,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#select_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,200,150,150,150,*");
    mygrid.setColTypes("link,ro,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getGasPriceList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getGasPrice(id, handle) {
    popupName = 'TH\u00D4NG TIN GI\u00C1 B\u00C1N';
    var url = 'gasPriceForm.do';
    if (id != 0)
        url += '?gasPriceId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['gasPriceForm'].price.focus();
        tryNumberFormatCurrentcy(document.forms['gasPriceForm'].price, "VND");

        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        // ============================
        var customerIdCombobox = dhtmlXComboFromSelect("customerIdCombobox");
        customerIdCombobox.enableFilteringMode(true);
        customerIdCombobox.attachEvent("onSelectionChange", function() {
            setCustomerSelectedForm('gasPriceForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
        });
        customerIdCombobox.attachEvent("onBlur", function() {
            setCustomerSelectedForm('gasPriceForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
            customerIdCombobox.setComboText(customerIdCombobox.getSelectedText());
        });
        customerIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                customerIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        if (id == 0) {
            customerIdCombobox.setComboValue("");
            customerIdCombobox.openSelect();
            var currentDate = getCurrentDate();

            document.forms['gasPriceForm'].gasPriceToDate.value = currentDate;
            if (savedFromDate == "")
                document.forms['gasPriceForm'].gasPriceFromDate.value = currentDate;
            else
                document.forms['gasPriceForm'].gasPriceFromDate.value = savedFromDate;

            if (savedToDate == "")
                document.forms['gasPriceForm'].gasPriceToDate.value = currentDate;
            else
                document.forms['gasPriceForm'].gasPriceToDate.value = savedToDate;

        } else {
            var customerId = document.forms['gasPriceForm'].customerId.value;
            if (customerId != 0) {
                var ind = customerIdCombobox.getIndexByValue(customerId);
                customerIdCombobox.selectOption(ind);
            } else {
                customerIdCombobox.unSelectOption();
                customerIdCombobox.setComboValue("");
            }
        }

        var myCalendar = new dhtmlXCalendarObject(["gasPriceFromDate", "gasPriceToDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");
    });
}
function saveGasPrice() {
    if (scriptFunction == "saveGasPrice")
        return false;
    var field = document.forms['gasPriceForm'].fromDate;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp ng\u00E0y b\u1EAFt \u0111\u1EA7u");
        field.focus();
        field = null;
        return false;
    }
    field = document.forms['gasPriceForm'].toDate;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp ng\u00E0y k\u1EBFt th\u00FAc");
        field.focus();
        field = null;
        return false;
    }
    field = document.forms['gasPriceForm'].price;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp gi\u00E1 b\u00E1n");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    reformatNumberMoney(document.forms['gasPriceForm'].price);
    savedFromDate = document.forms['gasPriceForm'].fromDate.value;
    savedToDate = document.forms['gasPriceForm'].toDate.value;
    document.forms['gasPriceForm'].customerId.value = document.forms['gasPriceForm'].customerSelectedHidden.value;
    scriptFunction = "saveGasPrice";
    callAjaxCheckError("addGasPrice.do", null, document.forms['gasPriceForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getGasPrice(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('gasPriceFormshowHelpHideDiv');
    });
    return false;
}
function delGasPrice() {
    callAjaxCheckError('delGasPrice.do?gasPriceId=' + document.forms['gasPriceForm'].id.value, null, null, function() {
        loadGasPricePanel();
        prepareHidePopup('gasPriceFormshowHelpHideDiv');
    });
    return false;
}
function loadGasImportPanel() {
    callAjax("getGasImportPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['gasImportSearchForm'].fromDate.value = currentTime;
        document.forms['gasImportSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadGasImportList(currentTime, currentTime);
    });
    return false;
}
function loadGasImportList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('gasImportList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("M\u00E3 phi\u1EBFu,Ng\u00E0y,Nh\u00E0 cung c\u1EA5p,T\u1ED5ng ti\u1EC1n,Thanh to\u00E1n,C\u00F2n n\u1EE3,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#select_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,100,150,150,150,*");
    mygrid.setColTypes("link,ro,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getGasImportList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getGasImport(id) {
    var url = 'gasImportForm.do';
    if (id != 0)
        url += '?gasImportId=' + id
    callAjax(url, null, null, function(data) {
        clearContent();
        setAjaxData(data, 'contentDiv');
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['gasImportForm'].gasImportCreatedDate.value = currentDate;
        }
        var myCalendar = new dhtmlXCalendarObject(["gasImportCreatedDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");

        tryNumberFormatCurrentcy(document.forms['gasImportForm'].total, "VND");
        tryNumberFormatCurrentcy(document.forms['gasImportForm'].paid, "VND");
        tryNumberFormatCurrentcy(document.forms['gasImportForm'].debt, "VND");
        tryNumberFormatCurrentcy(document.forms['gasImportForm'].rate, "VND");
        formatFormDetail('gasImportForm');

        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        // ============================
        var shellName = dhtmlXComboFromSelect("shellIdCombobox");
        shellName.enableFilteringMode(true);
        shellName.attachEvent("onSelectionChange", function() {
            setShellSelectedForm('gasImportForm', shellName.getComboText(), shellName.getSelectedValue());
        });
        shellName.attachEvent("onBlur", function() {
            setShellSelectedForm('gasImportForm', shellName.getComboText(), shellName.getSelectedValue());
        });
        shellName.DOMelem_input.onkeypress = function(event) {
            var key;
            if (window.event)
                key = window.event.keyCode;//IE
            else
                key = event.which;//firefox
            if (key == 13) {
                addGasImportShell();
                shellName.setComboValue("");
            }
        }
        shellName.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                shellName.openSelect();
                isManuallySeleted = 0;
            }
        }
        shellName.setComboValue("");
    });
}
function saveGasImport() {
    if (scriptFunction == "saveGasImport")
        return false;
    var quantity = document.forms['gasImportForm'].quantity;
    if (quantity == null) {
        alert('Vui l\u00F2ng ch\u1ECDn h\u00E0ng h\u00F3a');
        return false;
    }
    var price = document.forms['gasImportForm'].price;
    var amount = document.forms['gasImportForm'].amount;
    if (quantity.length != null) {
        for (var i = 0; i < quantity.length; i++) {
            var number = Number(quantity[i].value);
            if (number == 0) {
                alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
                quantity[i].focus();
                quantity = null;
                return false;
            }
            reformatNumberMoney(quantity[i]);
            reformatNumberMoney(price[i]);
            reformatNumberMoney(amount[i]);
        }
    } else {
        if (quantity.value == "0") {
            alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
            quantity.focus();
            quantity = null;
            return false;
        }
        reformatNumberMoney(quantity);
        reformatNumberMoney(price);
        reformatNumberMoney(amount);
    }
    quantity = null;
    price = null;
    amount = null;
    reformatNumberMoney(document.forms['gasImportForm'].total);
    reformatNumberMoney(document.forms['gasImportForm'].paid);
    reformatNumberMoney(document.forms['gasImportForm'].debt);
    reformatNumberMoney(document.forms['gasImportForm'].rate);
    scriptFunction = "saveGasImport";
    callAjaxCheckError("addGasImport.do", null, document.forms['gasImportForm'], function(data) {
        scriptFunction = "";
        loadGasImportPanel();
    });
    return false;
}
function addGasImportShell() {
    var shell = document.forms['gasImportForm'].shellSelectedHidden.value;
    if (shell == -1 || shell == 0)
        return false;
    var shellId = document.forms['gasImportForm'].shellId;
    var existed = false;
    if (shellId != null) {
        if (shellId.length != null) {
            for (i = 0; i < shellId.length; i++) {
                if (shellId[i].value == shell) {
                    existed = true;
                    break;
                }
            }
        } else if (shellId.value == shell)
            existed = true;
    }
    shellId = null;
    if (existed == true) {
        alert("H\u00E0ng ho\u00E1 \u0111\u00E3 t\u1ED3n t\u1EA1i");
        return false;
    }
    callAjax("getGasImportShell.do?shellId=" + shell, null, null, function(data) {
        setAjaxData(data, 'gasImportShellHideDiv');
        var matTable = document.getElementById('gasImportShellTbl');
        var detTable = document.getElementById('gasImportDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
        formatFormDetail('gasImportForm');
    });
    return false;
}
function delGasImport() {
    callAjaxCheckError('delGasImport.do?gasImportId=' + document.forms['gasImportForm'].id.value, null, null, function() {
        loadGasImportPanel();
    });
    return false;
}
function loadAccessoryImportPanel() {
    callAjax("getAccessoryImportPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['accessoryImportSearchForm'].fromDate.value = currentTime;
        document.forms['accessoryImportSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadAccessoryImportList(currentTime, currentTime);
    });
    return false;
}
function loadAccessoryImportList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('accessoryImportList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("M\u00E3 phi\u1EBFu,Ng\u00E0y,Nh\u00E0 cung c\u1EA5p,T\u1ED5ng ti\u1EC1n,Thanh to\u00E1n,C\u00F2n n\u1EE3,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#select_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,100,150,150,150,*");
    mygrid.setColTypes("link,ro,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getAccessoryImportList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getAccessoryImport(id) {
    var url = 'accessoryImportForm.do';
    if (id != 0)
        url += '?accessoryImportId=' + id
    callAjax(url, null, null, function(data) {
        clearContent();
        setAjaxData(data, 'contentDiv');
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['accessoryImportForm'].accessoryImportCreatedDate.value = currentDate;
        }
        var myCalendar = new dhtmlXCalendarObject(["accessoryImportCreatedDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");

        tryNumberFormatCurrentcy(document.forms['accessoryImportForm'].total, "VND");
        tryNumberFormatCurrentcy(document.forms['accessoryImportForm'].paid, "VND");
        tryNumberFormatCurrentcy(document.forms['accessoryImportForm'].debt, "VND");
        formatFormDetail('accessoryImportForm');

        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        // ============================
        var accessoryIdCombobox = dhtmlXComboFromSelect("accessoryIdCombobox");
        accessoryIdCombobox.enableFilteringMode(true);
        accessoryIdCombobox.attachEvent("onSelectionChange", function() {
            setAccessorySelectedForm('accessoryImportForm', accessoryIdCombobox.getComboText(), accessoryIdCombobox.getSelectedValue());
        });
        accessoryIdCombobox.attachEvent("onBlur", function() {
            setAccessorySelectedForm('accessoryImportForm', accessoryIdCombobox.getComboText(), accessoryIdCombobox.getSelectedValue());
        });
        accessoryIdCombobox.DOMelem_input.onkeypress = function(event) {
            var key;
            if (window.event)
                key = window.event.keyCode;//IE
            else
                key = event.which;//firefox
            if (key == 13) {
                addAccessoryImportAccessory();
                accessoryIdCombobox.setComboValue("");
            }
        }
        accessoryIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                accessoryIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        accessoryIdCombobox.setComboValue("");
    });
}
function setAccessorySelectedForm(form, text, value) {
    if (value == null) {
        if (text != "")
            value = "-1";
        else
            value = "0";
    }
    document.forms[form].accessorySelectedHidden.value = value;
}
function saveAccessoryImport() {
    if (scriptFunction == "saveAccessoryImport")
        return false;
    var quantity = document.forms['accessoryImportForm'].quantity;
    if (quantity == null) {
        alert('Vui l\u00F2ng ch\u1ECDn h\u00E0ng h\u00F3a');
        return false;
    }
    var price = document.forms['accessoryImportForm'].price;
    var amount = document.forms['accessoryImportForm'].amount;
    if (quantity.length != null) {
        for (var i = 0; i < quantity.length; i++) {
            var number = Number(quantity[i].value);
            if (number == 0) {
                alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
                quantity[i].focus();
                quantity = null;
                return false;
            }
            reformatNumberMoney(quantity[i]);
            reformatNumberMoney(price[i]);
            reformatNumberMoney(amount[i]);
        }
    } else {
        if (quantity.value == "0") {
            alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
            quantity.focus();
            quantity = null;
            return false;
        }
        reformatNumberMoney(quantity);
        reformatNumberMoney(price);
        reformatNumberMoney(amount);
    }
    quantity = null;
    price = null;
    amount = null;
    reformatNumberMoney(document.forms['accessoryImportForm'].total);
    reformatNumberMoney(document.forms['accessoryImportForm'].paid);
    reformatNumberMoney(document.forms['accessoryImportForm'].debt);
    scriptFunction = "saveAccessoryImport";
    callAjaxCheckError("addAccessoryImport.do", null, document.forms['accessoryImportForm'], function(data) {
        scriptFunction = "";
        loadAccessoryImportPanel();
    });
    return false;
}
function addAccessoryImportAccessory() {
    var accessory = document.forms['accessoryImportForm'].accessorySelectedHidden.value;
    if (accessory == -1 || accessory == 0)
        return false;
    var accessoryId = document.forms['accessoryImportForm'].accessoryId;
    var existed = false;
    if (accessoryId != null) {
        if (accessoryId.length != null) {
            for (i = 0; i < accessoryId.length; i++) {
                if (accessoryId[i].value == accessory) {
                    existed = true;
                    break;
                }
            }
        } else if (accessoryId.value == accessory)
            existed = true;
    }
    accessoryId = null;
    if (existed == true) {
        alert("H\u00E0ng ho\u00E1 \u0111\u00E3 t\u1ED3n t\u1EA1i");
        return false;
    }
    callAjax("getAccessoryImportAccessory.do?accessoryId=" + accessory, null, null, function(data) {
        setAjaxData(data, 'accessoryImportAccessoryHideDiv');
        var matTable = document.getElementById('accessoryImportAccessoryTbl');
        var detTable = document.getElementById('accessoryImportDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
        formatFormDetail('accessoryImportForm');
    });
    return false;
}
function delAccessoryImport() {
    callAjaxCheckError('delAccessoryImport.do?accessoryImportId=' + document.forms['accessoryImportForm'].id.value, null, null, function() {
        loadAccessoryImportPanel();
    });
    return false;
}
function loadPromotionMaterialImportPanel() {
    callAjax("getPromotionMaterialImportPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['promotionMaterialImportSearchForm'].fromDate.value = currentTime;
        document.forms['promotionMaterialImportSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadPromotionMaterialImportList(currentTime, currentTime);
    });
    return false;
}
function loadPromotionMaterialImportList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('promotionMaterialImportList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("M\u00E3 phi\u1EBFu,Ng\u00E0y,Nh\u00E0 cung c\u1EA5p,T\u1ED5ng ti\u1EC1n,Thanh to\u00E1n,C\u00F2n n\u1EE3,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#select_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,100,150,150,150,*");
    mygrid.setColTypes("link,ro,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getPromotionMaterialImportList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getPromotionMaterialImport(id) {
    var url = 'promotionMaterialImportForm.do';
    if (id != 0)
        url += '?promotionMaterialImportId=' + id
    callAjax(url, null, null, function(data) {
        clearContent();
        setAjaxData(data, 'contentDiv');
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['promotionMaterialImportForm'].promotionMaterialImportCreatedDate.value = currentDate;
        }
        var myCalendar = new dhtmlXCalendarObject(["promotionMaterialImportCreatedDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");

        tryNumberFormatCurrentcy(document.forms['promotionMaterialImportForm'].total, "VND");
        tryNumberFormatCurrentcy(document.forms['promotionMaterialImportForm'].paid, "VND");
        tryNumberFormatCurrentcy(document.forms['promotionMaterialImportForm'].debt, "VND");
        formatFormDetail('promotionMaterialImportForm');

        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        // ============================
        var promotionMaterialIdCombobox = dhtmlXComboFromSelect("promotionMaterialIdCombobox");
        promotionMaterialIdCombobox.enableFilteringMode(true);
        promotionMaterialIdCombobox.attachEvent("onSelectionChange", function() {
            setPromotoinMaterialSelectedForm('promotionMaterialImportForm', promotionMaterialIdCombobox.getComboText(), promotionMaterialIdCombobox.getSelectedValue());
        });
        promotionMaterialIdCombobox.attachEvent("onBlur", function() {
            setPromotoinMaterialSelectedForm('promotionMaterialImportForm', promotionMaterialIdCombobox.getComboText(), promotionMaterialIdCombobox.getSelectedValue());
        });
        promotionMaterialIdCombobox.DOMelem_input.onkeypress = function(event) {
            var key;
            if (window.event)
                key = window.event.keyCode;//IE
            else
                key = event.which;//firefox
            if (key == 13) {
                addPromotionMaterialImportPromotionMaterial();
                promotionMaterialIdCombobox.setComboValue("");
            }
        }
        promotionMaterialIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                promotionMaterialIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        promotionMaterialIdCombobox.setComboValue("");
    });
}
function setPromotoinMaterialSelectedForm(form, text, value) {
    if (value == null) {
        if (text != "")
            value = "-1";
        else
            value = "0";
    }
    document.forms[form].promotionMaterialSelectedHidden.value = value;
}
function savePromotionMaterialImport() {
    if (scriptFunction == "savePromotionMaterialImport")
        return false;
    var quantity = document.forms['promotionMaterialImportForm'].quantity;
    if (quantity == null) {
        alert('Vui l\u00F2ng ch\u1ECDn h\u00E0ng h\u00F3a');
        return false;
    }
    var price = document.forms['promotionMaterialImportForm'].price;
    var amount = document.forms['promotionMaterialImportForm'].amount;
    if (quantity.length != null) {
        for (var i = 0; i < quantity.length; i++) {
            var number = Number(quantity[i].value);
            if (number == 0) {
                alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
                quantity[i].focus();
                quantity = null;
                return false;
            }
            reformatNumberMoney(quantity[i]);
            reformatNumberMoney(price[i]);
            reformatNumberMoney(amount[i]);
        }
    } else {
        if (quantity.value == "0") {
            alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
            quantity.focus();
            quantity = null;
            return false;
        }
        reformatNumberMoney(quantity);
        reformatNumberMoney(price);
        reformatNumberMoney(amount);
    }
    quantity = null;
    price = null;
    amount = null;
    reformatNumberMoney(document.forms['promotionMaterialImportForm'].total);
    reformatNumberMoney(document.forms['promotionMaterialImportForm'].paid);
    reformatNumberMoney(document.forms['promotionMaterialImportForm'].debt);
    scriptFunction = "savePromotionMaterialImport";
    callAjaxCheckError("addPromotionMaterialImport.do", null, document.forms['promotionMaterialImportForm'], function(data) {
        scriptFunction = "";
        loadPromotionMaterialImportPanel();
    });
    return false;
}
function addPromotionMaterialImportPromotionMaterial() {
    var promotionMaterial = document.forms['promotionMaterialImportForm'].promotionMaterialSelectedHidden.value;
    if (promotionMaterial == -1 || promotionMaterial == 0)
        return false;
    var promotionMaterialId = document.forms['promotionMaterialImportForm'].promotionMaterialId;
    var existed = false;
    if (promotionMaterialId != null) {
        if (promotionMaterialId.length != null) {
            for (i = 0; i < promotionMaterialId.length; i++) {
                if (promotionMaterialId[i].value == promotionMaterial) {
                    existed = true;
                    break;
                }
            }
        } else if (promotionMaterialId.value == promotionMaterial)
            existed = true;
    }
    promotionMaterialId = null;
    if (existed == true) {
        alert("H\u00E0ng ho\u00E1 \u0111\u00E3 t\u1ED3n t\u1EA1i");
        return false;
    }
    callAjax("getPromotionMaterialImportPromotionMaterial.do?promotionMaterialId=" + promotionMaterial, null, null, function(data) {
        setAjaxData(data, 'promotionMaterialImportPromotionMaterialHideDiv');
        var matTable = document.getElementById('promotionMaterialImportPromotionMaterialTbl');
        var detTable = document.getElementById('promotionMaterialImportDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
        formatFormDetail('promotionMaterialImportForm');
    });
    return false;
}
function delPromotionMaterialImport() {
    callAjaxCheckError('delPromotionMaterialImport.do?promotionMaterialImportId=' + document.forms['promotionMaterialImportForm'].id.value, null, null, function() {
        loadPromotionMaterialImportPanel();
    });
    return false;
}
function loadPetroImportPanel() {
    callAjax("getPetroImportPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['petroImportSearchForm'].fromDate.value = currentTime;
        document.forms['petroImportSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadPetroImportList(currentTime, currentTime);
    });
    return false;
}
function loadPetroImportList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('petroImportList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("M\u00E3 phi\u1EBFu,Ng\u00E0y,Nh\u00E0 cung c\u1EA5p,Kho,T\u1ED5ng ti\u1EC1n,Thanh to\u00E1n,C\u00F2n n\u1EE3,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#select_filter,#select_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,100,150,150,150,150,*");
    mygrid.setColTypes("link,ro,ro,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getPetroImportList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getPetroImport(id) {
    var url = 'petroImportForm.do';
    if (id != 0)
        url += '?petroImportId=' + id
    callAjax(url, null, null, function(data) {
        clearContent();
        setAjaxData(data, 'contentDiv');
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['petroImportForm'].petroImportCreatedDate.value = currentDate;
        }
        var myCalendar = new dhtmlXCalendarObject(["petroImportCreatedDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");

        tryNumberFormatCurrentcy(document.forms['petroImportForm'].total, "VND");
        tryNumberFormatCurrentcy(document.forms['petroImportForm'].paid, "VND");
        tryNumberFormatCurrentcy(document.forms['petroImportForm'].debt, "VND");
        tryNumberFormatCurrentcy(document.forms['petroImportForm'].rate, "VND");
        formatFormDetail('petroImportForm');

        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        // ============================
        var petroIdCombobox = dhtmlXComboFromSelect("petroIdCombobox");
        petroIdCombobox.enableFilteringMode(true);
        petroIdCombobox.attachEvent("onSelectionChange", function() {
            setPetroSelectedForm('petroImportForm', petroIdCombobox.getComboText(), petroIdCombobox.getSelectedValue());
        });
        petroIdCombobox.attachEvent("onBlur", function() {
            setPetroSelectedForm('petroImportForm', petroIdCombobox.getComboText(), petroIdCombobox.getSelectedValue());
        });
        petroIdCombobox.DOMelem_input.onkeypress = function(event) {
            var key;
            if (window.event)
                key = window.event.keyCode;//IE
            else
                key = event.which;//firefox
            if (key == 13) {
                addPetroImportPetro();
                petroIdCombobox.setComboValue("");
            }
        }
        petroIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                petroIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        petroIdCombobox.setComboValue("");
    });
}
function setPetroSelectedForm(form, text, value) {
    if (value == null) {
        if (text != "")
            value = "-1";
        else
            value = "0";
    }
    document.forms[form].petroSelectedHidden.value = value;
}
function savePetroImport() {
    if (scriptFunction == "savePetroImport")
        return false;
    var quantity = document.forms['petroImportForm'].quantity;
    if (quantity == null) {
        alert('Vui l\u00F2ng ch\u1ECDn h\u00E0ng h\u00F3a');
        return false;
    }
    var price = document.forms['petroImportForm'].price;
    var amount = document.forms['petroImportForm'].amount;
    if (quantity.length != null) {
        for (var i = 0; i < quantity.length; i++) {
            var number = Number(quantity[i].value);
            if (number == 0) {
                alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
                quantity[i].focus();
                quantity = null;
                return false;
            }
            reformatNumberMoney(quantity[i]);
            reformatNumberMoney(price[i]);
            reformatNumberMoney(amount[i]);
        }
    } else {
        if (quantity.value == "0") {
            alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
            quantity.focus();
            quantity = null;
            return false;
        }
        reformatNumberMoney(quantity);
        reformatNumberMoney(price);
        reformatNumberMoney(amount);
    }
    quantity = null;
    price = null;
    amount = null;
    reformatNumberMoney(document.forms['petroImportForm'].total);
    reformatNumberMoney(document.forms['petroImportForm'].paid);
    reformatNumberMoney(document.forms['petroImportForm'].debt);
    reformatNumberMoney(document.forms['petroImportForm'].rate);
    scriptFunction = "savePetroImport";
    callAjaxCheckError("addPetroImport.do", null, document.forms['petroImportForm'], function(data) {
        scriptFunction = "";
        loadPetroImportPanel();
    });
    return false;
}
function addPetroImportPetro() {
    var petro = document.forms['petroImportForm'].petroSelectedHidden.value;
    if (petro == -1 || petro == 0)
        return false;
    var petroId = document.forms['petroImportForm'].petroId;
    var existed = false;
    if (petroId != null) {
        if (petroId.length != null) {
            for (i = 0; i < petroId.length; i++) {
                if (petroId[i].value == petro) {
                    existed = true;
                    break;
                }
            }
        } else if (petroId.value == petro)
            existed = true;
    }
    petroId = null;
    if (existed == true) {
        alert("H\u00E0ng ho\u00E1 \u0111\u00E3 t\u1ED3n t\u1EA1i");
        return false;
    }
    callAjax("getPetroImportPetro.do?petroId=" + petro, null, null, function(data) {
        setAjaxData(data, 'petroImportPetroHideDiv');
        var matTable = document.getElementById('petroImportPetroTbl');
        var detTable = document.getElementById('petroImportDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
        formatFormDetail('petroImportForm');
    });
    return false;
}
function delPetroImport() {
    callAjaxCheckError('delPetroImport.do?petroImportId=' + document.forms['petroImportForm'].id.value, null, null, function() {
        loadPetroImportPanel();
    });
    return false;
}
function loadGasWholesalePanel() {
    callAjax("getGasWholesalePanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['gasWholesaleSearchForm'].fromDate.value = currentTime;
        document.forms['gasWholesaleSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadGasWholesaleList(currentTime, currentTime);
    });
    return false;
}
function loadGasWholesaleList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('gasWholesaleList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("M\u00E3 phi\u1EBFu,Ng\u00E0y,Kh\u00E1ch h\u00E0ng,T\u1ED5ng ti\u1EC1n,Thanh to\u00E1n,C\u00F2n n\u1EE3,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,100,150,150,150,*");
    mygrid.setColTypes("link,ro,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getGasWholesaleList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getGasWholesale(id) {
    var url = 'gasWholesaleForm.do?vehicleOutSavedDate=' + savedDate2;
    if (id != 0)
        url += '&gasWholesaleId=' + id
    callAjax(url, null, null, function(data) {
        clearContent();
        setAjaxData(data, 'contentDiv');

        tryNumberFormatCurrentcy(document.forms['gasWholesaleForm'].total, "VND");
        tryNumberFormatCurrentcy(document.forms['gasWholesaleForm'].paid, "VND");
        tryNumberFormatCurrentcy(document.forms['gasWholesaleForm'].debt, "VND");
        tryNumberFormatCurrentcy(document.forms['gasWholesaleForm'].discount, "VND");
        tryNumberFormatCurrentcy(document.forms['gasWholesaleForm'].totalPay, "VND");
        tryNumberFormatCurrentcy(document.forms['gasWholesaleForm'].gasReturn, "VND");
        tryNumberFormatCurrentcy(document.forms['gasWholesaleForm'].gasReturnPrice, "VND");
        tryNumberFormatCurrentcy(document.forms['gasWholesaleForm'].oldDebt, "VND");
        formatFormDetail('gasWholesaleForm');
        formatGasWholesalePromotionMaterialQuantityDetail();
        formatGasWholesaleReturnShellQuantityDetail();
        formatGasWholesaleFeeDetail();

        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        // ============================
        var customerIdCombobox = dhtmlXComboFromSelect("customerIdCombobox");
        customerIdCombobox.enableFilteringMode(true);
        customerIdCombobox.attachEvent("onSelectionChange", function() {
            setCustomerSelectedForm('gasWholesaleForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
        });
        customerIdCombobox.attachEvent("onBlur", function() {
            setCustomerSelectedForm('gasWholesaleForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
            customerIdCombobox.setComboText(customerIdCombobox.getSelectedText());
        });
        customerIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                customerIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        if (id == 0) {
//            if (savedCustomer == 0)
            customerIdCombobox.setComboValue("");
//            else {
//                var ind = customerIdCombobox.getIndexByValue(savedCustomer);
//                customerIdCombobox.selectOption(ind);
//            }
        } else {
            var customerId = document.forms['gasWholesaleForm'].customerId.value;
            if (customerId != 0) {
                var ind = customerIdCombobox.getIndexByValue(customerId);
                customerIdCombobox.selectOption(ind);
            } else {
                customerIdCombobox.unSelectOption();
                customerIdCombobox.setComboValue("");
            }
        }
        // ============================
        var shellName = dhtmlXComboFromSelect("shellNameCombobox");
        shellName.enableFilteringMode(true);
        shellName.attachEvent("onSelectionChange", function() {
            setShellSelectedForm('gasWholesaleForm', shellName.getComboText(), shellName.getSelectedValue());
        });
        shellName.attachEvent("onBlur", function() {
            setShellSelectedForm('gasWholesaleForm', shellName.getComboText(), shellName.getSelectedValue());
        });
        shellName.DOMelem_input.onkeypress = function(event) {
            var key;
            if (window.event)
                key = window.event.keyCode;//IE
            else
                key = event.which;//firefox
            if (key == 13) {
                addGasWholesaleShell();
                shellName.setComboValue("");
            }
        }
        shellName.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                shellName.openSelect();
                isManuallySeleted = 0;
            }
        }
        shellName.setComboValue("");
        // ============================
        var returnShellIdCombobox = dhtmlXComboFromSelect("returnShellIdCombobox");
        returnShellIdCombobox.enableFilteringMode(true);
        returnShellIdCombobox.attachEvent("onSelectionChange", function() {
            setReturnShellSelectedForm('gasWholesaleForm', returnShellIdCombobox.getComboText(), returnShellIdCombobox.getSelectedValue());
        });
        returnShellIdCombobox.attachEvent("onBlur", function() {
            setReturnShellSelectedForm('gasWholesaleForm', returnShellIdCombobox.getComboText(), returnShellIdCombobox.getSelectedValue());
        });
        returnShellIdCombobox.DOMelem_input.onkeypress = function(event) {
            var key;
            if (window.event)
                key = window.event.keyCode;//IE
            else
                key = event.which;//firefox
            if (key == 13) {
                addGasWholesaleReturnShell();
                returnShellIdCombobox.setComboValue("");
            }
        }
        returnShellIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                returnShellIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        returnShellIdCombobox.setComboValue("");
        // ============================
        var promotionMaterialIdCombobox = dhtmlXComboFromSelect("promotionMaterialIdCombobox");
        promotionMaterialIdCombobox.enableFilteringMode(true);
        promotionMaterialIdCombobox.attachEvent("onSelectionChange", function() {
            setPromotionMaterialSelectedForm('gasWholesaleForm', promotionMaterialIdCombobox.getComboText(), promotionMaterialIdCombobox.getSelectedValue());
        });
        promotionMaterialIdCombobox.attachEvent("onBlur", function() {
            setPromotionMaterialSelectedForm('gasWholesaleForm', promotionMaterialIdCombobox.getComboText(), promotionMaterialIdCombobox.getSelectedValue());
        });
        promotionMaterialIdCombobox.DOMelem_input.onkeypress = function(event) {
            var key;
            if (window.event)
                key = window.event.keyCode;//IE
            else
                key = event.which;//firefox
            if (key == 13) {
                addGasWholesalePromotionMaterial();
                promotionMaterialIdCombobox.setComboValue("");
            }
        }
        promotionMaterialIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                promotionMaterialIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        promotionMaterialIdCombobox.setComboValue("");
        // ============================
        var selectedCombo = dhtmlXComboFromSelect("vehicleOutIdCombobox");
        selectedCombo.enableFilteringMode(true);
        selectedCombo.attachEvent("onSelectionChange", function() {
            setVehicleSelectedForm('gasWholesaleForm', selectedCombo.getComboText(), selectedCombo.getSelectedValue());
        });
        selectedCombo.attachEvent("onBlur", function() {
            setVehicleSelectedForm('gasWholesaleForm', selectedCombo.getComboText(), selectedCombo.getSelectedValue());
            selectedCombo.setComboText(selectedCombo.getSelectedText());
        });
        selectedCombo.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                selectedCombo.openSelect();
                isManuallySeleted = 0;
            }
        }
        if (id == 0) {
            if (savedVehicle == 0)
                selectedCombo.setComboValue("");
            else {
                var ind = selectedCombo.getIndexByValue(savedVehicle);
                selectedCombo.selectOption(ind);
            }
        } else {
            var vehicleOutId = document.forms['gasWholesaleForm'].vehicleOutId.value;
            if (vehicleOutId != 0) {
                var ind = selectedCombo.getIndexByValue(vehicleOutId);
                selectedCombo.selectOption(ind);
            } else {
                selectedCombo.unSelectOption();
                selectedCombo.setComboValue("");
            }
        }
        // ============================
        var feeCombobox = dhtmlXComboFromSelect("feeIdCombobox");
        feeCombobox.enableFilteringMode(true);
        feeCombobox.attachEvent("onSelectionChange", function() {
            setFeeSelectedForm('gasWholesaleForm', feeCombobox.getComboText(), feeCombobox.getSelectedValue());
        });
        feeCombobox.attachEvent("onBlur", function() {
            setFeeSelectedForm('gasWholesaleForm', feeCombobox.getComboText(), feeCombobox.getSelectedValue());
        });
        feeCombobox.DOMelem_input.onkeypress = function(event) {
            var key;
            if (window.event)
                key = window.event.keyCode;//IE
            else
                key = event.which;//firefox
            if (key == 13) {
                addGasWholesaleFee();
                feeCombobox.setComboValue("");
            }
        }
        feeCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                feeCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        feeCombobox.setComboValue("");
        // ============================

        if (id == 0) {
            var currentDate = "";
            if (savedDate == "") {
                currentDate = getCurrentDate();
                customerIdCombobox.openSelect();
            } else {
                currentDate = savedDate;
                customerIdCombobox.openSelect();
            }
            document.forms['gasWholesaleForm'].gasWholesaleCreatedDate.value = currentDate;
        }
        var myCalendar = new dhtmlXCalendarObject(["gasWholesaleCreatedDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");

        var vehicleOutCalendar = new dhtmlXCalendarObject(["gasWholesaleVehicleOutCreatedDate"]);
        vehicleOutCalendar.setSkin('dhx_web');
        vehicleOutCalendar.setDateFormat("%d/%m/%Y");
        vehicleOutCalendar.attachEvent("onClick", function(date) {
            var strDate = getDateString(date);
            savedDate2 = strDate;
            var url = "getVehicleOutByDateAction.do?date=" + strDate;
            callAjaxCheckError(url, null, null, function(data) {
                var obj = eval('(' + data + ')');
                selectedCombo.clearAll();
                selectedCombo.addOption(obj.options);
                selectedCombo.setComboText("");
            });
        });
    });
}
function setShellSelectedForm(form, text, value) {
    if (value == null) {
        if (text != "")
            value = "-1";
        else
            value = "0";
    }
    document.forms[form].shellSelectedHidden.value = value;
}
function setCustomerSelectedForm(form, text, value) {
    if (value == null) {
        if (text != "")
            value = "-1";
        else
            value = "0";
    }
    document.forms[form].customerSelectedHidden.value = value;
}
function setReturnShellSelectedForm(form, text, value) {
    if (value == null) {
        if (text != "")
            value = "-1";
        else
            value = "0";
    }
    document.forms[form].returnShellSelectedHidden.value = value;
}
function setPromotionMaterialSelectedForm(form, text, value) {
    if (value == null) {
        if (text != "")
            value = "-1";
        else
            value = "0";
    }
    document.forms[form].promotionMaterialSelectedHidden.value = value;
}
function setVehicleSelectedForm(form, text, value) {
    if (value == null) {
        if (text != "")
            value = "-1";
        else
            value = "0";
    }
    document.forms[form].vehicleSelectedHidden.value = value;
}
function gasWholesalePaidDiscountChanged(recalculatePaid) {
    var total = document.forms['gasWholesaleForm'].total;
    var gasReturnAmount = document.forms['gasWholesaleForm'].gasReturnAmount;
    var paid = document.forms['gasWholesaleForm'].paid;
    var debt = document.forms['gasWholesaleForm'].debt;
    var discount = document.forms['gasWholesaleForm'].discount;
    var totalPay = document.forms['gasWholesaleForm'].totalPay;
    if (total == null || paid == null || debt == null || discount == null || totalPay == null)
        return false;
    totalPay.value = reformatNumberMoneyString(total.value) * 1 - reformatNumberMoneyString(gasReturnAmount.value) * 1 - reformatNumberMoneyString(discount.value) * 1;
    if (recalculatePaid == 1)
        paid.value = 0;
//        paid.value = totalPay.value;

    debt.value = reformatNumberMoneyString(totalPay.value) * 1 - reformatNumberMoneyString(paid.value) * 1;
    tryNumberFormatCurrentcy(total, "VND");
    tryNumberFormatCurrentcy(paid, "VND");
    tryNumberFormatCurrentcy(debt, "VND");
    tryNumberFormatCurrentcy(discount, "VND");
    tryNumberFormatCurrentcy(totalPay, "VND");
    total = null;
    paid = null;
    debt = null;
    discount = null;
    totalPay = null;
    gasReturnAmount = null;
    return false;
}
function gasWholesaleGasReturnChanged() {
    var gasReturn = document.forms['gasWholesaleForm'].gasReturn;
    var gasReturnPrice = document.forms['gasWholesaleForm'].gasReturnPrice;
    var gasReturnAmount = document.forms['gasWholesaleForm'].gasReturnAmount;
    var roundedAmount = reformatNumberMoneyString(gasReturn.value) * reformatNumberMoneyString(gasReturnPrice.value);
    var mod = roundedAmount % 1000;
    roundedAmount -= mod;
    if (mod >= 500)
        mod = 1000;
    else
        mod = 0;
    roundedAmount += mod;
    gasReturnAmount.value = roundedAmount;
    tryNumberFormatCurrentcy(gasReturn, "VND");
    tryNumberFormatCurrentcy(gasReturnPrice, "VND");
    gasReturn = null;
    gasReturnPrice = null;
    gasReturnAmount = null;
    gasWholesalePaidDiscountChanged(1);
    return false;
}
function saveGasWholesale() {
    if (scriptFunction == "saveGasWholesale")
        return false;
    var quantity = document.forms['gasWholesaleForm'].quantity;
//    if (quantity == null) {
//        alert('Vui l\u00F2ng ch\u1ECDn h\u00E0ng h\u00F3a');
//        return false;
//    }
    if (quantity != null) {
        var price = document.forms['gasWholesaleForm'].price;
        var amount = document.forms['gasWholesaleForm'].amount;
        if (quantity.length != null) {
            for (var i = 0; i < quantity.length; i++) {
                var number = Number(quantity[i].value);
                if (number == 0) {
                    alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
                    quantity[i].focus();
                    quantity = null;
                    return false;
                }
                reformatNumberMoney(quantity[i]);
                reformatNumberMoney(price[i]);
                reformatNumberMoney(amount[i]);
            }
        } else {
            if (quantity.value == "0") {
                alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
                quantity.focus();
                quantity = null;
                return false;
            }
            reformatNumberMoney(quantity);
            reformatNumberMoney(price);
            reformatNumberMoney(amount);
        }
        quantity = null;
        price = null;
        amount = null;
    }
    reformatNumberMoney(document.forms['gasWholesaleForm'].total);
    reformatNumberMoney(document.forms['gasWholesaleForm'].paid);
    reformatNumberMoney(document.forms['gasWholesaleForm'].debt);
    reformatNumberMoney(document.forms['gasWholesaleForm'].discount);
    reformatNumberMoney(document.forms['gasWholesaleForm'].totalPay);
    reformatNumberMoney(document.forms['gasWholesaleForm'].gasReturn);
    reformatNumberMoney(document.forms['gasWholesaleForm'].gasReturnPrice);
    reformatNumberMoney(document.forms['gasWholesaleForm'].oldDebt);
    reformatFormDetail('gasWholesaleForm');
    reformatGasWholesalePromotionMaterialQuantityDetail();
    reformatGasWholesaleReturnShellQuantityDetail();
    reformatGasWholesaleFeeDetail();
    savedCustomer = document.forms['gasWholesaleForm'].customerSelectedHidden.value;
    savedVehicle = document.forms['gasWholesaleForm'].vehicleSelectedHidden.value;
    document.forms['gasWholesaleForm'].customerId.value = savedCustomer;
    document.forms['gasWholesaleForm'].vehicleOutId.value = savedVehicle;
    savedDate = document.forms['gasWholesaleForm'].gasWholesaleCreatedDate.value;
    if (savedCustomer == 0) {
        alert('Vui l\u00F2ng ch\u1ECDn kh\u00E1ch h\u00E0ng');
        return false;
    }
    scriptFunction = "saveGasWholesale";
    callAjaxCheckError("addGasWholesale.do", null, document.forms['gasWholesaleForm'], function(data) {
        scriptFunction = "";
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getGasWholesale(0);
        else
            loadGasWholesalePanel();
    });
    return false;
}
function addGasWholesaleShell() {
    var shell = document.forms['gasWholesaleForm'].shellSelectedHidden.value;
    if (shell == -1 || shell == 0)
        return false;
    var shellId = document.forms['gasWholesaleForm'].shellId;
    var existed = false;
    if (shellId != null) {
        if (shellId.length != null) {
            for (i = 0; i < shellId.length; i++) {
                if (shellId[i].value == shell) {
                    existed = true;
                    break;
                }
            }
        } else if (shellId.value == shell)
            existed = true;
    }
    shellId = null;
    if (existed == true) {
        alert("H\u00E0ng ho\u00E1 \u0111\u00E3 t\u1ED3n t\u1EA1i");
        return false;
    }
    callAjax("getGasWholesaleShell.do?shellId=" + shell, null, null, function(data) {
        setAjaxData(data, 'gasWholesaleShellHideDiv');
        var matTable = document.getElementById('gasWholesaleShellTbl');
        var detTable = document.getElementById('gasWholesaleDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
        formatFormDetail('gasWholesaleForm');
    });
    return false;
}
function delGasWholesale() {
    callAjaxCheckError('delGasWholesale.do?gasWholesaleId=' + document.forms['gasWholesaleForm'].id.value, null, null, function() {
        loadGasWholesalePanel();
    });
    return false;
}
function addGasWholesalePromotionMaterial() {
    var promotionMaterial = document.forms['gasWholesaleForm'].promotionMaterialSelectedHidden.value;
    if (promotionMaterial == -1 || promotionMaterial == 0)
        return false;
    var promotionMaterialId = document.forms['gasWholesaleForm'].promotionMaterialId;
    var existed = false;
    if (promotionMaterialId != null) {
        if (promotionMaterialId.length != null) {
            for (i = 0; i < promotionMaterialId.length; i++) {
                if (promotionMaterialId[i].value == promotionMaterial) {
                    existed = true;
                    break;
                }
            }
        } else if (promotionMaterialId.value == promotionMaterial)
            existed = true;
    }
    promotionMaterialId = null;
    if (existed == true) {
        alert("H\u00E0ng ho\u00E1 \u0111\u00E3 t\u1ED3n t\u1EA1i");
        return false;
    }
    callAjax("getGasWholesalePromotionMaterial.do?promotionMaterialId=" + promotionMaterial, null, null, function(data) {
        setAjaxData(data, 'gasWholesalePromotionMaterialHideDiv');
        var matTable = document.getElementById('gasWholesalePromotionMaterialTbl');
        var detTable = document.getElementById('gasWholesalePromotionMaterialDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
        formatGasWholesalePromotionMaterialQuantityDetail();
    });
    return false;
}
function addGasWholesaleReturnShell() {
    var shell = document.forms['gasWholesaleForm'].returnShellSelectedHidden.value;
    if (shell == -1 || shell == 0)
        return false;
    var shellId = document.forms['gasWholesaleForm'].returnShellId;
    var existed = false;
    if (shellId != null) {
        if (shellId.length != null) {
            for (i = 0; i < shellId.length; i++) {
                if (shellId[i].value == shell) {
                    existed = true;
                    break;
                }
            }
        } else if (shellId.value == shell)
            existed = true;
    }
    shellId = null;
    if (existed == true) {
        alert("H\u00E0ng ho\u00E1 \u0111\u00E3 t\u1ED3n t\u1EA1i");
        return false;
    }
    callAjax("getGasWholesaleReturnShell.do?shellId=" + shell, null, null, function(data) {
        setAjaxData(data, 'gasWholesaleReturnShellHideDiv');
        var matTable = document.getElementById('gasWholesaleReturnShellTbl');
        var detTable = document.getElementById('gasWholesaleReturnShellDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
        formatGasWholesaleReturnShellQuantityDetail();
    });
    return false;
}
function formatGasWholesalePromotionMaterialQuantityDetail() {
    var quantity = document.forms['gasWholesaleForm'].promotionMaterialQuantity;
    if (quantity != null) {
        if (quantity.length != null) {
            for (var i = 0; i < quantity.length; i++) {
                tryNumberFormatCurrentcy(quantity[i], "VND");
            }
        } else {
            tryNumberFormatCurrentcy(quantity, "VND");
        }
    }
    quantity = null;
}
function formatGasWholesaleReturnShellQuantityDetail() {
    var quantity = document.forms['gasWholesaleForm'].returnShellQuantity;
    if (quantity != null) {
        if (quantity.length != null) {
            for (var i = 0; i < quantity.length; i++) {
                tryNumberFormatCurrentcy(quantity[i], "VND");
            }
        } else {
            tryNumberFormatCurrentcy(quantity, "VND");
        }
    }
    quantity = null;
}
function reformatGasWholesalePromotionMaterialQuantityDetail() {
    var quantity = document.forms['gasWholesaleForm'].promotionMaterialQuantity;
    if (quantity != null) {
        if (quantity.length != null) {
            for (var i = 0; i < quantity.length; i++) {
                reformatNumberMoney(quantity[i]);
            }
        } else {
            reformatNumberMoney(quantity);
        }
    }
    quantity = null;
}
function reformatGasWholesaleReturnShellQuantityDetail() {
    var quantity = document.forms['gasWholesaleForm'].returnShellQuantity;
    if (quantity != null) {
        if (quantity.length != null) {
            for (var i = 0; i < quantity.length; i++) {
                reformatNumberMoney(quantity[i]);
            }
        } else {
            reformatNumberMoney(quantity);
        }
    }
    quantity = null;
}
function addCustomerWholesale() {
    getCustomer(0, 'loadCustomerGasWholesale', 2);
    return false;
}
function loadCustomerGasWholesale() {
    callAjax("getCustomerListWholesale.do", "gasWholesaleCustomerId", null, null);
    return false;
}
function setFeeSelectedForm(form, text, value) {
    if (value == null) {
        if (text != "")
            value = "-1";
        else
            value = "0";
    }
    document.forms[form].feeSelectedHidden.value = value;
}
function addGasWholesaleFee() {
    var fee = document.forms['gasWholesaleForm'].feeSelectedHidden.value;
    if (fee == -1 || fee == 0)
        return false;
    var feeId = document.forms['gasWholesaleForm'].feeId;
    var existed = false;
    if (feeId != null) {
        if (feeId.length != null) {
            for (i = 0; i < feeId.length; i++) {
                if (feeId[i].value == fee) {
                    existed = true;
                    break;
                }
            }
        } else if (feeId.value == fee)
            existed = true;
    }
    feeId = null;
    if (existed == true) {
        alert("H\u00E0ng ho\u00E1 \u0111\u00E3 t\u1ED3n t\u1EA1i");
        return false;
    }
    callAjax("getGasWholesaleFee.do?feeId=" + fee, null, null, function(data) {
        setAjaxData(data, 'gasWholesaleFeeHideDiv');
        var matTable = document.getElementById('gasWholesaleFeeTbl');
        var detTable = document.getElementById('gasWholesaleFeeDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
        formatGasWholesaleFeeDetail();
    });
    return false;
}
function formatGasWholesaleFeeDetail() {
    var amount = document.forms['gasWholesaleForm'].feeAmount;
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
}
function reformatGasWholesaleFeeDetail() {
    var amount = document.forms['gasWholesaleForm'].feeAmount;
    if (amount != null) {
        if (amount.length != null) {
            for (var i = 0; i < amount.length; i++) {
                reformatNumberMoney(amount[i]);
            }
        } else {
            reformatNumberMoney(amount);
        }
    }
    amount = null;
}
function loadGasRetailPanel() {
    callAjax("getGasRetailPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['gasRetailSearchForm'].fromDate.value = currentTime;
        document.forms['gasRetailSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadGasRetailList(currentTime, currentTime);
    });
    return false;
}
function loadGasRetailList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('gasRetailList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("M\u00E3 phi\u1EBFu,Ng\u00E0y,Kh\u00E1ch h\u00E0ng,T\u1ED5ng ti\u1EC1n,Thanh to\u00E1n,C\u00F2n n\u1EE3,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#select_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,100,150,150,150,*");
    mygrid.setColTypes("link,ro,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getGasRetailList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getGasRetail(id) {
    var url = 'gasRetailForm.do';
    if (id != 0)
        url += '?gasRetailId=' + id
    callAjax(url, null, null, function(data) {
        clearContent();
        setAjaxData(data, 'contentDiv');
//        var myCalendar = new dhtmlXCalendarObject(["gasRetailCreatedDate"]);
//        myCalendar.setSkin('dhx_web');
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['gasRetailForm'].gasRetailCreatedDate.value = currentDate;
        }
//        myCalendar.setDateFormat("%d/%m/%Y");
        tryNumberFormatCurrentcy(document.forms['gasRetailForm'].total, "VND");
        tryNumberFormatCurrentcy(document.forms['gasRetailForm'].paid, "VND");
        tryNumberFormatCurrentcy(document.forms['gasRetailForm'].debt, "VND");
        tryNumberFormatCurrentcy(document.forms['gasRetailForm'].discount, "VND");
        tryNumberFormatCurrentcy(document.forms['gasRetailForm'].totalPay, "VND");
        formatFormDetail('gasRetailForm');
        formatGasRetailPromotionMaterialQuantityDetail();
        formatGasRetailReturnShellQuantityDetail();
    });
}
function saveGasRetail() {
    if (scriptFunction == "saveGasRetail")
        return false;
    var quantity = document.forms['gasRetailForm'].quantity;
    if (quantity == null) {
        alert('Vui l\u00F2ng ch\u1ECDn h\u00E0ng h\u00F3a');
        return false;
    }
    var price = document.forms['gasRetailForm'].price;
    var amount = document.forms['gasRetailForm'].amount;
    if (quantity.length != null) {
        for (var i = 0; i < quantity.length; i++) {
            var number = Number(quantity[i].value);
            if (number == 0) {
                alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
                quantity[i].focus();
                quantity = null;
                return false;
            }
            reformatNumberMoney(quantity[i]);
            reformatNumberMoney(price[i]);
            reformatNumberMoney(amount[i]);
        }
    } else {
        if (quantity.value == "0") {
            alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
            quantity.focus();
            quantity = null;
            return false;
        }
        reformatNumberMoney(quantity);
        reformatNumberMoney(price);
        reformatNumberMoney(amount);
    }
    quantity = null;
    price = null;
    amount = null;
    reformatNumberMoney(document.forms['gasRetailForm'].total);
    reformatNumberMoney(document.forms['gasRetailForm'].paid);
    reformatNumberMoney(document.forms['gasRetailForm'].debt);
    reformatNumberMoney(document.forms['gasRetailForm'].discount);
    reformatNumberMoney(document.forms['gasRetailForm'].totalPay);
    reformatFormDetail('gasRetailForm');
    reformatGasRetailPromotionMaterialQuantityDetail();
    reformatGasRetailReturnShellQuantityDetail();
    scriptFunction = "saveGasRetail";
    callAjaxCheckError("addGasRetail.do", null, document.forms['gasRetailForm'], function(data) {
        scriptFunction = "";
        loadGasRetailPanel();
    });
    return false;
}
function addGasRetailShell() {
    var shell = document.forms['gasRetailForm'].shellIdCombobox;
    if (shell == null && shell.selectedIndex == -1)
        shell = null;
    else
        shell = shell.options[shell.selectedIndex].value;
    if (shell == -1 || shell == 0)
        return false;
    var shellId = document.forms['gasRetailForm'].shellId;
    var existed = false;
    if (shellId != null) {
        if (shellId.length != null) {
            for (i = 0; i < shellId.length; i++) {
                if (shellId[i].value == shell) {
                    existed = true;
                    break;
                }
            }
        } else if (shellId.value == shell)
            existed = true;
    }
    shellId = null;
    if (existed == true) {
        alert("H\u00E0ng ho\u00E1 \u0111\u00E3 t\u1ED3n t\u1EA1i");
        return false;
    }
    callAjax("getGasRetailShell.do?shellId=" + shell, null, null, function(data) {
        setAjaxData(data, 'gasRetailShellHideDiv');
        var matTable = document.getElementById('gasRetailShellTbl');
        var detTable = document.getElementById('gasRetailDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
        formatFormDetail('gasRetailForm');
    });
    return false;
}
function delGasRetail() {
    callAjaxCheckError('delGasRetail.do?gasRetailId=' + document.forms['gasRetailForm'].id.value, null, null, function() {
        loadGasRetailPanel();
    });
    return false;
}
function addGasRetailPromotionMaterial() {
    var promotionMaterial = document.forms['gasRetailForm'].promotionMaterialIdCombobox;
    if (promotionMaterial == null && promotionMaterial.selectedIndex == -1)
        promotionMaterial = null;
    else
        promotionMaterial = promotionMaterial.options[promotionMaterial.selectedIndex].value;
    if (promotionMaterial == -1 || promotionMaterial == 0)
        return false;
    var promotionMaterialId = document.forms['gasRetailForm'].promotionMaterialId;
    var existed = false;
    if (promotionMaterialId != null) {
        if (promotionMaterialId.length != null) {
            for (i = 0; i < promotionMaterialId.length; i++) {
                if (promotionMaterialId[i].value == promotionMaterial) {
                    existed = true;
                    break;
                }
            }
        } else if (promotionMaterialId.value == promotionMaterial)
            existed = true;
    }
    promotionMaterialId = null;
    if (existed == true) {
        alert("H\u00E0ng ho\u00E1 \u0111\u00E3 t\u1ED3n t\u1EA1i");
        return false;
    }
    callAjax("getGasRetailPromotionMaterial.do?promotionMaterialId=" + promotionMaterial, null, null, function(data) {
        setAjaxData(data, 'gasRetailPromotionMaterialHideDiv');
        var matTable = document.getElementById('gasRetailPromotionMaterialTbl');
        var detTable = document.getElementById('gasRetailPromotionMaterialDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
        formatGasRetailPromotionMaterialQuantityDetail();
    });
    return false;
}
function addGasRetailReturnShell() {
    var shell = document.forms['gasRetailForm'].returnShellIdCombobox;
    if (shell == null && shell.selectedIndex == -1)
        shell = null;
    else
        shell = shell.options[shell.selectedIndex].value;
    if (shell == -1 || shell == 0)
        return false;
    var shellId = document.forms['gasRetailForm'].returnShellId;
    var existed = false;
    if (shellId != null) {
        if (shellId.length != null) {
            for (i = 0; i < shellId.length; i++) {
                if (shellId[i].value == shell) {
                    existed = true;
                    break;
                }
            }
        } else if (shellId.value == shell)
            existed = true;
    }
    shellId = null;
    if (existed == true) {
        alert("H\u00E0ng ho\u00E1 \u0111\u00E3 t\u1ED3n t\u1EA1i");
        return false;
    }
    callAjax("getGasRetailReturnShell.do?shellId=" + shell, null, null, function(data) {
        setAjaxData(data, 'gasRetailReturnShellHideDiv');
        var matTable = document.getElementById('gasRetailReturnShellTbl');
        var detTable = document.getElementById('gasRetailReturnShellDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
        formatGasRetailReturnShellQuantityDetail();
    });
    return false;
}
function formatGasRetailPromotionMaterialQuantityDetail() {
    var quantity = document.forms['gasRetailForm'].promotionMaterialQuantity;
    if (quantity != null) {
        if (quantity.length != null) {
            for (var i = 0; i < quantity.length; i++) {
                tryNumberFormatCurrentcy(quantity[i], "VND");
            }
        } else {
            tryNumberFormatCurrentcy(quantity, "VND");
        }
    }
    quantity = null;
}
function formatGasRetailReturnShellQuantityDetail() {
    var quantity = document.forms['gasRetailForm'].returnShellQuantity;
    if (quantity != null) {
        if (quantity.length != null) {
            for (var i = 0; i < quantity.length; i++) {
                tryNumberFormatCurrentcy(quantity[i], "VND");
            }
        } else {
            tryNumberFormatCurrentcy(quantity, "VND");
        }
    }
    quantity = null;
}
function reformatGasRetailPromotionMaterialQuantityDetail() {
    var quantity = document.forms['gasRetailForm'].promotionMaterialQuantity;
    if (quantity != null) {
        if (quantity.length != null) {
            for (var i = 0; i < quantity.length; i++) {
                reformatNumberMoney(quantity[i]);
            }
        } else {
            reformatNumberMoney(quantity);
        }
    }
    quantity = null;
}
function reformatGasRetailReturnShellQuantityDetail() {
    var quantity = document.forms['gasRetailForm'].returnShellQuantity;
    if (quantity != null) {
        if (quantity.length != null) {
            for (var i = 0; i < quantity.length; i++) {
                reformatNumberMoney(quantity[i]);
            }
        } else {
            reformatNumberMoney(quantity);
        }
    }
    quantity = null;
}
function addCustomerRetail() {
    getCustomer(0, 'loadCustomerGasRetail', 1);
    return false;
}
function loadCustomerGasRetail() {
    callAjax("getCustomerListRetail.do", "gasRetailCustomerId", null, null);
    return false;
}
function loadSaleAccessoryPanel() {
    callAjax("getSaleAccessoryPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['saleAccessorySearchForm'].fromDate.value = currentTime;
        document.forms['saleAccessorySearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadSaleAccessoryList(currentTime, currentTime);
    });
    return false;
}
function loadSaleAccessoryList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('saleAccessoryList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("M\u00E3 phi\u1EBFu,Ng\u00E0y,T\u1ED5ng ti\u1EC1n,Thanh to\u00E1n,C\u00F2n n\u1EE3,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,100,150,150,*");
    mygrid.setColTypes("link,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getSaleAccessoryList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getSaleAccessory(id) {
    var url = 'saleAccessoryForm.do';
    if (id != 0)
        url += '?saleAccessoryId=' + id
    callAjax(url, null, null, function(data) {
        clearContent();
        setAjaxData(data, 'contentDiv');
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['saleAccessoryForm'].saleAccessoryCreatedDate.value = currentDate;
        }
        var myCalendar = new dhtmlXCalendarObject(["saleAccessoryCreatedDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");

        tryNumberFormatCurrentcy(document.forms['saleAccessoryForm'].total, "VND");
        tryNumberFormatCurrentcy(document.forms['saleAccessoryForm'].paid, "VND");
        tryNumberFormatCurrentcy(document.forms['saleAccessoryForm'].debt, "VND");
        tryNumberFormatCurrentcy(document.forms['saleAccessoryForm'].discount, "VND");
        tryNumberFormatCurrentcy(document.forms['saleAccessoryForm'].totalPay, "VND");
        formatFormDetail('saleAccessoryForm');
        formatSaleAccessoryChangeDetail();

        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        // ============================
        var accessoryIdCombobox = dhtmlXComboFromSelect("accessoryIdCombobox");
        accessoryIdCombobox.enableFilteringMode(true);
        accessoryIdCombobox.attachEvent("onSelectionChange", function() {
            setAccessorySelectedForm('saleAccessoryForm', accessoryIdCombobox.getComboText(), accessoryIdCombobox.getSelectedValue());
        });
        accessoryIdCombobox.attachEvent("onBlur", function() {
            setAccessorySelectedForm('saleAccessoryForm', accessoryIdCombobox.getComboText(), accessoryIdCombobox.getSelectedValue());
        });
        accessoryIdCombobox.DOMelem_input.onkeypress = function(event) {
            var key;
            if (window.event)
                key = window.event.keyCode;//IE
            else
                key = event.which;//firefox
            if (key == 13) {
                addSaleAccessoryGood();
                accessoryIdCombobox.setComboValue("");
            }
        }
        accessoryIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                accessoryIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        accessoryIdCombobox.setComboValue("");
        // ============================
        var changeGoodIdCombobox = dhtmlXComboFromSelect("changeGoodIdCombobox");
        changeGoodIdCombobox.enableFilteringMode(true);
        changeGoodIdCombobox.attachEvent("onSelectionChange", function() {
            setAccessoryChangeGoodSelectedForm('saleAccessoryForm', changeGoodIdCombobox.getComboText(), changeGoodIdCombobox.getSelectedValue());
        });
        changeGoodIdCombobox.attachEvent("onBlur", function() {
            setAccessoryChangeGoodSelectedForm('saleAccessoryForm', changeGoodIdCombobox.getComboText(), changeGoodIdCombobox.getSelectedValue());
        });
        changeGoodIdCombobox.DOMelem_input.onkeypress = function(event) {
            var key;
            if (window.event)
                key = window.event.keyCode;//IE
            else
                key = event.which;//firefox
            if (key == 13) {
                addSaleAccessoryChangeGood();
                changeGoodIdCombobox.setComboValue("");
            }
        }
        changeGoodIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                changeGoodIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        changeGoodIdCombobox.setComboValue("");
    });
}
function setAccessoryChangeGoodSelectedForm(form, text, value) {
    if (value == null) {
        if (text != "")
            value = "-1";
        else
            value = "0";
    }
    document.forms[form].changeGoodSelectedHidden.value = value;
}
function saveSaleAccessory() {
    if (scriptFunction == "saveSaleAccessory")
        return false;
    var quantity = document.forms['saleAccessoryForm'].quantity;
    if (quantity == null) {
        alert('Vui l\u00F2ng ch\u1ECDn h\u00E0ng h\u00F3a');
        return false;
    }
    var price = document.forms['saleAccessoryForm'].price;
    var amount = document.forms['saleAccessoryForm'].amount;
    if (quantity.length != null) {
        for (var i = 0; i < quantity.length; i++) {
            var number = Number(quantity[i].value);
            if (number == 0) {
                alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
                quantity[i].focus();
                quantity = null;
                return false;
            }
            reformatNumberMoney(quantity[i]);
            reformatNumberMoney(price[i]);
            reformatNumberMoney(amount[i]);
        }
    } else {
        if (quantity.value == "0") {
            alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
            quantity.focus();
            quantity = null;
            return false;
        }
        reformatNumberMoney(quantity);
        reformatNumberMoney(price);
        reformatNumberMoney(amount);
    }
    quantity = null;
    price = null;
    amount = null;
    reformatNumberMoney(document.forms['saleAccessoryForm'].total);
    reformatNumberMoney(document.forms['saleAccessoryForm'].paid);
    reformatNumberMoney(document.forms['saleAccessoryForm'].debt);
    reformatNumberMoney(document.forms['saleAccessoryForm'].discount);
    reformatNumberMoney(document.forms['saleAccessoryForm'].totalPay);
    reformatFormDetail('saleAccessoryForm');
    reformatSaleAccessoryChangeDetail();
    scriptFunction = "saveSaleAccessory";
    callAjaxCheckError("addSaleAccessory.do", null, document.forms['saleAccessoryForm'], function(data) {
        scriptFunction = "";
        loadSaleAccessoryPanel();
    });
    return false;
}
function addSaleAccessoryGood() {
    var good = document.forms['saleAccessoryForm'].accessorySelectedHidden.value;
    if (good == -1 || good == 0)
        return false;
    var goodId = document.forms['saleAccessoryForm'].goodId;
    var existed = false;
    if (goodId != null) {
        if (goodId.length != null) {
            for (i = 0; i < goodId.length; i++) {
                if (goodId[i].value == good) {
                    existed = true;
                    break;
                }
            }
        } else if (goodId.value == good)
            existed = true;
    }
    goodId = null;
    if (existed == true) {
        alert("H\u00E0ng ho\u00E1 \u0111\u00E3 t\u1ED3n t\u1EA1i");
        return false;
    }
    callAjax("getSaleAccessoryGood.do?goodId=" + good, null, null, function(data) {
        setAjaxData(data, 'saleAccessoryGoodHideDiv');
        var matTable = document.getElementById('saleAccessoryGoodTbl');
        var detTable = document.getElementById('saleAccessoryDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
        formatFormDetail('saleAccessoryForm');
    });
    return false;
}
function delSaleAccessory() {
    callAjaxCheckError('delSaleAccessory.do?saleAccessoryId=' + document.forms['saleAccessoryForm'].id.value, null, null, function() {
        loadSaleAccessoryPanel();
    });
    return false;
}
function addSaleAccessoryChangeGood() {
    var good = document.forms['saleAccessoryForm'].changeGoodSelectedHidden.value;
    if (good == -1 || good == 0)
        return false;
    var goodId = document.forms['saleAccessoryForm'].changeGoodId;
    var existed = false;
    if (goodId != null) {
        if (goodId.length != null) {
            for (i = 0; i < goodId.length; i++) {
                if (goodId[i].value == good) {
                    existed = true;
                    break;
                }
            }
        } else if (goodId.value == good)
            existed = true;
    }
    goodId = null;
    if (existed == true) {
        alert("H\u00E0ng ho\u00E1 \u0111\u00E3 t\u1ED3n t\u1EA1i");
        return false;
    }
    callAjax("getSaleAccessoryChangeGood.do?changeGoodId=" + good, null, null, function(data) {
        setAjaxData(data, 'saleAccessoryChangeGoodHideDiv');
        var matTable = document.getElementById('saleAccessoryChangeGoodTbl');
        var detTable = document.getElementById('saleAccessoryChangeGoodDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
        formatFormDetail('saleAccessoryForm');
    });
    return false;
}
function caculateSaleAccessoryListDetail(goodId) {
    var quantity = document.getElementById("detquantity" + goodId);
    var price = document.getElementById("detprice" + goodId);
    var detTotal = document.getElementById("detamount" + goodId);
    if (quantity == null || price == null || detTotal == null)
        return false;
    detTotal.value = reformatNumberMoneyString(quantity.value) * reformatNumberMoneyString(price.value);
    quantity = null;
    price = null;
    detTotal = null;
    caculateSaleAccessoryTotal();
    return false;
}
function caculateSaleAccessoryChangeListDetail(goodId) {
    var quantity = document.getElementById("detchangegoodquantity" + goodId);
    var price = document.getElementById("detchangegoodprice" + goodId);
    var detTotal = document.getElementById("detchangegoodamount" + goodId);
    if (quantity == null || price == null || detTotal == null)
        return false;
    detTotal.value = reformatNumberMoneyString(quantity.value) * reformatNumberMoneyString(price.value);
    quantity = null;
    price = null;
    detTotal = null;
    caculateSaleAccessoryTotal();
    return false;
}
function caculateSaleAccessoryTotal() {
    var quantity = document.forms['saleAccessoryForm'].quantity;
    var price = document.forms['saleAccessoryForm'].price;
    var amount = document.forms['saleAccessoryForm'].amount;
    var sum = 0;
    if (quantity != null) {
        if (quantity.length != null) {
            for (i = 0; i < quantity.length; i++) {
                sum += reformatNumberMoneyString(amount[i].value) * 1;
                tryNumberFormatCurrentcy(quantity[i], "VND");
                tryNumberFormatCurrentcy(price[i], "VND");
                tryNumberFormatCurrentcy(amount[i], "VND");
            }
        } else {
            sum += reformatNumberMoneyString(amount.value) * 1;
            tryNumberFormatCurrentcy(quantity, "VND");
            tryNumberFormatCurrentcy(price, "VND");
            tryNumberFormatCurrentcy(amount, "VND");
        }
    }

    quantity = document.forms['saleAccessoryForm'].changeGoodQuantity;
    price = document.forms['saleAccessoryForm'].changeGoodPrice;
    amount = document.forms['saleAccessoryForm'].changeGoodAmount;
    if (quantity != null) {
        if (quantity.length != null) {
            for (i = 0; i < quantity.length; i++) {
                sum -= reformatNumberMoneyString(amount[i].value) * 1;
                tryNumberFormatCurrentcy(quantity[i], "VND");
                tryNumberFormatCurrentcy(price[i], "VND");
                tryNumberFormatCurrentcy(amount[i], "VND");
            }
        } else {
            sum -= reformatNumberMoneyString(amount.value) * 1;
            tryNumberFormatCurrentcy(quantity, "VND");
            tryNumberFormatCurrentcy(price, "VND");
            tryNumberFormatCurrentcy(amount, "VND");
        }
    }

    quantity = null;
    price = null;
    amount = null;
    document.forms['saleAccessoryForm'].total.value = sum;
    document.forms['saleAccessoryForm'].discount.value = 0;
    document.forms['saleAccessoryForm'].totalPay.value = sum;
    document.forms['saleAccessoryForm'].paid.value = 0;
    document.forms['saleAccessoryForm'].debt.value = sum;
    tryNumberFormatCurrentcy(document.forms['saleAccessoryForm'].discount, "VND");
    tryNumberFormatCurrentcy(document.forms['saleAccessoryForm'].totalPay, "VND");
    tryNumberFormatCurrentcy(document.forms['saleAccessoryForm'].total, "VND");
    tryNumberFormatCurrentcy(document.forms['saleAccessoryForm'].debt, "VND");
    return false;
}
function reformatSaleAccessoryChangeDetail() {
    var quantity = document.forms['saleAccessoryForm'].changeGoodQuantity;
    var price = document.forms['saleAccessoryForm'].changeGoodPrice;
    var amount = document.forms['saleAccessoryForm'].changeGoodAmount;
    if (quantity != null) {
        if (quantity.length != null) {
            for (var i = 0; i < quantity.length; i++) {
                reformatNumberMoney(quantity[i]);
                reformatNumberMoney(price[i]);
                reformatNumberMoney(amount[i]);
            }
        } else {
            reformatNumberMoney(quantity);
            reformatNumberMoney(price);
            reformatNumberMoney(amount);
        }
    }
    quantity = null;
    price = null;
    amount = null;
}
function formatSaleAccessoryChangeDetail() {
    var quantity = document.forms['saleAccessoryForm'].changeGoodQuantity;
    var price = document.forms['saleAccessoryForm'].changeGoodPrice;
    var amount = document.forms['saleAccessoryForm'].changeGoodAmount;
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
}
function loadSalePetroPanel() {
    callAjax("getSalePetroPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['salePetroSearchForm'].fromDate.value = currentTime;
        document.forms['salePetroSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadSalePetroList(currentTime, currentTime);
    });
    return false;
}
function loadSalePetroList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('salePetroList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("M\u00E3 phi\u1EBFu,Ng\u00E0y,T\u1ED5ng ti\u1EC1n,Thanh to\u00E1n,C\u00F2n n\u1EE3,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,100,150,150,*");
    mygrid.setColTypes("link,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getSalePetroList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getSalePetro(id) {
    var url = 'salePetroForm.do';
    if (id != 0)
        url += '?salePetroId=' + id
    callAjax(url, null, null, function(data) {
        clearContent();
        setAjaxData(data, 'contentDiv');
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['salePetroForm'].salePetroCreatedDate.value = currentDate;
        }
        var myCalendar = new dhtmlXCalendarObject(["salePetroCreatedDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");

        tryNumberFormatCurrentcy(document.forms['salePetroForm'].total, "VND");
        tryNumberFormatCurrentcy(document.forms['salePetroForm'].paid, "VND");
        tryNumberFormatCurrentcy(document.forms['salePetroForm'].debt, "VND");
        tryNumberFormatCurrentcy(document.forms['salePetroForm'].discount, "VND");
        tryNumberFormatCurrentcy(document.forms['salePetroForm'].totalPay, "VND");
        formatFormDetail('salePetroForm');

        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        // ============================
        var petroIdCombobox = dhtmlXComboFromSelect("petroIdCombobox");
        petroIdCombobox.enableFilteringMode(true);
        petroIdCombobox.attachEvent("onSelectionChange", function() {
            setPetroSelectedForm('salePetroForm', petroIdCombobox.getComboText(), petroIdCombobox.getSelectedValue());
        });
        petroIdCombobox.attachEvent("onBlur", function() {
            setPetroSelectedForm('salePetroForm', petroIdCombobox.getComboText(), petroIdCombobox.getSelectedValue());
        });
        petroIdCombobox.DOMelem_input.onkeypress = function(event) {
            var key;
            if (window.event)
                key = window.event.keyCode;//IE
            else
                key = event.which;//firefox
            if (key == 13) {
                addSalePetroGood();
                petroIdCombobox.setComboValue("");
            }
        }
        petroIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                petroIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        petroIdCombobox.setComboValue("");
        // ============================
        var customerIdCombobox = dhtmlXComboFromSelect("customerIdCombobox");
        customerIdCombobox.enableFilteringMode(true);
        customerIdCombobox.attachEvent("onSelectionChange", function() {
            setCustomerSelectedForm('salePetroForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
        });
        customerIdCombobox.attachEvent("onBlur", function() {
            setCustomerSelectedForm('salePetroForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
            customerIdCombobox.setComboText(customerIdCombobox.getSelectedText());
        });
        customerIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                customerIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        if (id == 0) {
            customerIdCombobox.setComboValue("");
        } else {
            var customerId = document.forms['salePetroForm'].customerId.value;
            if (customerId != 0) {
                var ind = customerIdCombobox.getIndexByValue(customerId);
                customerIdCombobox.selectOption(ind);
            } else {
                customerIdCombobox.unSelectOption();
                customerIdCombobox.setComboValue("");
            }
        }
    });
}
function saveSalePetro() {
    if (scriptFunction == "saveSalePetro")
        return false;
    var quantity = document.forms['salePetroForm'].quantity;
    if (quantity == null) {
        alert('Vui l\u00F2ng ch\u1ECDn h\u00E0ng h\u00F3a');
        return false;
    }
    var price = document.forms['salePetroForm'].price;
    var amount = document.forms['salePetroForm'].amount;
    if (quantity.length != null) {
        for (var i = 0; i < quantity.length; i++) {
            var number = Number(quantity[i].value);
            if (number == 0) {
                alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
                quantity[i].focus();
                quantity = null;
                return false;
            }
            reformatNumberMoney(quantity[i]);
            reformatNumberMoney(price[i]);
            reformatNumberMoney(amount[i]);
        }
    } else {
        if (quantity.value == "0") {
            alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
            quantity.focus();
            quantity = null;
            return false;
        }
        reformatNumberMoney(quantity);
        reformatNumberMoney(price);
        reformatNumberMoney(amount);
    }
    quantity = null;
    price = null;
    amount = null;
    reformatNumberMoney(document.forms['salePetroForm'].total);
    reformatNumberMoney(document.forms['salePetroForm'].paid);
    reformatNumberMoney(document.forms['salePetroForm'].debt);
    reformatNumberMoney(document.forms['salePetroForm'].discount);
    reformatNumberMoney(document.forms['salePetroForm'].totalPay);
    reformatFormDetail('salePetroForm');
    document.forms['salePetroForm'].customerId.value = document.forms['salePetroForm'].customerSelectedHidden.value;
    scriptFunction = "saveSalePetro";
    callAjaxCheckError("addSalePetro.do", null, document.forms['salePetroForm'], function(data) {
        scriptFunction = "";
        loadSalePetroPanel();
    });
    return false;
}
function addSalePetroGood() {
    var good = document.forms['salePetroForm'].petroSelectedHidden.value;
    if (good == -1 || good == 0)
        return false;
    var goodId = document.forms['salePetroForm'].goodId;
    var existed = false;
    if (goodId != null) {
        if (goodId.length != null) {
            for (i = 0; i < goodId.length; i++) {
                if (goodId[i].value == good) {
                    existed = true;
                    break;
                }
            }
        } else if (goodId.value == good)
            existed = true;
    }
    goodId = null;
    if (existed == true) {
        alert("H\u00E0ng ho\u00E1 \u0111\u00E3 t\u1ED3n t\u1EA1i");
        return false;
    }
    callAjax("getSalePetroGood.do?goodId=" + good, null, null, function(data) {
        setAjaxData(data, 'salePetroGoodHideDiv');
        var matTable = document.getElementById('salePetroGoodTbl');
        var detTable = document.getElementById('salePetroDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
        formatFormDetail('salePetroForm');
    });
    return false;
}
function delSalePetro() {
    callAjaxCheckError('delSalePetro.do?salePetroId=' + document.forms['salePetroForm'].id.value, null, null, function() {
        loadSalePetroPanel();
    });
    return false;
}
function loadSaleShellPanel() {
    callAjax("getSaleShellPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['saleShellSearchForm'].fromDate.value = currentTime;
        document.forms['saleShellSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadSaleShellList(currentTime, currentTime);
    });
    return false;
}
function loadSaleShellList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('saleShellList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("M\u00E3 phi\u1EBFu,Ng\u00E0y,T\u1ED5ng ti\u1EC1n,Thanh to\u00E1n,C\u00F2n n\u1EE3,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,100,150,150,*");
    mygrid.setColTypes("link,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getSaleShellList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getSaleShell(id) {
    var url = 'saleShellForm.do';
    if (id != 0)
        url += '?saleShellId=' + id
    callAjax(url, null, null, function(data) {
        clearContent();
        setAjaxData(data, 'contentDiv');
        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        // ============================
        var shellIdCombobox = dhtmlXComboFromSelect("goodIdCombobox");
        shellIdCombobox.enableFilteringMode(true);
        shellIdCombobox.attachEvent("onSelectionChange", function() {
            setShellSelectedForm('saleShellForm', shellIdCombobox.getComboText(), shellIdCombobox.getSelectedValue());
        });
        shellIdCombobox.attachEvent("onBlur", function() {
            setShellSelectedForm('saleShellForm', shellIdCombobox.getComboText(), shellIdCombobox.getSelectedValue());
        });
        shellIdCombobox.DOMelem_input.onkeypress = function(event) {
            var key;
            if (window.event)
                key = window.event.keyCode;//IE
            else
                key = event.which;//firefox
            if (key == 13) {
                addSaleShellGood();
                shellIdCombobox.setComboValue("");
            }
        }
        shellIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                shellIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        shellIdCombobox.setComboValue("");
        // ============================
        var customerIdCombobox = dhtmlXComboFromSelect("customerIdCombobox");
        customerIdCombobox.enableFilteringMode(true);
        customerIdCombobox.attachEvent("onSelectionChange", function() {
            setCustomerSelectedForm('saleShellForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
        });
        customerIdCombobox.attachEvent("onBlur", function() {
            setCustomerSelectedForm('saleShellForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
            customerIdCombobox.setComboText(customerIdCombobox.getSelectedText());
        });
        customerIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                customerIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        if (id == 0) {
            customerIdCombobox.setComboValue("");
        } else {
            var customerId = document.forms['saleShellForm'].customerId.value;
            if (customerId != 0) {
                var ind = customerIdCombobox.getIndexByValue(customerId);
                customerIdCombobox.selectOption(ind);
            } else {
                customerIdCombobox.unSelectOption();
                customerIdCombobox.setComboValue("");
            }
        }
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['saleShellForm'].saleShellCreatedDate.value = currentDate;
        }
        var myCalendar = new dhtmlXCalendarObject(["saleShellCreatedDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");

        tryNumberFormatCurrentcy(document.forms['saleShellForm'].total, "VND");
        tryNumberFormatCurrentcy(document.forms['saleShellForm'].paid, "VND");
        tryNumberFormatCurrentcy(document.forms['saleShellForm'].debt, "VND");
        tryNumberFormatCurrentcy(document.forms['saleShellForm'].discount, "VND");
        tryNumberFormatCurrentcy(document.forms['saleShellForm'].totalPay, "VND");
        formatFormDetail('saleShellForm');
    });
}
function saveSaleShell() {
    if (scriptFunction == "saveSaleShell")
        return false;
    var quantity = document.forms['saleShellForm'].quantity;
    if (quantity == null) {
        alert('Vui l\u00F2ng ch\u1ECDn h\u00E0ng h\u00F3a');
        return false;
    }
    var price = document.forms['saleShellForm'].price;
    var amount = document.forms['saleShellForm'].amount;
    if (quantity.length != null) {
        for (var i = 0; i < quantity.length; i++) {
            var number = Number(quantity[i].value);
            if (number == 0) {
                alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
                quantity[i].focus();
                quantity = null;
                return false;
            }
            reformatNumberMoney(quantity[i]);
            reformatNumberMoney(price[i]);
            reformatNumberMoney(amount[i]);
        }
    } else {
        if (quantity.value == "0") {
            alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
            quantity.focus();
            quantity = null;
            return false;
        }
        reformatNumberMoney(quantity);
        reformatNumberMoney(price);
        reformatNumberMoney(amount);
    }
    quantity = null;
    price = null;
    amount = null;
    reformatNumberMoney(document.forms['saleShellForm'].total);
    reformatNumberMoney(document.forms['saleShellForm'].paid);
    reformatNumberMoney(document.forms['saleShellForm'].debt);
    reformatNumberMoney(document.forms['saleShellForm'].discount);
    reformatNumberMoney(document.forms['saleShellForm'].totalPay);
    reformatFormDetail('saleShellForm');
    document.forms['saleShellForm'].customerId.value = document.forms['saleShellForm'].customerSelectedHidden.value;
    scriptFunction = "saveSaleShell";
    callAjaxCheckError("addSaleShell.do", null, document.forms['saleShellForm'], function(data) {
        scriptFunction = "";
        loadSaleShellPanel();
    });
    return false;
}
function addSaleShellGood() {
    var good = document.forms['saleShellForm'].shellSelectedHidden.value;
    if (good == -1 || good == 0)
        return false;
    var goodId = document.forms['saleShellForm'].goodId;
    var existed = false;
    if (goodId != null) {
        if (goodId.length != null) {
            for (i = 0; i < goodId.length; i++) {
                if (goodId[i].value == good) {
                    existed = true;
                    break;
                }
            }
        } else if (goodId.value == good)
            existed = true;
    }
    goodId = null;
    if (existed == true) {
        alert("H\u00E0ng ho\u00E1 \u0111\u00E3 t\u1ED3n t\u1EA1i");
        return false;
    }
    callAjax("getSaleShellGood.do?goodId=" + good, null, null, function(data) {
        setAjaxData(data, 'saleShellGoodHideDiv');
        var matTable = document.getElementById('saleShellGoodTbl');
        var detTable = document.getElementById('saleShellDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
        formatFormDetail('saleShellForm');
    });
    return false;
}
function delSaleShell() {
    callAjaxCheckError('delSaleShell.do?saleShellId=' + document.forms['saleShellForm'].id.value, null, null, function() {
        loadSaleShellPanel();
    });
    return false;
}
function loadOldShellPanel() {
    callAjax("getOldShellPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['oldShellSearchForm'].fromDate.value = currentTime;
        document.forms['oldShellSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadOldShellList(currentTime, currentTime);
    });
    return false;
}
function loadOldShellList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('oldShellList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("S\u1ED1 phi\u1EBFu,Ng\u00E0y,S\u1ED1 l\u01B0\u1EE3ng,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,150,200,*");
    mygrid.setColTypes("link,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getOldShellList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getOldShell(id) {
    var url = 'oldShellForm.do';
    if (id != 0)
        url += '?oldShellId=' + id
    callAjax(url, null, null, function(data) {
        clearContent();
        setAjaxData(data, 'contentDiv');
        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        var shellIdCombobox = dhtmlXComboFromSelect("shellIdCombobox");
        shellIdCombobox.enableFilteringMode(true);
        shellIdCombobox.attachEvent("onSelectionChange", function() {
            setShellSelectedForm('oldShellForm', shellIdCombobox.getComboText(), shellIdCombobox.getSelectedValue());
        });
        shellIdCombobox.attachEvent("onBlur", function() {
            setShellSelectedForm('oldShellForm', shellIdCombobox.getComboText(), shellIdCombobox.getSelectedValue());
            shellIdCombobox.setComboText(shellIdCombobox.getSelectedText());
        });
        shellIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                shellIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        if (id == 0) {
            shellIdCombobox.setComboValue("");
        } else {
            var shellId = document.forms['oldShellForm'].shellId.value;
            if (shellId != 0) {
                var ind = shellIdCombobox.getIndexByValue(shellId);
                shellIdCombobox.selectOption(ind);
            } else {
                shellIdCombobox.unSelectOption();
                shellIdCombobox.setComboValue("");
            }
        }

        tryNumberFormatCurrentcy(document.forms['oldShellForm'].quantity, "VND");
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['oldShellForm'].oldShellDate.value = currentDate;
        }
        var myCalendar = new dhtmlXCalendarObject(["oldShellDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");
    });
}
function saveOldShell() {
    if (scriptFunction == "saveOldShell")
        return false;
    var field = document.forms['oldShellForm'].quantity;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    reformatNumberMoney(document.forms['oldShellForm'].quantity);
    document.forms['oldShellForm'].shellId.value = document.forms['oldShellForm'].shellSelectedHidden.value;
    scriptFunction = "saveOldShell";
    callAjaxCheckError("addOldShell.do", null, document.forms['oldShellForm'], function(data) {
        scriptFunction = "";
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getOldShell(0);
        else
            loadOldShellPanel();
    });
    return false;
}
function delOldShell() {
    callAjaxCheckError('delOldShell.do?oldShellId=' + document.forms['oldShellForm'].id.value, null, null, function() {
        loadOldShellPanel();
        prepareHidePopup('oldShellFormshowHelpHideDiv');
    });
    return false;
}
function loadShellReturnPanel() {
    callAjax("getShellReturnPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['shellReturnSearchForm'].fromDate.value = currentTime;
        document.forms['shellReturnSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadShellReturnList(currentTime, currentTime);
    });
    return false;
}
function loadShellReturnList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('shellReturnList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("S\u1ED1 phi\u1EBFu,Ng\u00E0y,Kh\u00E1ch h\u00E0ng,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#select_filter,#select_filter,#text_filter");
    mygrid.setInitWidths("150,200,200,*");
    mygrid.setColTypes("link,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getShellReturnList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getShellReturn(id) {
    var url = 'shellReturnForm.do';
    if (id != 0)
        url += '?shellReturnId=' + id
    callAjax(url, null, null, function(data) {
        clearContent();
        setAjaxData(data, 'contentDiv');
        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        var shellIdCombobox = dhtmlXComboFromSelect("shellIdCombobox");
        shellIdCombobox.enableFilteringMode(true);
        shellIdCombobox.attachEvent("onSelectionChange", function() {
            setShellSelectedForm('shellReturnForm', shellIdCombobox.getComboText(), shellIdCombobox.getSelectedValue());
        });
        shellIdCombobox.attachEvent("onBlur", function() {
            setShellSelectedForm('shellReturnForm', shellIdCombobox.getComboText(), shellIdCombobox.getSelectedValue());
        });
        shellIdCombobox.DOMelem_input.onkeypress = function(event) {
            var key;
            if (window.event)
                key = window.event.keyCode;//IE
            else
                key = event.which;//firefox
            if (key == 13) {
                addShellReturnShell();
                shellIdCombobox.setComboValue("");
            }
        }
        shellIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                shellIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        shellIdCombobox.setComboValue("");
        // ============================
        var customerIdCombobox = dhtmlXComboFromSelect("customerIdCombobox");
        customerIdCombobox.enableFilteringMode(true);
        customerIdCombobox.attachEvent("onSelectionChange", function() {
            setCustomerSelectedForm('shellReturnForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
        });
        customerIdCombobox.attachEvent("onBlur", function() {
            setCustomerSelectedForm('shellReturnForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
            customerIdCombobox.setComboText(customerIdCombobox.getSelectedText());
        });
        customerIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                customerIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        if (id == 0) {
            customerIdCombobox.setComboValue("");
        } else {
            var customerId = document.forms['shellReturnForm'].customerId.value;
            if (customerId != 0) {
                var ind = customerIdCombobox.getIndexByValue(customerId);
                customerIdCombobox.selectOption(ind);
            } else {
                customerIdCombobox.unSelectOption();
                customerIdCombobox.setComboValue("");
            }
        }
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['shellReturnForm'].shellReturnCreatedDate.value = currentDate;
        }
        var myCalendar = new dhtmlXCalendarObject(["shellReturnCreatedDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");

        formatShellReturnDetail();
    });
}
function saveShellReturn() {
    if (scriptFunction == "saveShellReturn")
        return false;
    var quantity = document.forms['shellReturnForm'].quantity;
    if (quantity == null) {
        alert('Vui l\u00F2ng ch\u1ECDn h\u00E0ng h\u00F3a');
        return false;
    }
    if (quantity.length != null) {
        for (var i = 0; i < quantity.length; i++) {
            var number = Number(quantity[i].value);
            if (number == 0) {
                alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
                quantity[i].focus();
                quantity = null;
                return false;
            }
            reformatNumberMoney(quantity[i]);
        }
    } else {
        if (quantity.value == "0") {
            alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
            quantity.focus();
            quantity = null;
            return false;
        }
        reformatNumberMoney(quantity);
    }
    quantity = null;
    document.forms['shellReturnForm'].customerId.value = document.forms['shellReturnForm'].customerSelectedHidden.value;
    scriptFunction = "saveShellReturn";
    callAjaxCheckError("addShellReturn.do", null, document.forms['shellReturnForm'], function(data) {
        scriptFunction = "";
        loadShellReturnPanel();
    });
    return false;
}
function addShellReturnShell() {
    var shell = document.forms['shellReturnForm'].shellSelectedHidden.value;
    if (shell == -1 || shell == 0)
        return false;
    var shellId = document.forms['shellReturnForm'].shellId;
    var existed = false;
    if (shellId != null) {
        if (shellId.length != null) {
            for (i = 0; i < shellId.length; i++) {
                if (shellId[i].value == shell) {
                    existed = true;
                    break;
                }
            }
        } else if (shellId.value == shell)
            existed = true;
    }
    shellId = null;
    if (existed == true) {
        alert("H\u00E0ng ho\u00E1 \u0111\u00E3 t\u1ED3n t\u1EA1i");
        return false;
    }
    callAjax("getShellReturnShell.do?shellId=" + shell, null, null, function(data) {
        setAjaxData(data, 'shellReturnShellHideDiv');
        var matTable = document.getElementById('shellReturnShellTbl');
        var detTable = document.getElementById('shellReturnDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
        formatShellReturnDetail();
    });
    return false;
}
function delShellReturn() {
    callAjaxCheckError('delShellReturn.do?shellReturnId=' + document.forms['shellReturnForm'].id.value, null, null, function() {
        loadShellReturnPanel();
    });
    return false;
}
function formatShellReturnDetail() {
    var quantity = document.forms['shellReturnForm'].quantity;
    if (quantity != null) {
        if (quantity.length != null) {
            for (var i = 0; i < quantity.length; i++) {
                tryNumberFormatCurrentcy(quantity[i], "VND");
            }
        } else {
            tryNumberFormatCurrentcy(quantity, "VND");
        }
    }
    quantity = null;
}
function loadGasReturnPanel() {
    callAjax("getGasReturnPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['gasReturnSearchForm'].fromDate.value = currentTime;
        document.forms['gasReturnSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadGasReturnList(currentTime, currentTime);
    });
    return false;
}
function loadGasReturnList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('gasReturnList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("M\u00E3 phi\u1EBFu,Ng\u00E0y,T\u1ED5ng ti\u1EC1n,Thanh to\u00E1n,C\u00F2n n\u1EE3,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,100,150,150,*");
    mygrid.setColTypes("link,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getGasReturnList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getGasReturn(id) {
    var url = 'gasReturnForm.do';
    if (id != 0)
        url += '?gasReturnId=' + id
    callAjax(url, null, null, function(data) {
        clearContent();
        setAjaxData(data, 'contentDiv');
//        var myCalendar = new dhtmlXCalendarObject(["gasReturnCreatedDate"]);
//        myCalendar.setSkin('dhx_web');
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['gasReturnForm'].gasReturnCreatedDate.value = currentDate;
        }
//        myCalendar.setDateFormat("%d/%m/%Y");
        tryNumberFormatCurrentcy(document.forms['gasReturnForm'].total, "VND");
        tryNumberFormatCurrentcy(document.forms['gasReturnForm'].paid, "VND");
        tryNumberFormatCurrentcy(document.forms['gasReturnForm'].debt, "VND");
        tryNumberFormatCurrentcy(document.forms['gasReturnForm'].discount, "VND");
        tryNumberFormatCurrentcy(document.forms['gasReturnForm'].totalPay, "VND");
        formatFormDetail('gasReturnForm');
    });
}
function saveGasReturn() {
    if (scriptFunction == "saveGasReturn")
        return false;
    var quantity = document.forms['gasReturnForm'].quantity;
    if (quantity == null) {
        alert('Vui l\u00F2ng ch\u1ECDn h\u00E0ng h\u00F3a');
        return false;
    }
    var price = document.forms['gasReturnForm'].price;
    var amount = document.forms['gasReturnForm'].amount;
    if (quantity.length != null) {
        for (var i = 0; i < quantity.length; i++) {
            var number = Number(quantity[i].value);
            if (number == 0) {
                alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
                quantity[i].focus();
                quantity = null;
                return false;
            }
            reformatNumberMoney(quantity[i]);
            reformatNumberMoney(price[i]);
            reformatNumberMoney(amount[i]);
        }
    } else {
        if (quantity.value == "0") {
            alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
            quantity.focus();
            quantity = null;
            return false;
        }
        reformatNumberMoney(quantity);
        reformatNumberMoney(price);
        reformatNumberMoney(amount);
    }
    quantity = null;
    price = null;
    amount = null;
    reformatNumberMoney(document.forms['gasReturnForm'].total);
    reformatNumberMoney(document.forms['gasReturnForm'].paid);
    reformatNumberMoney(document.forms['gasReturnForm'].debt);
    reformatNumberMoney(document.forms['gasReturnForm'].discount);
    reformatNumberMoney(document.forms['gasReturnForm'].totalPay);
    reformatFormDetail('gasReturnForm');
    scriptFunction = "saveGasReturn";
    callAjaxCheckError("addGasReturn.do", null, document.forms['gasReturnForm'], function(data) {
        scriptFunction = "";
        loadGasReturnPanel();
    });
    return false;
}
function addGasReturnGood() {
    var good = document.forms['gasReturnForm'].goodIdCombobox;
    if (good == null && good.selectedIndex == -1)
        good = null;
    else
        good = good.options[good.selectedIndex].value;
    if (good == -1 || good == 0)
        return false;
    var goodId = document.forms['gasReturnForm'].goodId;
    var existed = false;
    if (goodId != null) {
        if (goodId.length != null) {
            for (i = 0; i < goodId.length; i++) {
                if (goodId[i].value == good) {
                    existed = true;
                    break;
                }
            }
        } else if (goodId.value == good)
            existed = true;
    }
    goodId = null;
    if (existed == true) {
        alert("H\u00E0ng ho\u00E1 \u0111\u00E3 t\u1ED3n t\u1EA1i");
        return false;
    }
    callAjax("getGasReturnGood.do?goodId=" + good, null, null, function(data) {
        setAjaxData(data, 'gasReturnGoodHideDiv');
        var matTable = document.getElementById('gasReturnGoodTbl');
        var detTable = document.getElementById('gasReturnDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
        formatFormDetail('gasReturnForm');
    });
    return false;
}
function delGasReturn() {
    callAjaxCheckError('delGasReturn.do?gasReturnId=' + document.forms['gasReturnForm'].id.value, null, null, function() {
        loadGasReturnPanel();
    });
    return false;
}
function loadShellReturnSupplierPanel() {
    callAjax("getShellReturnSupplierPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['shellReturnSupplierSearchForm'].fromDate.value = currentTime;
        document.forms['shellReturnSupplierSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadShellReturnSupplierList(currentTime, currentTime);
    });
    return false;
}
function loadShellReturnSupplierList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('shellReturnSupplierList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("S\u1ED1 phi\u1EBFu,Ng\u00E0y,Nh\u00E0 cung c\u1EA5p,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#select_filter,#select_filter,#text_filter");
    mygrid.setInitWidths("150,200,200,*");
    mygrid.setColTypes("link,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getShellReturnSupplierList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getShellReturnSupplier(id) {
    var url = 'shellReturnSupplierForm.do';
    if (id != 0)
        url += '?shellReturnSupplierId=' + id
    callAjax(url, null, null, function(data) {
        clearContent();
        setAjaxData(data, 'contentDiv');
        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        var shellIdCombobox = dhtmlXComboFromSelect("shellIdCombobox");
        shellIdCombobox.enableFilteringMode(true);
        shellIdCombobox.attachEvent("onSelectionChange", function() {
            setShellSelectedForm('shellReturnSupplierForm', shellIdCombobox.getComboText(), shellIdCombobox.getSelectedValue());
        });
        shellIdCombobox.attachEvent("onBlur", function() {
            setShellSelectedForm('shellReturnSupplierForm', shellIdCombobox.getComboText(), shellIdCombobox.getSelectedValue());
        });
        shellIdCombobox.DOMelem_input.onkeypress = function(event) {
            var key;
            if (window.event)
                key = window.event.keyCode;//IE
            else
                key = event.which;//firefox
            if (key == 13) {
                addShellReturnSupplierShell();
                shellIdCombobox.setComboValue("");
            }
        }
        shellIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                shellIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        shellIdCombobox.setComboValue("");
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['shellReturnSupplierForm'].shellReturnSupplierCreatedDate.value = currentDate;
        }
        var myCalendar = new dhtmlXCalendarObject(["shellReturnSupplierCreatedDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");
        formatShellReturnSupplierDetail();
    });
}
function saveShellReturnSupplier() {
    if (scriptFunction == "saveShellReturnSupplier")
        return false;
    var quantity = document.forms['shellReturnSupplierForm'].quantity;
    if (quantity == null) {
        alert('Vui l\u00F2ng ch\u1ECDn h\u00E0ng h\u00F3a');
        return false;
    }
    if (quantity.length != null) {
        for (var i = 0; i < quantity.length; i++) {
            var number = Number(quantity[i].value);
            if (number == 0) {
                alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
                quantity[i].focus();
                quantity = null;
                return false;
            }
            reformatNumberMoney(quantity[i]);
        }
    } else {
        if (quantity.value == "0") {
            alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
            quantity.focus();
            quantity = null;
            return false;
        }
        reformatNumberMoney(quantity);
    }
    quantity = null;
    scriptFunction = "saveShellReturnSupplier";
    callAjaxCheckError("addShellReturnSupplier.do", null, document.forms['shellReturnSupplierForm'], function(data) {
        scriptFunction = "";
        loadShellReturnSupplierPanel();
    });
    return false;
}
function addShellReturnSupplierShell() {
    var shell = document.forms['shellReturnSupplierForm'].shellSelectedHidden.value;
    if (shell == -1 || shell == 0)
        return false;
    var shellId = document.forms['shellReturnSupplierForm'].shellId;
    var existed = false;
    if (shellId != null) {
        if (shellId.length != null) {
            for (i = 0; i < shellId.length; i++) {
                if (shellId[i].value == shell) {
                    existed = true;
                    break;
                }
            }
        } else if (shellId.value == shell)
            existed = true;
    }
    shellId = null;
    if (existed == true) {
        alert("H\u00E0ng ho\u00E1 \u0111\u00E3 t\u1ED3n t\u1EA1i");
        return false;
    }
    callAjax("getShellReturnSupplierShell.do?shellId=" + shell, null, null, function(data) {
        setAjaxData(data, 'shellReturnSupplierShellHideDiv');
        var matTable = document.getElementById('shellReturnSupplierShellTbl');
        var detTable = document.getElementById('shellReturnSupplierDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
        formatShellReturnSupplierDetail();
    });
    return false;
}
function delShellReturnSupplier() {
    callAjaxCheckError('delShellReturnSupplier.do?shellReturnSupplierId=' + document.forms['shellReturnSupplierForm'].id.value, null, null, function() {
        loadShellReturnSupplierPanel();
    });
    return false;
}
function formatShellReturnSupplierDetail() {
    var quantity = document.forms['shellReturnSupplierForm'].quantity;
    if (quantity != null) {
        if (quantity.length != null) {
            for (var i = 0; i < quantity.length; i++) {
                tryNumberFormatCurrentcy(quantity[i], "VND");
            }
        } else {
            tryNumberFormatCurrentcy(quantity, "VND");
        }
    }
    quantity = null;
}
function loadVehicleOutPanel() {
    callAjax("getVehicleOutPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['vehicleOutSearchForm'].fromDate.value = currentTime;
        document.forms['vehicleOutSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadVehicleOutList(currentTime, currentTime);
    });
    return false;
}
function loadVehicleOutList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('vehicleOutList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("M\u00E3 phi\u1EBFu,Ng\u00E0y,S\u1ED1 xe,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#select_filter,#text_filter");
    mygrid.setInitWidths("150,100,150,*");
    mygrid.setColTypes("link,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getVehicleOutList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getVehicleOut(id) {
    var url = 'vehicleOutForm.do';
    if (id != 0)
        url += '?vehicleOutId=' + id
    callAjax(url, null, null, function(data) {
        clearContent();
        setAjaxData(data, 'contentDiv');
        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        var shellIdCombobox = dhtmlXComboFromSelect("goodIdCombobox");
        shellIdCombobox.enableFilteringMode(true);
        shellIdCombobox.attachEvent("onSelectionChange", function() {
            setShellSelectedForm('vehicleOutForm', shellIdCombobox.getComboText(), shellIdCombobox.getSelectedValue());
        });
        shellIdCombobox.attachEvent("onBlur", function() {
            setShellSelectedForm('vehicleOutForm', shellIdCombobox.getComboText(), shellIdCombobox.getSelectedValue());
        });
        shellIdCombobox.DOMelem_input.onkeypress = function(event) {
            var key;
            if (window.event)
                key = window.event.keyCode;//IE
            else
                key = event.which;//firefox
            if (key == 13) {
                addVehicleOutGood();
                shellIdCombobox.setComboValue("");
            }
        }
        shellIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                shellIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        shellIdCombobox.setComboValue("");
        // ============================
        var employeeIdCombobox = dhtmlXComboFromSelect("employeeIdCombobox");
        employeeIdCombobox.enableFilteringMode(true);
        employeeIdCombobox.attachEvent("onSelectionChange", function() {
            setEmployeeSelectedForm('vehicleOutForm', employeeIdCombobox.getComboText(), employeeIdCombobox.getSelectedValue());
        });
        employeeIdCombobox.attachEvent("onBlur", function() {
            setEmployeeSelectedForm('vehicleOutForm', employeeIdCombobox.getComboText(), employeeIdCombobox.getSelectedValue());
        });
        employeeIdCombobox.DOMelem_input.onkeypress = function(event) {
            var key;
            if (window.event)
                key = window.event.keyCode;//IE
            else
                key = event.which;//firefox
            if (key == 13) {
                addVehicleOutEmployee();
                employeeIdCombobox.setComboValue("");
            }
        }
        employeeIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                employeeIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        employeeIdCombobox.setComboValue("");
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['vehicleOutForm'].vehicleOutCreatedDate.value = currentDate;
            shellIdCombobox.openSelect();
        }
        var myCalendar = new dhtmlXCalendarObject(["vehicleOutCreatedDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");
        formatFormDetail('vehicleOutForm');
    });
}
function saveVehicleOut() {
    if (scriptFunction == "saveVehicleOut")
        return false;
    var quantity = document.forms['vehicleOutForm'].quantity;
    if (quantity == null) {
        alert('Vui l\u00F2ng ch\u1ECDn h\u00E0ng h\u00F3a');
        return false;
    }
//    var price = document.forms['vehicleOutForm'].price;
//    var amount = document.forms['vehicleOutForm'].amount;
    if (quantity.length != null) {
        for (var i = 0; i < quantity.length; i++) {
            var number = Number(quantity[i].value);
            if (number == 0) {
                alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
                quantity[i].focus();
                quantity = null;
                return false;
            }
        }
    } else {
        if (quantity.value == "0") {
            alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
            quantity.focus();
            quantity = null;
            return false;
        }
    }
    quantity = null;
//    price = null;
//    amount = null;
    reformatFormDetail('vehicleOutForm');
    scriptFunction = "saveVehicleOut";
    callAjaxCheckError("addVehicleOut.do", null, document.forms['vehicleOutForm'], function(data) {
        scriptFunction = "";
        loadVehicleOutPanel();
    });
    return false;
}
function addVehicleOutGood() {
    var good = document.forms['vehicleOutForm'].shellSelectedHidden.value;
    if (good == -1 || good == 0)
        return false;
    var goodId = document.forms['vehicleOutForm'].shellId;
    var existed = false;
    if (goodId != null) {
        if (goodId.length != null) {
            for (i = 0; i < goodId.length; i++) {
                if (goodId[i].value == good) {
                    existed = true;
                    break;
                }
            }
        } else if (goodId.value == good)
            existed = true;
    }
    goodId = null;
    if (existed == true) {
        alert("H\u00E0ng ho\u00E1 \u0111\u00E3 t\u1ED3n t\u1EA1i");
        return false;
    }
    callAjax("getVehicleOutGood.do?shellId=" + good, null, null, function(data) {
        setAjaxData(data, 'vehicleOutGoodHideDiv');
        var matTable = document.getElementById('vehicleOutGoodTbl');
        var detTable = document.getElementById('vehicleOutDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
        formatFormDetail('vehicleOutForm');
    });
    return false;
}
function delVehicleOut() {
    callAjaxCheckError('delVehicleOut.do?vehicleOutId=' + document.forms['vehicleOutForm'].id.value, null, null, function() {
        loadVehicleOutPanel();
    });
    return false;
}
function addVehicleOutEmployee() {
    var employee = document.forms['vehicleOutForm'].employeeSelectedHidden.value;
    if (employee == -1 || employee == 0)
        return false;
    var employeeId = document.forms['vehicleOutForm'].employeeId;
    var existed = false;
    if (employeeId != null) {
        if (employeeId.length != null) {
            for (i = 0; i < employeeId.length; i++) {
                if (employeeId[i].value == employee) {
                    existed = true;
                    break;
                }
            }
        } else if (employeeId.value == employee)
            existed = true;
    }
    employeeId = null;
    if (existed == true) {
        alert("H\u00E0ng ho\u00E1 \u0111\u00E3 t\u1ED3n t\u1EA1i");
        return false;
    }
    callAjax("getVehicleOutEmployee.do?employeeId=" + employee, null, null, function(data) {
        setAjaxData(data, 'vehicleOutEmployeeHideDiv');
        var matTable = document.getElementById('vehicleOutEmployeeTbl');
        var detTable = document.getElementById('vehicleOutEmployeeDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
    });
    return false;
}
function loadVehicleInPanel() {
    callAjax("getVehicleInPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['vehicleInSearchForm'].fromDate.value = currentTime;
        document.forms['vehicleInSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadVehicleInList(currentTime, currentTime);
    });
    return false;
}
function loadVehicleInList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('vehicleInList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("M\u00E3 phi\u1EBFu,Ng\u00E0y,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,100,*");
    mygrid.setColTypes("link,ro,ro");
    mygrid.setColSorting("str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getVehicleInList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getVehicleIn(id) {
    var url = 'vehicleInForm.do?vehicleOutSavedDate=' + savedDate2;
    if (id != 0)
        url += '&vehicleInId=' + id
    callAjax(url, null, null, function(data) {
        clearContent();
        setAjaxData(data, 'contentDiv');
        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        var shellIdCombobox = dhtmlXComboFromSelect("goodIdCombobox");
        shellIdCombobox.enableFilteringMode(true);
        shellIdCombobox.attachEvent("onSelectionChange", function() {
            setShellSelectedForm('vehicleInForm', shellIdCombobox.getComboText(), shellIdCombobox.getSelectedValue());
        });
        shellIdCombobox.attachEvent("onBlur", function() {
            setShellSelectedForm('vehicleInForm', shellIdCombobox.getComboText(), shellIdCombobox.getSelectedValue());
        });
        shellIdCombobox.DOMelem_input.onkeypress = function(event) {
            var key;
            if (window.event)
                key = window.event.keyCode;//IE
            else
                key = event.which;//firefox
            if (key == 13) {
                addVehicleInGood();
                shellIdCombobox.setComboValue("");
            }
        }
        shellIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                shellIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        shellIdCombobox.setComboValue("");
        /*
         // ============================
         var returnShellIdCombobox = dhtmlXComboFromSelect("returnShellIdCombobox");
         returnShellIdCombobox.enableFilteringMode(true);
         returnShellIdCombobox.attachEvent("onSelectionChange", function() {
         setReturnShellSelectedForm('vehicleInForm', returnShellIdCombobox.getComboText(), returnShellIdCombobox.getSelectedValue());
         });
         returnShellIdCombobox.attachEvent("onBlur", function() {
         setReturnShellSelectedForm('vehicleInForm', returnShellIdCombobox.getComboText(), returnShellIdCombobox.getSelectedValue());
         });
         returnShellIdCombobox.DOMelem_input.onkeypress = function(event) {
         var key;
         if (window.event)
         key = window.event.keyCode;//IE
         else
         key = event.which;//firefox
         if (key == 13) {
         addVehicleInReturnShell();
         returnShellIdCombobox.setComboValue("");
         }
         }
         returnShellIdCombobox.DOMelem_input.onfocus = function(event) {
         if (isManuallySeleted == 1) {
         returnShellIdCombobox.openSelect();
         isManuallySeleted = 0;
         }
         }
         returnShellIdCombobox.setComboValue("");
         */
        // ============================
        var accessoryIdCombobox = dhtmlXComboFromSelect("accessoryIdCombobox");
        accessoryIdCombobox.enableFilteringMode(true);
        accessoryIdCombobox.attachEvent("onSelectionChange", function() {
            setVehicleInAccessorySelectedForm(accessoryIdCombobox.getComboText(), accessoryIdCombobox.getSelectedValue());
        });
        accessoryIdCombobox.attachEvent("onBlur", function() {
            setVehicleInAccessorySelectedForm(accessoryIdCombobox.getComboText(), accessoryIdCombobox.getSelectedValue());
        });
        accessoryIdCombobox.DOMelem_input.onkeypress = function(event) {
            var key;
            if (window.event)
                key = window.event.keyCode;//IE
            else
                key = event.which;//firefox
            if (key == 13) {
                addVehicleInAccessory();
                accessoryIdCombobox.setComboValue("");
            }
        }
        accessoryIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                accessoryIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        accessoryIdCombobox.setComboValue("");
        // ============================
        var oilExportIdCombobox = dhtmlXComboFromSelect("oilExportIdCombobox");
        oilExportIdCombobox.enableFilteringMode(true);
        oilExportIdCombobox.attachEvent("onSelectionChange", function() {
            setVehicleInOilExportSelectedForm(oilExportIdCombobox.getComboText(), oilExportIdCombobox.getSelectedValue());
        });
        oilExportIdCombobox.attachEvent("onBlur", function() {
            setVehicleInOilExportSelectedForm(oilExportIdCombobox.getComboText(), oilExportIdCombobox.getSelectedValue());
        });
        oilExportIdCombobox.DOMelem_input.onkeypress = function(event) {
            var key;
            if (window.event)
                key = window.event.keyCode;//IE
            else
                key = event.which;//firefox
            if (key == 13) {
                addVehicleInOilExport();
                oilExportIdCombobox.setComboValue("");
            }
        }
        oilExportIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                oilExportIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        oilExportIdCombobox.setComboValue("");
        // ============================
        var selectedCombo = dhtmlXComboFromSelect("vehicleOutIdCombobox");
        selectedCombo.enableFilteringMode(true);
        selectedCombo.attachEvent("onSelectionChange", function() {
            setVehicleSelectedForm('vehicleInForm', selectedCombo.getComboText(), selectedCombo.getSelectedValue());
        });
        selectedCombo.attachEvent("onBlur", function() {
            setVehicleSelectedForm('vehicleInForm', selectedCombo.getComboText(), selectedCombo.getSelectedValue());
            selectedCombo.setComboText(selectedCombo.getSelectedText());
        });
        selectedCombo.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                selectedCombo.openSelect();
                isManuallySeleted = 0;
            }
        }

        if (id == 0) {
            selectedCombo.setComboValue("");
            var currentDate = getCurrentDate();
            document.forms['vehicleInForm'].vehicleInCreatedDate.value = currentDate;
            shellIdCombobox.openSelect();
        } else {
            var vehicleOutId = document.forms['vehicleInForm'].vehicleOutId.value;
            if (vehicleOutId != 0) {
                var ind = selectedCombo.getIndexByValue(vehicleOutId);
                selectedCombo.selectOption(ind);
            } else {
                selectedCombo.unSelectOption();
                selectedCombo.setComboValue("");
            }
        }

        var myCalendar = new dhtmlXCalendarObject(["vehicleInCreatedDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");

        formatFormDetail('vehicleInForm');
//        formatVehicleInReturnShellDetail();
        formatVehicleInAccessoryDetail();

        var vehicleOutCalendar = new dhtmlXCalendarObject(["vehicleInVehicleOutCreatedDate"]);
        vehicleOutCalendar.setSkin('dhx_web');
        vehicleOutCalendar.setDateFormat("%d/%m/%Y");
        vehicleOutCalendar.attachEvent("onClick", function(date) {
            var strDate = getDateString(date);
            savedDate2 = strDate;
            var url = "getVehicleOutByDateAction.do?date=" + strDate;
            callAjaxCheckError(url, null, null, function(data) {
                var obj = eval('(' + data + ')');
                selectedCombo.clearAll();
                selectedCombo.addOption(obj.options);
                selectedCombo.setComboText("");
            });
        });
    });
}
function saveVehicleIn() {
    if (scriptFunction == "saveVehicleIn")
        return false;
    var quantity = document.forms['vehicleInForm'].quantity;
    if (quantity == null) {
        alert('Vui l\u00F2ng ch\u1ECDn h\u00E0ng h\u00F3a');
        return false;
    }
//    var price = document.forms['vehicleInForm'].price;
//    var amount = document.forms['vehicleInForm'].amount;
    if (quantity.length != null) {
        for (var i = 0; i < quantity.length; i++) {
            var number = Number(quantity[i].value);
            if (number == 0) {
                alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
                quantity[i].focus();
                quantity = null;
                return false;
            }
        }
    } else {
        if (quantity.value == "0") {
            alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
            quantity.focus();
            quantity = null;
            return false;
        }
    }
    quantity = null;
//    price = null;
//    amount = null;
    reformatFormDetail('vehicleInForm');
//    reformatVehicleInReturnShellDetail();
    reformatVehicleInAccessoryDetail();
    document.forms['vehicleInForm'].vehicleOutId.value = document.forms['vehicleInForm'].vehicleSelectedHidden.value;
    scriptFunction = "saveVehicleIn";
    callAjaxCheckError("addVehicleIn.do", null, document.forms['vehicleInForm'], function(data) {
        scriptFunction = "";
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getVehicleIn(0);
        else
            loadVehicleInPanel();
    });
    return false;
}
function addVehicleInGood() {
    var good = document.forms['vehicleInForm'].shellSelectedHidden.value;
    if (good == -1 || good == 0)
        return false;
    var goodId = document.forms['vehicleInForm'].shellId;
    var existed = false;
    if (goodId != null) {
        if (goodId.length != null) {
            for (i = 0; i < goodId.length; i++) {
                if (goodId[i].value == good) {
                    existed = true;
                    break;
                }
            }
        } else if (goodId.value == good)
            existed = true;
    }
    goodId = null;
    if (existed == true) {
        alert("H\u00E0ng ho\u00E1 \u0111\u00E3 t\u1ED3n t\u1EA1i");
        return false;
    }
    callAjax("getVehicleInGood.do?shellId=" + good, null, null, function(data) {
        setAjaxData(data, 'vehicleInGoodHideDiv');
        var matTable = document.getElementById('vehicleInGoodTbl');
        var detTable = document.getElementById('vehicleInDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
        formatFormDetail('vehicleInForm');
    });
    return false;
}
function delVehicleIn() {
    callAjaxCheckError('delVehicleIn.do?vehicleInId=' + document.forms['vehicleInForm'].id.value, null, null, function() {
        loadVehicleInPanel();
    });
    return false;
}
function addVehicleInReturnShell() {
    var shell = document.forms['vehicleInForm'].returnShellSelectedHidden.value;
    if (shell == -1 || shell == 0)
        return false;
    var returnShellId = document.forms['vehicleInForm'].returnShellId;
    var existed = false;
    if (returnShellId != null) {
        if (returnShellId.length != null) {
            for (i = 0; i < returnShellId.length; i++) {
                if (returnShellId[i].value == shell) {
                    existed = true;
                    break;
                }
            }
        } else if (returnShellId.value == shell)
            existed = true;
    }
    returnShellId = null;
    if (existed == true) {
        alert("H\u00E0ng ho\u00E1 \u0111\u00E3 t\u1ED3n t\u1EA1i");
        return false;
    }
    callAjax("getVehicleInReturnShell.do?shellId=" + shell, null, null, function(data) {
        setAjaxData(data, 'vehicleInReturnShellHideDiv');
        var matTable = document.getElementById('vehicleInReturnShellTbl');
        var detTable = document.getElementById('vehicleInReturnShellDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
        reformatVehicleInReturnShellDetail();
    });
    return false;
}
function reformatVehicleInReturnShellDetail() {
    var quantity = document.forms['vehicleInForm'].returnShellQuantity;
    if (quantity != null) {
        if (quantity.length != null) {
            for (var i = 0; i < quantity.length; i++) {
                reformatNumberMoney(quantity[i]);
            }
        } else {
            reformatNumberMoney(quantity);
        }
    }
    quantity = null;
}
function formatVehicleInReturnShellDetail() {
    var quantity = document.forms['vehicleInForm'].returnShellQuantity;
    if (quantity != null) {
        if (quantity.length != null) {
            for (var i = 0; i < quantity.length; i++) {
                tryNumberFormatCurrentcy(quantity[i], "VND");
            }
        } else {
            tryNumberFormatCurrentcy(quantity, "VND");
        }
    }
    quantity = null;
}
function addVehicleInAccessory() {
    var good = document.forms['vehicleInForm'].accessorySelectedHidden.value;
    if (good == -1 || good == 0)
        return false;
    var goodId = document.forms['vehicleInForm'].accessoryId;
    var existed = false;
    if (goodId != null) {
        if (goodId.length != null) {
            for (i = 0; i < goodId.length; i++) {
                if (goodId[i].value == good) {
                    existed = true;
                    break;
                }
            }
        } else if (goodId.value == good)
            existed = true;
    }
    goodId = null;
    if (existed == true) {
        alert("H\u00E0ng ho\u00E1 \u0111\u00E3 t\u1ED3n t\u1EA1i");
        return false;
    }
    callAjax("getVehicleInAccessory.do?accessoryId=" + good, null, null, function(data) {
        setAjaxData(data, 'vehicleInAccessoryHideDiv');
        var matTable = document.getElementById('vehicleInAccessoryTbl');
        var detTable = document.getElementById('vehicleInAccessoryDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
        formatVehicleInAccessoryDetail();
    });
    return false;
}
function caculateVehicleInAccessoryListDetail(goodId) {
    var quantity = document.getElementById("accessorydetquantity" + goodId);
    var price = document.getElementById("accessorydetprice" + goodId);
    var detTotal = document.getElementById("accessorydetamount" + goodId);
    if (quantity == null || price == null || detTotal == null)
        return false;
    detTotal.value = reformatNumberMoneyString(quantity.value) * reformatNumberMoneyString(price.value);
    tryNumberFormatCurrentcy(quantity, "VND");
    tryNumberFormatCurrentcy(price, "VND");
    tryNumberFormatCurrentcy(detTotal, "VND");
    quantity = null;
    price = null;
    detTotal = null;
    return false;
}
function formatVehicleInAccessoryDetail() {
    var quantity = document.forms['vehicleInForm'].accessoryQuantity;
    var price = document.forms['vehicleInForm'].accessoryPrice;
    var amount = document.forms['vehicleInForm'].accessoryAmount;
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
}
function reformatVehicleInAccessoryDetail() {
    var quantity = document.forms['vehicleInForm'].accessoryQuantity;
    var price = document.forms['vehicleInForm'].accessoryPrice;
    var amount = document.forms['vehicleInForm'].accessoryAmount;
    if (quantity != null) {
        if (quantity.length != null) {
            for (var i = 0; i < quantity.length; i++) {
                reformatNumberMoney(quantity[i]);
                reformatNumberMoney(price[i]);
                reformatNumberMoney(amount[i]);
            }
        } else {
            reformatNumberMoney(quantity);
            reformatNumberMoney(price);
            reformatNumberMoney(amount);
        }
    }
    quantity = null;
    price = null;
    amount = null;
}
function setVehicleInAccessorySelectedForm(text, value) {
    if (value == null) {
        if (text != "")
            value = "-1";
        else
            value = "0";
    }
    document.forms['vehicleInForm'].accessorySelectedHidden.value = value;
}
function setVehicleInOilExportSelectedForm(text, value) {
    if (value == null) {
        if (text != "")
            value = "-1";
        else
            value = "0";
    }
    document.forms['vehicleInForm'].oilExportSelectedHidden.value = value;
}
function addVehicleInOilExport() {
    var good = document.forms['vehicleInForm'].oilExportSelectedHidden.value;
    if (good == -1 || good == 0)
        return false;
    var goodId = document.forms['vehicleInForm'].oilExportId;
    var existed = false;
    if (goodId != null) {
        if (goodId.length != null) {
            for (i = 0; i < goodId.length; i++) {
                if (goodId[i].value == good) {
                    existed = true;
                    break;
                }
            }
        } else if (goodId.value == good)
            existed = true;
    }
    goodId = null;
    if (existed == true) {
        alert("H\u00E0ng ho\u00E1 \u0111\u00E3 t\u1ED3n t\u1EA1i");
        return false;
    }
    callAjax("getVehicleInOilExport.do?oilExportId=" + good, null, null, function(data) {
        setAjaxData(data, 'vehicleInOilExportHideDiv');
        var matTable = document.getElementById('vehicleInOilExportTbl');
        var detTable = document.getElementById('vehicleInOilExportDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
    });
    return false;
}
function loadExportWholesalePanel() {
    callAjax("getExportWholesalePanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['exportWholesaleSearchForm'].fromDate.value = currentTime;
        document.forms['exportWholesaleSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadExportWholesaleList(currentTime, currentTime);
    });
    return false;
}
function loadExportWholesaleList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('exportWholesaleList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("M\u00E3 phi\u1EBFu,Ng\u00E0y,Kh\u00E1ch h\u00E0ng,T\u1ED5ng ti\u1EC1n,Thanh to\u00E1n,C\u00F2n n\u1EE3,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#select_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,100,150,150,150,*");
    mygrid.setColTypes("link,ro,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getExportWholesaleList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getExportWholesale(id) {
    var url = 'exportWholesaleForm.do';
    if (id != 0)
        url += '?exportWholesaleId=' + id
    callAjax(url, null, null, function(data) {
        clearContent();
        setAjaxData(data, 'contentDiv');
        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        var shellIdCombobox = dhtmlXComboFromSelect("goodIdCombobox");
        shellIdCombobox.enableFilteringMode(true);
        shellIdCombobox.attachEvent("onSelectionChange", function() {
            setShellSelectedForm('exportWholesaleForm', shellIdCombobox.getComboText(), shellIdCombobox.getSelectedValue());
        });
        shellIdCombobox.attachEvent("onBlur", function() {
            setShellSelectedForm('exportWholesaleForm', shellIdCombobox.getComboText(), shellIdCombobox.getSelectedValue());
        });
        shellIdCombobox.DOMelem_input.onkeypress = function(event) {
            var key;
            if (window.event)
                key = window.event.keyCode;//IE
            else
                key = event.which;//firefox
            if (key == 13) {
                addExportWholesaleGood();
                shellIdCombobox.setComboValue("");
            }
        }
        shellIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                shellIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        shellIdCombobox.setComboValue("");
        // ============================
        var returnShellIdCombobox = dhtmlXComboFromSelect("returnShellIdCombobox");
        returnShellIdCombobox.enableFilteringMode(true);
        returnShellIdCombobox.attachEvent("onSelectionChange", function() {
            setReturnShellSelectedForm('exportWholesaleForm', returnShellIdCombobox.getComboText(), returnShellIdCombobox.getSelectedValue());
        });
        returnShellIdCombobox.attachEvent("onBlur", function() {
            setReturnShellSelectedForm('exportWholesaleForm', returnShellIdCombobox.getComboText(), returnShellIdCombobox.getSelectedValue());
        });
        returnShellIdCombobox.DOMelem_input.onkeypress = function(event) {
            var key;
            if (window.event)
                key = window.event.keyCode;//IE
            else
                key = event.which;//firefox
            if (key == 13) {
                addExportWholesaleReturnShell();
                returnShellIdCombobox.setComboValue("");
            }
        }
        returnShellIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                returnShellIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        returnShellIdCombobox.setComboValue("");
        // ============================
        var customerIdCombobox = dhtmlXComboFromSelect("customerIdCombobox");
        customerIdCombobox.enableFilteringMode(true);
        customerIdCombobox.attachEvent("onSelectionChange", function() {
            setCustomerSelectedForm('exportWholesaleForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
        });
        customerIdCombobox.attachEvent("onBlur", function() {
            setCustomerSelectedForm('exportWholesaleForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
            customerIdCombobox.setComboText(customerIdCombobox.getSelectedText());
        });
        customerIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                customerIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        if (id == 0) {
            customerIdCombobox.setComboValue("");
            var currentDate = getCurrentDate();
            document.forms['exportWholesaleForm'].exportWholesaleCreatedDate.value = currentDate;
            customerIdCombobox.openSelect();
        } else {
            var customerId = document.forms['exportWholesaleForm'].customerId.value;
            if (customerId != 0) {
                var ind = customerIdCombobox.getIndexByValue(customerId);
                customerIdCombobox.selectOption(ind);
            } else {
                customerIdCombobox.unSelectOption();
                customerIdCombobox.setComboValue("");
            }
        }

        var myCalendar = new dhtmlXCalendarObject(["exportWholesaleCreatedDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");

        tryNumberFormatCurrentcy(document.forms['exportWholesaleForm'].total, "VND");
        tryNumberFormatCurrentcy(document.forms['exportWholesaleForm'].paid, "VND");
        tryNumberFormatCurrentcy(document.forms['exportWholesaleForm'].debt, "VND");
        tryNumberFormatCurrentcy(document.forms['exportWholesaleForm'].discount, "VND");
        tryNumberFormatCurrentcy(document.forms['exportWholesaleForm'].totalPay, "VND");
        formatFormDetail('exportWholesaleForm');
        formatExportWholesaleReturnShellDetail();
    });
}
function saveExportWholesale() {
    if (scriptFunction == "saveExportWholesale")
        return false;
    var quantity = document.forms['exportWholesaleForm'].quantity;
    if (quantity == null) {
        alert('Vui l\u00F2ng ch\u1ECDn h\u00E0ng h\u00F3a');
        return false;
    }
    var price = document.forms['exportWholesaleForm'].price;
    var amount = document.forms['exportWholesaleForm'].amount;
    if (quantity.length != null) {
        for (var i = 0; i < quantity.length; i++) {
            var number = Number(quantity[i].value);
            if (number == 0) {
                alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
                quantity[i].focus();
                quantity = null;
                return false;
            }
        }
    } else {
        if (quantity.value == "0") {
            alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
            quantity.focus();
            quantity = null;
            return false;
        }
    }
    quantity = null;
    price = null;
    amount = null;
    reformatNumberMoney(document.forms['exportWholesaleForm'].total);
    reformatNumberMoney(document.forms['exportWholesaleForm'].paid);
    reformatNumberMoney(document.forms['exportWholesaleForm'].debt);
    reformatNumberMoney(document.forms['exportWholesaleForm'].discount);
    reformatNumberMoney(document.forms['exportWholesaleForm'].totalPay);
    document.forms['exportWholesaleForm'].customerId.value = document.forms['exportWholesaleForm'].customerSelectedHidden.value;
    reformatFormDetail('exportWholesaleForm');
    reformatExportWholesaleReturnShellDetail();
    scriptFunction = "saveExportWholesale";
    callAjaxCheckError("addExportWholesale.do", null, document.forms['exportWholesaleForm'], function(data) {
        scriptFunction = "";
        loadExportWholesalePanel();
    });
    return false;
}
function addExportWholesaleGood() {
    var good = document.forms['exportWholesaleForm'].shellSelectedHidden.value;
    if (good == -1 || good == 0)
        return false;
    var goodId = document.forms['exportWholesaleForm'].shellId;
    var existed = false;
    if (goodId != null) {
        if (goodId.length != null) {
            for (i = 0; i < goodId.length; i++) {
                if (goodId[i].value == good) {
                    existed = true;
                    break;
                }
            }
        } else if (goodId.value == good)
            existed = true;
    }
    goodId = null;
    if (existed == true) {
        alert("H\u00E0ng ho\u00E1 \u0111\u00E3 t\u1ED3n t\u1EA1i");
        return false;
    }
    callAjax("getExportWholesaleGood.do?shellId=" + good, null, null, function(data) {
        setAjaxData(data, 'exportWholesaleGoodHideDiv');
        var matTable = document.getElementById('exportWholesaleGoodTbl');
        var detTable = document.getElementById('exportWholesaleDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
        formatFormDetail('exportWholesaleForm');
    });
    return false;
}
function delExportWholesale() {
    callAjaxCheckError('delExportWholesale.do?exportWholesaleId=' + document.forms['exportWholesaleForm'].id.value, null, null, function() {
        loadExportWholesalePanel();
    });
    return false;
}
function addExportWholesaleReturnShell() {
    var shell = document.forms['exportWholesaleForm'].returnShellSelectedHidden.value;
    if (shell == -1 || shell == 0)
        return false;
    var returnShellId = document.forms['exportWholesaleForm'].returnShellId;
    var existed = false;
    if (returnShellId != null) {
        if (returnShellId.length != null) {
            for (i = 0; i < returnShellId.length; i++) {
                if (returnShellId[i].value == shell) {
                    existed = true;
                    break;
                }
            }
        } else if (returnShellId.value == shell)
            existed = true;
    }
    returnShellId = null;
    if (existed == true) {
        alert("H\u00E0ng ho\u00E1 \u0111\u00E3 t\u1ED3n t\u1EA1i");
        return false;
    }
    callAjax("getExportWholesaleReturnShell.do?shellId=" + shell, null, null, function(data) {
        setAjaxData(data, 'exportWholesaleReturnShellHideDiv');
        var matTable = document.getElementById('exportWholesaleReturnShellTbl');
        var detTable = document.getElementById('exportWholesaleReturnShellDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
        reformatExportWholesaleReturnShellDetail();
    });
    return false;
}
function reformatExportWholesaleReturnShellDetail() {
    var quantity = document.forms['exportWholesaleForm'].returnShellQuantity;
    if (quantity != null) {
        if (quantity.length != null) {
            for (var i = 0; i < quantity.length; i++) {
                reformatNumberMoney(quantity[i]);
            }
        } else {
            reformatNumberMoney(quantity);
        }
    }
    quantity = null;
}
function formatExportWholesaleReturnShellDetail() {
    var quantity = document.forms['exportWholesaleForm'].returnShellQuantity;
    if (quantity != null) {
        if (quantity.length != null) {
            for (var i = 0; i < quantity.length; i++) {
                tryNumberFormatCurrentcy(quantity[i], "VND");
            }
        } else {
            tryNumberFormatCurrentcy(quantity, "VND");
        }
    }
    quantity = null;
}
function loadDebtVendorPanel() {
    callAjax("getDebtVendorPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['debtVendorSearchForm'].fromDate.value = currentTime;
        document.forms['debtVendorSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadDebtVendorList(currentTime, currentTime);
    });
    return false;
}
function loadDebtVendorList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('debtVendorList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("S\u1ED1 phi\u1EBFu,Ng\u00E0y,Nh\u00E0 cung c\u1EA5p,S\u1ED1 ti\u1EC1n,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#select_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,200,200,200,*");
    mygrid.setColTypes("link,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getDebtVendorList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getDebtVendor(id, handle) {
    popupName = 'TH\u00D4NG TIN THANH TO\u00C1N C\u00D4NG N\u1EE2';
    var url = 'debtVendorForm.do';
    if (id != 0)
        url += '?debtVendorId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['debtVendorForm'].paid.focus();
        tryNumberFormatCurrentcy(document.forms['debtVendorForm'].paid, "VND");
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['debtVendorForm'].debtVendorDate.value = currentDate;
        }
        var myCalendar = new dhtmlXCalendarObject(["debtVendorDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");

        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        // ============================
        var vendorIdCombobox = dhtmlXComboFromSelect("vendorIdCombobox");
        vendorIdCombobox.enableFilteringMode(true);
        vendorIdCombobox.attachEvent("onSelectionChange", function() {
            setVendorSelectedForm('debtVendorForm', vendorIdCombobox.getComboText(), vendorIdCombobox.getSelectedValue());
        });
        vendorIdCombobox.attachEvent("onBlur", function() {
            setVendorSelectedForm('debtVendorForm', vendorIdCombobox.getComboText(), vendorIdCombobox.getSelectedValue());
            vendorIdCombobox.setComboText(vendorIdCombobox.getSelectedText());
        });
        vendorIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                vendorIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        if (id == 0) {
            vendorIdCombobox.setComboValue("");
        } else {
            var vendorId = document.forms['debtVendorForm'].vendorId.value;
            if (vendorId != 0) {
                var ind = vendorIdCombobox.getIndexByValue(vendorId);
                vendorIdCombobox.selectOption(ind);
            } else {
                vendorIdCombobox.unSelectOption();
                vendorIdCombobox.setComboValue("");
            }
        }
    });
}
function setVendorSelectedForm(form, text, value) {
    if (value == null) {
        if (text != "")
            value = "-1";
        else
            value = "0";
    }
    document.forms[form].vendorSelectedHidden.value = value;
}
function saveDebtVendor() {
    if (scriptFunction == "saveDebtVendor")
        return false;
    var field = document.forms['debtVendorForm'].createdDate;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp ng\u00E0y");
        field.focus();
        field = null;
        return false;
    }
    field = document.forms['debtVendorForm'].paid;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp s\u1ED1 ti\u1EC1n");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    reformatNumberMoney(document.forms['debtVendorForm'].paid);
    document.forms['debtVendorForm'].vendorId.value = document.forms['debtVendorForm'].vendorSelectedHidden.value;
    scriptFunction = "saveDebtVendor";
    callAjaxCheckError("addDebtVendor.do", null, document.forms['debtVendorForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getDebtVendor(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('debtVendorFormshowHelpHideDiv');
    });
    return false;
}
function delDebtVendor() {
    callAjaxCheckError('delDebtVendor.do?debtVendorId=' + document.forms['debtVendorForm'].id.value, null, null, function() {
        loadDebtVendorPanel();
        prepareHidePopup('debtVendorFormshowHelpHideDiv');
    });
    return false;
}
function loadDebtRetailPanel() {
    callAjax("getDebtRetailPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['debtRetailSearchForm'].fromDate.value = currentTime;
        document.forms['debtRetailSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadDebtRetailList(currentTime, currentTime);
    });
    return false;
}
function loadDebtRetailList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('debtRetailList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("S\u1ED1 phi\u1EBFu,Ng\u00E0y,Kh\u00E1ch h\u00E0ng,S\u1ED1 ti\u1EC1n,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#select_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,200,200,200,*");
    mygrid.setColTypes("link,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getDebtRetailList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getDebtRetail(id, handle) {
    popupName = 'TH\u00D4NG TIN THANH TO\u00C1N C\u00D4NG N\u1EE2';
    var url = 'debtRetailForm.do';
    if (id != 0)
        url += '?debtRetailId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['debtRetailForm'].paid.focus();
        tryNumberFormatCurrentcy(document.forms['debtRetailForm'].paid, "VND");
        var myCalendar = new dhtmlXCalendarObject(["debtRetailDate"]);
        myCalendar.setSkin('dhx_web');
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['debtRetailForm'].debtRetailDate.value = currentDate;
        }
        myCalendar.setDateFormat("%d/%m/%Y");
    });
}
function saveDebtRetail() {
    if (scriptFunction == "saveDebtRetail")
        return false;
    var field = document.forms['debtRetailForm'].createdDate;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp ng\u00E0y");
        field.focus();
        field = null;
        return false;
    }
    field = document.forms['debtRetailForm'].paid;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp s\u1ED1 ti\u1EC1n");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    reformatNumberMoney(document.forms['debtRetailForm'].paid);
    scriptFunction = "saveDebtRetail";
    callAjaxCheckError("addDebtRetail.do", null, document.forms['debtRetailForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getDebtRetail(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('debtRetailFormshowHelpHideDiv');
    });
    return false;
}
function delDebtRetail() {
    callAjaxCheckError('delDebtRetail.do?debtRetailId=' + document.forms['debtRetailForm'].id.value, null, null, function() {
        loadDebtRetailPanel();
        prepareHidePopup('debtRetailFormshowHelpHideDiv');
    });
    return false;
}
function loadDebtWholesalePanel() {
    callAjax("getDebtWholesalePanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['debtWholesaleSearchForm'].fromDate.value = currentTime;
        document.forms['debtWholesaleSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadDebtWholesaleList(currentTime, currentTime);
    });
    return false;
}
function loadDebtWholesaleList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('debtWholesaleList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("S\u1ED1 phi\u1EBFu,Ng\u00E0y,Kh\u00E1ch h\u00E0ng,S\u1ED1 ti\u1EC1n,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#select_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,200,200,200,*");
    mygrid.setColTypes("link,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getDebtWholesaleList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getDebtWholesale(id, handle) {
    popupName = 'TH\u00D4NG TIN THANH TO\u00C1N C\u00D4NG N\u1EE2';
    var url = 'debtWholesaleForm.do';
    if (id != 0)
        url += '?debtWholesaleId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['debtWholesaleForm'].paid.focus();
        tryNumberFormatCurrentcy(document.forms['debtWholesaleForm'].paid, "VND");
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['debtWholesaleForm'].debtWholesaleDate.value = currentDate;
        }
        var myCalendar = new dhtmlXCalendarObject(["debtWholesaleDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");

        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        // ============================
        var customerIdCombobox = dhtmlXComboFromSelect("customerIdCombobox");
        customerIdCombobox.enableFilteringMode(true);
        customerIdCombobox.attachEvent("onSelectionChange", function() {
            setCustomerSelectedForm('debtWholesaleForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
        });
        customerIdCombobox.attachEvent("onBlur", function() {
            setCustomerSelectedForm('debtWholesaleForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
            customerIdCombobox.setComboText(customerIdCombobox.getSelectedText());
        });
        customerIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                customerIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        if (id == 0) {
            customerIdCombobox.setComboValue("");
        } else {
            var customerId = document.forms['debtWholesaleForm'].customerId.value;
            if (customerId != 0) {
                var ind = customerIdCombobox.getIndexByValue(customerId);
                customerIdCombobox.selectOption(ind);
            } else {
                customerIdCombobox.unSelectOption();
                customerIdCombobox.setComboValue("");
            }
        }
    });
}
function saveDebtWholesale() {
    if (scriptFunction == "saveDebtWholesale")
        return false;
    var field = document.forms['debtWholesaleForm'].createdDate;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp ng\u00E0y");
        field.focus();
        field = null;
        return false;
    }
    field = document.forms['debtWholesaleForm'].paid;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp s\u1ED1 ti\u1EC1n");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    reformatNumberMoney(document.forms['debtWholesaleForm'].paid);
    document.forms['debtWholesaleForm'].customerId.value = document.forms['debtWholesaleForm'].customerSelectedHidden.value;
    scriptFunction = "saveDebtWholesale";
    callAjaxCheckError("addDebtWholesale.do", null, document.forms['debtWholesaleForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getDebtWholesale(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('debtWholesaleFormshowHelpHideDiv');
    });
    return false;
}
function delDebtWholesale() {
    callAjaxCheckError('delDebtWholesale.do?debtWholesaleId=' + document.forms['debtWholesaleForm'].id.value, null, null, function() {
        loadDebtWholesalePanel();
        prepareHidePopup('debtWholesaleFormshowHelpHideDiv');
    });
    return false;
}
function loadIncomePanel() {
    callAjax("getIncomePanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['incomeSearchForm'].fromDate.value = currentTime;
        document.forms['incomeSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadIncomeList(currentTime, currentTime);
    });
    return false;
}
function loadIncomeList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('incomeList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("S\u1ED1 phi\u1EBFu,Ng\u00E0y,N\u1ED9i dung,S\u1ED1 ti\u1EC1n,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,200,200,200,*");
    mygrid.setColTypes("link,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getIncomeList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getIncome(id, handle) {
    popupName = 'TH\u00D4NG TIN THU';
    var url = 'incomeForm.do';
    if (id != 0)
        url += '?incomeId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['incomeForm'].amount.focus();
        tryNumberFormatCurrentcy(document.forms['incomeForm'].amount, "VND");
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['incomeForm'].incomeDate.value = currentDate;
        }
        var myCalendar = new dhtmlXCalendarObject(["incomeDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");
    });
}
function saveIncome() {
    if (scriptFunction == "saveIncome")
        return false;
    var field = document.forms['incomeForm'].createdDate;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp ng\u00E0y");
        field.focus();
        field = null;
        return false;
    }
    field = document.forms['incomeForm'].amount;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp s\u1ED1 ti\u1EC1n");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    reformatNumberMoney(document.forms['incomeForm'].amount);
    scriptFunction = "saveIncome";
    callAjaxCheckError("addIncome.do", null, document.forms['incomeForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getIncome(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('incomeFormshowHelpHideDiv');
    });
    return false;
}
function delIncome() {
    callAjaxCheckError('delIncome.do?incomeId=' + document.forms['incomeForm'].id.value, null, null, function() {
        loadIncomePanel();
        prepareHidePopup('incomeFormshowHelpHideDiv');
    });
    return false;
}
function loadExpensePanel() {
    callAjax("getExpensePanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['expenseSearchForm'].fromDate.value = currentTime;
        document.forms['expenseSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadExpenseList(currentTime, currentTime);
    });
    return false;
}
function loadExpenseList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('expenseList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("S\u1ED1 phi\u1EBFu,Ng\u00E0y,N\u1ED9i dung,S\u1ED1 ti\u1EC1n,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,200,200,200,*");
    mygrid.setColTypes("link,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getExpenseList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getExpense(id, handle) {
    popupName = 'TH\u00D4NG TIN CHI';
    var url = 'expenseForm.do';
    if (id != 0)
        url += '?expenseId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['expenseForm'].amount.focus();
        tryNumberFormatCurrentcy(document.forms['expenseForm'].amount, "VND");
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['expenseForm'].expenseDate.value = currentDate;
            document.forms['expenseForm'].expenseFromDate.value = currentDate;
            document.forms['expenseForm'].expenseToDate.value = currentDate;
        }
        var myCalendar = new dhtmlXCalendarObject(["expenseDate", "expenseFromDate", "expenseToDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");
    });
}
function saveExpense() {
    if (scriptFunction == "saveExpense")
        return false;
    var field = document.forms['expenseForm'].fromDate;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp ng\u00E0y b\u1EAFt \u0111\u1EA7u");
        field.focus();
        field = null;
        return false;
    }
    document.forms['expenseForm'].toDate;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp ng\u00E0y k\u1EBFt th\u00FAc");
        field.focus();
        field = null;
        return false;
    }
    field = document.forms['expenseForm'].amount;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp s\u1ED1 ti\u1EC1n");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    reformatNumberMoney(document.forms['expenseForm'].amount);
    scriptFunction = "saveExpense";
    callAjaxCheckError("addExpense.do", null, document.forms['expenseForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getExpense(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('expenseFormshowHelpHideDiv');
    });
    return false;
}
function delExpense() {
    callAjaxCheckError('delExpense.do?expenseId=' + document.forms['expenseForm'].id.value, null, null, function() {
        loadExpensePanel();
        prepareHidePopup('expenseFormshowHelpHideDiv');
    });
    return false;
}
function loadEmployeeOffIncreasePanel() {
    callAjax("getEmployeeOffIncreasePanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['employeeOffIncreaseSearchForm'].fromDate.value = currentTime;
        document.forms['employeeOffIncreaseSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadEmployeeOffIncreaseList(currentTime, currentTime);
    });
    return false;
}
function loadEmployeeOffIncreaseList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('employeeOffIncreaseList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("S\u1ED1 phi\u1EBFu,Nh\u00E2n vi\u00EAn,Ng\u00E0y t\u1EA1o,S\u1ED1 l\u01B0\u1EE3ng,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,200,150,150,*");
    mygrid.setColTypes("link,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getEmployeeOffIncreaseList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getEmployeeOffIncrease(id, handle) {
    popupName = 'TH\u00D4NG TIN B\u00D9 NGH\u1EC8 PH\u00C9P';
    var url = 'employeeOffIncreaseForm.do';
    if (id != 0)
        url += '?employeeOffIncreaseId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;

        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        // ============================
        var employeeIdCombobox = dhtmlXComboFromSelect("employeeIdCombobox");
        employeeIdCombobox.enableFilteringMode(true);
        employeeIdCombobox.attachEvent("onSelectionChange", function() {
            setEmployeeSelectedForm('employeeOffIncreaseForm', employeeIdCombobox.getComboText(), employeeIdCombobox.getSelectedValue());
        });
        employeeIdCombobox.attachEvent("onBlur", function() {
            setEmployeeSelectedForm('employeeOffIncreaseForm', employeeIdCombobox.getComboText(), employeeIdCombobox.getSelectedValue());
            employeeIdCombobox.setComboText(employeeIdCombobox.getSelectedText());
        });
        employeeIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                employeeIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['employeeOffIncreaseForm'].employeeOffIncreaseDate.value = currentDate;
            employeeIdCombobox.setComboValue("");
            employeeIdCombobox.openSelect();
        } else {
            var employeeId = document.forms['employeeOffIncreaseForm'].employeeId.value;
            if (employeeId != 0) {
                var ind = employeeIdCombobox.getIndexByValue(employeeId);
                employeeIdCombobox.selectOption(ind);
            } else {
                employeeIdCombobox.unSelectOption();
                employeeIdCombobox.setComboValue("");
            }
        }
        var myCalendar = new dhtmlXCalendarObject(["employeeOffIncreaseDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");

        var list = document.forms['employeeOffIncreaseForm'].dayoffId;
        if (list != null)
            list.selectedIndex = savedDayoff;
        list = null;
        document.forms['employeeOffIncreaseForm'].quantity.value = savedQuantityDayoff;
    });
}
function saveEmployeeOffIncrease() {
    if (scriptFunction == "saveEmployeeOffIncrease")
        return false;
    var list = document.forms['employeeOffIncreaseForm'].dayoffId;
    if (list != null && list.selectedIndex > -1)
        savedDayoff = list.selectedIndex;
    else
        savedDayoff = 0;
    list = null;
    savedQuantityDayoff = document.forms['employeeOffIncreaseForm'].quantity.value;
    document.forms['employeeOffIncreaseForm'].employeeId.value = document.forms['employeeOffIncreaseForm'].employeeSelectedHidden.value;
    scriptFunction = "saveEmployeeOffIncrease";
    callAjaxCheckError("addEmployeeOffIncrease.do", null, document.forms['employeeOffIncreaseForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getEmployeeOffIncrease(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('employeeOffIncreaseFormshowHelpHideDiv');
    });
    return false;
}
function delEmployeeOffIncrease() {
    callAjaxCheckError('delEmployeeOffIncrease.do?employeeOffIncreaseId=' + document.forms['employeeOffIncreaseForm'].id.value, null, null, function() {
        loadEmployeeOffIncreasePanel();
        prepareHidePopup('employeeOffIncreaseFormshowHelpHideDiv');
    });
    return false;
}
function loadEmployeeOffMoneyPanel() {
    callAjax("getEmployeeOffMoneyPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['employeeOffMoneySearchForm'].fromDate.value = currentTime;
        document.forms['employeeOffMoneySearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadEmployeeOffMoneyList(currentTime, currentTime);
    });
    return false;
}
function loadEmployeeOffMoneyList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('employeeOffMoneyList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("S\u1ED1 phi\u1EBFu,Nh\u00E2n vi\u00EAn,Ng\u00E0y thanh to\u00E1n,S\u1ED1 ng\u00E0y,S\u1ED1 ti\u1EC1n,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,200,200,200,200,*");
    mygrid.setColTypes("link,ro,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getEmployeeOffMoneyList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getEmployeeOffMoney(id, handle) {
    popupName = 'TH\u00D4NG TIN THANH TO\u00C1N NG\u00C0Y PH\u00C9P';
    var url = 'employeeOffMoneyForm.do';
    if (id != 0)
        url += '?employeeOffMoneyId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['employeeOffMoneyForm'].amount.focus();
        tryNumberFormatCurrentcy(document.forms['employeeOffMoneyForm'].quantity, "VND");
        tryNumberFormatCurrentcy(document.forms['employeeOffMoneyForm'].price, "VND");
        tryNumberFormatCurrentcy(document.forms['employeeOffMoneyForm'].amount, "VND");

        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        // ============================
        var employeeIdCombobox = dhtmlXComboFromSelect("employeeIdCombobox");
        employeeIdCombobox.enableFilteringMode(true);
        employeeIdCombobox.attachEvent("onSelectionChange", function() {
            setEmployeeSelectedForm('employeeOffMoneyForm', employeeIdCombobox.getComboText(), employeeIdCombobox.getSelectedValue());
        });
        employeeIdCombobox.attachEvent("onBlur", function() {
            setEmployeeSelectedForm('employeeOffMoneyForm', employeeIdCombobox.getComboText(), employeeIdCombobox.getSelectedValue());
            employeeIdCombobox.setComboText(employeeIdCombobox.getSelectedText());
            employeeOffMoneyEmployeeChanged(employeeIdCombobox.getSelectedValue());
        });
        employeeIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                employeeIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        var employeeId = document.forms['employeeOffMoneyForm'].employeeId.value;
        if (employeeId != 0) {
            var ind = employeeIdCombobox.getIndexByValue(employeeId);
            employeeIdCombobox.selectOption(ind);
        } else {
            employeeIdCombobox.unSelectOption();
            employeeIdCombobox.setComboValue("");
        }
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['employeeOffMoneyForm'].employeeOffMoneyDate.value = currentDate;
            employeeIdCombobox.openSelect();
        }
        var myCalendar = new dhtmlXCalendarObject(["employeeOffMoneyDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");
    });
}
function saveEmployeeOffMoney() {
    if (scriptFunction == "saveEmployeeOffMoney")
        return false;
    var field = document.forms['employeeOffMoneyForm'].quantity;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp s\u1ED1 ng\u00E0y");
        field.focus();
        field = null;
        return false;
    }
    field = document.forms['employeeOffMoneyForm'].price;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp \u0111\u01A1n gi\u00E1");
        field.focus();
        field = null;
        return false;
    }
    field = document.forms['employeeOffMoneyForm'].amount;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp s\u1ED1 ti\u1EC1n");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    reformatNumberMoney(document.forms['employeeOffMoneyForm'].quantity);
    reformatNumberMoney(document.forms['employeeOffMoneyForm'].price);
    reformatNumberMoney(document.forms['employeeOffMoneyForm'].amount);
    document.forms['employeeOffMoneyForm'].employeeId.value = document.forms['employeeOffMoneyForm'].employeeSelectedHidden.value;
    scriptFunction = "saveEmployeeOffMoney";
    callAjaxCheckError("addEmployeeOffMoney.do", null, document.forms['employeeOffMoneyForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getEmployeeOffMoney(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('employeeOffMoneyFormshowHelpHideDiv');
    });
    return false;
}
function delEmployeeOffMoney() {
    callAjaxCheckError('delEmployeeOffMoney.do?employeeOffMoneyId=' + document.forms['employeeOffMoneyForm'].id.value, null, null, function() {
        loadEmployeeOffMoneyPanel();
        prepareHidePopup('employeeOffMoneyFormshowHelpHideDiv');
    });
    return false;
}
function employeeOffMoneyEmployeeChanged(employeeId) {
    if (employeeId == 0)
        return false;
    var url = "getDayOffAndSalaryOfEmployee.do?employeeId=" + employeeId;
    callAjaxCheckError(url, null, null, function(data) {
        var obj = eval('(' + data + ')');
        var quantity = document.forms['employeeOffMoneyForm'].quantity;
        var price = document.forms['employeeOffMoneyForm'].price;
        var amount = document.forms['employeeOffMoneyForm'].amount;
        quantity.value = obj.quantity;
        price.value = obj.price;
        amount.value = obj.quantity * obj.price;
        tryNumberFormatCurrentcy(quantity, "VND");
        tryNumberFormatCurrentcy(price, "VND");
        tryNumberFormatCurrentcy(amount, "VND");
        quantity = null;
        price = null;
        amount = null;
    });
    return false;
}
function createSalary() {
    if (scriptFunction == "createSalary")
        return false;
    callAjaxCheckError("createSalary.do", null, null, function(data) {
        scriptFunction = "";
        loadSalaryPanel();
    });
    return false;
}
function loadFixedAssetGroupPanel() {
    callAjax("getFixedAssetGroupPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        loadFixedAssetGroupList();
    });
}
function loadFixedAssetGroupList() {
    var mygrid = new dhtmlXGridObject('fixedAssetGroupList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("T\u00EAn t\u00E0i s\u1EA3n,Nh\u00F3m,T\u1EF7 l\u1EC7 KH,S\u1ED1 th\u00E1ng KH");
    mygrid.attachHeader("#text_filter,#select_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("*,300,200,200");
    mygrid.setColTypes("link,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getFixedAssetGroupList.do";
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getFixedAssetGroup(id, handle) {
    popupName = 'TH\u00D4NG TIN NH\u00D3M T\u00C0I S\u1EA2N C\u1ED0 \u0110\u1ECANH';
    var url = 'fixedAssetGroupForm.do';
    if (id != 0)
        url += '?fixedAssetGroupId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['fixedAssetGroupForm'].name.focus();
    });
}
function saveFixedAssetGroup() {
    if (scriptFunction == "saveFixedAssetGroup")
        return false;
    var field = document.forms['fixedAssetGroupForm'].name;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp t\u00EAn");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    scriptFunction = "saveFixedAssetGroup";
    callAjaxCheckError("addFixedAssetGroup.do", null, document.forms['fixedAssetGroupForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getFixedAssetGroup(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('fixedAssetGroupFormshowHelpHideDiv');
    });
    return false;
}
function delFixedAssetGroup() {
    callAjaxCheckError('delFixedAssetGroup.do?fixedAssetGroupId=' + document.forms['fixedAssetGroupForm'].id.value, null, null, function() {
        loadFixedAssetGroupPanel();
        prepareHidePopup('fixedAssetGroupFormshowHelpHideDiv');
    });
    return false;
}
function loadFixedAssetPanel() {
    callAjax("getFixedAssetPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        loadFixedAssetList();
    });
}
function loadFixedAssetList() {
    var mygrid = new dhtmlXGridObject('fixedAssetList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("T\u00EAn t\u00E0i s\u1EA3n,Nh\u00F3m,T\u1EF7 l\u1EC7 KH,S\u1ED1 th\u00E1ng KH");
    mygrid.attachHeader("#text_filter,#select_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("*,300,200,200");
    mygrid.setColTypes("link,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getFixedAssetList.do";
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getFixedAsset(id, handle) {
    popupName = 'TH\u00D4NG TIN T\u00C0I S\u1EA2N C\u1ED0 \u0110\u1ECANH';
    var url = 'fixedAssetForm.do';
    if (id != 0)
        url += '?fixedAssetId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['fixedAssetForm'].name.focus();
        tryNumberFormatCurrentcy(document.forms['fixedAssetForm'].quantity, "VND");
        tryNumberFormatCurrentcy(document.forms['fixedAssetForm'].rate, "VND");
        tryNumberFormatCurrentcy(document.forms['fixedAssetForm'].monthCount, "VND");
        tryNumberFormatCurrentcy(document.forms['fixedAssetForm'].price, "VND");
        var myCalendar = new dhtmlXCalendarObject(["fixedAssetStartDate"]);
        myCalendar.setSkin('dhx_web');
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['fixedAssetForm'].fixedAssetStartDate.value = currentDate;
        }
        myCalendar.setDateFormat("%d/%m/%Y");
    });
}
function saveFixedAsset() {
    if (scriptFunction == "saveFixedAsset")
        return false;
    var field = document.forms['fixedAssetForm'].name;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp t\u00EAn");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    reformatNumberMoney(document.forms['fixedAssetForm'].quantity);
    reformatNumberMoney(document.forms['fixedAssetForm'].rate);
    reformatNumberMoney(document.forms['fixedAssetForm'].monthCount);
    reformatNumberMoney(document.forms['fixedAssetForm'].price);
    scriptFunction = "saveFixedAsset";
    callAjaxCheckError("addFixedAsset.do", null, document.forms['fixedAssetForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getFixedAsset(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('fixedAssetFormshowHelpHideDiv');
    });
    return false;
}
function delFixedAsset() {
    callAjaxCheckError('delFixedAsset.do?fixedAssetId=' + document.forms['fixedAssetForm'].id.value, null, null, function() {
        loadFixedAssetPanel();
        prepareHidePopup('fixedAssetFormshowHelpHideDiv');
    });
    return false;
}
function loadFixedAssetDepreciationPanel() {
    callAjax("getFixedAssetDepreciationPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['fixedAssetDepreciationSearchForm'].fromDate.value = currentTime;
        document.forms['fixedAssetDepreciationSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadFixedAssetDepreciationList(currentTime, currentTime);
    });
    return false;
}
function loadFixedAssetDepreciationList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('fixedAssetDepreciationList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("M\u00E3 phi\u1EBFu,Ng\u00E0y t\u1EA1o,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,100,*");
    mygrid.setColTypes("link,ro,ro");
    mygrid.setColSorting("str,str,,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getFixedAssetDepreciationList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getFixedAssetDepreciation(id) {
    var url = 'fixedAssetDepreciationForm.do?fixedAssetDepreciationId=' + id
    callAjax(url, null, null, function(data) {
        clearContent();
        setAjaxData(data, 'contentDiv');
        formatFormDetail('fixedAssetDepreciationForm');
    });
}
function saveFixedAssetDepreciation() {
    if (scriptFunction == "saveFixedAssetDepreciation")
        return false;
    scriptFunction = "saveFixedAssetDepreciation";
    callAjaxCheckError("addFixedAssetDepreciation.do", null, document.forms['fixedAssetDepreciationForm'], function(data) {
        scriptFunction = "";
        loadFixedAssetDepreciationPanel();
    });
    return false;
}
function delFixedAssetDepreciation() {
    callAjaxCheckError('delFixedAssetDepreciation.do?fixedAssetDepreciationId=' + document.forms['fixedAssetDepreciationForm'].id.value, null, null, function() {
        loadFixedAssetDepreciationPanel();
    });
    return false;
}
function loadContractPanel() {
    callAjax("getContractPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['contractSearchForm'].fromDate.value = currentTime;
        document.forms['contractSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadContractList(currentTime, currentTime);
    });
    return false;
}
function loadContractList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('contractList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("S\u1ED1 h\u1EE3p \u0111\u1ED3ng,Ng\u00E0y h\u1EE3p \u0111\u1ED3ng,Kh\u00E1ch h\u00E0ng,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,200,200,*");
    mygrid.setColTypes("link,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getContractList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getContract(id) {
    var url = 'contractForm.do';
    if (id != 0)
        url += '?contractId=' + id
    callAjax(url, null, null, function(data) {
        clearContent();
        setAjaxData(data, 'contentDiv');
        tryNumberFormatCurrentcy(document.forms['contractForm'].shell12Price, "VND");
        tryNumberFormatCurrentcy(document.forms['contractForm'].shell45Price, "VND");
        tryNumberFormatCurrentcy(document.forms['contractForm'].creditDate, "VND");
        tryNumberFormatCurrentcy(document.forms['contractForm'].creditAmount, "VND");
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['contractForm'].contractDate.value = currentDate;
        } else {
            loadAttchmentFileList(null, null);
        }
        var myCalendar = new dhtmlXCalendarObject(["contractDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");

        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        // ============================
        var customerIdCombobox = dhtmlXComboFromSelect("customerIdCombobox");
        customerIdCombobox.enableFilteringMode(true);
        customerIdCombobox.attachEvent("onSelectionChange", function() {
            setCustomerSelectedForm('contractForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
        });
        customerIdCombobox.attachEvent("onBlur", function() {
            setCustomerSelectedForm('contractForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
            customerIdCombobox.setComboText(customerIdCombobox.getSelectedText());
        });
        customerIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                customerIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        if (id == 0) {
            customerIdCombobox.setComboValue("");
        } else {
            var customerId = document.forms['contractForm'].customerId.value;
            if (customerId != 0) {
                var ind = customerIdCombobox.getIndexByValue(customerId);
                customerIdCombobox.selectOption(ind);
            } else {
                customerIdCombobox.unSelectOption();
                customerIdCombobox.setComboValue("");
            }
        }
    });
}
function saveContract() {
    if (scriptFunction == "saveContract")
        return false;
    var field = document.forms['contractForm'].createdDate;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp ng\u00E0y");
        field.focus();
        field = null;
        return false;
    }
    reformatNumberMoney(document.forms['contractForm'].shell12Price);
    reformatNumberMoney(document.forms['contractForm'].shell45Price);
    reformatNumberMoney(document.forms['contractForm'].creditDate);
    reformatNumberMoney(document.forms['contractForm'].creditAmount);
    document.forms['contractForm'].customerId.value = document.forms['contractForm'].customerSelectedHidden.value;
    scriptFunction = "saveContract";
    callAjaxCheckError("addContract.do", null, document.forms['contractForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getContract(0, handle);
        else
            loadContractPanel();
    });
    return false;
}
function delContract() {
    callAjaxCheckError('delContract.do?contractId=' + document.forms['contractForm'].id.value, null, null, function() {
        loadContractPanel();
    });
    return false;
}
function printContract(templateType) {
    var url = "printContract.do?contractId=" + document.forms['contractForm'].id.value + "&templateType=" + templateType;
    callServer(url);
    return false;
}
function loadAttchmentFileList(fileType, parentId) {
    if (fileType == null)
        fileType = document.getElementById("attchmentFileType").value;
    if (parentId == null)
        parentId = document.getElementById("attchmentFileParentId").value;
    if (fileType == null || parentId == null)
        return;
    mainGrid = new dhtmlXGridObject('attachmentFileList');
    mainGrid.setImagePath("js/dhtmlx/grid/imgs/");
    mainGrid.setHeader("Ch\u1ECDn,T\u00EAn file,Ng\u01B0\u1EDDi t\u1EA1o,Ng\u00E0y t\u1EA1o");
    mainGrid.attachHeader("&nbsp;,#text_filter,#text_filter,#text_filter");
    mainGrid.setInitWidths("50,350,250,200");
    mainGrid.setColTypes("ch,link,ro,ro");
    mainGrid.setColSorting("str,str,str");
    mainGrid.setSkin("light");
    mainGrid.al(true, 500); //enableAutoHeight
    mainGrid.enablePaging(true, 15, 3, "recinfoArea");
    mainGrid.setPagingSkin("toolbar", "dhx_skyblue");
    mainGrid.init();
    callAjax("getAttachmentFileList.do?fileType=" + fileType + "&parentId=" + parentId, null, null, function(data) {
        mainGrid.parse(data);
    });
    return false;
}
function getAttchmentFile() {
    popupName = 'TH\u00D4NG TIN FILE';
    var fileType = document.getElementById("attchmentFileType");
    var parentId = document.getElementById("attchmentFileParentId");
    if (fileType == null || parentId == null)
        return;
    fileType = fileType.value;
    parentId = parentId.value;
    callAjax("attchmentFileForm.do", null, null, function(data) {
        showPopupForm(data);
        vault = new dhtmlXVaultObject();
        vault.setImagePath("js/dhtmlx/vault/imgs/");
        vault.setServerHandlers("UploadHandler.do", "GetInfoHandler.do", "GetIdHandler.do");
        vault.setFilesLimit(1);
        vault.create("vaultDiv");
        vault.onUploadComplete = function(files) {
            var s = "";
            for (var i = 0; i < files.length; i++) {
                var file = files[i];
                s += ("id:" + file.id + ",name:" + file.name + ",uploaded:" + file.uploaded + ",error:" + file.error) + "\n";
            }
            if (file.uploaded == true) {
                callAjaxCheckError("uploadAction.do?attachFile=1&image=" + file.name + "&fileType=" + fileType + "&parentId=" + parentId, null, null, function(data) {
                    prepareHidePopup('uploadFormshowHelpHideDiv');
                    loadAttchmentFileList(fileType, parentId);
                });
            }
        };
    });
    return false;
}
function delAttchmentFile() {
    var checked = mainGrid.getCheckedRows(0);
    callAjaxCheckError("delAttchmentFile.do?ids=" + checked, null, null, function(data) {
        loadAttchmentFileList(null, null);
    });
    return false;
}
function showReportPanel(name) {
    var url = 'getReportPanel.do?reportName=' + name;
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        changePopupFormHeader(document.getElementById("reportSearchFormHeader").value);
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['reportSearchForm'].fromDate.value = currentTime;
        document.forms['reportSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
    });
}
function reportTimeChange(list, form) {
    if (list.selectedIndex == -1)
        return false;
    var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
    myCalendar.setSkin('dhx_web');
    var currentTime = new Date();
    var dd = currentTime.getDate();
    var mm = currentTime.getMonth() + 1;
    var yyyy = currentTime.getFullYear();
    if (dd < 10)
        dd = '0' + dd;
    if (mm < 10)
        mm = '0' + mm;
    list = list[list.selectedIndex].value;
    if (list == 1) {
        currentTime = dd + '/' + mm + '/' + yyyy;
        myCalendar.setDateFormat("%d/%m/%Y");
    } else if (list == 2) {
        currentTime = mm + '/' + yyyy;
        myCalendar.setDateFormat("%m/%Y");
    } else if (list == 3) {
        currentTime = yyyy;
        myCalendar.setDateFormat("%Y");
    }
    document.forms[form].fromDate.value = currentTime;
    document.forms[form].toDate.value = currentTime;
    return false;
}
function printReport(fromDate, toDate) {
    var list = document.getElementById("reportSearchFormTime");
    if (list == null || list.selectedIndex == -1)
        return false;
    if (list.selectedIndex == 1) {
        fromDate = "01/" + fromDate;
        var ind = toDate.indexOf("/");
        var month = toDate.substring(0, ind);
        var year = toDate.substring(ind + 1);
        toDate = month + "/01/" + year;
        var d = new Date(toDate);
        var lastDay = new Date(d.getFullYear(), d.getMonth() + 1, 0).getDate();
        toDate = lastDay + "/" + month + "/" + year;
    } else if (list.selectedIndex == 2) {
        fromDate = "01/01/" + fromDate;
        toDate = "31/12/" + toDate;
    }
    var url = "reportPrint.do?reportName=" + document.getElementById("reportSearchFormName").value;
    if (fromDate !== null)
        url += "&fromDate=" + fromDate;
    if (toDate !== null)
        url += "&toDate=" + toDate;
    callServer(url);
    return false;
}
function loadCustomerDocumentPanel() {
    callAjax("getCustomerDocumentPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        loadCustomerDocumentList();
    });
}
function loadCustomerDocumentList() {
    var mygrid = new dhtmlXGridObject('customerDocumentList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("T\u00EAn v\u0103n b\u1EA3n,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter");
    mygrid.setInitWidths("200,*");
    mygrid.setColTypes("link,ro");
    mygrid.setColSorting("str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getCustomerDocumentList.do";
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getCustomerDocument(id, handle) {
    popupName = 'TH\u00D4NG TIN V\u0102N B\u1EA2N';
    var url = 'customerDocumentForm.do?temp=1';
    if (id != 0)
        url += '&customerDocumentId=' + id;
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['customerDocumentForm'].name.focus();
    });
}
function saveCustomerDocument() {
    if (scriptFunction == "saveCustomerDocument")
        return false;
    var field = document.forms['customerDocumentForm'].name;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp t\u00EAn v\u0103n b\u1EA3n");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    scriptFunction = "saveCustomerDocument";
    callAjaxCheckError("addCustomerDocument.do", null, document.forms['customerDocumentForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getCustomerDocument(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('customerDocumentFormshowHelpHideDiv');
    });
    return false;
}
function delCustomerDocument() {
    callAjaxCheckError('delCustomerDocument.do?customerDocumentId=' + document.forms['customerDocumentForm'].id.value, null, null, function() {
        loadCustomerDocumentPanel();
        prepareHidePopup('customerDocumentFormshowHelpHideDiv');
    });
    return false;
}
function loadLpgSalePanel() {
    callAjax("getLpgSalePanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['lpgSaleSearchForm'].fromDate.value = currentTime;
        document.forms['lpgSaleSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadLpgSaleList(currentTime, currentTime);
    });
    return false;
}
function loadLpgSaleList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('lpgSaleList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("S\u1ED1 phi\u1EBFu,Kh\u00E1ch h\u00E0ng,S\u1ED1 l\u01B0\u1EE3ng,\u0110\u01A1n gi\u00E1,Th\u00E0nh ti\u1EC1n,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,200,150,150,150,*");
    mygrid.setColTypes("link,ro,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getLpgSaleList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getLpgSale(id, handle, lpgImportId) {
    popupName = 'TH\u00D4NG TIN PHI\u1EBEU B\u00C1N H\u00C0NG';
    var url = 'lpgSaleForm.do?temp=1';
    if (id != 0)
        url += '&lpgSaleId=' + id;
    if (lpgImportId != 0)
        url += '&lpgImportId=' + lpgImportId;
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        tryNumberFormatCurrentcy(document.forms['lpgSaleForm'].quantity, "VND");
        tryNumberFormatCurrentcy(document.forms['lpgSaleForm'].price, "VND");
        tryNumberFormatCurrentcy(document.forms['lpgSaleForm'].priceTransport, "VND");
        tryNumberFormatCurrentcy(document.forms['lpgSaleForm'].vat, "VND");
        tryNumberFormatCurrentcy(document.forms['lpgSaleForm'].total, "VND");
        tryNumberFormatCurrentcy(document.forms['lpgSaleForm'].paid, "VND");
        tryNumberFormatCurrentcy(document.forms['lpgSaleForm'].debt, "VND");
        tryNumberFormatCurrentcy(document.forms['lpgSaleForm'].rate, "VND");

        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        // ============================
        var routeIdCombobox = dhtmlXComboFromSelect("routeIdCombobox");
        routeIdCombobox.enableFilteringMode(true);
        routeIdCombobox.attachEvent("onSelectionChange", function() {
            setRouteSelectedForm('lpgSaleForm', routeIdCombobox.getComboText(), routeIdCombobox.getSelectedValue());
        });
        routeIdCombobox.attachEvent("onBlur", function() {
            setRouteSelectedForm('lpgSaleForm', routeIdCombobox.getComboText(), routeIdCombobox.getSelectedValue());
            routeIdCombobox.setComboText(routeIdCombobox.getSelectedText());
        });
        routeIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                routeIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        if (id == 0) {
            routeIdCombobox.setComboValue("");
        } else {
            var routeId = document.forms['lpgSaleForm'].routeId.value;
            if (routeId != 0) {
                var ind = routeIdCombobox.getIndexByValue(routeId);
                routeIdCombobox.selectOption(ind);
            } else {
                routeIdCombobox.unSelectOption();
                routeIdCombobox.setComboValue("");
            }
        }
        // ============================
        var customerIdCombobox = dhtmlXComboFromSelect("customerIdCombobox");
        customerIdCombobox.enableFilteringMode(true);
        customerIdCombobox.attachEvent("onSelectionChange", function() {
            setCustomerSelectedForm('lpgSaleForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
        });
        customerIdCombobox.attachEvent("onBlur", function() {
            setCustomerSelectedForm('lpgSaleForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
            customerIdCombobox.setComboText(customerIdCombobox.getSelectedText());
        });
        customerIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                customerIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        if (id == 0) {
            customerIdCombobox.setComboValue("");
            var currentDate = getCurrentDate();
            document.forms['lpgSaleForm'].lpgSaleDate.value = currentDate;
            customerIdCombobox.openSelect();
        } else {
            var customerId = document.forms['lpgSaleForm'].customerId.value;
            if (customerId != 0) {
                var ind = customerIdCombobox.getIndexByValue(customerId);
                customerIdCombobox.selectOption(ind);
            } else {
                customerIdCombobox.unSelectOption();
                customerIdCombobox.setComboValue("");
            }
        }
        var myCalendar = new dhtmlXCalendarObject(["lpgSaleDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");
    });
    if (lpgImportId > 0)
        return false;
}
function saveLpgSale() {
    if (scriptFunction == "saveLpgSale")
        return false;
    reformatNumberMoney(document.forms['lpgSaleForm'].quantity);
    reformatNumberMoney(document.forms['lpgSaleForm'].price);
    reformatNumberMoney(document.forms['lpgSaleForm'].priceTransport);
    reformatNumberMoney(document.forms['lpgSaleForm'].vat);
    reformatNumberMoney(document.forms['lpgSaleForm'].total);
    reformatNumberMoney(document.forms['lpgSaleForm'].paid);
    reformatNumberMoney(document.forms['lpgSaleForm'].debt);
    reformatNumberMoney(document.forms['lpgSaleForm'].rate);
    document.forms['lpgSaleForm'].routeId.value = document.forms['lpgSaleForm'].routeSelectedHidden.value;
    document.forms['lpgSaleForm'].customerId.value = document.forms['lpgSaleForm'].customerSelectedHidden.value;
    scriptFunction = "saveLpgSale";
    callAjaxCheckError("addLpgSale.do", null, document.forms['lpgSaleForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getLpgSale(0, handle, 0);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('lpgSaleFormshowHelpHideDiv');
    });
    return false;
}
function delLpgSale() {
    callAjaxCheckError('delLpgSale.do?lpgSaleId=' + document.forms['lpgSaleForm'].id.value, null, null, function() {
        loadLpgSalePanel();
        prepareHidePopup('lpgSaleFormshowHelpHideDiv');
    });
    return false;
}
function lpgSaleCaculateAmount() {
    var quantity = document.forms['lpgSaleForm'].quantity;
    var price = document.forms['lpgSaleForm'].price;
    var priceTransport = document.forms['lpgSaleForm'].priceTransport;
    var vat = document.forms['lpgSaleForm'].vat;
    var rate = document.forms['lpgSaleForm'].rate;
    var amount = document.forms['lpgSaleForm'].total;
    var paid = document.forms['lpgSaleForm'].paid;
    var debt = document.forms['lpgSaleForm'].debt;
    amount.value = reformatNumberMoneyString(quantity.value) * (reformatNumberMoneyString(price.value) * 1 + reformatNumberMoneyString(priceTransport.value) * 1) * (100 + reformatNumberMoneyString(vat.value) * 1) / 100 * reformatNumberMoneyString(rate.value) / 1000;
    paid.value = 0;
    debt.value = amount.value;
    tryNumberFormatCurrentcy(quantity, "VND");
    tryNumberFormatCurrentcy(price, "USD");
    tryNumberFormatCurrentcy(priceTransport, "USD");
    tryNumberFormatCurrentcy(vat, "USD");
    tryNumberFormatCurrentcy(rate, "VND");
    tryNumberFormatCurrentcy(amount, "VND");
    tryNumberFormatCurrentcy(debt, "VND");
    quantity = null;
    price = null;
    priceTransport = null;
    vat = null;
    rate = null;
    amount = null;
    paid = null;
    debt = null;
    return false;
}
function loadShieldImportPanel() {
    callAjax("getShieldImportPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['shieldImportSearchForm'].fromDate.value = currentTime;
        document.forms['shieldImportSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadShieldImportList(currentTime, currentTime);
    });
    return false;
}
function loadShieldImportList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('shieldImportList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("S\u1ED1 phi\u1EBFu,Ng\u00E0y,S\u1ED1 l\u01B0\u1EE3ng,Nh\u00E0 cung c\u1EA5p,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,150,200,200,*");
    mygrid.setColTypes("link,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getShieldImportList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getShieldImport(id, handle) {
    popupName = 'TH\u00D4NG TIN PHI\u1EBEU NH\u1EACP';
    var url = 'shieldImportForm.do';
    if (id != 0)
        url += '?shieldImportId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['shieldImportForm'].quantity.focus();
        tryNumberFormatCurrentcy(document.forms['shieldImportForm'].quantity, "VND");
        var myCalendar = new dhtmlXCalendarObject(["shieldImportDate"]);
        myCalendar.setSkin('dhx_web');
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['shieldImportForm'].shieldImportDate.value = currentDate;
            var myCalendar = new dhtmlXCalendarObject(["shieldImportDate"]);
            myCalendar.setSkin('dhx_web');
            myCalendar.setDateFormat("%d/%m/%Y");
        }
        myCalendar.setDateFormat("%d/%m/%Y");
    });
}
function saveShieldImport() {
    if (scriptFunction == "saveShieldImport")
        return false;
    var field = document.forms['shieldImportForm'].createdDate;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp ng\u00E0y t\u1EA1o");
        field.focus();
        field = null;
        return false;
    }
    field = document.forms['shieldImportForm'].quantity;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    reformatNumberMoney(document.forms['shieldImportForm'].quantity);
    scriptFunction = "saveShieldImport";
    callAjaxCheckError("addShieldImport.do", null, document.forms['shieldImportForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getShieldImport(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('shieldImportFormshowHelpHideDiv');
    });
    return false;
}
function delShieldImport() {
    callAjaxCheckError('delShieldImport.do?shieldImportId=' + document.forms['shieldImportForm'].id.value, null, null, function() {
        loadShieldImportPanel();
        prepareHidePopup('shieldImportFormshowHelpHideDiv');
    });
    return false;
}
function loadShieldDecreasePanel() {
    callAjax("getShieldDecreasePanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['shieldDecreaseSearchForm'].fromDate.value = currentTime;
        document.forms['shieldDecreaseSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadShieldDecreaseList(currentTime, currentTime);
    });
    return false;
}
function loadShieldDecreaseList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('shieldDecreaseList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("S\u1ED1 phi\u1EBFu,Ng\u00E0y,S\u1ED1 l\u01B0\u1EE3ng,Nh\u00E0 cung c\u1EA5p,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,150,200,200,*");
    mygrid.setColTypes("link,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getShieldDecreaseList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getShieldDecrease(id, handle) {
    popupName = 'TH\u00D4NG TIN PHI\u1EBEU GI\u1EA2M';
    var url = 'shieldDecreaseForm.do';
    if (id != 0)
        url += '?shieldDecreaseId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['shieldDecreaseForm'].quantity.focus();
        tryNumberFormatCurrentcy(document.forms['shieldDecreaseForm'].quantity, "VND");
        var myCalendar = new dhtmlXCalendarObject(["shieldDecreaseDate"]);
        myCalendar.setSkin('dhx_web');
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['shieldDecreaseForm'].shieldDecreaseDate.value = currentDate;
        }
        myCalendar.setDateFormat("%d/%m/%Y");
    });
}
function saveShieldDecrease() {
    if (scriptFunction == "saveShieldDecrease")
        return false;
    var field = document.forms['shieldDecreaseForm'].createdDate;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp ng\u00E0y t\u1EA1o");
        field.focus();
        field = null;
        return false;
    }
    field = document.forms['shieldDecreaseForm'].quantity;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    reformatNumberMoney(document.forms['shieldDecreaseForm'].quantity);
    scriptFunction = "saveShieldDecrease";
    callAjaxCheckError("addShieldDecrease.do", null, document.forms['shieldDecreaseForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getShieldDecrease(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('shieldDecreaseFormshowHelpHideDiv');
    });
    return false;
}
function delShieldDecrease() {
    callAjaxCheckError('delShieldDecrease.do?shieldDecreaseId=' + document.forms['shieldDecreaseForm'].id.value, null, null, function() {
        loadShieldDecreasePanel();
        prepareHidePopup('shieldDecreaseFormshowHelpHideDiv');
    });
    return false;
}
function loadVendorOrganizationPanel() {
    callAjax("getVendorOrganizationPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        loadVendorOrganizationList();
    });
}
function loadVendorOrganizationList() {
    var mygrid = new dhtmlXGridObject('vendorOrganizationList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("\u0110\u01A1n v\u1ECB,Nh\u00E0 cung c\u1EA5p");
    mygrid.attachHeader("#select_filter,#text_filter");
    mygrid.setInitWidths("300,*");
    mygrid.setColTypes("link,ro");
    mygrid.setColSorting("str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getVendorOrganizationList.do";
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getVendorOrganization(id, handle) {
    popupName = 'TH\u00D4NG TIN NH\u00C0 CUNG C\u1EA4P LI\u00CAN K\u1EBET';
    var url = 'vendorOrganizationForm.do';
    if (id != 0)
        url += '?vendorOrganizationId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
    });
}
function saveVendorOrganization() {
    if (scriptFunction == "saveVendorOrganization")
        return false;
    scriptFunction = "saveVendorOrganization";
    callAjaxCheckError("addVendorOrganization.do", null, document.forms['vendorOrganizationForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getVendorOrganization(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('vendorOrganizationFormshowHelpHideDiv');
    });
    return false;
}
function delVendorOrganization() {
    callAjaxCheckError('delVendorOrganization.do?vendorOrganizationId=' + document.forms['vendorOrganizationForm'].id.value, null, null, function() {
        loadVendorOrganizationPanel();
        prepareHidePopup('dynamicFieldFormshowHelpHideDiv');
    });
    return false;
}
function showCompareReportPanel() {
    popupName = 'Bi\u00EAn b\u1EA3n \u0111\u1ED1i chi\u1EBFu c\u00F4ng n\u1EE3';
    var url = 'getCompareReportPanel.do';
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['reportCompareSearchForm'].fromDate.value = currentTime;
        document.forms['reportCompareSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        // ============================
        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        var customerIdCombobox = dhtmlXComboFromSelect("customerIdComboboxPopup");
        customerIdCombobox.enableFilteringMode(true);
        customerIdCombobox.attachEvent("onSelectionChange", function() {
            setCustomerSelectedForm('reportCompareSearchForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
        });
        customerIdCombobox.attachEvent("onBlur", function() {
            setCustomerSelectedForm('reportCompareSearchForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
            customerIdCombobox.setComboText(customerIdCombobox.getSelectedText());
        });
        customerIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                customerIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        customerIdCombobox.setComboValue("");
    });
}
function printComapreReport(fromDate, toDate) {
    var list = document.getElementById("reportCompareSearchFormTime");
    if (list == null || list.selectedIndex == -1)
        return false;
    if (list.selectedIndex == 1) {
        fromDate = "01/" + fromDate;
        var ind = toDate.indexOf("/");
        var month = toDate.substring(0, ind);
        var year = toDate.substring(ind + 1);
        toDate = month + "/01/" + year;
        var d = new Date(toDate);
        var lastDay = new Date(d.getFullYear(), d.getMonth() + 1, 0).getDate();
        toDate = lastDay + "/" + month + "/" + year;
    } else if (list.selectedIndex == 2) {
        fromDate = "01/01/" + fromDate;
        toDate = "31/12/" + toDate;
    }
    var url = "reportComparePrint.do?temp=1";
    if (fromDate !== null)
        url += "&fromDate=" + fromDate;
    if (toDate !== null)
        url += "&toDate=" + toDate;
    list = null;
    url += "&customerId=" + document.forms['reportCompareSearchForm'].customerSelectedHidden.value;
    callServer(url);
    return false;
}
function showLpgStockSumOrganizationReportPanel() {
    popupName = 'S\u1ED5 theo d\u00F5i nh\u1EADp xu\u1EA5t kh\u00ED h\u00F3a l\u1ECFng LPG';
    var url = 'getLpgStockSumOrganizationReportPanel.do';
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['reportLpgStockSumOrganizationSearchForm'].fromDate.value = currentTime;
        document.forms['reportLpgStockSumOrganizationSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
    });
}
function printLpgStockSumOrganizationReport(fromDate, toDate) {
    var list = document.getElementById("reportLpgStockSumOrganizationSearchFormTime");
    if (list == null || list.selectedIndex == -1)
        return false;
    if (list.selectedIndex == 1) {
        fromDate = "01/" + fromDate;
        var ind = toDate.indexOf("/");
        var month = toDate.substring(0, ind);
        var year = toDate.substring(ind + 1);
        toDate = month + "/01/" + year;
        var d = new Date(toDate);
        var lastDay = new Date(d.getFullYear(), d.getMonth() + 1, 0).getDate();
        toDate = lastDay + "/" + month + "/" + year;
    } else if (list.selectedIndex == 2) {
        fromDate = "01/01/" + fromDate;
        toDate = "31/12/" + toDate;
    }
    var url = "reportLpgStockSumOrganizationPrint.do?temp=1";
    if (fromDate !== null)
        url += "&fromDate=" + fromDate;
    if (toDate !== null)
        url += "&toDate=" + toDate;
    list = document.forms['reportLpgStockSumOrganizationSearchForm'].vendorId;
    if (list != null && list.selectedIndex > -1)
        list = list.options[list.selectedIndex].value;
    else
        list = 0;
    url += "&vendorId=" + list;
    callServer(url);
    return false;
}
function setEmployeeSelectedForm(form, text, value) {
    if (value == null) {
        if (text != "")
            value = "-1";
        else
            value = "0";
    }
    document.forms[form].employeeSelectedHidden.value = value;
}
function loadDiscountPanel() {
    callAjax("getDiscountPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        loadDiscountList();
    });
    return false;
}
function loadDiscountList() {
    var mygrid = new dhtmlXGridObject('discountList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("M\u00E3 chi\u1EBFt kh\u1EA5u,T\u00EAn chi\u1EBFt kh\u1EA5u,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,150,*");
    mygrid.setColTypes("link,ro,ro");
    mygrid.setColSorting("str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getDiscountList.do";
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getDiscount(id) {
    var url = 'discountForm.do';
    if (id != 0)
        url += '?discountId=' + id
    callAjax(url, null, null, function(data) {
        clearContent();
        setAjaxData(data, 'contentDiv');
        document.forms['discountForm'].name.focus();
        formatDiscountCommissionDetail();
    });
}
function saveDiscount() {
    if (scriptFunction == "saveDiscount")
        return false;
    var field = document.forms['discountForm'].name;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp t\u00EAn chi\u1EBFt kh\u1EA5u");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    reformatDiscountCommissionDetail();
    scriptFunction = "saveDiscount";
    callAjaxCheckError("addDiscount.do", null, document.forms['discountForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getDiscount(0, handle);
        else
            loadDiscountPanel();
    });
    return false;
}
function addDiscountCommission() {
    callAjax("getDiscountCommission.do", null, null, function(data) {
        setAjaxData(data, 'discountCommissionHideDiv');
        var matTable = document.getElementById('discountCommissionTbl');
        var detTable = document.getElementById('discountCommissionDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
        formatDiscountCommissionDetail();
    });
    return false;
}
function formatDiscountCommissionDetail() {
    var discountCommissionFrom = document.forms['discountForm'].discountCommissionFrom;
    var discountCommissionTo = document.forms['discountForm'].discountCommissionTo;
    var discountCommissionCommission = document.forms['discountForm'].discountCommissionCommission;
    if (discountCommissionCommission != null) {
        if (discountCommissionCommission.length != null) {
            for (var i = 0; i < discountCommissionCommission.length; i++) {
                tryNumberFormatCurrentcy(discountCommissionFrom[i], "VND");
                tryNumberFormatCurrentcy(discountCommissionTo[i], "VND");
                tryNumberFormatCurrentcy(discountCommissionCommission[i], "VND");
            }
        } else {
            tryNumberFormatCurrentcy(discountCommissionFrom, "VND");
            tryNumberFormatCurrentcy(discountCommissionTo, "VND");
            tryNumberFormatCurrentcy(discountCommissionCommission, "VND");
        }
    }
    discountCommissionFrom = null;
    discountCommissionTo = null;
    discountCommissionCommission = null;
}
function reformatDiscountCommissionDetail() {
    var discountCommissionFrom = document.forms['discountForm'].discountCommissionFrom;
    var discountCommissionTo = document.forms['discountForm'].discountCommissionTo;
    var discountCommissionCommission = document.forms['discountForm'].discountCommissionCommission;
    if (discountCommissionCommission != null) {
        if (discountCommissionCommission.length != null) {
            for (var i = 0; i < discountCommissionCommission.length; i++) {
                reformatNumberMoney(discountCommissionFrom[i]);
                reformatNumberMoney(discountCommissionTo[i]);
                reformatNumberMoney(discountCommissionCommission[i]);
            }
        } else {
            reformatNumberMoney(discountCommissionFrom);
            reformatNumberMoney(discountCommissionTo);
            reformatNumberMoney(discountCommissionCommission);
        }
    }
    discountCommissionFrom = null;
    discountCommissionTo = null;
    discountCommissionCommission = null;
}
function delDiscount() {
    callAjaxCheckError('delDiscount.do?discountId=' + document.forms['discountForm'].id.value, null, null, function() {
        loadDiscountPanel();
        prepareHidePopup('discountFormshowHelpHideDiv');
    });
    return false;
}
function showPetroStockStoreReportPanel() {
    popupName = 'S\u1ED5 theo d\u00F5i NXT x\u0103ng d\u1EA7u theo c\u1EEDa h\u00E0ng';
    var url = 'getPetroStockStoreReportPanel.do';
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['reportPetroStockStoreSearchForm'].fromDate.value = currentTime;
        document.forms['reportPetroStockStoreSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
    });
}
function printPetroStockStoreReport(fromDate, toDate) {
    var list = document.getElementById("reportPetroStockStoreSearchFormTime");
    if (list == null || list.selectedIndex == -1)
        return false;
    if (list.selectedIndex == 1) {
        fromDate = "01/" + fromDate;
        var ind = toDate.indexOf("/");
        var month = toDate.substring(0, ind);
        var year = toDate.substring(ind + 1);
        toDate = month + "/01/" + year;
        var d = new Date(toDate);
        var lastDay = new Date(d.getFullYear(), d.getMonth() + 1, 0).getDate();
        toDate = lastDay + "/" + month + "/" + year;
    } else if (list.selectedIndex == 2) {
        fromDate = "01/01/" + fromDate;
        toDate = "31/12/" + toDate;
    }
    var url = "reportPetroStockStorePrint.do?temp=1";
    if (fromDate !== null)
        url += "&fromDate=" + fromDate;
    if (toDate !== null)
        url += "&toDate=" + toDate;
    list = document.forms['reportPetroStockStoreSearchForm'].storeId;
    if (list != null && list.selectedIndex > -1)
        list = list.options[list.selectedIndex].value;
    else
        list = 0;
    url += "&storeId=" + list;
    callServer(url);
    return false;
}
function loadGoodPanel() {
    callAjax("getGoodPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        loadGoodList();
    });
}
function loadGoodList() {
    var mygrid = new dhtmlXGridObject('goodList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("M\u00E3 h\u00E0ng h\u00F3a,T\u00EAn h\u00E0ng h\u00F3a,Gi\u00E1 b\u00E1n,\u0110\u01A1n v\u1ECB t\u00EDnh,\u0110\u01A1n v\u1ECB,T\u00ECnh tr\u1EA1ng");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#select_filter");
    mygrid.setInitWidths("150,*,150,150,300,200");
    mygrid.setColTypes("link,ro,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var list = document.forms['goodSearchForm'].statusCombobox;
    if (list != null && list.selectedIndex > -1)
        list = list.options[list.selectedIndex].value;
    else
        list = 0;
    var url = "getGoodList.do?status=" + list;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getGood(id, handle) {
    popupName = 'TH\u00D4NG TIN H\u00C0NG H\u00D3A';
    var url = 'goodForm.do';
    if (id != 0)
        url += '?goodId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['goodForm'].code.focus();
        tryNumberFormatCurrentcy(document.forms['goodForm'].price, "VND");
    });
}
function saveGood() {
    if (scriptFunction == "saveGood")
        return false;
    var field = document.forms['goodForm'].code;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp m\u00E3 h\u00E0ng h\u00F3a");
        field.focus();
        field = null;
        return false;
    }
    field = document.forms['goodForm'].name;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp t\u00EAn h\u00E0ng h\u00F3a");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    reformatNumberMoney(document.forms['goodForm'].price);
    scriptFunction = "saveGood";
    callAjaxCheckError("addGood.do", null, document.forms['goodForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getGood(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('goodFormshowHelpHideDiv');
    });
    return false;
}
function loadGoodImportPanel() {
    callAjax("getGoodImportPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['goodImportSearchForm'].fromDate.value = currentTime;
        document.forms['goodImportSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadGoodImportList(currentTime, currentTime);
    });
    return false;
}
function loadGoodImportList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('goodImportList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("M\u00E3 phi\u1EBFu,Ng\u00E0y,Nh\u00E0 cung c\u1EA5p,Kho,T\u1ED5ng ti\u1EC1n,Thanh to\u00E1n,C\u00F2n n\u1EE3,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#select_filter,#select_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,100,150,150,150,150,*");
    mygrid.setColTypes("link,ro,ro,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getGoodImportList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getGoodImport(id) {
    var url = 'goodImportForm.do';
    if (id != 0)
        url += '?goodImportId=' + id
    callAjax(url, null, null, function(data) {
        clearContent();
        setAjaxData(data, 'contentDiv');
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['goodImportForm'].goodImportCreatedDate.value = currentDate;
        }
        var myCalendar = new dhtmlXCalendarObject(["goodImportCreatedDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");

        tryNumberFormatCurrentcy(document.forms['goodImportForm'].total, "VND");
        tryNumberFormatCurrentcy(document.forms['goodImportForm'].paid, "VND");
        tryNumberFormatCurrentcy(document.forms['goodImportForm'].debt, "VND");
        tryNumberFormatCurrentcy(document.forms['goodImportForm'].rate, "VND");
        formatFormDetail('goodImportForm');

        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        // ============================
        var goodIdCombobox = dhtmlXComboFromSelect("goodIdCombobox");
        goodIdCombobox.enableFilteringMode(true);
        goodIdCombobox.attachEvent("onSelectionChange", function() {
            setGoodSelectedForm('goodImportForm', goodIdCombobox.getComboText(), goodIdCombobox.getSelectedValue());
        });
        goodIdCombobox.attachEvent("onBlur", function() {
            setGoodSelectedForm('goodImportForm', goodIdCombobox.getComboText(), goodIdCombobox.getSelectedValue());
        });
        goodIdCombobox.DOMelem_input.onkeypress = function(event) {
            var key;
            if (window.event)
                key = window.event.keyCode;//IE
            else
                key = event.which;//firefox
            if (key == 13) {
                addGoodImportGood();
                goodIdCombobox.setComboValue("");
            }
        }
        goodIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                goodIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        goodIdCombobox.setComboValue("");
    });
}
function saveGoodImport() {
    if (scriptFunction == "saveGoodImport")
        return false;
    var quantity = document.forms['goodImportForm'].quantity;
    if (quantity == null) {
        alert('Vui l\u00F2ng ch\u1ECDn h\u00E0ng h\u00F3a');
        return false;
    }
    var price = document.forms['goodImportForm'].price;
    var amount = document.forms['goodImportForm'].amount;
    if (quantity.length != null) {
        for (var i = 0; i < quantity.length; i++) {
            var number = Number(quantity[i].value);
            if (number == 0) {
                alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
                quantity[i].focus();
                quantity = null;
                return false;
            }
            reformatNumberMoney(quantity[i]);
            reformatNumberMoney(price[i]);
            reformatNumberMoney(amount[i]);
        }
    } else {
        if (quantity.value == "0") {
            alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
            quantity.focus();
            quantity = null;
            return false;
        }
        reformatNumberMoney(quantity);
        reformatNumberMoney(price);
        reformatNumberMoney(amount);
    }
    quantity = null;
    price = null;
    amount = null;
    reformatNumberMoney(document.forms['goodImportForm'].total);
    reformatNumberMoney(document.forms['goodImportForm'].paid);
    reformatNumberMoney(document.forms['goodImportForm'].debt);
    reformatNumberMoney(document.forms['goodImportForm'].rate);
    scriptFunction = "saveGoodImport";
    callAjaxCheckError("addGoodImport.do", null, document.forms['goodImportForm'], function(data) {
        scriptFunction = "";
        loadGoodImportPanel();
    });
    return false;
}
function addGoodImportGood() {
    var good = document.forms['goodImportForm'].goodSelectedHidden.value;
    if (good == -1 || good == 0)
        return false;
    var goodId = document.forms['goodImportForm'].goodId;
    var existed = false;
    if (goodId != null) {
        if (goodId.length != null) {
            for (i = 0; i < goodId.length; i++) {
                if (goodId[i].value == good) {
                    existed = true;
                    break;
                }
            }
        } else if (goodId.value == good)
            existed = true;
    }
    goodId = null;
    if (existed == true) {
        alert("H\u00E0ng ho\u00E1 \u0111\u00E3 t\u1ED3n t\u1EA1i");
        return false;
    }
    callAjax("getGoodImportGood.do?goodId=" + good, null, null, function(data) {
        setAjaxData(data, 'goodImportGoodHideDiv');
        var matTable = document.getElementById('goodImportGoodTbl');
        var detTable = document.getElementById('goodImportDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
        formatFormDetail('goodImportForm');
    });
    return false;
}
function delGoodImport() {
    callAjaxCheckError('delGoodImport.do?goodImportId=' + document.forms['goodImportForm'].id.value, null, null, function() {
        loadGoodImportPanel();
    });
    return false;
}
function loadSaleGoodPanel() {
    callAjax("getSaleGoodPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['saleGoodSearchForm'].fromDate.value = currentTime;
        document.forms['saleGoodSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadSaleGoodList(currentTime, currentTime);
    });
    return false;
}
function loadSaleGoodList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('saleGoodList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("M\u00E3 phi\u1EBFu,Ng\u00E0y,T\u1ED5ng ti\u1EC1n,Thanh to\u00E1n,C\u00F2n n\u1EE3,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,100,150,150,*");
    mygrid.setColTypes("link,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getSaleGoodList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getSaleGood(id) {
    var url = 'saleGoodForm.do';
    if (id != 0)
        url += '?saleGoodId=' + id
    callAjax(url, null, null, function(data) {
        clearContent();
        setAjaxData(data, 'contentDiv');
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['saleGoodForm'].saleGoodCreatedDate.value = currentDate;
        }

        var myCalendar = new dhtmlXCalendarObject(["saleGoodCreatedDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");

        tryNumberFormatCurrentcy(document.forms['saleGoodForm'].total, "VND");
        tryNumberFormatCurrentcy(document.forms['saleGoodForm'].paid, "VND");
        tryNumberFormatCurrentcy(document.forms['saleGoodForm'].debt, "VND");
        tryNumberFormatCurrentcy(document.forms['saleGoodForm'].discount, "VND");
        tryNumberFormatCurrentcy(document.forms['saleGoodForm'].totalPay, "VND");
        formatFormDetail('saleGoodForm');

        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        // ============================
        var goodIdCombobox = dhtmlXComboFromSelect("goodIdCombobox");
        goodIdCombobox.enableFilteringMode(true);
        goodIdCombobox.attachEvent("onSelectionChange", function() {
            setGoodSelectedForm('saleGoodForm', goodIdCombobox.getComboText(), goodIdCombobox.getSelectedValue());
        });
        goodIdCombobox.attachEvent("onBlur", function() {
            setGoodSelectedForm('saleGoodForm', goodIdCombobox.getComboText(), goodIdCombobox.getSelectedValue());
        });
        goodIdCombobox.DOMelem_input.onkeypress = function(event) {
            var key;
            if (window.event)
                key = window.event.keyCode;//IE
            else
                key = event.which;//firefox
            if (key == 13) {
                addSaleGoodGood();
                goodIdCombobox.setComboValue("");
            }
        }
        goodIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                goodIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        goodIdCombobox.setComboValue("");
        // ============================
        var customerIdCombobox = dhtmlXComboFromSelect("customerIdCombobox");
        customerIdCombobox.enableFilteringMode(true);
        customerIdCombobox.attachEvent("onSelectionChange", function() {
            setCustomerSelectedForm('saleGoodForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
        });
        customerIdCombobox.attachEvent("onBlur", function() {
            setCustomerSelectedForm('saleGoodForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
            customerIdCombobox.setComboText(customerIdCombobox.getSelectedText());
        });
        customerIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                customerIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        if (id == 0) {
            customerIdCombobox.setComboValue("");
        } else {
            var customerId = document.forms['saleGoodForm'].customerId.value;
            if (customerId != 0) {
                var ind = customerIdCombobox.getIndexByValue(customerId);
                customerIdCombobox.selectOption(ind);
            } else {
                customerIdCombobox.unSelectOption();
                customerIdCombobox.setComboValue("");
            }
        }
    });
}
function setGoodSelectedForm(form, text, value) {
    if (value == null) {
        if (text != "")
            value = "-1";
        else
            value = "0";
    }
    document.forms[form].goodSelectedHidden.value = value;
}
function saveSaleGood() {
    if (scriptFunction == "saveSaleGood")
        return false;
    var quantity = document.forms['saleGoodForm'].quantity;
    if (quantity == null) {
        alert('Vui l\u00F2ng ch\u1ECDn h\u00E0ng h\u00F3a');
        return false;
    }
    var price = document.forms['saleGoodForm'].price;
    var amount = document.forms['saleGoodForm'].amount;
    if (quantity.length != null) {
        for (var i = 0; i < quantity.length; i++) {
            var number = Number(quantity[i].value);
            if (number == 0) {
                alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
                quantity[i].focus();
                quantity = null;
                return false;
            }
            reformatNumberMoney(quantity[i]);
            reformatNumberMoney(price[i]);
            reformatNumberMoney(amount[i]);
        }
    } else {
        if (quantity.value == "0") {
            alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
            quantity.focus();
            quantity = null;
            return false;
        }
        reformatNumberMoney(quantity);
        reformatNumberMoney(price);
        reformatNumberMoney(amount);
    }
    quantity = null;
    price = null;
    amount = null;
    reformatNumberMoney(document.forms['saleGoodForm'].total);
    reformatNumberMoney(document.forms['saleGoodForm'].paid);
    reformatNumberMoney(document.forms['saleGoodForm'].debt);
    reformatNumberMoney(document.forms['saleGoodForm'].discount);
    reformatNumberMoney(document.forms['saleGoodForm'].totalPay);
    reformatFormDetail('saleGoodForm');
    document.forms['saleGoodForm'].customerId.value = document.forms['saleGoodForm'].customerSelectedHidden.value;
    scriptFunction = "saveSaleGood";
    callAjaxCheckError("addSaleGood.do", null, document.forms['saleGoodForm'], function(data) {
        scriptFunction = "";
        loadSaleGoodPanel();
    });
    return false;
}
function addSaleGoodGood() {
    var good = document.forms['saleGoodForm'].goodSelectedHidden.value;
    if (good == -1 || good == 0)
        return false;
    var goodId = document.forms['saleGoodForm'].goodId;
    var existed = false;
    if (goodId != null) {
        if (goodId.length != null) {
            for (i = 0; i < goodId.length; i++) {
                if (goodId[i].value == good) {
                    existed = true;
                    break;
                }
            }
        } else if (goodId.value == good)
            existed = true;
    }
    goodId = null;
    if (existed == true) {
        alert("H\u00E0ng ho\u00E1 \u0111\u00E3 t\u1ED3n t\u1EA1i");
        return false;
    }
    callAjax("getSaleGoodGood.do?goodId=" + good, null, null, function(data) {
        setAjaxData(data, 'saleGoodGoodHideDiv');
        var matTable = document.getElementById('saleGoodGoodTbl');
        var detTable = document.getElementById('saleGoodDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
        formatFormDetail('saleGoodForm');
    });
    return false;
}
function delSaleGood() {
    callAjaxCheckError('delSaleGood.do?saleGoodId=' + document.forms['saleGoodForm'].id.value, null, null, function() {
        loadSaleGoodPanel();
    });
    return false;
}
function showCompareGoodReportPanel() {
    popupName = 'Bi\u00EAn b\u1EA3n \u0111\u1ED1i chi\u1EBFu c\u00F4ng n\u1EE3';
    var url = 'getCompareGoodReportPanel.do';
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['reportCompareGoodSearchForm'].fromDate.value = currentTime;
        document.forms['reportCompareGoodSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
    });
}
function printComapreGoodReport(fromDate, toDate) {
    var list = document.getElementById("reportCompareGoodSearchFormTime");
    if (list == null || list.selectedIndex == -1)
        return false;
    if (list.selectedIndex == 1) {
        fromDate = "01/" + fromDate;
        var ind = toDate.indexOf("/");
        var month = toDate.substring(0, ind);
        var year = toDate.substring(ind + 1);
        toDate = month + "/01/" + year;
        var d = new Date(toDate);
        var lastDay = new Date(d.getFullYear(), d.getMonth() + 1, 0).getDate();
        toDate = lastDay + "/" + month + "/" + year;
    } else if (list.selectedIndex == 2) {
        fromDate = "01/01/" + fromDate;
        toDate = "31/12/" + toDate;
    }
    var url = "reportCompareGoodPrint.do?temp=1";
    if (fromDate !== null)
        url += "&fromDate=" + fromDate;
    if (toDate !== null)
        url += "&toDate=" + toDate;
    list = document.forms['reportCompareGoodSearchForm'].customerId;
    if (list != null && list.selectedIndex > -1)
        list = list.options[list.selectedIndex].value;
    else
        list = 0;
    url += "&customerId=" + list;
    callServer(url);
    return false;
}
function getGasReturnVendor() {
    popupName = 'TH\u00D4NG TIN NH\u00C0 CUNG C\u1EA4P NH\u1EACN TR\u1EA2 GAS';
    var url = 'gasReturnVendorForm.do';
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
    });
}
function saveGasReturnVendor() {
    if (scriptFunction == "saveGasReturnVendor")
        return false;
    scriptFunction = "saveGasReturnVendor";
    callAjaxCheckError("addGasReturnVendor.do", null, document.forms['gasReturnVendorForm'], function(data) {
        scriptFunction = "";
        prepareHidePopup('gasReturnVendorFormshowHelpHideDiv');
    });
    return false;
}
function loadLoVoPanel() {
    callAjax("getLoVoPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['loVoSearchForm'].fromDate.value = currentTime;
        document.forms['loVoSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadLoVoList(currentTime, currentTime);
    });
    return false;
}
function loadLoVoList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('loVoList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("M\u00E3 phi\u1EBFu,Ng\u00E0y,S\u1ED1 l\u01B0\u1EE3ng,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,100,150,*");
    mygrid.setColTypes("link,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getLoVoList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getLoVo(id) {
    var url = 'loVoForm.do';
    if (id != 0)
        url += '?loVoId=' + id
    callAjax(url, null, null, function(data) {
        clearContent();
        setAjaxData(data, 'contentDiv');
        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";

        var employeeIdCombobox = dhtmlXComboFromSelect("employeeIdCombobox");
        employeeIdCombobox.enableFilteringMode(true);
        employeeIdCombobox.attachEvent("onSelectionChange", function() {
            setEmployeeSelectedForm('loVoForm', employeeIdCombobox.getComboText(), employeeIdCombobox.getSelectedValue());
        });
        employeeIdCombobox.attachEvent("onBlur", function() {
            setEmployeeSelectedForm('loVoForm', employeeIdCombobox.getComboText(), employeeIdCombobox.getSelectedValue());
        });
        employeeIdCombobox.DOMelem_input.onkeypress = function(event) {
            var key;
            if (window.event)
                key = window.event.keyCode;//IE
            else
                key = event.which;//firefox
            if (key == 13) {
                addLoVoEmployee();
                employeeIdCombobox.setComboValue("");
            }
        }
        employeeIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                employeeIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        employeeIdCombobox.setComboValue("");
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['loVoForm'].loVoCreatedDate.value = currentDate;
        }
        var myCalendar = new dhtmlXCalendarObject(["loVoCreatedDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");

        tryNumberFormatCurrentcy(document.forms['loVoForm'].quantity, "VND");
    });
}
function saveLoVo() {
    if (scriptFunction == "saveLoVo")
        return false;
    reformatNumberMoney(document.forms['loVoForm'].quantity);
    scriptFunction = "saveLoVo";
    callAjaxCheckError("addLoVo.do", null, document.forms['loVoForm'], function(data) {
        scriptFunction = "";
        loadLoVoPanel();
    });
    return false;
}
function delLoVo() {
    callAjaxCheckError('delLoVo.do?loVoId=' + document.forms['loVoForm'].id.value, null, null, function() {
        loadLoVoPanel();
    });
    return false;
}
function addLoVoEmployee() {
    var employee = document.forms['loVoForm'].employeeSelectedHidden.value;
    if (employee == -1 || employee == 0)
        return false;
    var employeeId = document.forms['loVoForm'].employeeId;
    var existed = false;
    if (employeeId != null) {
        if (employeeId.length != null) {
            for (i = 0; i < employeeId.length; i++) {
                if (employeeId[i].value == employee) {
                    existed = true;
                    break;
                }
            }
        } else if (employeeId.value == employee)
            existed = true;
    }
    employeeId = null;
    if (existed == true) {
        alert("H\u00E0ng ho\u00E1 \u0111\u00E3 t\u1ED3n t\u1EA1i");
        return false;
    }
    callAjax("getLoVoEmployee.do?employeeId=" + employee, null, null, function(data) {
        setAjaxData(data, 'loVoEmployeeHideDiv');
        var matTable = document.getElementById('loVoEmployeeTbl');
        var detTable = document.getElementById('loVoEmployeeDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
    });
    return false;
}
function loadOpeningStockPanel() {
    callAjax("getOpeningStockPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["openingStockDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");
    });
}
function printOpeningStockExport(kind) {
    var url = "exportOpeningStock.do?reportName=" + kind;
    var date = document.getElementById("openingStockDate").value;
    if (date !== null)
        url += "&date=" + date;
    callServer(url);
    return false;
}
function importOpeningStock(openingStockKind) {
    popupName = 'TH\u00D4NG TIN FILE';
    callAjax("attchmentFileForm.do", null, null, function(data) {
        showPopupForm(data);
        vault = new dhtmlXVaultObject();
        vault.setImagePath("js/dhtmlx/vault/imgs/");
        vault.setServerHandlers("UploadHandler.do", "GetInfoHandler.do", "GetIdHandler.do");
        vault.setFilesLimit(1);
        vault.create("vaultDiv");
        vault.onUploadComplete = function(files) {
            var s = "";
            for (var i = 0; i < files.length; i++) {
                var file = files[i];
                s += ("id:" + file.id + ",name:" + file.name + ",uploaded:" + file.uploaded + ",error:" + file.error) + "\n";
            }
            if (file.uploaded == true) {
                callAjaxCheckError("uploadAction.do?openingStockKind=" + openingStockKind + "&image=" + file.name, null, null, function(data) {
                    prepareHidePopup('uploadFormshowHelpHideDiv');
                });
            }
        };
    });
    return false;
}
function showVehicleFeeReportPanel() {
    popupName = 'S\u1ED5 theo d\u00F5i chi ph\u00ED xe';
    var url = 'getVehicleFeeReportPanel.do';
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['reportVehicleFeeSearchForm'].fromDate.value = currentTime;
        document.forms['reportVehicleFeeSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
    });
}
function printVehicleFeeReport(fromDate, toDate) {
    var list = document.getElementById("reportVehicleFeeSearchFormTime");
    if (list == null || list.selectedIndex == -1)
        return false;
    if (list.selectedIndex == 1) {
        fromDate = "01/" + fromDate;
        var ind = toDate.indexOf("/");
        var month = toDate.substring(0, ind);
        var year = toDate.substring(ind + 1);
        toDate = month + "/01/" + year;
        var d = new Date(toDate);
        var lastDay = new Date(d.getFullYear(), d.getMonth() + 1, 0).getDate();
        toDate = lastDay + "/" + month + "/" + year;
    } else if (list.selectedIndex == 2) {
        fromDate = "01/01/" + fromDate;
        toDate = "31/12/" + toDate;
    }
    var url = "reportVehicleFeePrint.do?temp=1";
    if (fromDate !== null)
        url += "&fromDate=" + fromDate;
    if (toDate !== null)
        url += "&toDate=" + toDate;
    list = document.forms['reportVehicleFeeSearchForm'].vehicleId;
    if (list != null && list.selectedIndex > -1)
        list = list.options[list.selectedIndex].value;
    else
        list = 0;
    url += "&vehicleId=" + list;
    callServer(url);
    return false;
}
function showCompareVendorReportPanel() {
    popupName = 'Bi\u00EAn b\u1EA3n \u0111\u1ED1i chi\u1EBFu c\u00F4ng n\u1EE3 nh\u00E0 cung c\u1EA5p';
    var url = 'getCompareVendorReportPanel.do';
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['reportCompareVendorSearchForm'].fromDate.value = currentTime;
        document.forms['reportCompareVendorSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
    });
}
function printComapreVendorReport(fromDate, toDate) {
    var list = document.getElementById("reportCompareVendorSearchFormTime");
    if (list == null || list.selectedIndex == -1)
        return false;
    if (list.selectedIndex == 1) {
        fromDate = "01/" + fromDate;
        var ind = toDate.indexOf("/");
        var month = toDate.substring(0, ind);
        var year = toDate.substring(ind + 1);
        toDate = month + "/01/" + year;
        var d = new Date(toDate);
        var lastDay = new Date(d.getFullYear(), d.getMonth() + 1, 0).getDate();
        toDate = lastDay + "/" + month + "/" + year;
    } else if (list.selectedIndex == 2) {
        fromDate = "01/01/" + fromDate;
        toDate = "31/12/" + toDate;
    }
    var url = "reportCompareVendorPrint.do?temp=1";
    if (fromDate !== null)
        url += "&fromDate=" + fromDate;
    if (toDate !== null)
        url += "&toDate=" + toDate;
    list = document.forms['reportCompareVendorSearchForm'].customerId;
    if (list != null && list.selectedIndex > -1)
        list = list.options[list.selectedIndex].value;
    else
        list = 0;
    url += "&vendorId=" + list;
    callServer(url);
    return false;
}
function showCompareLPGReportPanel() {
    popupName = 'Bi\u00EAn b\u1EA3n \u0111\u1ED1i chi\u1EBFu c\u00F4ng n\u1EE3';
    var url = 'getCompareLPGReportPanel.do';
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['reportCompareLPGSearchForm'].fromDate.value = currentTime;
        document.forms['reportCompareLPGSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        // ============================
        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        var customerIdCombobox = dhtmlXComboFromSelect("customerIdComboboxPopup");
        customerIdCombobox.enableFilteringMode(true);
        customerIdCombobox.attachEvent("onSelectionChange", function() {
            setCustomerSelectedForm('reportCompareLPGSearchForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
        });
        customerIdCombobox.attachEvent("onBlur", function() {
            setCustomerSelectedForm('reportCompareLPGSearchForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
            customerIdCombobox.setComboText(customerIdCombobox.getSelectedText());
        });
        customerIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                customerIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        customerIdCombobox.setComboValue("");
    });
}
function printComapreLPGReport(fromDate, toDate) {
    var list = document.getElementById("reportCompareLPGSearchFormTime");
    if (list == null || list.selectedIndex == -1)
        return false;
    if (list.selectedIndex == 1) {
        fromDate = "01/" + fromDate;
        var ind = toDate.indexOf("/");
        var month = toDate.substring(0, ind);
        var year = toDate.substring(ind + 1);
        toDate = month + "/01/" + year;
        var d = new Date(toDate);
        var lastDay = new Date(d.getFullYear(), d.getMonth() + 1, 0).getDate();
        toDate = lastDay + "/" + month + "/" + year;
    } else if (list.selectedIndex == 2) {
        fromDate = "01/01/" + fromDate;
        toDate = "31/12/" + toDate;
    }
    var url = "reportCompareLPGPrint.do?temp=1";
    if (fromDate !== null)
        url += "&fromDate=" + fromDate;
    if (toDate !== null)
        url += "&toDate=" + toDate;
    list = null;
    url += "&customerId=" + document.forms['reportCompareLPGSearchForm'].customerSelectedHidden.value;
    callServer(url);
    return false;
}
function loadTransportServicePanel() {
    callAjax("getTransportServicePanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['transportServiceSearchForm'].fromDate.value = currentTime;
        document.forms['transportServiceSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadTransportServiceList(currentTime, currentTime);
    });
    return false;
}
function loadTransportServiceList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('transportServiceList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("S\u1ED1 phi\u1EBFu,Kh\u00E1ch h\u00E0ng,S\u1ED1 l\u01B0\u1EE3ng,\u0110\u01A1n gi\u00E1,Th\u00E0nh ti\u1EC1n,Thanh to\u00E1n,C\u00F2n l\u1EA1i,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,200,150,150,150,150,150,*");
    mygrid.setColTypes("link,ro,ro,ro,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getTransportServiceList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getTransportService(id, handle) {
    popupName = 'TH\u00D4NG TIN PHI\u1EBEU V\u1EACN CHUY\u1EC2N';
    var url = 'transportServiceForm.do';
    if (id != 0)
        url += '?transportServiceId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        tryNumberFormatCurrentcy(document.forms['transportServiceForm'].inQuantity, "VND");
        tryNumberFormatCurrentcy(document.forms['transportServiceForm'].outQuantity, "VND");
        tryNumberFormatCurrentcy(document.forms['transportServiceForm'].price, "USD");
        tryNumberFormatCurrentcy(document.forms['transportServiceForm'].priceDiff, "USD");
        tryNumberFormatCurrentcy(document.forms['transportServiceForm'].rate, "USD");
        tryNumberFormatCurrentcy(document.forms['transportServiceForm'].rateDiff, "USD");
        tryNumberFormatCurrentcy(document.forms['transportServiceForm'].amount, "VND");
        tryNumberFormatCurrentcy(document.forms['transportServiceForm'].paid, "VND");
        tryNumberFormatCurrentcy(document.forms['transportServiceForm'].debt, "VND");
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['transportServiceForm'].createdDate.value = currentDate;
        }
        var myCalendar = new dhtmlXCalendarObject(["transportServiceDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");

        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        // ============================
        var customerIdCombobox = dhtmlXComboFromSelect("customerIdCombobox");
        customerIdCombobox.enableFilteringMode(true);
        customerIdCombobox.attachEvent("onSelectionChange", function() {
            setCustomerSelectedForm('transportServiceForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
        });
        customerIdCombobox.attachEvent("onBlur", function() {
            setCustomerSelectedForm('transportServiceForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
            customerIdCombobox.setComboText(customerIdCombobox.getSelectedText());
        });
        customerIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                customerIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        if (id == 0) {
            customerIdCombobox.setComboValue("");
        } else {
            var customerId = document.forms['transportServiceForm'].customerId.value;
            if (customerId != 0) {
                var ind = customerIdCombobox.getIndexByValue(customerId);
                customerIdCombobox.selectOption(ind);
            } else {
                customerIdCombobox.unSelectOption();
                customerIdCombobox.setComboValue("");
            }
        }
    });
}
function saveTransportService() {
    if (scriptFunction == "saveTransportService")
        return false;
    reformatNumberMoney(document.forms['transportServiceForm'].inQuantity);
    reformatNumberMoney(document.forms['transportServiceForm'].outQuantity);
    reformatNumberMoney(document.forms['transportServiceForm'].price);
    reformatNumberMoney(document.forms['transportServiceForm'].priceDiff);
    reformatNumberMoney(document.forms['transportServiceForm'].rate);
    reformatNumberMoney(document.forms['transportServiceForm'].rateDiff);
    reformatNumberMoney(document.forms['transportServiceForm'].amount);
    reformatNumberMoney(document.forms['transportServiceForm'].paid);
    reformatNumberMoney(document.forms['transportServiceForm'].debt);
    document.forms['transportServiceForm'].customerId.value = document.forms['transportServiceForm'].customerSelectedHidden.value;
    scriptFunction = "saveTransportService";
    callAjaxCheckError("addTransportService.do", null, document.forms['transportServiceForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getTransportService(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('transportServiceFormshowHelpHideDiv');
    });
    return false;
}
function delTransportService() {
    callAjaxCheckError('delTransportService.do?transportServiceId=' + document.forms['transportServiceForm'].id.value, null, null, function() {
        loadTransportServicePanel();
        prepareHidePopup('transportServiceFormshowHelpHideDiv');
    });
    return false;
}
function transportServiceCaculateAmount() {
    var quantityIn = document.forms['transportServiceForm'].inQuantity;
    var quantityOut = document.forms['transportServiceForm'].outQuantity;
    var price = document.forms['transportServiceForm'].price;
    var priceDiff = document.forms['transportServiceForm'].priceDiff;
    var rate = document.forms['transportServiceForm'].rate;
    var rateDiff = document.forms['transportServiceForm'].rateDiff;
    var amount = document.forms['transportServiceForm'].amount;
    var paid = document.forms['transportServiceForm'].paid;
    var debt = document.forms['transportServiceForm'].debt;
    var diff = reformatNumberMoneyString(quantityOut.value) * 1 - reformatNumberMoneyString(quantityIn.value) * 1;
    amount.value = (reformatNumberMoneyString(quantityIn.value) * reformatNumberMoneyString(price.value) * reformatNumberMoneyString(rate.value) + diff * reformatNumberMoneyString(priceDiff.value) * reformatNumberMoneyString(rateDiff.value)) / 1000;
    paid.value = 0;
    debt.value = amount.value;
    tryNumberFormatCurrentcy(quantityIn, "VND");
    tryNumberFormatCurrentcy(quantityOut, "VND");
    tryNumberFormatCurrentcy(price, "USD");
    tryNumberFormatCurrentcy(rate, "VND");
    tryNumberFormatCurrentcy(rateDiff, "VND");
    tryNumberFormatCurrentcy(amount, "VND");
    tryNumberFormatCurrentcy(paid, "VND");
    tryNumberFormatCurrentcy(debt, "VND");
    quantityIn = null;
    quantityOut = null;
    price = null;
    rate = null;
    amount = null;
    paid = null;
    debt = null;
    return false;
}
function transportServicePaidChanged() {
    var total = document.forms['transportServiceForm'].amount;
    var paid = document.forms['transportServiceForm'].paid;
    var debt = document.forms['transportServiceForm'].debt;
    if (total == null || paid == null || debt == null)
        return false;
    debt.value = reformatNumberMoneyString(total.value) * 1 - reformatNumberMoneyString(paid.value) * 1;
    tryNumberFormatCurrentcy(total, "VND");
    tryNumberFormatCurrentcy(paid, "VND");
    tryNumberFormatCurrentcy(debt, "VND");
    total = null;
    paid = null;
    debt = null;
    return false;
}
function showTransportServiceReportPanel() {
    popupName = 'Bi\u00EAn b\u1EA3n \u0111\u1ED1i chi\u1EBFu c\u00F4ng n\u1EE3';
    var url = 'getTransportServiceReportPanel.do';
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['reportTransportServiceSearchForm'].fromDate.value = currentTime;
        document.forms['reportTransportServiceSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        // ============================
        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";

        var vendorIdCombobox = dhtmlXComboFromSelect("vendorIdComboboxPopup");
        vendorIdCombobox.enableFilteringMode(true);
        vendorIdCombobox.attachEvent("onSelectionChange", function() {
            setVendorSelectedForm('reportTransportServiceSearchForm', vendorIdCombobox.getComboText(), vendorIdCombobox.getSelectedValue());
        });
        vendorIdCombobox.attachEvent("onBlur", function() {
            setVendorSelectedForm('reportTransportServiceSearchForm', vendorIdCombobox.getComboText(), vendorIdCombobox.getSelectedValue());
            vendorIdCombobox.setComboText(vendorIdCombobox.getSelectedText());
        });
        vendorIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                vendorIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        vendorIdCombobox.setComboValue("");

        var customerIdCombobox = dhtmlXComboFromSelect("customerIdComboboxPopup");
        customerIdCombobox.enableFilteringMode(true);
        customerIdCombobox.attachEvent("onSelectionChange", function() {
            setCustomerSelectedForm('reportTransportServiceSearchForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
        });
        customerIdCombobox.attachEvent("onBlur", function() {
            setCustomerSelectedForm('reportTransportServiceSearchForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
            customerIdCombobox.setComboText(customerIdCombobox.getSelectedText());
        });
        customerIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                customerIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        customerIdCombobox.setComboValue("");

        var transporterIdCombobox = dhtmlXComboFromSelect("transporterIdComboboxPopup");
        transporterIdCombobox.enableFilteringMode(true);
        transporterIdCombobox.attachEvent("onSelectionChange", function() {
            setTransporterSelectedForm('reportTransportServiceSearchForm', transporterIdCombobox.getComboText(), transporterIdCombobox.getSelectedValue());
        });
        transporterIdCombobox.attachEvent("onBlur", function() {
            setTransporterSelectedForm('reportTransportServiceSearchForm', transporterIdCombobox.getComboText(), transporterIdCombobox.getSelectedValue());
            transporterIdCombobox.setComboText(transporterIdCombobox.getSelectedText());
        });
        transporterIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                transporterIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        transporterIdCombobox.setComboValue("");
    });
}
function printTransportServiceReport(fromDate, toDate) {
    var list = document.getElementById("reportTransportServiceSearchFormTime");
    if (list == null || list.selectedIndex == -1)
        return false;
    if (list.selectedIndex == 1) {
        fromDate = "01/" + fromDate;
        var ind = toDate.indexOf("/");
        var month = toDate.substring(0, ind);
        var year = toDate.substring(ind + 1);
        toDate = month + "/01/" + year;
        var d = new Date(toDate);
        var lastDay = new Date(d.getFullYear(), d.getMonth() + 1, 0).getDate();
        toDate = lastDay + "/" + month + "/" + year;
    } else if (list.selectedIndex == 2) {
        fromDate = "01/01/" + fromDate;
        toDate = "31/12/" + toDate;
    }
    var url = "reportTransportServicePrint.do?temp=1";
    if (fromDate !== null)
        url += "&fromDate=" + fromDate;
    if (toDate !== null)
        url += "&toDate=" + toDate;
    list = null;
    url += "&vendorId=" + document.forms['reportTransportServiceSearchForm'].vendorSelectedHidden.value;
    url += "&customerId=" + document.forms['reportTransportServiceSearchForm'].customerSelectedHidden.value;
    url += "&transporterId=" + document.forms['reportTransportServiceSearchForm'].transporterSelectedHidden.value;
    callServer(url);
    return false;
}
function showCompareGasReportPanel() {
    popupName = 'Bi\u00EAn b\u1EA3n \u0111\u1ED1i chi\u1EBFu c\u00F4ng n\u1EE3';
    var url = 'getCompareGasReportPanel.do';
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['reportCompareGasSearchForm'].fromDate.value = currentTime;
        document.forms['reportCompareGasSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        // ============================
        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        var customerIdCombobox = dhtmlXComboFromSelect("vendorIdComboboxPopup");
        customerIdCombobox.enableFilteringMode(true);
        customerIdCombobox.attachEvent("onSelectionChange", function() {
            setVendorSelectedForm('reportCompareGasSearchForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
        });
        customerIdCombobox.attachEvent("onBlur", function() {
            setVendorSelectedForm('reportCompareGasSearchForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
            customerIdCombobox.setComboText(customerIdCombobox.getSelectedText());
        });
        customerIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                customerIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        customerIdCombobox.setComboValue("");
    });
}
function printComapreGasReport(fromDate, toDate) {
    var list = document.getElementById("reportCompareGasSearchFormTime");
    if (list == null || list.selectedIndex == -1)
        return false;
    if (list.selectedIndex == 1) {
        fromDate = "01/" + fromDate;
        var ind = toDate.indexOf("/");
        var month = toDate.substring(0, ind);
        var year = toDate.substring(ind + 1);
        toDate = month + "/01/" + year;
        var d = new Date(toDate);
        var lastDay = new Date(d.getFullYear(), d.getMonth() + 1, 0).getDate();
        toDate = lastDay + "/" + month + "/" + year;
    } else if (list.selectedIndex == 2) {
        fromDate = "01/01/" + fromDate;
        toDate = "31/12/" + toDate;
    }
    var url = "reportCompareGasPrint.do?temp=1";
    if (fromDate !== null)
        url += "&fromDate=" + fromDate;
    if (toDate !== null)
        url += "&toDate=" + toDate;
    list = null;
    url += "&vendorId=" + document.forms['reportCompareGasSearchForm'].vendorSelectedHidden.value;
    callServer(url);
    return false;
}
function loadVendorCustomerPanel() {
    callAjax("getVendorCustomerPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        loadVendorCustomerList();
    });
}
function loadVendorCustomerList() {
    var mygrid = new dhtmlXGridObject('vendorCustomerList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("Nh\u00E0 cung c\u1EA5p,Kh\u00E1ch h\u00E0ng");
    mygrid.attachHeader("#text_filter,#text_filter");
    mygrid.setInitWidths("300,*");
    mygrid.setColTypes("link,ro");
    mygrid.setColSorting("str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getVendorCustomerList.do";
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getVendorCustomer(id, handle) {
    popupName = 'TH\u00D4NG TIN NH\u00C0 CUNG C\u1EA4P - KH\u00C1CH H\u00C0NG';
    var url = 'vendorCustomerForm.do';
    if (id != 0)
        url += '?vendorCustomerId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;

        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        // ============================
        var customerIdCombobox = dhtmlXComboFromSelect("customerIdCombobox");
        customerIdCombobox.enableFilteringMode(true);
        customerIdCombobox.attachEvent("onSelectionChange", function() {
            setCustomerSelectedForm('vendorCustomerForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
        });
        customerIdCombobox.attachEvent("onBlur", function() {
            setCustomerSelectedForm('vendorCustomerForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
            customerIdCombobox.setComboText(customerIdCombobox.getSelectedText());
        });
        customerIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                customerIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        if (id == 0) {
            customerIdCombobox.setComboValue("");
        } else {
            var customerId = document.forms['vendorCustomerForm'].customerId.value;
            if (customerId != 0) {
                var ind = customerIdCombobox.getIndexByValue(customerId);
                customerIdCombobox.selectOption(ind);
            } else {
                customerIdCombobox.unSelectOption();
                customerIdCombobox.setComboValue("");
            }
        }
    });
}
function saveVendorCustomer() {
    if (scriptFunction == "saveVendorCustomer")
        return false;
    document.forms['vendorCustomerForm'].customerId.value = document.forms['vendorCustomerForm'].customerSelectedHidden.value;
    scriptFunction = "saveVendorCustomer";
    callAjaxCheckError("addVendorCustomer.do", null, document.forms['vendorCustomerForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getVendorCustomer(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('vendorCustomerFormshowHelpHideDiv');
    });
    return false;
}
function delVendorCustomer() {
    callAjaxCheckError('delVendorCustomer.do?vendorCustomerId=' + document.forms['vendorCustomerForm'].id.value, null, null, function() {
        loadVendorCustomerPanel();
        prepareHidePopup('dynamicFieldFormshowHelpHideDiv');
    });
    return false;
}
function createLpgImportAuto(lpgSaleId, kind) {
    if (scriptFunction == "createLpgImportAuto")
        return false;
    scriptFunction = "createLpgImportAuto";
    callAjaxCheckError("createLpgImportAuto.do?lpgSaleId=" + lpgSaleId + "&kind=" + kind, null, null, function(data) {
        scriptFunction = "";
        prepareHidePopup('lpgSaleFormshowHelpHideDiv');
    });
    return false;
}
function setTransporterSelectedForm(form, text, value) {
    if (value == null) {
        if (text != "")
            value = "-1";
        else
            value = "0";
    }
    document.forms[form].transporterSelectedHidden.value = value;
}
function loadDebtAdjustmentPanel() {
    callAjax("getDebtAdjustmentPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['debtAdjustmentSearchForm'].fromDate.value = currentTime;
        document.forms['debtAdjustmentSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadDebtAdjustmentList(currentTime, currentTime);
    });
    return false;
}
function loadDebtAdjustmentList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('debtAdjustmentList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("S\u1ED1 phi\u1EBFu,Ng\u00E0y,Nh\u00E0 cung c\u1EA5p,Kh\u00E1ch h\u00E0ng,S\u1ED1 ti\u1EC1n,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,200,200,200,200,*");
    mygrid.setColTypes("link,ro,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getDebtAdjustmentList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getDebtAdjustment(id, handle) {
    popupName = 'TH\u00D4NG TIN \u0110I\u1EC0U CH\u1EC8NH C\u00D4NG N\u1EE2';
    var url = 'debtAdjustmentForm.do';
    if (id != 0)
        url += '?debtAdjustmentId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['debtAdjustmentForm'].amount.focus();
        tryNumberFormatCurrentcy(document.forms['debtAdjustmentForm'].amount, "VND");
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['debtAdjustmentForm'].createdDate.value = currentDate;
        }
        var myCalendar = new dhtmlXCalendarObject(["debtAdjustmentDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");

        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";

        var vendorIdCombobox = dhtmlXComboFromSelect("vendorIdComboboxPopup");
        vendorIdCombobox.enableFilteringMode(true);
        vendorIdCombobox.attachEvent("onSelectionChange", function() {
            setVendorSelectedForm('debtAdjustmentForm', vendorIdCombobox.getComboText(), vendorIdCombobox.getSelectedValue());
        });
        vendorIdCombobox.attachEvent("onBlur", function() {
            setVendorSelectedForm('debtAdjustmentForm', vendorIdCombobox.getComboText(), vendorIdCombobox.getSelectedValue());
            vendorIdCombobox.setComboText(vendorIdCombobox.getSelectedText());
        });
        vendorIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                vendorIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        vendorIdCombobox.setComboValue("");

        var customerIdCombobox = dhtmlXComboFromSelect("customerIdComboboxPopup");
        customerIdCombobox.enableFilteringMode(true);
        customerIdCombobox.attachEvent("onSelectionChange", function() {
            setCustomerSelectedForm('debtAdjustmentForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
        });
        customerIdCombobox.attachEvent("onBlur", function() {
            setCustomerSelectedForm('debtAdjustmentForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
            customerIdCombobox.setComboText(customerIdCombobox.getSelectedText());
        });
        customerIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                customerIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        customerIdCombobox.setComboValue("");

        if (id == 0) {
            vendorIdCombobox.setComboValue("");
            customerIdCombobox.setComboValue("");
        } else {
            var vendorId = document.forms['debtAdjustmentForm'].vendorId.value;
            if (vendorId != 0) {
                var ind = vendorIdCombobox.getIndexByValue(vendorId);
                vendorIdCombobox.selectOption(ind);
            } else {
                vendorIdCombobox.unSelectOption();
                vendorIdCombobox.setComboValue("");
            }

            var customerId = document.forms['debtAdjustmentForm'].customerId.value;
            if (customerId != 0) {
                var ind = customerIdCombobox.getIndexByValue(customerId);
                customerIdCombobox.selectOption(ind);
            } else {
                customerIdCombobox.unSelectOption();
                customerIdCombobox.setComboValue("");
            }
        }
    });
}
function saveDebtAdjustment() {
    if (scriptFunction == "saveDebtAdjustment")
        return false;
    var field = document.forms['debtAdjustmentForm'].amount;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp s\u1ED1 ti\u1EC1n");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    reformatNumberMoney(document.forms['debtAdjustmentForm'].amount);
    document.forms['debtAdjustmentForm'].vendorId.value = document.forms['debtAdjustmentForm'].vendorSelectedHidden.value;
    document.forms['debtAdjustmentForm'].customerId.value = document.forms['debtAdjustmentForm'].customerSelectedHidden.value;
    scriptFunction = "saveDebtAdjustment";
    callAjaxCheckError("addDebtAdjustment.do", null, document.forms['debtAdjustmentForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getDebtAdjustment(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('debtAdjustmentFormshowHelpHideDiv');
    });
    return false;
}
function delDebtAdjustment() {
    callAjaxCheckError('delDebtAdjustment.do?debtAdjustmentId=' + document.forms['debtAdjustmentForm'].id.value, null, null, function() {
        loadDebtAdjustmentPanel();
        prepareHidePopup('debtAdjustmentFormshowHelpHideDiv');
    });
    return false;
}
function showCompareLPGVendorCustomerReportPanel() {
    popupName = 'Bi\u00EAn b\u1EA3n \u0111\u1ED1i chi\u1EBFu c\u00F4ng n\u1EE3 NCC - KH';
    var url = 'getCompareLPGVendorCustomerReportPanel.do';
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['reportCompareLPGVendorCustomerSearchForm'].fromDate.value = currentTime;
        document.forms['reportCompareLPGVendorCustomerSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        // ============================
        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        var customerIdCombobox = dhtmlXComboFromSelect("customerIdComboboxPopup");
        customerIdCombobox.enableFilteringMode(true);
        customerIdCombobox.attachEvent("onSelectionChange", function() {
            setCustomerSelectedForm('reportCompareLPGVendorCustomerSearchForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
        });
        customerIdCombobox.attachEvent("onBlur", function() {
            setCustomerSelectedForm('reportCompareLPGVendorCustomerSearchForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
            customerIdCombobox.setComboText(customerIdCombobox.getSelectedText());
        });
        customerIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                customerIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        customerIdCombobox.setComboValue("");
    });
}
function printComapreLPGVendorCustomerReport(fromDate, toDate) {
    var list = document.getElementById("reportCompareLPGVendorCustomerSearchFormTime");
    if (list == null || list.selectedIndex == -1)
        return false;
    if (list.selectedIndex == 1) {
        fromDate = "01/" + fromDate;
        var ind = toDate.indexOf("/");
        var month = toDate.substring(0, ind);
        var year = toDate.substring(ind + 1);
        toDate = month + "/01/" + year;
        var d = new Date(toDate);
        var lastDay = new Date(d.getFullYear(), d.getMonth() + 1, 0).getDate();
        toDate = lastDay + "/" + month + "/" + year;
    } else if (list.selectedIndex == 2) {
        fromDate = "01/01/" + fromDate;
        toDate = "31/12/" + toDate;
    }
    var url = "reportCompareLPGVendorCustomerPrint.do?temp=1";
    if (fromDate !== null)
        url += "&fromDate=" + fromDate;
    if (toDate !== null)
        url += "&toDate=" + toDate;
    list = null;
    url += "&vendorCustomerId=" + document.forms['reportCompareLPGVendorCustomerSearchForm'].customerSelectedHidden.value;
    callServer(url);
    return false;
}
function loadSaleInnerPanel() {
    callAjax("getSaleInnerPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['saleInnerSearchForm'].fromDate.value = currentTime;
        document.forms['saleInnerSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadSaleInnerList(currentTime, currentTime);
    });
    return false;
}
function loadSaleInnerList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('saleInnerList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("M\u00E3 phi\u1EBFu,Ng\u00E0y,T\u1ED5ng ti\u1EC1n,Thanh to\u00E1n,C\u00F2n n\u1EE3,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,100,150,150,150,*");
    mygrid.setColTypes("link,ro,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getSaleInnerList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getSaleInner(id) {
    var url = 'saleInnerForm.do';
    if (id != 0)
        url += '?saleInnerId=' + id
    callAjax(url, null, null, function(data) {
        clearContent();
        setAjaxData(data, 'contentDiv');
        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        // ============================
        var innerIdCombobox = dhtmlXComboFromSelect("goodIdCombobox");
        innerIdCombobox.enableFilteringMode(true);
        innerIdCombobox.attachEvent("onSelectionChange", function() {
            setShellSelectedForm('saleInnerForm', innerIdCombobox.getComboText(), innerIdCombobox.getSelectedValue());
        });
        innerIdCombobox.attachEvent("onBlur", function() {
            setShellSelectedForm('saleInnerForm', innerIdCombobox.getComboText(), innerIdCombobox.getSelectedValue());
        });
        innerIdCombobox.DOMelem_input.onkeypress = function(event) {
            var key;
            if (window.event)
                key = window.event.keyCode;//IE
            else
                key = event.which;//firefox
            if (key == 13) {
                addSaleInnerGood();
                innerIdCombobox.setComboValue("");
            }
        }
        innerIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                innerIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        innerIdCombobox.setComboValue("");
        // ============================
        var employeeIdCombobox = dhtmlXComboFromSelect("employeeIdCombobox");
        employeeIdCombobox.enableFilteringMode(true);
        employeeIdCombobox.attachEvent("onSelectionChange", function() {
            setEmployeeSelectedForm('saleInnerForm', employeeIdCombobox.getComboText(), employeeIdCombobox.getSelectedValue());
        });
        employeeIdCombobox.attachEvent("onBlur", function() {
            setEmployeeSelectedForm('saleInnerForm', employeeIdCombobox.getComboText(), employeeIdCombobox.getSelectedValue());
            employeeIdCombobox.setComboText(employeeIdCombobox.getSelectedText());
        });
        employeeIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                employeeIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        if (id == 0) {
            employeeIdCombobox.setComboValue("");
        } else {
            var employeeId = document.forms['saleInnerForm'].employeeId.value;
            if (employeeId != 0) {
                var ind = employeeIdCombobox.getIndexByValue(employeeId);
                employeeIdCombobox.selectOption(ind);
            } else {
                employeeIdCombobox.unSelectOption();
                employeeIdCombobox.setComboValue("");
            }
        }
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['saleInnerForm'].saleInnerCreatedDate.value = currentDate;
        }
        var myCalendar = new dhtmlXCalendarObject(["saleInnerCreatedDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");

        tryNumberFormatCurrentcy(document.forms['saleInnerForm'].total, "VND");
        tryNumberFormatCurrentcy(document.forms['saleInnerForm'].paid, "VND");
        tryNumberFormatCurrentcy(document.forms['saleInnerForm'].debt, "VND");
        tryNumberFormatCurrentcy(document.forms['saleInnerForm'].discount, "VND");
        tryNumberFormatCurrentcy(document.forms['saleInnerForm'].totalPay, "VND");
        formatFormDetail('saleInnerForm');
    });
}
function saveSaleInner() {
    if (scriptFunction == "saveSaleInner")
        return false;
    var quantity = document.forms['saleInnerForm'].quantity;
    if (quantity == null) {
        alert('Vui l\u00F2ng ch\u1ECDn h\u00E0ng h\u00F3a');
        return false;
    }
    var price = document.forms['saleInnerForm'].price;
    var amount = document.forms['saleInnerForm'].amount;
    if (quantity.length != null) {
        for (var i = 0; i < quantity.length; i++) {
            var number = Number(quantity[i].value);
            if (number == 0) {
                alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
                quantity[i].focus();
                quantity = null;
                return false;
            }
            reformatNumberMoney(quantity[i]);
            reformatNumberMoney(price[i]);
            reformatNumberMoney(amount[i]);
        }
    } else {
        if (quantity.value == "0") {
            alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
            quantity.focus();
            quantity = null;
            return false;
        }
        reformatNumberMoney(quantity);
        reformatNumberMoney(price);
        reformatNumberMoney(amount);
    }
    quantity = null;
    price = null;
    amount = null;
    reformatNumberMoney(document.forms['saleInnerForm'].total);
    reformatNumberMoney(document.forms['saleInnerForm'].paid);
    reformatNumberMoney(document.forms['saleInnerForm'].debt);
    reformatNumberMoney(document.forms['saleInnerForm'].discount);
    reformatNumberMoney(document.forms['saleInnerForm'].totalPay);
    reformatFormDetail('saleInnerForm');
    document.forms['saleInnerForm'].employeeId.value = document.forms['saleInnerForm'].employeeSelectedHidden.value;
    scriptFunction = "saveSaleInner";
    callAjaxCheckError("addSaleInner.do", null, document.forms['saleInnerForm'], function(data) {
        scriptFunction = "";
        loadSaleInnerPanel();
    });
    return false;
}
function addSaleInnerGood() {
    var good = document.forms['saleInnerForm'].shellSelectedHidden.value;
    if (good == -1 || good == 0)
        return false;
    var goodId = document.forms['saleInnerForm'].goodId;
    var existed = false;
    if (goodId != null) {
        if (goodId.length != null) {
            for (i = 0; i < goodId.length; i++) {
                if (goodId[i].value == good) {
                    existed = true;
                    break;
                }
            }
        } else if (goodId.value == good)
            existed = true;
    }
    goodId = null;
    if (existed == true) {
        alert("H\u00E0ng ho\u00E1 \u0111\u00E3 t\u1ED3n t\u1EA1i");
        return false;
    }
    callAjax("getSaleInnerGood.do?goodId=" + good, null, null, function(data) {
        setAjaxData(data, 'saleInnerGoodHideDiv');
        var matTable = document.getElementById('saleInnerGoodTbl');
        var detTable = document.getElementById('saleInnerDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
        formatFormDetail('saleInnerForm');
    });
    return false;
}
function delSaleInner() {
    callAjaxCheckError('delSaleInner.do?saleInnerId=' + document.forms['saleInnerForm'].id.value, null, null, function() {
        loadSaleInnerPanel();
    });
    return false;
}
function loadGasWholeSaleFeePanel() {
    callAjax("getGasWholeSaleFeePanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        loadGasWholeSaleFeeList();
    });
}
function loadGasWholeSaleFeeList() {
    var mygrid = new dhtmlXGridObject('gasWholeSaleFeeList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("T\u00EAn lo\u1EA1i ph\u00ED,H\u00ECnh th\u1EE9c,T\u00ECnh tr\u1EA1ng");
    mygrid.attachHeader("#text_filter,#text_filter,#select_filter");
    mygrid.setInitWidths("*,150,250");
    mygrid.setColTypes("link,ro,ro");
    mygrid.setColSorting("str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var list = document.forms['gasWholeSaleFeeSearchForm'].statusCombobox;
    if (list != null && list.selectedIndex > -1)
        list = list.options[list.selectedIndex].value;
    else
        list = 0;
    var url = "getGasWholeSaleFeeList.do?status=" + list;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getGasWholeSaleFee(id, handle) {
    popupName = 'TH\u00D4NG TIN LO\u1EA0I PH\u00CD';
    var url = 'gasWholeSaleFeeForm.do';
    if (id != 0)
        url += '?gasWholeSaleFeeId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['gasWholeSaleFeeForm'].name.focus();
    });
}
function saveGasWholeSaleFee() {
    if (scriptFunction == "savegasWholeSaleFee")
        return false;
    var field = document.forms['gasWholeSaleFeeForm'].name;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp t\u00EAn \u0111\u01A1n v\u1ECB t\u00EDnh");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    scriptFunction = "saveGasWholeSaleFee";
    callAjaxCheckError("addGasWholeSaleFee.do", null, document.forms['gasWholeSaleFeeForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getgasWholeSaleFee(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('gasWholeSaleFeeFormshowHelpHideDiv');
    });
    return false;
}
function loadDayoffPanel() {
    callAjax("getDayoffPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        loadDayoffList();
    });
}
function loadDayoffList() {
    var mygrid = new dhtmlXGridObject('dayoffList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("T\u00EAn ng\u00E0y ngh\u1EC9 b\u00F9,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter");
    mygrid.setInitWidths("250,*");
    mygrid.setColTypes("link,ro");
    mygrid.setColSorting("str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getDayoffList.do";
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getDayoff(id, handle) {
    popupName = 'TH\u00D4NG TIN NG\u00C0Y NGH\u1EC8 B\u00D9';
    var url = 'dayoffForm.do';
    if (id != 0)
        url += '?dayoffId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['dayoffForm'].name.focus();
    });
}
function saveDayoff() {
    if (scriptFunction == "saveDayoff")
        return false;
    var field = document.forms['dayoffForm'].name;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp t\u00EAn ng\u00E0y ngh\u1EC9 b\u00F9");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    scriptFunction = "saveDayoff";
    callAjaxCheckError("addDayoff.do", null, document.forms['dayoffForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getDayoff(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('dayoffFormshowHelpHideDiv');
    });
    return false;
}
function delDayoff() {
    callAjaxCheckError('delDayoff.do?dayoffId=' + document.forms['dayoffForm'].id.value, null, null, function() {
        loadDayoffPanel();
        prepareHidePopup('dayoffFormshowHelpHideDiv');
    });
    return false;
}
function loadOtherBonusPanel() {
    callAjax("getOtherBonusPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        loadOtherBonusList();
    });
}
function loadOtherBonusList() {
    var mygrid = new dhtmlXGridObject('otherBonusList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("T\u00EAn kho\u1EA3n th\u01B0\u1EDFng kh\u00E1c,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter");
    mygrid.setInitWidths("250,*");
    mygrid.setColTypes("link,ro");
    mygrid.setColSorting("str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getOtherBonusList.do";
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getOtherBonus(id, handle) {
    popupName = 'TH\u00D4NG TIN KHO\u1EA2N TH\u01AF\u1EDENG KH\u00C1C';
    var url = 'otherBonusForm.do';
    if (id != 0)
        url += '?otherBonusId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['otherBonusForm'].name.focus();
    });
}
function saveOtherBonus() {
    if (scriptFunction == "saveOtherBonus")
        return false;
    var field = document.forms['otherBonusForm'].name;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp t\u00EAn kho\u1EA3n th\u01B0\u1EDFng kh\u00E1c");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    scriptFunction = "saveOtherBonus";
    callAjaxCheckError("addOtherBonus.do", null, document.forms['otherBonusForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getOtherBonus(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('otherBonusFormshowHelpHideDiv');
    });
    return false;
}
function delOtherBonus() {
    callAjaxCheckError('delOtherBonus.do?otherBonusId=' + document.forms['otherBonusForm'].id.value, null, null, function() {
        loadOtherBonusPanel();
        prepareHidePopup('otherBonusFormshowHelpHideDiv');
    });
    return false;
}
function loadPaneltyPanel() {
    callAjax("getPaneltyPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        loadPaneltyList();
    });
}
function loadPaneltyList() {
    var mygrid = new dhtmlXGridObject('paneltyList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("T\u00EAn kho\u1EA3n th\u01B0\u1EDFng kh\u00E1c,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter");
    mygrid.setInitWidths("250,*");
    mygrid.setColTypes("link,ro");
    mygrid.setColSorting("str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getPaneltyList.do";
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getPanelty(id, handle) {
    popupName = 'TH\u00D4NG TIN KHO\u1EA2N TH\u01AF\u1EDENG KH\u00C1C';
    var url = 'paneltyForm.do';
    if (id != 0)
        url += '?paneltyId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['paneltyForm'].name.focus();
    });
}
function savePanelty() {
    if (scriptFunction == "savePanelty")
        return false;
    var field = document.forms['paneltyForm'].name;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp t\u00EAn kho\u1EA3n th\u01B0\u1EDFng kh\u00E1c");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    scriptFunction = "savePanelty";
    callAjaxCheckError("addPanelty.do", null, document.forms['paneltyForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getPanelty(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('paneltyFormshowHelpHideDiv');
    });
    return false;
}
function delPanelty() {
    callAjaxCheckError('delPanelty.do?paneltyId=' + document.forms['paneltyForm'].id.value, null, null, function() {
        loadPaneltyPanel();
        prepareHidePopup('paneltyFormshowHelpHideDiv');
    });
    return false;
}
function loadEmployeeOtherBonusPanel() {
    callAjax("getEmployeeOtherBonusPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['employeeOtherBonusSearchForm'].fromDate.value = currentTime;
        document.forms['employeeOtherBonusSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadEmployeeOtherBonusList(currentTime, currentTime);
    });
    return false;
}
function loadEmployeeOtherBonusList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('employeeOtherBonusList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("S\u1ED1 phi\u1EBFu,Nh\u00E2n vi\u00EAn,Ng\u00E0y,Kho\u1EA3n th\u01B0\u1EDFng th\u00EAm,S\u1ED1 ti\u1EC1n,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,200,200,200,200,*");
    mygrid.setColTypes("link,ro,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getEmployeeOtherBonusList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getEmployeeOtherBonus(id, handle) {
    popupName = 'TH\u00D4NG TIN KHO\u1EA2N TH\u01AF\u1EDENG TH\u00CAM';
    var url = 'employeeOtherBonusForm.do';
    if (id != 0)
        url += '?employeeOtherBonusId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['employeeOtherBonusForm'].amount.focus();
        tryNumberFormatCurrentcy(document.forms['employeeOtherBonusForm'].amount, "VND");

        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        // ============================
        var employeeIdCombobox = dhtmlXComboFromSelect("employeeIdCombobox");
        employeeIdCombobox.enableFilteringMode(true);
        employeeIdCombobox.attachEvent("onSelectionChange", function() {
            setEmployeeSelectedForm('employeeOtherBonusForm', employeeIdCombobox.getComboText(), employeeIdCombobox.getSelectedValue());
        });
        employeeIdCombobox.attachEvent("onBlur", function() {
            setEmployeeSelectedForm('employeeOtherBonusForm', employeeIdCombobox.getComboText(), employeeIdCombobox.getSelectedValue());
            employeeIdCombobox.setComboText(employeeIdCombobox.getSelectedText());
            employeeOtherBonusEmployeeChanged(employeeIdCombobox.getSelectedValue());
        });
        employeeIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                employeeIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        var employeeId = document.forms['employeeOtherBonusForm'].employeeId.value;
        if (employeeId != 0) {
            var ind = employeeIdCombobox.getIndexByValue(employeeId);
            employeeIdCombobox.selectOption(ind);
        } else {
            employeeIdCombobox.unSelectOption();
            employeeIdCombobox.setComboValue("");
        }
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['employeeOtherBonusForm'].employeeOtherBonusDate.value = currentDate;
            employeeIdCombobox.openSelect();
        }
        var myCalendar = new dhtmlXCalendarObject(["employeeOtherBonusDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");
    });
}
function saveEmployeeOtherBonus() {
    if (scriptFunction == "saveEmployeeOtherBonus")
        return false;
    var field = document.forms['employeeOtherBonusForm'].amount;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp s\u1ED1 ti\u1EC1n");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    reformatNumberMoney(document.forms['employeeOtherBonusForm'].amount);
    document.forms['employeeOtherBonusForm'].employeeId.value = document.forms['employeeOtherBonusForm'].employeeSelectedHidden.value;
    scriptFunction = "saveEmployeeOtherBonus";
    callAjaxCheckError("addEmployeeOtherBonus.do", null, document.forms['employeeOtherBonusForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getEmployeeOtherBonus(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('employeeOtherBonusFormshowHelpHideDiv');
    });
    return false;
}
function delEmployeeOtherBonus() {
    callAjaxCheckError('delEmployeeOtherBonus.do?employeeOtherBonusId=' + document.forms['employeeOtherBonusForm'].id.value, null, null, function() {
        loadEmployeeOtherBonusPanel();
        prepareHidePopup('employeeOtherBonusFormshowHelpHideDiv');
    });
    return false;
}
function loadEmployeePaneltyPanel() {
    callAjax("getEmployeePaneltyPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['employeePaneltySearchForm'].fromDate.value = currentTime;
        document.forms['employeePaneltySearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadEmployeePaneltyList(currentTime, currentTime);
    });
    return false;
}
function loadEmployeePaneltyList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('employeePaneltyList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("S\u1ED1 phi\u1EBFu,Nh\u00E2n vi\u00EAn,Ng\u00E0y,Kho\u1EA3n chi,S\u1ED1 ti\u1EC1n,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,200,200,200,200,*");
    mygrid.setColTypes("link,ro,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getEmployeePaneltyList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getEmployeePanelty(id, handle) {
    popupName = 'TH\u00D4NG TIN KHO\u1EA2N CHI';
    var url = 'employeePaneltyForm.do';
    if (id != 0)
        url += '?employeePaneltyId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['employeePaneltyForm'].amount.focus();
        tryNumberFormatCurrentcy(document.forms['employeePaneltyForm'].amount, "VND");

        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        // ============================
        var employeeIdCombobox = dhtmlXComboFromSelect("employeeIdCombobox");
        employeeIdCombobox.enableFilteringMode(true);
        employeeIdCombobox.attachEvent("onSelectionChange", function() {
            setEmployeeSelectedForm('employeePaneltyForm', employeeIdCombobox.getComboText(), employeeIdCombobox.getSelectedValue());
        });
        employeeIdCombobox.attachEvent("onBlur", function() {
            setEmployeeSelectedForm('employeePaneltyForm', employeeIdCombobox.getComboText(), employeeIdCombobox.getSelectedValue());
            employeeIdCombobox.setComboText(employeeIdCombobox.getSelectedText());
            employeePaneltyEmployeeChanged(employeeIdCombobox.getSelectedValue());
        });
        employeeIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                employeeIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        var employeeId = document.forms['employeePaneltyForm'].employeeId.value;
        if (employeeId != 0) {
            var ind = employeeIdCombobox.getIndexByValue(employeeId);
            employeeIdCombobox.selectOption(ind);
        } else {
            employeeIdCombobox.unSelectOption();
            employeeIdCombobox.setComboValue("");
        }
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['employeePaneltyForm'].employeePaneltyDate.value = currentDate;
            employeeIdCombobox.openSelect();
        }
        var myCalendar = new dhtmlXCalendarObject(["employeePaneltyDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");
    });
}
function saveEmployeePanelty() {
    if (scriptFunction == "saveEmployeePanelty")
        return false;
    var field = document.forms['employeePaneltyForm'].amount;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp s\u1ED1 ti\u1EC1n");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    reformatNumberMoney(document.forms['employeePaneltyForm'].amount);
    document.forms['employeePaneltyForm'].employeeId.value = document.forms['employeePaneltyForm'].employeeSelectedHidden.value;
    scriptFunction = "saveEmployeePanelty";
    callAjaxCheckError("addEmployeePanelty.do", null, document.forms['employeePaneltyForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getEmployeePanelty(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('employeePaneltyFormshowHelpHideDiv');
    });
    return false;
}
function delEmployeePanelty() {
    callAjaxCheckError('delEmployeePanelty.do?employeePaneltyId=' + document.forms['employeePaneltyForm'].id.value, null, null, function() {
        loadEmployeePaneltyPanel();
        prepareHidePopup('employeePaneltyFormshowHelpHideDiv');
    });
    return false;
}
function showMonthlyReportPanel(name) {
    var url = 'getMonthlyReportPanel.do?reportName=' + name;
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        changePopupFormHeader(document.getElementById("monthlyReportSearchFormHeader").value);
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['monthlyReportSearchForm'].fromDate.value = currentTime;
        document.forms['monthlyReportSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        var list = document.forms['monthlyReportSearchForm'].monthlyReportSearchFormTime;
        if (list != null)
            reportTimeChange(list, 'monthlyReportSearchForm');
    });
}
function printMonthlyReport(fromDate, toDate) {
    var list = document.getElementById("monthlyReportSearchFormTime");
    if (list == null || list.selectedIndex == -1)
        return false;
    list = list[list.selectedIndex].value;
    if (list == 2) {
        fromDate = "01/" + fromDate;
        var ind = toDate.indexOf("/");
        var month = toDate.substring(0, ind);
        var year = toDate.substring(ind + 1);
        toDate = month + "/01/" + year;
        var d = new Date(toDate);
        var lastDay = new Date(d.getFullYear(), d.getMonth() + 1, 0).getDate();
        toDate = lastDay + "/" + month + "/" + year;
    } else if (list == 3) {
        fromDate = "01/01/" + fromDate;
        toDate = "31/12/" + toDate;
    }
    var url = "reportPrint.do?reportName=" + document.getElementById("monthlyReportSearchFormName").value;
    if (fromDate !== null)
        url += "&fromDate=" + fromDate;
    if (toDate !== null)
        url += "&toDate=" + toDate;
    callServer(url);
    return false;
}
function showYearlyReportPanel(name) {
    var url = 'getYearlyReportPanel.do?reportName=' + name;
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        changePopupFormHeader(document.getElementById("yearlyReportSearchFormHeader").value);
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['yearlyReportSearchForm'].fromDate.value = currentTime;
        document.forms['yearlyReportSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        var list = document.forms['yearlyReportSearchForm'].yearlyReportSearchFormTime;
        if (list != null)
            reportTimeChange(list, 'yearlyReportSearchForm');
    });
}
function printYearlyReport(fromDate, toDate) {
    var list = document.getElementById("yearlyReportSearchFormTime");
    if (list == null || list.selectedIndex == -1)
        return false;
    list = list[list.selectedIndex].value;
    if (list == 2) {
        fromDate = "01/" + fromDate;
        var ind = toDate.indexOf("/");
        var month = toDate.substring(0, ind);
        var year = toDate.substring(ind + 1);
        toDate = month + "/01/" + year;
        var d = new Date(toDate);
        var lastDay = new Date(d.getFullYear(), d.getMonth() + 1, 0).getDate();
        toDate = lastDay + "/" + month + "/" + year;
    } else if (list == 3) {
        fromDate = "01/01/" + fromDate;
        toDate = "31/12/" + toDate;
    }
    var url = "reportPrint.do?reportName=" + document.getElementById("yearlyReportSearchFormName").value;
    if (fromDate !== null)
        url += "&fromDate=" + fromDate;
    if (toDate !== null)
        url += "&toDate=" + toDate;
    callServer(url);
    return false;
}
function printDirectlyReport(reportName) {
    callServer("reportPrint.do?reportName=" + reportName);
    return false;
}
function loadEmployeeRouteFeePanel() {
    callAjax("getEmployeeRouteFeePanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['employeeRouteFeeSearchForm'].fromDate.value = currentTime;
        document.forms['employeeRouteFeeSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadEmployeeRouteFeeList(currentTime, currentTime);
    });
    return false;
}
function loadEmployeeRouteFeeList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('employeeRouteFeeList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("S\u1ED1 phi\u1EBFu,Ng\u00E0y,Tuy\u1EBFn \u0111\u01B0\u1EDDng,KM,SL b\u01A1m,Th\u1EF1c nh\u1EADn,T\u1ED5ng l\u00EDt,\u0110\u01A1n gi\u00E1,Th\u00E0nh ti\u1EC1n,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,150,200,150,150,150,150,150,150,*");
    mygrid.setColTypes("link,ro,ro,ro,ro,ro,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str,str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getEmployeeRouteFeeList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getEmployeeRouteFee(id, handle, lpgImportId) {
    popupName = 'CHI PH\u00CD NH\u00C2N VI\u00CAN V\u1EACN CHUY\u1EC2N';
    var url = 'employeeRouteFeeForm.do?temp=1';
    if (id != 0)
        url += '&employeeRouteFeeId=' + id;
    if (lpgImportId != 0)
        url += '&lpgImportId=' + lpgImportId;
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        tryNumberFormatCurrentcy(document.forms['employeeRouteFeeForm'].inQuantity, "VND");
        tryNumberFormatCurrentcy(document.forms['employeeRouteFeeForm'].outQuantity, "VND");
        tryNumberFormatCurrentcy(document.forms['employeeRouteFeeForm'].price, "VND");

        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        // ============================
        var routeIdCombobox = dhtmlXComboFromSelect("routeIdCombobox");
        routeIdCombobox.enableFilteringMode(true);
        routeIdCombobox.attachEvent("onSelectionChange", function() {
            setRouteSelectedForm('employeeRouteFeeForm', routeIdCombobox.getComboText(), routeIdCombobox.getSelectedValue());
        });
        routeIdCombobox.attachEvent("onBlur", function() {
            setRouteSelectedForm('employeeRouteFeeForm', routeIdCombobox.getComboText(), routeIdCombobox.getSelectedValue());
            routeIdCombobox.setComboText(routeIdCombobox.getSelectedText());
        });
        routeIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                routeIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        if (id == 0) {
            routeIdCombobox.setComboValue("");
        } else {
            var routeId = document.forms['employeeRouteFeeForm'].routeId.value;
            if (routeId != 0) {
                var ind = routeIdCombobox.getIndexByValue(routeId);
                routeIdCombobox.selectOption(ind);
            } else {
                routeIdCombobox.unSelectOption();
                routeIdCombobox.setComboValue("");
            }
        }
        // ============================
        var employeeIdCombobox = dhtmlXComboFromSelect("employeeIdCombobox");
        employeeIdCombobox.enableFilteringMode(true);
        employeeIdCombobox.attachEvent("onSelectionChange", function() {
            setEmployeeSelectedForm('employeeRouteFeeForm', employeeIdCombobox.getComboText(), employeeIdCombobox.getSelectedValue());
        });
        employeeIdCombobox.attachEvent("onBlur", function() {
            setEmployeeSelectedForm('employeeRouteFeeForm', employeeIdCombobox.getComboText(), employeeIdCombobox.getSelectedValue());
            employeeIdCombobox.setComboText(employeeIdCombobox.getSelectedText());
        });
        employeeIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                employeeIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        if (id == 0) {
            employeeIdCombobox.setComboValue("");
            employeeIdCombobox.openSelect();
        } else {
            var employeeId = document.forms['employeeRouteFeeForm'].employeeId.value;
            if (employeeId != 0) {
                var ind = employeeIdCombobox.getIndexByValue(employeeId);
                employeeIdCombobox.selectOption(ind);
            } else {
                employeeIdCombobox.unSelectOption();
                employeeIdCombobox.setComboValue("");
            }
        }
        var myCalendar = new dhtmlXCalendarObject(["employeeRouteFeeDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");
        if (id == 0) {
            var currentTime = getCurrentDate();
            document.forms['employeeRouteFeeForm'].employeeRouteFeeDate.value = currentTime;
        }
    });
}
function saveEmployeeRouteFee() {
    if (scriptFunction == "saveEmployeeRouteFee")
        return false;
    reformatNumberMoney(document.forms['employeeRouteFeeForm'].inQuantity);
    reformatNumberMoney(document.forms['employeeRouteFeeForm'].outQuantity);
    reformatNumberMoney(document.forms['employeeRouteFeeForm'].price);
    document.forms['employeeRouteFeeForm'].routeId.value = document.forms['employeeRouteFeeForm'].routeSelectedHidden.value;
    document.forms['employeeRouteFeeForm'].employeeId.value = document.forms['employeeRouteFeeForm'].employeeSelectedHidden.value;
    scriptFunction = "saveEmployeeRouteFee";
    callAjaxCheckError("addEmployeeRouteFee.do", null, document.forms['employeeRouteFeeForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getEmployeeRouteFee(0, handle, 0);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('employeeRouteFeeFormshowHelpHideDiv');
    });
    return false;
}
function delEmployeeRouteFee() {
    callAjaxCheckError('delEmployeeRouteFee.do?employeeRouteFeeId=' + document.forms['employeeRouteFeeForm'].id.value, null, null, function() {
        loadEmployeeRouteFeePanel();
        prepareHidePopup('employeeRouteFeeFormshowHelpHideDiv');
    });
    return false;
}
function showEmployeeVehicleSalaryReportPanel() {
    popupName = 'B\u1EA2NG L\u01AF\u01A0NG NH\u00C2N VI\u00CAN V\u1EACN CHUY\u1EC2N';
    var url = 'getEmployeeVehicleSalaryReportPanel.do';
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['reportEmployeeVehicleSalarySearchForm'].fromDate.value = currentTime;
        document.forms['reportEmployeeVehicleSalarySearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        // ============================
        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        var employeeIdCombobox = dhtmlXComboFromSelect("employeeIdComboboxPopup");
        employeeIdCombobox.enableFilteringMode(true);
        employeeIdCombobox.attachEvent("onSelectionChange", function() {
            setEmployeeSelectedForm('reportEmployeeVehicleSalarySearchForm', employeeIdCombobox.getComboText(), employeeIdCombobox.getSelectedValue());
        });
        employeeIdCombobox.attachEvent("onBlur", function() {
            setEmployeeSelectedForm('reportEmployeeVehicleSalarySearchForm', employeeIdCombobox.getComboText(), employeeIdCombobox.getSelectedValue());
            employeeIdCombobox.setComboText(employeeIdCombobox.getSelectedText());
        });
        employeeIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                employeeIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        employeeIdCombobox.setComboValue("");
        var list = document.forms['reportEmployeeVehicleSalarySearchForm'].reportEmployeeVehicleSalarySearchFormTime;
        if (list != null)
            reportTimeChange(list, 'reportEmployeeVehicleSalarySearchForm');
    });
}
function printEmployeeVehicleSalaryReport(fromDate, toDate) {
    var list = document.getElementById("reportEmployeeVehicleSalarySearchFormTime");
    if (list == null || list.selectedIndex == -1)
        return false;
    list = list[list.selectedIndex].value;
    if (list == 2) {
        fromDate = "01/" + fromDate;
        var ind = toDate.indexOf("/");
        var month = toDate.substring(0, ind);
        var year = toDate.substring(ind + 1);
        toDate = month + "/01/" + year;
        var d = new Date(toDate);
        var lastDay = new Date(d.getFullYear(), d.getMonth() + 1, 0).getDate();
        toDate = lastDay + "/" + month + "/" + year;
    } else if (list == 3) {
        fromDate = "01/01/" + fromDate;
        toDate = "31/12/" + toDate;
    }
    var url = "reportEmployeeVehicleSalaryPrint.do?temp=1";
    if (fromDate !== null)
        url += "&fromDate=" + fromDate;
    if (toDate !== null)
        url += "&toDate=" + toDate;
    list = null;
    url += "&employeeId=" + document.forms['reportEmployeeVehicleSalarySearchForm'].employeeSelectedHidden.value;
    callServer(url);
    return false;
}
function loadTripOilPanel() {
    callAjax("getTripOilPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['tripOilSearchForm'].fromDate.value = currentTime;
        document.forms['tripOilSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadTripOilList(currentTime, currentTime);
    });
    return false;
}
function loadTripOilList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('tripOilList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("S\u1ED1 phi\u1EBFu,Xe,Ng\u00E0y,Th\u00E0nh ti\u1EC1n,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,150,200,200,200,*");
    mygrid.setColTypes("link,ro,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getTripOilList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getTripOil(id, handle) {
    popupName = 'TH\u00D4NG TIN \u1EE8NG D\u1EA6U';
    var url = 'tripOilForm.do';
    if (id != 0)
        url += '?tripOilId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        tryNumberFormatCurrentcy(document.forms['tripOilForm'].quantity, "VND");
        tryNumberFormatCurrentcy(document.forms['tripOilForm'].price, "VND");
        tryNumberFormatCurrentcy(document.forms['tripOilForm'].amount, "VND");

        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        // ============================
        var employeeIdCombobox = dhtmlXComboFromSelect("employeeIdCombobox");
        employeeIdCombobox.enableFilteringMode(true);
        employeeIdCombobox.attachEvent("onSelectionChange", function() {
            setEmployeeSelectedForm('tripOilForm', employeeIdCombobox.getComboText(), employeeIdCombobox.getSelectedValue());
        });
        employeeIdCombobox.attachEvent("onBlur", function() {
            setEmployeeSelectedForm('tripOilForm', employeeIdCombobox.getComboText(), employeeIdCombobox.getSelectedValue());
            employeeIdCombobox.setComboText(employeeIdCombobox.getSelectedText());
        });
        employeeIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                employeeIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        if (id == 0) {
            employeeIdCombobox.setComboValue("");
            employeeIdCombobox.openSelect();
        } else {
            var employeeId = document.forms['tripOilForm'].employeeId.value;
            if (employeeId != 0) {
                var ind = employeeIdCombobox.getIndexByValue(employeeId);
                employeeIdCombobox.selectOption(ind);
            } else {
                employeeIdCombobox.unSelectOption();
                employeeIdCombobox.setComboValue("");
            }
        }

        var myCalendar = new dhtmlXCalendarObject(["tripOilDate"]);
        myCalendar.setSkin('dhx_web');
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['tripOilForm'].tripOilDate.value = currentDate;
        }
        myCalendar.setDateFormat("%d/%m/%Y");
    });
}
function saveTripOil() {
    if (scriptFunction == "saveTripOil")
        return false;
    var field = document.forms['tripOilForm'].createdDate;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp ng\u00E0y t\u1EA1o");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    reformatNumberMoney(document.forms['tripOilForm'].quantity);
    reformatNumberMoney(document.forms['tripOilForm'].price);
    reformatNumberMoney(document.forms['tripOilForm'].amount);
    document.forms['tripOilForm'].employeeId.value = document.forms['tripOilForm'].employeeSelectedHidden.value;
    scriptFunction = "saveTripOil";
    callAjaxCheckError("addTripOil.do", null, document.forms['tripOilForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getTripOil(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('tripOilFormshowHelpHideDiv');
    });
    return false;
}
function delTripOil() {
    callAjaxCheckError('delTripOil.do?tripOilId=' + document.forms['tripOilForm'].id.value, null, null, function() {
        loadTripOilPanel();
        prepareHidePopup('tripOilFormshowHelpHideDiv');
    });
    return false;
}
function loadBorrowPanel() {
    callAjax("getBorrowPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['borrowSearchForm'].fromDate.value = currentTime;
        document.forms['borrowSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadBorrowList(currentTime, currentTime);
    });
    return false;
}
function loadBorrowList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('borrowList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("S\u1ED1 phi\u1EBFu,Ng\u00E0y,T\u00EAn nh\u00E2n vi\u00EAn,T\u1ED5ng ti\u1EC1n,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,100,150,150,*");
    mygrid.setColTypes("link,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getBorrowList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getBorrow(id) {
    var url = 'borrowForm.do';
    if (id != 0)
        url += '?borrowId=' + id
    callAjax(url, null, null, function(data) {
        clearContent();
        setAjaxData(data, 'contentDiv');
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['borrowForm'].borrowCreatedDate.value = currentDate;
        }
        var myCalendar = new dhtmlXCalendarObject(["borrowCreatedDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");

        var myCalendar2 = new dhtmlXCalendarObject(["payDateSelected"]);
        myCalendar2.setSkin('dhx_web');
        myCalendar2.setDateFormat("%m/%Y");

        tryNumberFormatCurrentcy(document.forms['borrowForm'].total, "VND");
        formatFormDetail('borrowForm');

        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        // ============================
        // ============================
        var employeeIdCombobox = dhtmlXComboFromSelect("employeeIdCombobox");
        employeeIdCombobox.enableFilteringMode(true);
        employeeIdCombobox.attachEvent("onSelectionChange", function() {
            setEmployeeSelectedForm('borrowForm', employeeIdCombobox.getComboText(), employeeIdCombobox.getSelectedValue());
        });
        employeeIdCombobox.attachEvent("onBlur", function() {
            setEmployeeSelectedForm('borrowForm', employeeIdCombobox.getComboText(), employeeIdCombobox.getSelectedValue());
            employeeIdCombobox.setComboText(employeeIdCombobox.getSelectedText());
        });
        employeeIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                employeeIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        if (id == 0) {
            employeeIdCombobox.setComboValue("");
            employeeIdCombobox.openSelect();
        } else {
            var employeeId = document.forms['borrowForm'].employeeId.value;
            if (employeeId != 0) {
                var ind = employeeIdCombobox.getIndexByValue(employeeId);
                employeeIdCombobox.selectOption(ind);
            } else {
                employeeIdCombobox.unSelectOption();
                employeeIdCombobox.setComboValue("");
            }
        }
    });
}
function saveBorrow() {
    if (scriptFunction == "saveBorrow")
        return false;
    var amount = document.forms['borrowForm'].amount;
    if (amount == null) {
        alert('Vui l\u00F2ng nh\u1EADp ti\u1EBFn \u0111\u1ED9 thanh to\u00E1n');
        return false;
    }
    if (amount.length != null) {
        for (var i = 0; i < amount.length; i++) {
            var number = Number(amount[i].value);
            if (number == 0) {
                alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 ti\u1EC1n');
                quantity[i].focus();
                quantity = null;
                return false;
            }
            reformatNumberMoney(amount[i]);
        }
    } else {
        if (amount.value == "0") {
            alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 ti\u1EC1n');
            quantity.focus();
            quantity = null;
            return false;
        }
        reformatNumberMoney(amount);
    }
    amount = null;
    reformatNumberMoney(document.forms['borrowForm'].total);
    document.forms['borrowForm'].employeeId.value = document.forms['borrowForm'].employeeSelectedHidden.value;
    scriptFunction = "saveBorrow";
    callAjaxCheckError("addBorrow.do", null, document.forms['borrowForm'], function(data) {
        scriptFunction = "";
        loadBorrowPanel();
    });
    return false;
}
function addBorrowPayDate() {
    var payDateSelected = document.forms['borrowForm'].payDateSelected.value;
    if (payDateSelected == "")
        return false;
    var payDate = document.forms['borrowForm'].payDate;
    var existed = false;
    if (payDate != null) {
        if (payDate.length != null) {
            for (i = 0; i < payDate.length; i++) {
                if (payDate[i].value == payDateSelected) {
                    existed = true;
                    break;
                }
            }
        } else if (payDate.value == payDateSelected)
            existed = true;
    }
    if (existed == true) {
        alert("Ng\u00E0y thanh to\u00E1n \u0111\u00E3 t\u1ED3n t\u1EA1i");
        return false;
    }
    callAjax("getBorrowPayDate.do?payDate=" + payDateSelected + "&borrowId" + document.forms['borrowForm'].id.value, null, null, function(data) {
        setAjaxData(data, 'borrowPayDateHideDiv');
        var matTable = document.getElementById('borrowPayDateTbl');
        var detTable = document.getElementById('borrowDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
        formatFormDetail('borrowForm');
    });
    return false;
}
function delBorrow() {
    callAjaxCheckError('delBorrow.do?borrowId=' + document.forms['borrowForm'].id.value, null, null, function() {
        loadBorrowPanel();
    });
    return false;
}
function onBorrowPayDateKeyPress() {
    //Hàm dùng để ngăn người dùng nhập các ký tự khác ký tự số vào TextBox
    var keypressed = null;
    if (window.event)
        keypressed = window.event.keyCode; //IE
    else
        keypressed = e.which; //NON-IE, Standard
    if (keypressed == 13) // enter key
        return addBorrowPayDate();
    else
        return true;
}
function loadUnitRatePanel() {
    callAjax("getUnitRatePanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        loadUnitRateList();
    });
}
function loadUnitRateList() {
    var mygrid = new dhtmlXGridObject('unitRateList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("\u0110\u01A1n v\u1ECB t\u00EDnh c\u01A1 b\u1EA3n,\u0110\u01A1n v\u1ECB t\u00EDnh qui \u0111\u1ED5i,H\u1EC7 s\u1ED1");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("*,250,150");
    mygrid.setColTypes("link,ro,ro");
    mygrid.setColSorting("str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getUnitRateList.do";
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getUnitRate(id, handle) {
    popupName = 'TH\u00D4NG TIN QUI \u0110\u1ED4I \u0110\u01A0N V\u1ECA T\u00CDNH';
    var url = 'unitRateForm.do';
    if (id != 0)
        url += '?unitRateId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        tryNumberFormatCurrentcy(document.forms['unitRateForm'].rate, "VND");
    });
}
function saveUnitRate() {
    if (scriptFunction == "saveUnitRate")
        return false;
    reformatNumberMoney(document.forms['unitRateForm'].rate);
    scriptFunction = "saveUnitRate";
    callAjaxCheckError("addUnitRate.do", null, document.forms['unitRateForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getUnitRate(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('unitRateFormshowHelpHideDiv');
    });
    return false;
}
function delUnitRate() {
    callAjaxCheckError('delUnitRate.do?unitRateId=' + document.forms['unitRateForm'].id.value, null, null, function() {
        loadUnitRatePanel();
        prepareHidePopup('unitRateFormshowHelpHideDiv');
    });
    return false;
}
function loadAgencyPanel() {
    callAjax("getAgencyPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        loadAgencyList();
    });
    return false;
}
function loadAgencyList() {
    var mygrid = new dhtmlXGridObject('agencyList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("T\u00EAn \u0111\u1EA1i l\u00FD,S\u1ED1 \u0111i\u1EC7n tho\u1EA1i,\u0110\u1ECBa ch\u1EC9,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("200,150,250,*");
    mygrid.setColTypes("link,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var list = document.forms['agencySearchForm'].statusCombobox;
    if (list != null && list.selectedIndex > -1)
        list = list.options[list.selectedIndex].value;
    else
        list = 0;
    var url = "getAgencyList.do?status=" + list;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getAgency(id) {
    var url = 'agencyForm.do';
    if (id != 0)
        url += '?agencyId=' + id
    callAjax(url, null, null, function(data) {
        clearContent();
        setAjaxData(data, 'contentDiv');
        document.forms['agencyForm'].name.focus();
        formatAgencyCommissionDetail();

        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        // ============================
        var customerCombobox = dhtmlXComboFromSelect("customerIdCombobox");
        customerCombobox.enableFilteringMode(true);
        customerCombobox.attachEvent("onSelectionChange", function() {
            setCustomerSelectedForm('agencyForm', customerCombobox.getComboText(), customerCombobox.getSelectedValue());
        });
        customerCombobox.attachEvent("onBlur", function() {
            setCustomerSelectedForm('agencyForm', customerCombobox.getComboText(), customerCombobox.getSelectedValue());
        });
        customerCombobox.DOMelem_input.onkeypress = function(event) {
            var key;
            if (window.event)
                key = window.event.keyCode;//IE
            else
                key = event.which;//firefox
            if (key == 13) {
                addAgencyCustomer();
                customerCombobox.setComboValue("");
            }
        }
        customerCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                customerCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        customerCombobox.setComboValue("");
    });
}
function saveAgency() {
    if (scriptFunction == "saveAgency")
        return false;
    var field = document.forms['agencyForm'].name;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp t\u00EAn \u0111\u1EA1i l\u00FD");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    scriptFunction = "saveAgency";
    callAjaxCheckError("addAgency.do", null, document.forms['agencyForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getAgency(0, handle);
        else
            loadAgencyPanel();
    });
    return false;
}
function addAgencyCustomer() {
    var customer = document.forms['agencyForm'].customerSelectedHidden.value;
    if (customer == -1 || customer == 0)
        return false;
    var customerId = document.forms['agencyForm'].customerId;
    var existed = false;
    if (customerId != null) {
        if (customerId.length != null) {
            for (i = 0; i < customerId.length; i++) {
                if (customerId[i].value == customer) {
                    existed = true;
                    break;
                }
            }
        } else if (customerId.value == customer)
            existed = true;
    }
    customerId = null;
    if (existed == true) {
        alert("Kh\u00E1ch h\u00E0ng \u0111\u00E3 t\u1ED3n t\u1EA1i");
        return false;
    }
    callAjax("getAgencyCustomer.do?customerId=" + customer, null, null, function(data) {
        setAjaxData(data, 'agencyCustomerHideDiv');
        var matTable = document.getElementById('agencyCustomerTbl');
        var detTable = document.getElementById('agencyCustomerDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
    });
    return false;
}
function addAgencyCommission() {
    callAjax("getAgencyCommission.do", null, null, function(data) {
        setAjaxData(data, 'agencyCommissionHideDiv');
        var matTable = document.getElementById('agencyCommissionTbl');
        var detTable = document.getElementById('agencyCommissionDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
        formatAgencyCommissionDetail();
    });
    return false;
}
function formatAgencyCommissionDetail() {
    var agencyCommissionCommissionFrom = document.forms['agencyForm'].agencyCommissionCommissionFrom;
    var agencyCommissionCommissionTo = document.forms['agencyForm'].agencyCommissionCommissionTo;
    var agencyCommissionCommission = document.forms['agencyForm'].agencyCommissionCommission;
    if (agencyCommissionCommission != null) {
        if (agencyCommissionCommission.length != null) {
            for (var i = 0; i < agencyCommissionCommission.length; i++) {
                tryNumberFormatCurrentcy(agencyCommissionCommissionFrom[i], "USD");
                tryNumberFormatCurrentcy(agencyCommissionCommissionTo[i], "USD");
                tryNumberFormatCurrentcy(agencyCommissionCommission[i], "USD");
            }
        } else {
            tryNumberFormatCurrentcy(agencyCommissionCommissionFrom, "USD");
            tryNumberFormatCurrentcy(agencyCommissionCommissionTo, "USD");
            tryNumberFormatCurrentcy(agencyCommissionCommission, "USD");
        }
    }
    agencyCommissionCommissionFrom = null;
    agencyCommissionCommissionTo = null;
    agencyCommissionCommission = null;
}
function reformatAgencyCommissionDetail() {
    var agencyCommissionCommissionFrom = document.forms['agencyForm'].agencyCommissionCommissionFrom;
    var agencyCommissionCommissionTo = document.forms['agencyForm'].agencyCommissionCommissionTo;
    var agencyCommissionCommission = document.forms['agencyForm'].agencyCommissionCommission;
    if (agencyCommissionCommission != null) {
        if (agencyCommissionCommission.length != null) {
            for (var i = 0; i < agencyCommissionCommission.length; i++) {
                reformatNumberMoney(agencyCommissionCommissionFrom[i]);
                reformatNumberMoney(agencyCommissionCommissionTo[i]);
                reformatNumberMoney(agencyCommissionCommission[i]);
            }
        } else {
            reformatNumberMoney(agencyCommissionCommissionFrom);
            reformatNumberMoney(agencyCommissionCommissionTo);
            reformatNumberMoney(agencyCommissionCommission);
        }
    }
    agencyCommissionCommissionFrom = null;
    agencyCommissionCommissionTo = null;
    agencyCommissionCommission = null;
}
function loadOilGroupPanel() {
    callAjax("getOilGroupPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        loadOilGroupList();
    });
}
function loadOilGroupList() {
    var mygrid = new dhtmlXGridObject('oilGroupList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("T\u00EAn nh\u00F3m d\u1EA7u nh\u1EDBt,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter");
    mygrid.setInitWidths("200,*");
    mygrid.setColTypes("link,ro");
    mygrid.setColSorting("str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var list = document.forms['oilGroupSearchForm'].statusCombobox;
    if (list != null && list.selectedIndex > -1)
        list = list.options[list.selectedIndex].value;
    else
        list = 0;
    var url = "getOilGroupList.do?status=" + list;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getOilGroup(id, handle) {
    popupName = 'TH\u00D4NG TIN NH\u00D3M D\u1EA6U NH\u1EDAT';
    var url = 'oilGroupForm.do';
    if (id != 0)
        url += '?oilGroupId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['oilGroupForm'].name.focus();
    });
}
function saveOilGroup() {
    if (scriptFunction == "saveOilGroup")
        return false;
    var field = document.forms['oilGroupForm'].name;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp t\u00EAn nh\u00F3m d\u1EA7u nh\u1EDBt");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    scriptFunction = "saveOilGroup";
    callAjaxCheckError("addOilGroup.do", null, document.forms['oilGroupForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getOilGroup(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('oilGroupFormshowHelpHideDiv');
    });
    return false;
}
function loadEmployeeOilCommissionPanel() {
    callAjax("getEmployeeOilCommissionPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        loadEmployeeOilCommissionList();
    });
}
function loadEmployeeOilCommissionList() {
    var mygrid = new dhtmlXGridObject('employeeOilCommissionList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("T\u00EAn lo\u1EA1i chi\u1EBFt kh\u1EA5u,S\u1ED1 ti\u1EC1n,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("250,150,*");
    mygrid.setColTypes("link,ro,ro");
    mygrid.setColSorting("str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getEmployeeOilCommissionList.do";
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getEmployeeOilCommission(id, handle) {
    popupName = 'TH\u00D4NG TIN QUI LO\u1EA0I CHI\u1EBET KH\u1EA4U B\u00C1N D\u1EA6U NH\u1EDAT';
    var url = 'employeeOilCommissionForm.do';
    if (id != 0)
        url += '?employeeOilCommissionId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        tryNumberFormatCurrentcy(document.forms['employeeOilCommissionForm'].amount, "VND");
    });
}
function saveEmployeeOilCommission() {
    if (scriptFunction == "saveEmployeeOilCommission")
        return false;
    var field = document.forms['employeeOilCommissionForm'].name;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp t\u00EAn lo\u1EA1i chi\u1EBFt kh\u1EA5u");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    reformatNumberMoney(document.forms['employeeOilCommissionForm'].amount);
    scriptFunction = "saveEmployeeOilCommission";
    callAjaxCheckError("addEmployeeOilCommission.do", null, document.forms['employeeOilCommissionForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getEmployeeOilCommission(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('employeeOilCommissionFormshowHelpHideDiv');
    });
    return false;
}
function delEmployeeOilCommission() {
    callAjaxCheckError('delEmployeeOilCommission.do?employeeOilCommissionId=' + document.forms['employeeOilCommissionForm'].id.value, null, null, function() {
        loadEmployeeOilCommissionPanel();
        prepareHidePopup('employeeOilCommissionFormshowHelpHideDiv');
    });
    return false;
}
function loadOilPanel() {
    callAjax("getOilPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        loadOilList();
    });
}
function loadOilList() {
    var mygrid = new dhtmlXGridObject('oilList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("M\u00E3 d\u1EA7u nh\u1EDBt,T\u00EAn d\u1EA7u nh\u1EDBt,\u0110\u01A1n v\u1ECB t\u00EDnh c\u01A1 b\u1EA3n,\u0110\u01A1n v\u1ECB t\u00EDnh mua b\u00E1n");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("100,*,150,150");
    mygrid.setColTypes("link,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var list = document.forms['oilSearchForm'].statusCombobox;
    if (list != null && list.selectedIndex > -1)
        list = list.options[list.selectedIndex].value;
    else
        list = 0;
    var url = "getOilList.do?status=" + list;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getOil(id, handle) {
    popupName = 'TH\u00D4NG TIN D\u1EA6U NH\u1EDAT';
    var url = 'oilForm.do';
    if (id != 0)
        url += '?oilId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        document.getElementById('callbackFunc').value = handle;
        document.forms['oilForm'].code.focus();
        tryNumberFormatCurrentcy(document.forms['oilForm'].weight, "VND");
        tryNumberFormatCurrentcy(document.forms['oilForm'].price, "VND");
    });
}
function saveOil() {
    if (scriptFunction == "saveOil")
        return false;
    var field = document.forms['oilForm'].code;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp m\u00E3 d\u1EA7u nh\u1EDBt");
        field.focus();
        field = null;
        return false;
    }
    field = document.forms['oilForm'].name;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp t\u00EAn d\u1EA7u nh\u1EDBt");
        field.focus();
        field = null;
        return false;
    }
    field = null;
    reformatNumberMoney(document.forms['oilForm'].weight);
    reformatNumberMoney(document.forms['oilForm'].price);
    scriptFunction = "saveOil";
    callAjaxCheckError("addOil.do", null, document.forms['oilForm'], function(data) {
        scriptFunction = "";
        var handle = document.getElementById('callbackFunc').value;
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getOil(0, handle);
        else if (handle != '')
            eval(handle + "()");
        prepareHidePopup('oilFormshowHelpHideDiv');
    });
    return false;
}
function loadOilImportPanel() {
    callAjax("getOilImportPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['oilImportSearchForm'].fromDate.value = currentTime;
        document.forms['oilImportSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadOilImportList(currentTime, currentTime);
    });
    return false;
}
function loadOilImportList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('oilImportList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("M\u00E3 phi\u1EBFu,Ng\u00E0y,Nh\u00E0 cung c\u1EA5p,T\u1ED5ng ti\u1EC1n,Thanh to\u00E1n,C\u00F2n n\u1EE3,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#select_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,100,150,150,150,*");
    mygrid.setColTypes("link,ro,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getOilImportList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getOilImport(id) {
    var url = 'oilImportForm.do';
    if (id != 0)
        url += '?oilImportId=' + id
    callAjax(url, null, null, function(data) {
        clearContent();
        setAjaxData(data, 'contentDiv');
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['oilImportForm'].oilImportCreatedDate.value = currentDate;
        }
        var myCalendar = new dhtmlXCalendarObject(["oilImportCreatedDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");

        tryNumberFormatCurrentcy(document.forms['oilImportForm'].totalBeforeCommission, "VND");
        tryNumberFormatCurrentcy(document.forms['oilImportForm'].total, "VND");
        tryNumberFormatCurrentcy(document.forms['oilImportForm'].paid, "VND");
        tryNumberFormatCurrentcy(document.forms['oilImportForm'].debt, "VND");
        tryNumberFormatCurrentcy(document.forms['oilImportForm'].rate, "VND");
        tryNumberFormatCurrentcy(document.forms['oilImportForm'].commission, "USD");
        formatFormDetail('oilImportForm');

        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        // ============================
        var oilIdCombobox = dhtmlXComboFromSelect("oilIdCombobox");
        oilIdCombobox.enableFilteringMode(true);
        oilIdCombobox.attachEvent("onSelectionChange", function() {
            setOilSelectedForm('oilImportForm', oilIdCombobox.getComboText(), oilIdCombobox.getSelectedValue());
        });
        oilIdCombobox.attachEvent("onBlur", function() {
            setOilSelectedForm('oilImportForm', oilIdCombobox.getComboText(), oilIdCombobox.getSelectedValue());
        });
        oilIdCombobox.DOMelem_input.onkeypress = function(event) {
            var key;
            if (window.event)
                key = window.event.keyCode;//IE
            else
                key = event.which;//firefox
            if (key == 13) {
                addOilImportOil();
                oilIdCombobox.setComboValue("");
            }
        }
        oilIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                oilIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        oilIdCombobox.setComboValue("");
    });
}
function saveOilImport() {
    if (scriptFunction == "saveOilImport")
        return false;
    var quantity = document.forms['oilImportForm'].quantity;
    if (quantity == null) {
        alert('Vui l\u00F2ng ch\u1ECDn h\u00E0ng h\u00F3a');
        return false;
    }
    var paid = document.forms['oilImportForm'].paid;
    var total = document.forms['oilImportForm'].total;
    if (paid.value != 0 && paid.value != total.value) {
        alert('S\u1ED1 ti\u1EC1n thanh to\u00E1n kh\u00F4ng \u0111\u00FAng');
        paid = null;
        total = null;
        return false;
    }
    paid = null;
    total = null;
    var price = document.forms['oilImportForm'].price;
    var amount = document.forms['oilImportForm'].amount;
    if (quantity.length != null) {
        for (var i = 0; i < quantity.length; i++) {
            var number = Number(quantity[i].value);
            if (number == 0) {
                alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
                quantity[i].focus();
                quantity = null;
                return false;
            }
            reformatNumberMoney(quantity[i]);
            reformatNumberMoney(price[i]);
            reformatNumberMoney(amount[i]);
        }
    } else {
        if (quantity.value == "0") {
            alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
            quantity.focus();
            quantity = null;
            return false;
        }
        reformatNumberMoney(quantity);
        reformatNumberMoney(price);
        reformatNumberMoney(amount);
    }
    quantity = null;
    price = null;
    amount = null;
    reformatNumberMoney(document.forms['oilImportForm'].totalBeforeCommission);
    reformatNumberMoney(document.forms['oilImportForm'].total);
    reformatNumberMoney(document.forms['oilImportForm'].paid);
    reformatNumberMoney(document.forms['oilImportForm'].debt);
    reformatNumberMoney(document.forms['oilImportForm'].rate);
    reformatNumberMoney(document.forms['oilImportForm'].commission);
    scriptFunction = "saveOilImport";
    callAjaxCheckError("addOilImport.do", null, document.forms['oilImportForm'], function(data) {
        scriptFunction = "";
        loadOilImportPanel();
    });
    return false;
}
function addOilImportOil() {
    var oil = document.forms['oilImportForm'].oilSelectedHidden.value;
//    if (oil == -1 || oil == 0)
//        return false;
    var oilId = document.forms['oilImportForm'].oilId;
//    var existed = false;
//    if (oilId != null) {
//        if (oilId.length != null) {
//            for (i = 0; i < oilId.length; i++) {
//                if (oilId[i].value == oil) {
//                    existed = true;
//                    break;
//                }
//            }
//        } else if (oilId.value == oil)
//            existed = true;
//    }
//    oilId = null;
//    if (existed == true) {
//        alert("H\u00E0ng ho\u00E1 \u0111\u00E3 t\u1ED3n t\u1EA1i");
//        return false;
//    }
    var length = 0;
    if (oilId != null) {
        if (oilId.length != null)
            length = oilId.length;
        else
            length = 1;
    }
    oilId = null;
    callAjax("getOilImportOil.do?oilId=" + oil + "&length=" + length, null, null, function(data) {
        setAjaxData(data, 'oilImportOilHideDiv');
        var matTable = document.getElementById('oilImportOilTbl');
        var detTable = document.getElementById('oilImportDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
        formatFormDetail('oilImportForm');
    });
    return false;
}
function delOilImport() {
    callAjaxCheckError('delOilImport.do?oilImportId=' + document.forms['oilImportForm'].id.value, null, null, function() {
        loadOilImportPanel();
    });
    return false;
}
function oilImportVendorChanged(list) {
    if (list.selectedIndex == -1)
        return false;
    var url = "getVendorCommission.do?vendorId=" + list.options[list.selectedIndex].value;
    callAjaxCheckError(url, null, null, function(data) {
        var obj = eval('(' + data + ')');
        var commission = document.forms['oilImportForm'].commission;
        commission.value = obj.commission;
        tryNumberFormatCurrentcy(commission, "USD");
        commission = null;
        caculateListTotal('oilImportForm');
    });
    list = null;
    return false;
}
function loadSaleOilPanel() {
    callAjax("getSaleOilPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['saleOilSearchForm'].fromDate.value = currentTime;
        document.forms['saleOilSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadSaleOilList(currentTime, currentTime);
    });
    return false;
}
function loadSaleOilList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('saleOilList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("M\u00E3 phi\u1EBFu,Ng\u00E0y,Kh\u00E1ch h\u00E0ng,T\u1ED5ng ti\u1EC1n,Thanh to\u00E1n,C\u00F2n n\u1EE3,Phi\u1EBFu xu\u1EA5t kho,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,100,150,150,150,150,*");
    mygrid.setColTypes("link,ro,ro,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getSaleOilList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getSaleOil(id) {
    var url = 'saleOilForm.do';
    if (id != 0)
        url += '?saleOilId=' + id
    callAjax(url, null, null, function(data) {
        clearContent();
        setAjaxData(data, 'contentDiv');
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['saleOilForm'].saleOilCreatedDate.value = currentDate;
        }

        var myCalendar = new dhtmlXCalendarObject(["saleOilCreatedDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");

        tryNumberFormatCurrentcy(document.forms['saleOilForm'].total, "VND");
        tryNumberFormatCurrentcy(document.forms['saleOilForm'].paid, "VND");
        tryNumberFormatCurrentcy(document.forms['saleOilForm'].debt, "VND");
        tryNumberFormatCurrentcy(document.forms['saleOilForm'].discount, "VND");
        tryNumberFormatCurrentcy(document.forms['saleOilForm'].totalPay, "VND");
        tryNumberFormatCurrentcy(document.forms['saleOilForm'].commission, "USD");
        tryNumberFormatCurrentcy(document.forms['saleOilForm'].commissionAmount, "VND");
        tryNumberFormatCurrentcy(document.forms['saleOilForm'].gapCustomerAmount, "VND");
        tryNumberFormatCurrentcy(document.forms['saleOilForm'].gapAgencyAmount, "VND");
        formatSaleOilDetail('saleOilForm');
        formatSaleOilPromotionMaterialQuantityDetail();

        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        // ============================
        var oilIdCombobox = dhtmlXComboFromSelect("oilIdCombobox");
        oilIdCombobox.enableFilteringMode(true);
        oilIdCombobox.attachEvent("onSelectionChange", function() {
            setOilSelectedForm('saleOilForm', oilIdCombobox.getComboText(), oilIdCombobox.getSelectedValue());
        });
        oilIdCombobox.attachEvent("onBlur", function() {
            setOilSelectedForm('saleOilForm', oilIdCombobox.getComboText(), oilIdCombobox.getSelectedValue());
        });
        oilIdCombobox.DOMelem_input.onkeypress = function(event) {
            var key;
            if (window.event)
                key = window.event.keyCode;//IE
            else
                key = event.which;//firefox
            if (key == 13) {
                addSaleOilOil();
                oilIdCombobox.setComboValue("");
            }
        }
        oilIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                oilIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        oilIdCombobox.setComboValue("");
        // ============================
        var customerIdCombobox = dhtmlXComboFromSelect("customerIdCombobox");
        customerIdCombobox.enableFilteringMode(true);
        customerIdCombobox.attachEvent("onSelectionChange", function() {
            setCustomerSelectedForm('saleOilForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
        });
        customerIdCombobox.attachEvent("onBlur", function() {
            setCustomerSelectedForm('saleOilForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
            customerIdCombobox.setComboText(customerIdCombobox.getSelectedText());
            saleOilCustomerSelectionChange();
        });
        customerIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                customerIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        if (id == 0) {
            customerIdCombobox.setComboValue("");
        } else {
            var customerId = document.forms['saleOilForm'].customerId.value;
            if (customerId != 0) {
                var ind = customerIdCombobox.getIndexByValue(customerId);
                customerIdCombobox.selectOption(ind);
            } else {
                customerIdCombobox.unSelectOption();
                customerIdCombobox.setComboValue("");
            }
        }
        // ============================
        var promotionMaterialIdCombobox = dhtmlXComboFromSelect("promotionMaterialIdCombobox");
        promotionMaterialIdCombobox.enableFilteringMode(true);
        promotionMaterialIdCombobox.attachEvent("onSelectionChange", function() {
            setPromotionMaterialSelectedForm('saleOilForm', promotionMaterialIdCombobox.getComboText(), promotionMaterialIdCombobox.getSelectedValue());
        });
        promotionMaterialIdCombobox.attachEvent("onBlur", function() {
            setPromotionMaterialSelectedForm('saleOilForm', promotionMaterialIdCombobox.getComboText(), promotionMaterialIdCombobox.getSelectedValue());
        });
        promotionMaterialIdCombobox.DOMelem_input.onkeypress = function(event) {
            var key;
            if (window.event)
                key = window.event.keyCode;//IE
            else
                key = event.which;//firefox
            if (key == 13) {
                addSaleOilPromotionMaterial();
                promotionMaterialIdCombobox.setComboValue("");
            }
        }
        promotionMaterialIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                promotionMaterialIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        promotionMaterialIdCombobox.setComboValue("");
    });
}
function setOilSelectedForm(form, text, value) {
    if (value == null) {
        if (text != "")
            value = "-1";
        else
            value = "0";
    }
    document.forms[form].oilSelectedHidden.value = value;
}
function saveSaleOil() {
    if (scriptFunction == "saveSaleOil")
        return false;
    var quantity = document.forms['saleOilForm'].quantity;
    if (quantity == null) {
        alert('Vui l\u00F2ng ch\u1ECDn h\u00E0ng h\u00F3a');
        return false;
    }
    var priceBeforeCommission = document.forms['saleOilForm'].priceBeforeCommission;
    var commissionPrice = document.forms['saleOilForm'].commissionPrice;
    var price = document.forms['saleOilForm'].price;
    var firstAmount = document.forms['saleOilForm'].firstAmount;
    var commissionDetail = document.forms['saleOilForm'].commissionDetail;
    var gapAgencyAmountDetail = document.forms['saleOilForm'].gapAgencyAmountDetail;
    var gapCustomerAmountDetail = document.forms['saleOilForm'].gapCustomerAmountDetail;
    var amount = document.forms['saleOilForm'].amount;
    if (quantity.length != null) {
        for (var i = 0; i < quantity.length; i++) {
            var number = Number(quantity[i].value);
            if (number == 0) {
                alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
                quantity[i].focus();
                quantity = null;
                return false;
            }
            reformatNumberMoney(quantity[i]);
            reformatNumberMoney(priceBeforeCommission[i]);
            reformatNumberMoney(commissionPrice[i]);
            reformatNumberMoney(price[i]);
            reformatNumberMoney(firstAmount[i]);
            reformatNumberMoney(commissionDetail[i]);
            reformatNumberMoney(gapAgencyAmountDetail[i]);
            reformatNumberMoney(gapCustomerAmountDetail[i]);
            reformatNumberMoney(amount[i]);
        }
    } else {
        if (quantity.value == "0") {
            alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
            quantity.focus();
            quantity = null;
            return false;
        }
        reformatNumberMoney(quantity);
        reformatNumberMoney(priceBeforeCommission);
        reformatNumberMoney(commissionPrice);
        reformatNumberMoney(price);
        reformatNumberMoney(firstAmount);
        reformatNumberMoney(commissionDetail);
        reformatNumberMoney(gapAgencyAmountDetail);
        reformatNumberMoney(gapCustomerAmountDetail);
        reformatNumberMoney(amount);
    }
    quantity = null;
    priceBeforeCommission = null;
    commissionPrice = null;
    price = null;
    firstAmount = null;
    commissionDetail = null;
    gapAgencyAmountDetail = null;
    gapCustomerAmountDetail = null;
    amount = null;

    reformatNumberMoney(document.forms['saleOilForm'].total);
    reformatNumberMoney(document.forms['saleOilForm'].paid);
    reformatNumberMoney(document.forms['saleOilForm'].debt);
    reformatNumberMoney(document.forms['saleOilForm'].discount);
    reformatNumberMoney(document.forms['saleOilForm'].totalPay);
    reformatNumberMoney(document.forms['saleOilForm'].commission);
    reformatNumberMoney(document.forms['saleOilForm'].commissionAmount);
    reformatNumberMoney(document.forms['saleOilForm'].gapCustomerAmount);
    reformatNumberMoney(document.forms['saleOilForm'].gapAgencyAmount);
    reformatFormDetail('saleOilForm');
    reformatSaleOilPromotionMaterialQuantityDetail();
    document.forms['saleOilForm'].customerId.value = document.forms['saleOilForm'].customerSelectedHidden.value;
    scriptFunction = "saveSaleOil";
    callAjaxCheckError("addSaleOil.do", null, document.forms['saleOilForm'], function(data) {
        scriptFunction = "";
        loadSaleOilPanel();
    });
    return false;
}
function addSaleOilOil() {
    var oilId = document.forms['saleOilForm'].oilId;
    var length = 0;
    if (oilId != null) {
        if (oilId.length != null)
            length = oilId.length;
        else
            length = 1;
    }
    oilId = null;

    var oil = document.forms['saleOilForm'].oilSelectedHidden.value;
    var customer = document.forms['saleOilForm'].customerSelectedHidden.value;
    callAjax("getSaleOilOil.do?oilId=" + oil + "&customerId=" + customer + "&length=" + length, null, null, function(data) {
        setAjaxData(data, 'saleOilOilHideDiv');
        var matTable = document.getElementById('saleOilOilTbl');
        var detTable = document.getElementById('saleOilDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
        formatSaleOilDetail('saleOilForm');
    });
    return false;
}
function delSaleOil() {
    callAjaxCheckError('delSaleOil.do?saleOilId=' + document.forms['saleOilForm'].id.value, null, null, function() {
        loadSaleOilPanel();
    });
    return false;
}
function caculateSaleOilListDetail(goodId, formName) {
    var quantity = document.getElementById("detquantity" + goodId);
    var priceBeforeCommission = document.getElementById("detpricebeforecommission" + goodId);
    var commissionPrice = document.getElementById("detcommissionprice" + goodId);
    var price = document.getElementById("detprice" + goodId);
    var firstAmount = document.getElementById("detfirstamount" + goodId);
    var commissionDetail = document.getElementById("detcommission" + goodId);
    var gapAgencyAmountDetail = document.getElementById("detgapagencyamount" + goodId);
    var gapCustomerAmountDetail = document.getElementById("detgapcustomeramount" + goodId);
    var detTotal = document.getElementById("detamount" + goodId);
    if (quantity == null || priceBeforeCommission == null || commissionPrice == null || price == null || firstAmount == null || commissionDetail == null
            || gapAgencyAmountDetail == null || gapCustomerAmountDetail == null || detTotal == null)
        return false;
    price.value = reformatNumberMoneyString(priceBeforeCommission.value) * (100 - reformatNumberMoneyString(commissionPrice.value) * 1) / 100
            + reformatNumberMoneyString(gapAgencyAmountDetail.value) * 1 + reformatNumberMoneyString(gapCustomerAmountDetail.value) * 1;
    firstAmount.value = reformatNumberMoneyString(quantity.value) * price.value;
    detTotal.value = firstAmount.value * (100 - reformatNumberMoneyString(commissionDetail.value)) / 100;
    tryNumberFormatCurrentcy(quantity, "VND");
    tryNumberFormatCurrentcy(priceBeforeCommission, "VND");
    tryNumberFormatCurrentcy(commissionPrice, "USD");
    tryNumberFormatCurrentcy(price, "VND");
    tryNumberFormatCurrentcy(firstAmount, "VND");
    tryNumberFormatCurrentcy(commissionDetail, "USD");
    tryNumberFormatCurrentcy(gapAgencyAmountDetail, "VND");
    tryNumberFormatCurrentcy(gapCustomerAmountDetail, "VND");
    tryNumberFormatCurrentcy(detTotal, "VND");
    quantity = null;
    price = null;
    detTotal = null;
    caculateListTotal(formName);
    saleOilCalculateAmounts(formName);
    return false;
}
function formatSaleOilDetail(formName) {
    var quantity = document.forms[formName].quantity;
    var priceBeforeCommission = document.forms[formName].priceBeforeCommission;
    var commissionPrice = document.forms[formName].commissionPrice;
    var price = document.forms[formName].price;
    var firstAmount = document.forms[formName].firstAmount;
    var commissionDetail = document.forms[formName].commissionDetail;
    var gapAgencyAmountDetail = document.forms[formName].gapAgencyAmountDetail;
    var gapCustomerAmountDetail = document.forms[formName].gapCustomerAmountDetail;
    var amount = document.forms[formName].amount;
    if (quantity != null) {
        if (quantity.length != null) {
            for (var i = 0; i < quantity.length; i++) {
                tryNumberFormatCurrentcy(quantity[i], "VND");
                tryNumberFormatCurrentcy(priceBeforeCommission[i], "VND");
                tryNumberFormatCurrentcy(commissionPrice[i], "USD");
                tryNumberFormatCurrentcy(price[i], "VND");
                tryNumberFormatCurrentcy(firstAmount[i], "VND");
                tryNumberFormatCurrentcy(commissionDetail[i], "USD");
                tryNumberFormatCurrentcy(gapAgencyAmountDetail[i], "VND");
                tryNumberFormatCurrentcy(gapCustomerAmountDetail[i], "VND");
                tryNumberFormatCurrentcy(amount[i], "VND");
            }
        } else {
            tryNumberFormatCurrentcy(quantity, "VND");
            tryNumberFormatCurrentcy(priceBeforeCommission, "VND");
            tryNumberFormatCurrentcy(commissionPrice, "USD");
            tryNumberFormatCurrentcy(price, "VND");
            tryNumberFormatCurrentcy(firstAmount, "VND");
            tryNumberFormatCurrentcy(commissionDetail, "USD");
            tryNumberFormatCurrentcy(gapAgencyAmountDetail, "VND");
            tryNumberFormatCurrentcy(gapCustomerAmountDetail, "VND");
            tryNumberFormatCurrentcy(amount, "VND");
        }
    }
    quantity = null;
    priceBeforeCommission = null;
    commissionPrice = null;
    price = null;
    firstAmount = null;
    commissionDetail = null;
    gapAgencyAmountDetail = null;
    gapCustomerAmountDetail = null;
    amount = null;
}
function saleOilCustomerSelectionChange() {
    var customerId = document.forms['saleOilForm'].customerSelectedHidden.value;
    if (customerId == 0)
        return false;
    var url = "getSaleOilCustomerCommission.do?customerId=" + customerId;
    callAjaxCheckError(url, null, null, function(data) {
        var obj = eval('(' + data + ')');
        var commission = document.forms['saleOilForm'].commission;
        commission.value = obj.commission;
        tryNumberFormatCurrentcy(commission, "USD");
        commission = null;
        saleOilSetCommission();
    });
    return false;
}
function saleOilSetCommission() {
    var commissionKind = document.forms['saleOilForm'].commissionKind;
    if (commissionKind != null && commissionKind.selectedIndex > -1)
        commissionKind = commissionKind.options[commissionKind.selectedIndex].value;
    else
        commissionKind = 0;
    if (commissionKind != 0) {
        var commission = document.forms['saleOilForm'].commission.value;
        var commissionPrice = null;
        var commissionPriceOther = null;
        var commissionPriceName = "";
        if (commissionKind == 1) {//chiet khau tren hoa don
            commissionPriceOther = document.forms['saleOilForm'].commissionPrice;
            commissionPrice = document.forms['saleOilForm'].commissionDetail;
            commissionPriceName = "detcommission";
        } else if (commissionKind == 2) {//chiet khau truc tiep tren gia
            commissionPriceOther = document.forms['saleOilForm'].commissionDetail;
            commissionPrice = document.forms['saleOilForm'].commissionPrice;
            commissionPriceName = "detcommissionprice";
        }
        if (commissionPrice != null) {
            var id = "";
            if (commissionPrice.length != null) {
                for (var i = 0; i < commissionPrice.length; i++) {
                    commissionPrice[i].value = commission;
                    commissionPriceOther[i].value = 0;
                    id = commissionPrice[i].id;
                    if (id.indexOf(commissionPriceName) == 0) {
                        id = id.substring(commissionPriceName.length);
                        caculateSaleOilListDetail(id, 'saleOilForm');
                    }
                }
            } else {
                commissionPriceOther.value = 0;
                commissionPrice.value = commission;
                id = commissionPrice.id;
                if (id.indexOf(commissionPriceName) == 0) {
                    id = id.substring(commissionPriceName.length);
                    caculateSaleOilListDetail(id, 'saleOilForm');
                }
            }
        }
        commissionPrice = null;
        commissionPriceOther = null;
        saleOilCalculateAmounts('saleOilForm');
    }
    return false;
}
function saleOilCalculateAmounts(formName) {
    var commissionTotal = 0;
    var gapCustomerTotal = 0;
    var gapAgencyTotal = 0;

    var commissionAmount = document.forms[formName].commissionAmount;
    var gapCustomerAmount = document.forms[formName].gapCustomerAmount;
    var gapAgencyAmount = document.forms[formName].gapAgencyAmount;

    var quantity = document.forms[formName].quantity;
    var firstAmount = document.forms[formName].firstAmount;
    var commissionDetail = document.forms[formName].commissionDetail;
    var gapAgencyAmountDetail = document.forms[formName].gapAgencyAmountDetail;
    var gapCustomerAmountDetail = document.forms[formName].gapCustomerAmountDetail;

    if (quantity != null) {
        if (quantity.length != null) {
            for (var i = 0; i < quantity.length; i++) {
                commissionTotal += reformatNumberMoneyString(firstAmount[i].value) * reformatNumberMoneyString(commissionDetail[i].value) / 100;
                gapCustomerTotal += reformatNumberMoneyString(gapCustomerAmountDetail[i].value) * reformatNumberMoneyString(quantity[i].value);
                gapAgencyTotal += reformatNumberMoneyString(gapAgencyAmountDetail[i].value) * reformatNumberMoneyString(quantity[i].value);
            }
        } else {
            commissionTotal += reformatNumberMoneyString(firstAmount.value) * reformatNumberMoneyString(commissionDetail.value) / 100;
            gapCustomerTotal += reformatNumberMoneyString(gapCustomerAmountDetail.value) * reformatNumberMoneyString(quantity.value);
            gapAgencyTotal += reformatNumberMoneyString(gapAgencyAmountDetail.value) * reformatNumberMoneyString(quantity.value);
        }
    }

    commissionAmount.value = commissionTotal;
    gapCustomerAmount.value = gapCustomerTotal;
    gapAgencyAmount.value = gapAgencyTotal;

    tryNumberFormatCurrentcy(document.forms[formName].commissionAmount, "VND");
    tryNumberFormatCurrentcy(document.forms[formName].gapCustomerAmount, "VND");
    tryNumberFormatCurrentcy(document.forms[formName].gapAgencyAmount, "VND");

    commissionAmount = null;
    gapCustomerAmount = null;
    gapAgencyAmount = null;

    firstAmount = null;
    commissionDetail = null;
    gapAgencyAmountDetail = null;
    gapCustomerAmountDetail = null;
}
function delSaleOilDetail() {
    delTableRow('saleOilForm', 'saleOilOilChk', 'saleOilDetailTbl');
    caculateListTotal('saleOilForm');
    saleOilCalculateAmounts('saleOilForm');
    return false;
}
function addSaleOilPromotionMaterial() {
    var promotionMaterial = document.forms['saleOilForm'].promotionMaterialSelectedHidden.value;
    if (promotionMaterial == -1 || promotionMaterial == 0)
        return false;
    var promotionMaterialId = document.forms['saleOilForm'].promotionMaterialId;
    var existed = false;
    if (promotionMaterialId != null) {
        if (promotionMaterialId.length != null) {
            for (i = 0; i < promotionMaterialId.length; i++) {
                if (promotionMaterialId[i].value == promotionMaterial) {
                    existed = true;
                    break;
                }
            }
        } else if (promotionMaterialId.value == promotionMaterial)
            existed = true;
    }
    promotionMaterialId = null;
    if (existed == true) {
        alert("H\u00E0ng ho\u00E1 \u0111\u00E3 t\u1ED3n t\u1EA1i");
        return false;
    }
    callAjax("getSaleOilPromotionMaterial.do?promotionMaterialId=" + promotionMaterial, null, null, function(data) {
        setAjaxData(data, 'saleOilPromotionMaterialHideDiv');
        var matTable = document.getElementById('saleOilPromotionMaterialTbl');
        var detTable = document.getElementById('saleOilPromotionMaterialDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
        formatSaleOilPromotionMaterialQuantityDetail();
    });
    return false;
}
function formatSaleOilPromotionMaterialQuantityDetail() {
    var quantity = document.forms['saleOilForm'].promotionMaterialQuantity;
    if (quantity != null) {
        if (quantity.length != null) {
            for (var i = 0; i < quantity.length; i++) {
                tryNumberFormatCurrentcy(quantity[i], "VND");
            }
        } else {
            tryNumberFormatCurrentcy(quantity, "VND");
        }
    }
    quantity = null;
}
function reformatSaleOilPromotionMaterialQuantityDetail() {
    var quantity = document.forms['saleOilForm'].promotionMaterialQuantity;
    if (quantity != null) {
        if (quantity.length != null) {
            for (var i = 0; i < quantity.length; i++) {
                reformatNumberMoney(quantity[i]);
            }
        } else {
            reformatNumberMoney(quantity);
        }
    }
    quantity = null;
}
function showOilStockStoreReportPanel() {
    popupName = 'S\u1ED5 theo d\u00F5i NXT d\u1EA7u nh\u1EDBt theo c\u1EEDa h\u00E0ng';
    var url = 'getOilStockStoreReportPanel.do';
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['reportOilStockStoreSearchForm'].fromDate.value = currentTime;
        document.forms['reportOilStockStoreSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
    });
}
function printOilStockStoreReport(fromDate, toDate) {
    var list = document.getElementById("reportOilStockStoreSearchFormTime");
    if (list == null || list.selectedIndex == -1)
        return false;
    if (list.selectedIndex == 1) {
        fromDate = "01/" + fromDate;
        var ind = toDate.indexOf("/");
        var month = toDate.substring(0, ind);
        var year = toDate.substring(ind + 1);
        toDate = month + "/01/" + year;
        var d = new Date(toDate);
        var lastDay = new Date(d.getFullYear(), d.getMonth() + 1, 0).getDate();
        toDate = lastDay + "/" + month + "/" + year;
    } else if (list.selectedIndex == 2) {
        fromDate = "01/01/" + fromDate;
        toDate = "31/12/" + toDate;
    }
    var url = "reportOilStockStorePrint.do?temp=1";
    if (fromDate !== null)
        url += "&fromDate=" + fromDate;
    if (toDate !== null)
        url += "&toDate=" + toDate;
    list = document.forms['reportOilStockStoreSearchForm'].storeId;
    if (list != null && list.selectedIndex > -1)
        list = list.options[list.selectedIndex].value;
    else
        list = 0;
    url += "&storeId=" + list;
    callServer(url);
    return false;
}
function showCompareAgencyCommissionReportPanel() {
    popupName = 'B\u00E1o c\u00E1o theo d\u00F5i chi\u1EBFt kh\u1EA5u d\u1EA7u nh\u1EDBt \u0111\u1EA1i l\u00FD';
    var url = 'getCompareAgencyCommissionReportPanel.do';
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['reportCompareAgencyCommissionSearchForm'].fromDate.value = currentTime;
        document.forms['reportCompareAgencyCommissionSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
    });
}
function printCompareAgencyCommissionReport(fromDate, toDate) {
    var list = document.getElementById("reportCompareAgencyCommissionSearchFormTime");
    if (list == null || list.selectedIndex == -1)
        return false;
    if (list.selectedIndex == 1) {
        fromDate = "01/" + fromDate;
        var ind = toDate.indexOf("/");
        var month = toDate.substring(0, ind);
        var year = toDate.substring(ind + 1);
        toDate = month + "/01/" + year;
        var d = new Date(toDate);
        var lastDay = new Date(d.getFullYear(), d.getMonth() + 1, 0).getDate();
        toDate = lastDay + "/" + month + "/" + year;
    } else if (list.selectedIndex == 2) {
        fromDate = "01/01/" + fromDate;
        toDate = "31/12/" + toDate;
    }
    var url = "reportCompareAgencyCommissionPrint.do?temp=1";
    if (fromDate !== null)
        url += "&fromDate=" + fromDate;
    if (toDate !== null)
        url += "&toDate=" + toDate;
    list = document.forms['reportCompareAgencyCommissionSearchForm'].agencyId;
    if (list != null && list.selectedIndex > -1)
        list = list.options[list.selectedIndex].value;
    else
        list = 0;
    url += "&agencyId=" + list;
    callServer(url);
    return false;
}
function showCompareCustomerCommissionReportPanel() {
    popupName = 'B\u00E1o c\u00E1o theo d\u00F5i chi\u1EBFt kh\u1EA5u d\u1EA7u nh\u1EDBt kh\u00E1ch h\u00E0ng';
    var url = 'getCompareCustomerCommissionReportPanel.do';
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['reportCompareCustomerCommissionSearchForm'].fromDate.value = currentTime;
        document.forms['reportCompareCustomerCommissionSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        // ============================
        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        var customerIdCombobox = dhtmlXComboFromSelect("customerIdCombobox");
        customerIdCombobox.enableFilteringMode(true);
        customerIdCombobox.attachEvent("onSelectionChange", function() {
            setCustomerSelectedForm('reportCompareCustomerCommissionSearchForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
        });
        customerIdCombobox.attachEvent("onBlur", function() {
            setCustomerSelectedForm('reportCompareCustomerCommissionSearchForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
            customerIdCombobox.setComboText(customerIdCombobox.getSelectedText());
        });
        customerIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                customerIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        customerIdCombobox.setComboValue("");
    });
}
function printCompareCustomerCommissionReport(fromDate, toDate) {
    var list = document.getElementById("reportCompareCustomerCommissionSearchFormTime");
    if (list == null || list.selectedIndex == -1)
        return false;
    if (list.selectedIndex == 1) {
        fromDate = "01/" + fromDate;
        var ind = toDate.indexOf("/");
        var month = toDate.substring(0, ind);
        var year = toDate.substring(ind + 1);
        toDate = month + "/01/" + year;
        var d = new Date(toDate);
        var lastDay = new Date(d.getFullYear(), d.getMonth() + 1, 0).getDate();
        toDate = lastDay + "/" + month + "/" + year;
    } else if (list.selectedIndex == 2) {
        fromDate = "01/01/" + fromDate;
        toDate = "31/12/" + toDate;
    }
    list = null;
    var url = "reportCompareCustomerCommissionPrint.do?temp=1";
    if (fromDate !== null)
        url += "&fromDate=" + fromDate;
    if (toDate !== null)
        url += "&toDate=" + toDate;
    url += "&customerId=" + document.forms['reportCompareCustomerCommissionSearchForm'].customerSelectedHidden.value;
    callServer(url);
    return false;
}
function showOilCompareReportPanel() {
    popupName = '\u0110\u1ED1i chi\u1EBFu d\u1EA7u nh\u1EDBt';
    var url = 'getOilCompareReportPanel.do';
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['reportOilCompareSearchForm'].fromDate.value = currentTime;
        document.forms['reportOilCompareSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        // ============================
        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        var customerIdCombobox = dhtmlXComboFromSelect("customerIdComboboxPopup");
        customerIdCombobox.enableFilteringMode(true);
        customerIdCombobox.attachEvent("onSelectionChange", function() {
            setCustomerSelectedForm('reportOilCompareSearchForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
        });
        customerIdCombobox.attachEvent("onBlur", function() {
            setCustomerSelectedForm('reportOilCompareSearchForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
            customerIdCombobox.setComboText(customerIdCombobox.getSelectedText());
        });
        customerIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                customerIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        customerIdCombobox.setComboValue("");
    });
}
function printOilComapreReport(fromDate, toDate) {
    var list = document.getElementById("reportOilCompareSearchFormTime");
    if (list == null || list.selectedIndex == -1)
        return false;
    if (list.selectedIndex == 1) {
        fromDate = "01/" + fromDate;
        var ind = toDate.indexOf("/");
        var month = toDate.substring(0, ind);
        var year = toDate.substring(ind + 1);
        toDate = month + "/01/" + year;
        var d = new Date(toDate);
        var lastDay = new Date(d.getFullYear(), d.getMonth() + 1, 0).getDate();
        toDate = lastDay + "/" + month + "/" + year;
    } else if (list.selectedIndex == 2) {
        fromDate = "01/01/" + fromDate;
        toDate = "31/12/" + toDate;
    }
    var url = "reportOilComparePrint.do?temp=1";
    if (fromDate !== null)
        url += "&fromDate=" + fromDate;
    if (toDate !== null)
        url += "&toDate=" + toDate;
    list = null;
    url += "&customerId=" + document.forms['reportOilCompareSearchForm'].customerSelectedHidden.value;
    callServer(url);
    return false;
}
function showOilVendorStockReportPanel() {
    popupName = 'B\u1EA3ng theo d\u00F5i nh\u1EADp xu\u1EA5t t\u1ED3n t\u1ED5ng kho';
    var url = 'getOilVendorStockReportPanel.do';
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['reportOilVendorStockSearchForm'].fromDate.value = currentTime;
        document.forms['reportOilVendorStockSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
    });
}
function printOilVendorStockReport(fromDate, toDate) {
    var list = document.getElementById("reportOilVendorStockSearchFormTime");
    if (list == null || list.selectedIndex == -1)
        return false;
    if (list.selectedIndex == 1) {
        fromDate = "01/" + fromDate;
        var ind = toDate.indexOf("/");
        var month = toDate.substring(0, ind);
        var year = toDate.substring(ind + 1);
        toDate = month + "/01/" + year;
        var d = new Date(toDate);
        var lastDay = new Date(d.getFullYear(), d.getMonth() + 1, 0).getDate();
        toDate = lastDay + "/" + month + "/" + year;
    } else if (list.selectedIndex == 2) {
        fromDate = "01/01/" + fromDate;
        toDate = "31/12/" + toDate;
    }
    var url = "reportOilVendorStockPrint.do?temp=1";
    if (fromDate !== null)
        url += "&fromDate=" + fromDate;
    if (toDate !== null)
        url += "&toDate=" + toDate;
    list = document.forms['reportOilVendorStockSearchForm'].vendorId;
    if (list != null && list.selectedIndex > -1)
        list = list.options[list.selectedIndex].value;
    else
        list = 0;
    url += "&vendorId=" + list;
    callServer(url);
    return false;
}
function loadSaleOilReturnPanel() {
    callAjax("getSaleOilReturnPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['saleOilReturnSearchForm'].fromDate.value = currentTime;
        document.forms['saleOilReturnSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadSaleOilReturnList(currentTime, currentTime);
    });
    return false;
}
function loadSaleOilReturnList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('saleOilReturnList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("M\u00E3 phi\u1EBFu,Ng\u00E0y,T\u1ED5ng ti\u1EC1n,Thanh to\u00E1n,C\u00F2n n\u1EE3,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,100,150,150,*");
    mygrid.setColTypes("link,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getSaleOilReturnList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getSaleOilReturn(id, saleOilId) {
    var url = 'saleOilReturnForm.do?saleOilReturnId=' + id + "&saleOilId=" + saleOilId;
    if (id == 0) {
        url += "&saleOilDetailIds=" + getCheckedTableRow('saleOilForm', 'saleOilOilChk');
    }
    callAjax(url, null, null, function(data) {
        clearContent();
        setAjaxData(data, 'contentDiv');
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['saleOilReturnForm'].saleOilReturnCreatedDate.value = currentDate;
        }

        var myCalendar = new dhtmlXCalendarObject(["saleOilReturnCreatedDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");

        tryNumberFormatCurrentcy(document.forms['saleOilReturnForm'].total, "VND");
        tryNumberFormatCurrentcy(document.forms['saleOilReturnForm'].paid, "VND");
        tryNumberFormatCurrentcy(document.forms['saleOilReturnForm'].debt, "VND");
        tryNumberFormatCurrentcy(document.forms['saleOilReturnForm'].totalPay, "VND");
        tryNumberFormatCurrentcy(document.forms['saleOilReturnForm'].commission, "USD");
        tryNumberFormatCurrentcy(document.forms['saleOilReturnForm'].commissionAmount, "VND");
        tryNumberFormatCurrentcy(document.forms['saleOilReturnForm'].gapCustomerAmount, "VND");
        tryNumberFormatCurrentcy(document.forms['saleOilReturnForm'].gapAgencyAmount, "VND");
        formatSaleOilDetail('saleOilReturnForm');
    });
    if (id == 0)
        return false;
}
function getCheckedTableRow(form, chkbox) {
    var detId = eval("document.forms['" + form + "']." + chkbox);
    var ids = "0";
    if (detId == null)
        return false;
    if (detId.length != null) {
        var len = detId.length;
        for (var i = len - 1; i >= 0; i--) {
            if (detId[i].checked == true)
                ids += "," + detId[i].value;
        }
    } else {
        if (detId.checked == true)
            ids += "," + detId.value;
    }
    detId = null;
    return ids;
}
function saveSaleOilReturn() {
    if (scriptFunction == "saveSaleOilReturn")
        return false;
    var quantity = document.forms['saleOilReturnForm'].quantity;
    if (quantity == null) {
        alert('Vui l\u00F2ng ch\u1ECDn h\u00E0ng h\u00F3a');
        return false;
    }
    var priceBeforeCommission = document.forms['saleOilReturnForm'].priceBeforeCommission;
    var commissionPrice = document.forms['saleOilReturnForm'].commissionPrice;
    var price = document.forms['saleOilReturnForm'].price;
    var firstAmount = document.forms['saleOilReturnForm'].firstAmount;
    var commissionDetail = document.forms['saleOilReturnForm'].commissionDetail;
    var gapAgencyAmountDetail = document.forms['saleOilReturnForm'].gapAgencyAmountDetail;
    var gapCustomerAmountDetail = document.forms['saleOilReturnForm'].gapCustomerAmountDetail;
    var amount = document.forms['saleOilReturnForm'].amount;
    if (quantity.length != null) {
        for (var i = 0; i < quantity.length; i++) {
            var number = Number(quantity[i].value);
            if (number == 0) {
                alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
                quantity[i].focus();
                quantity = null;
                return false;
            }
            reformatNumberMoney(quantity[i]);
            reformatNumberMoney(priceBeforeCommission[i]);
            reformatNumberMoney(commissionPrice[i]);
            reformatNumberMoney(price[i]);
            reformatNumberMoney(firstAmount[i]);
            reformatNumberMoney(commissionDetail[i]);
            reformatNumberMoney(gapAgencyAmountDetail[i]);
            reformatNumberMoney(gapCustomerAmountDetail[i]);
            reformatNumberMoney(amount[i]);
        }
    } else {
        if (quantity.value == "0") {
            alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
            quantity.focus();
            quantity = null;
            return false;
        }
        reformatNumberMoney(quantity);
        reformatNumberMoney(priceBeforeCommission);
        reformatNumberMoney(commissionPrice);
        reformatNumberMoney(price);
        reformatNumberMoney(firstAmount);
        reformatNumberMoney(commissionDetail);
        reformatNumberMoney(gapAgencyAmountDetail);
        reformatNumberMoney(gapCustomerAmountDetail);
        reformatNumberMoney(amount);
    }
    quantity = null;
    priceBeforeCommission = null;
    commissionPrice = null;
    price = null;
    firstAmount = null;
    commissionDetail = null;
    gapAgencyAmountDetail = null;
    gapCustomerAmountDetail = null;
    amount = null;

    reformatNumberMoney(document.forms['saleOilReturnForm'].total);
    reformatNumberMoney(document.forms['saleOilReturnForm'].paid);
    reformatNumberMoney(document.forms['saleOilReturnForm'].debt);
    reformatNumberMoney(document.forms['saleOilReturnForm'].totalPay);
    reformatNumberMoney(document.forms['saleOilReturnForm'].commission);
    reformatNumberMoney(document.forms['saleOilReturnForm'].commissionAmount);
    reformatNumberMoney(document.forms['saleOilReturnForm'].gapCustomerAmount);
    reformatNumberMoney(document.forms['saleOilReturnForm'].gapAgencyAmount);
    reformatFormDetail('saleOilReturnForm');
    scriptFunction = "saveSaleOilReturn";
    callAjaxCheckError("addSaleOilReturn.do", null, document.forms['saleOilReturnForm'], function(data) {
        scriptFunction = "";
        loadSaleOilReturnPanel();
    });
    return false;
}
function delSaleOilReturn() {
    callAjaxCheckError('delSaleOilReturn.do?saleOilReturnId=' + document.forms['saleOilReturnForm'].id.value, null, null, function() {
        loadSaleOilReturnPanel();
    });
    return false;
}
function getSaleOilReturnStore(id) {
    popupName = 'TH\u00D4NG TIN KHO TR\u1EA2 H\u00C0NG D\u1EA6U NH\u1EDAT';
    var url = 'saleOilReturnStoreForm.do';
    if (id != 0)
        url += '?saleOilReturnStoreId=' + id
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
    });
}
function saveSaleOilReturnStore() {
    if (scriptFunction == "saveSaleOilReturnStore")
        return false;
    scriptFunction = "saveSaleOilReturnStore";
    callAjaxCheckError("addSaleOilReturnStore.do", null, document.forms['saleOilReturnStoreForm'], function(data) {
        scriptFunction = "";
        prepareHidePopup('saleOilReturnStoreFormshowHelpHideDiv');
    });
    return false;
}
function loadOilExportPanel() {
    callAjax("getOilExportPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['oilExportSearchForm'].fromDate.value = currentTime;
        document.forms['oilExportSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadOilExportList(currentTime, currentTime);
    });
    return false;
}
function loadOilExportList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('oilExportList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("M\u00E3 phi\u1EBFu,Ng\u00E0y,Kh\u00E1ch h\u00E0ng,T\u1ED5ng ti\u1EC1n,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#select_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,100,150,*");
    mygrid.setColTypes("link,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getOilExportList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getOilExport(id, oilSaleId) {
    var url = 'oilExportForm.do?oilExportId=' + id + '&oilSaleId=' + oilSaleId;
    if (id == 0) {
        url += "&saleOilDetailIds=" + getCheckedTableRow('saleOilForm', 'saleOilOilChk');
    }
    callAjax(url, null, null, function(data) {
        clearContent();
        setAjaxData(data, 'contentDiv');
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['oilExportForm'].oilExportCreatedDate.value = currentDate;
        }
        var myCalendar = new dhtmlXCalendarObject(["oilExportCreatedDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");

        tryNumberFormatCurrentcy(document.forms['oilExportForm'].total, "VND");
        formatFormDetail('oilExportForm');
    });
    if (id == 0)
        return false;
}
function saveOilExport() {
    if (scriptFunction == "saveOilExport")
        return false;
    var quantity = document.forms['oilExportForm'].quantity;
    if (quantity == null) {
        alert('Vui l\u00F2ng ch\u1ECDn h\u00E0ng h\u00F3a');
        return false;
    }
    var price = document.forms['oilExportForm'].price;
    var amount = document.forms['oilExportForm'].amount;
    if (quantity.length != null) {
        for (var i = 0; i < quantity.length; i++) {
            var number = Number(quantity[i].value);
            if (number == 0) {
                alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
                quantity[i].focus();
                quantity = null;
                return false;
            }
            reformatNumberMoney(quantity[i]);
            reformatNumberMoney(price[i]);
            reformatNumberMoney(amount[i]);
        }
    } else {
        if (quantity.value == "0") {
            alert('Vui l\u00F2ng nh\u1EADp s\u1ED1 l\u01B0\u1EE3ng');
            quantity.focus();
            quantity = null;
            return false;
        }
        reformatNumberMoney(quantity);
        reformatNumberMoney(price);
        reformatNumberMoney(amount);
    }
    quantity = null;
    price = null;
    amount = null;
    reformatNumberMoney(document.forms['oilExportForm'].total);
    scriptFunction = "saveOilExport";
    callAjaxCheckError("addOilExport.do", null, document.forms['oilExportForm'], function(data) {
        scriptFunction = "";
        loadOilExportPanel();
    });
    return false;
}
function delOilExport() {
    callAjaxCheckError('delOilExport.do?oilExportId=' + document.forms['oilExportForm'].id.value, null, null, function() {
        loadOilExportPanel();
    });
    return false;
}
function delOilExportDetail() {
    delTableRow('oilExportForm', 'oilExportOilChk', 'oilExportDetailTbl');
    caculateListTotal('oilExportForm');
    return false;
}
function printOilExport(oilExportId) {
    callServer("reportOilExport.do?oilExportId=" + oilExportId);
    return false;
}
function loadVendorOilPanel() {
    callAjax("getVendorOilPanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        loadVendorOilList();
    });
}
function loadVendorOilList() {
    var mygrid = new dhtmlXGridObject('vendorOilList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("M\u00E3 nh\u00E0 cung c\u1EA5p,T\u00EAn nh\u00E0 cung c\u1EA5p,\u0110\u01A1n v\u1ECB,T\u00ECnh tr\u1EA1ng");
    mygrid.attachHeader("#text_filter,#text_filter,#select_filter,#select_filter");
    mygrid.setInitWidths("100,*,250,150");
    mygrid.setColTypes("link,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var list = document.forms['vendorOilSearchForm'].statusCombobox;
    if (list != null && list.selectedIndex > -1)
        list = list.options[list.selectedIndex].value;
    else
        list = 0;
    var url = "getVendorOilList.do?status=" + list;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getVendorOil(id) {
    var url = 'vendorOilForm.do';
    if (id != 0)
        url += '?vendorId=' + id
    callAjax(url, null, null, function(data) {
        clearContent();
        setAjaxData(data, 'contentDiv');
        document.forms['vendorOilForm'].commissionOnImport.focus();
        tryNumberFormatCurrentcy(document.forms['vendorOilForm'].commissionOnImport, "USD");
        tryNumberFormatCurrentcy(document.forms['vendorOilForm'].maxDebt, "VND");
    });
}
function saveVendorOil() {
    if (scriptFunction == "saveVendorOil")
        return false;
    reformatNumberMoney(document.forms['vendorOilForm'].commissionOnImport);
    reformatNumberMoney(document.forms['vendorOilForm'].maxDebt);
    scriptFunction = "saveVendorOil";
    callAjaxCheckError("addVendorOil.do", null, document.forms['vendorOilForm'], function(data) {
        scriptFunction = "";
        loadVendorOilPanel();
    });
    return false;
}
function addVendorOilStore() {
    var store = document.forms['vendorOilForm'].storeIdCombobox;
    if (store == null && store.selectedIndex == -1)
        store = null;
    else
        store = store.options[store.selectedIndex].value;
    if (store == -1 || store == 0)
        return false;
    var storeId = document.forms['vendorOilForm'].storeId;
    var existed = false;
    if (storeId != null) {
        if (storeId.length != null) {
            for (i = 0; i < storeId.length; i++) {
                if (storeId[i].value == store) {
                    existed = true;
                    break;
                }
            }
        } else if (storeId.value == store)
            existed = true;
    }
    storeId = null;
    if (existed == true) {
        alert("H\u00E0ng ho\u00E1 \u0111\u00E3 t\u1ED3n t\u1EA1i");
        return false;
    }
    callAjax("getVendorOilStore.do?storeId=" + store, null, null, function(data) {
        setAjaxData(data, 'vendorOilStoreHideDiv');
        var matTable = document.getElementById('vendorOilStoreTbl');
        var detTable = document.getElementById('vendorOilStoreDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
    });
    return false;
}
function loadInvoicePanel() {
    callAjax("getInvoicePanel.do", null, null, function(data) {
        clearContent();
        setAjaxData(data, "contentDiv");
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['invoiceSearchForm'].fromDate.value = currentTime;
        document.forms['invoiceSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        loadInvoiceList(currentTime, currentTime);
    });
    return false;
}
function loadInvoiceList(fromDate, toDate) {
    var mygrid = new dhtmlXGridObject('invoiceList');
    mygrid.setImagePath("js/dhtmlx/grid/imgs/");
    mygrid.setHeader("S\u1ED1 h\u00F3a \u0111\u01A1n,Ng\u00E0y h\u00F3a \u0111\u01A1n,Kh\u00E1ch h\u00E0ng,S\u1ED1 ti\u1EC1n,S\u1ED1 ti\u1EC1n \u0111\u00E3 thanh to\u00E1n,Ghi ch\u00FA");
    mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
    mygrid.setInitWidths("150,150,200,150,150,*");
    mygrid.setColTypes("link,ro,ro,ro,ro,ro");
    mygrid.setColSorting("str,str,str,str,str,str");
    mygrid.setSkin("light");
    var height = contentHeight - 210;
    mygrid.al(true, height); //enableAutoHeight
    mygrid.enablePaging(true, 15, 3, "recinfoArea");
    mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.init();
    var url = "getInvoiceList.do?t=1";
    if (fromDate != null)
        url += "&fromDate=" + fromDate;
    if (toDate != null)
        url += "&toDate=" + toDate;
    callAjax(url, null, null, function(data) {
        mygrid.parse(data);
    });
    return false;
}
function getInvoice(id) {
    var url = 'invoiceForm.do';
    if (id != 0)
        url += '?invoiceId=' + id
    callAjax(url, null, null, function(data) {
        clearContent();
        setAjaxData(data, 'contentDiv');
        var amount = document.forms['invoiceForm'].oilSaleDetailAmount;
        if (amount != null) {
            if (amount.length != null) {
                for (var i = 0; i < amount.length; i++) {
                    tryNumberFormatCurrentcy(amount[i]);
                }
            } else {
                tryNumberFormatCurrentcy(amount);
            }
        }
        amount = document.forms['invoiceForm'].paidAmount;
        if (amount != null) {
            if (amount.length != null) {
                for (var i = 0; i < amount.length; i++) {
                    tryNumberFormatCurrentcy(amount[i]);
                }
            } else {
                tryNumberFormatCurrentcy(amount);
            }
        }
        amount = null;
        tryNumberFormatCurrentcy(document.forms['invoiceForm'].amount, "VND");
        tryNumberFormatCurrentcy(document.forms['invoiceForm'].amountPaid, "VND");
        if (id == 0) {
            var currentDate = getCurrentDate();
            document.forms['invoiceForm'].invoiceDate.value = currentDate;
        }
        var myCalendar = new dhtmlXCalendarObject(["invoiceDate", "invoicePaidDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");

        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        // ============================
        var customerIdCombobox = dhtmlXComboFromSelect("customerIdCombobox");
        customerIdCombobox.enableFilteringMode(true);
        customerIdCombobox.attachEvent("onSelectionChange", function() {
            setCustomerSelectedForm('invoiceForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
        });
        customerIdCombobox.attachEvent("onBlur", function() {
            setCustomerSelectedForm('invoiceForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
            customerIdCombobox.setComboText(customerIdCombobox.getSelectedText());
        });
        customerIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                customerIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        if (id == 0) {
            customerIdCombobox.setComboValue("");
        } else {
            var customerId = document.forms['invoiceForm'].customerId.value;
            if (customerId != 0) {
                var ind = customerIdCombobox.getIndexByValue(customerId);
                customerIdCombobox.selectOption(ind);
            } else {
                customerIdCombobox.unSelectOption();
                customerIdCombobox.setComboValue("");
            }
            customerIdCombobox.readonly(true);
        }
    });
}
function saveInvoice() {
    if (scriptFunction == "saveInvoice")
        return false;
    var field = document.forms['invoiceForm'].createdDate;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp ng\u00E0y");
        field.focus();
        field = null;
        return false;
    }
    field = document.forms['invoiceForm'].number;
    if (field.value == '') {
        alert("Vui l\u00F2ng nh\u1EADp s\u1ED1 h\u00F3a \u0111\u01A1n");
        field.focus();
        field = null;
        return false;
    }
    field = null;

    document.forms['invoiceForm'].customerId.value = document.forms['invoiceForm'].customerSelectedHidden.value;

    var amount = reformatNumberMoney(document.forms['invoiceForm'].amount);
    var amountPaid = reformatNumberMoney(document.forms['invoiceForm'].amountPaid);

    if (amountPaid * 1 > amount * 1) {
        alert("T\u1ED5ng ti\u1EC1n \u0111\u00E3 thanh to\u00E1n kh\u00F4ng \u0111\u01B0\u1EE3c l\u1EDBn h\u01A1n t\u1ED5ng ti\u1EC1n h\u00F3a \u0111\u01A1n");
        tryNumberFormatCurrentcy(document.forms['invoiceForm'].amount, "VND");
        tryNumberFormatCurrentcy(document.forms['invoiceForm'].amountPaid, "VND");
        return false;
    }

    var amount = document.forms['invoiceForm'].oilSaleDetailAmount;
    if (amount != null) {
        if (amount.length != null) {
            for (var i = 0; i < amount.length; i++) {
                reformatNumberMoney(amount[i]);
            }
        } else {
            reformatNumberMoney(amount);
        }
    }
    amount = document.forms['invoiceForm'].paidAmount;
    if (amount != null) {
        if (amount.length != null) {
            for (var i = 0; i < amount.length; i++) {
                reformatNumberMoney(amount[i]);
            }
        } else {
            reformatNumberMoney(amount);
        }
    }
    amount = null;
    reformatNumberMoney(document.forms['invoiceForm'].amount);
    reformatNumberMoney(document.forms['invoiceForm'].amountPaid);
    scriptFunction = "saveInvoice";
    callAjaxCheckError("addInvoice.do", null, document.forms['invoiceForm'], function(data) {
        scriptFunction = "";
        if (confirm('B\u1EA1n c\u00F3 mu\u1ED1n nh\u1EADp ti\u1EBFp th\u00F4ng tin kh\u00E1c ?'))
            getInvoice(0);
        else
            loadInvoicePanel();
    });
    return false;
}
function delInvoice() {
    callAjaxCheckError('delInvoice.do?invoiceId=' + document.forms['invoiceForm'].id.value, null, null, function() {
        loadInvoicePanel();
    });
    return false;
}
function addInvoicePaidDetail() {
    var invoicePaidDate = document.getElementById("invoicePaidDate");
    if (invoicePaidDate == null || invoicePaidDate.value == "")
        return false;
    invoicePaidDate = invoicePaidDate.value;
    callAjax("getInvoicePaid.do?paidDate=" + invoicePaidDate, null, null, function(data) {
        setAjaxData(data, 'invoicePaidHideDiv');
        var matTable = document.getElementById('invoicePaidAmountTbl');
        var detTable = document.getElementById('invoicePaidDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
    });
    return false;
}
function invoicePaidAmountChanged(obj) {
    var total = 0;
    var paidAmount = document.forms["invoiceForm"].paidAmount;
    if (paidAmount != null) {
        if (paidAmount.length != null) {
            for (var i = 0; i < paidAmount.length; i++) {
                total += reformatNumberMoneyString(paidAmount[i].value) * 1;
            }
        } else {
            total += reformatNumberMoneyString(paidAmount.value) * 1;
        }
    }
    document.forms["invoiceForm"].amountPaid.value = total;
    tryNumberFormatCurrentcy(document.forms["invoiceForm"].amountPaid, "VND");
    paidAmount = null;
    tryNumberFormatCurrentcy(obj);
}
function calculateDetailAmountChanged() {
    var total = 0;
    var oilSaleDetailAmount = document.forms["invoiceForm"].oilSaleDetailAmount;
    if (oilSaleDetailAmount != null) {
        if (oilSaleDetailAmount.length != null) {
            for (var i = 0; i < oilSaleDetailAmount.length; i++) {
                total += reformatNumberMoneyString(oilSaleDetailAmount[i].value) * 1;
            }
        } else {
            total += reformatNumberMoneyString(oilSaleDetailAmount.value) * 1;
        }
    }
    document.forms["invoiceForm"].amount.value = total;
    tryNumberFormatCurrentcy(document.forms["invoiceForm"].amount, "VND");
    oilSaleDetailAmount = null;
}
function showSearchOilSale() {
    var customerId = document.forms['invoiceForm'].customerSelectedHidden.value;
    popupName = 'T\u00CCM CHI TI\u1EBET B\u00C1N H\u00C0NG';
    callAjax('getSearchOilSaleForm.do?customerId=' + customerId, null, null, function(data) {
        showPopupForm(data);
        var myCalendar = new dhtmlXCalendarObject(["searchOilSaleFromDate", "searchOilSaleToDate"]);
        myCalendar.setSkin('dhx_web');
        myCalendar.setDateFormat("%d/%m/%Y");
    });
    return false;
}
function searchOilSale() {
    var searchOilSaleCode = document.getElementById("searchOilSaleCode");
    var searchOilSaleFromDate = document.getElementById("searchOilSaleFromDate");
    var searchOilSaleToDate = document.getElementById("searchOilSaleToDate");
    var searchOilSaleOil = document.getElementById("searchOilSaleOil");

    if (searchOilSaleCode != null)
        searchOilSaleCode = searchOilSaleCode.value;
    else
        searchOilSaleCode = "";

    if (searchOilSaleFromDate != null)
        searchOilSaleFromDate = searchOilSaleFromDate.value;
    else
        searchOilSaleFromDate = "";

    if (searchOilSaleToDate != null)
        searchOilSaleToDate = searchOilSaleToDate.value;
    else
        searchOilSaleToDate = "";

    if (searchOilSaleOil != null)
        searchOilSaleOil = searchOilSaleOil.value;
    else
        searchOilSaleOil = "";

    callAjax("searchOilSale.do?code=" + searchOilSaleCode + "&fromDate=" + searchOilSaleFromDate + "&toDate=" + searchOilSaleToDate + "&oilName=" + searchOilSaleOil + "&customerId=" + document.forms['invoiceForm'].customerSelectedHidden.value, null, null, function(data) {
        setAjaxData(data, 'searchOilSaleResultHideDiv');
        var matTable = document.getElementById('searchOilSaleResultTbl');
        var detTable = document.getElementById('searchOilSaleDetailTbl');
        while (detTable.tBodies[0].hasChildNodes()) {
            detTable.tBodies[0].removeChild(detTable.tBodies[0].firstChild);
        }
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;
    });
    return false;
}
function addInvoiceDetail() {
    var invoiceDetailTbl = document.getElementById("invoiceDetailTbl");
    if (invoiceDetailTbl == null)
        return false;
    invoiceDetailTbl = null;

    var ids = getCheckedTableRow('searchOilSaleForm', 'invoiceSearchedDetailChk');

    var oilSaleDetailId = document.forms['invoiceForm'].oilSaleDetailId;
    if (oilSaleDetailId != null) {
        var idArray = ids.split(',');
        ids = "0";
        var existed = false;
        for (var i = 0; i < idArray.length; i++) {
            var id = idArray[i];
            existed = false;
            if (oilSaleDetailId.length != null) {
                for (i = 0; i < oilSaleDetailId.length; i++) {
                    if (oilSaleDetailId[i].value == id) {
                        existed = true;
                        break;
                    }
                }
            } else if (oilSaleDetailId.value == id)
                existed = true;
            if (!existed)
                ids += "," + id;
        }
        oilSaleDetailId = null;
    }

    if (ids == "0")
        return false;

    callAjax("getInvoiceOilSaleDetail.do?ids=" + ids, null, null, function(data) {
        setAjaxData(data, 'invoiceDetailHideDiv');
        var matTable = document.getElementById('invoiceOilSaleTbl');
        var detTable = document.getElementById('invoiceDetailTbl');
        if (matTable.tBodies[0] == null || detTable.tBodies[0] == null) {
            matTable = null;
            detTable = null;
            return;
        }
        for (var i = matTable.tBodies[0].rows.length - 1; i >= 0; i--)
            detTable.tBodies[0].appendChild(matTable.tBodies[0].rows[i]);
        matTable = null;
        detTable = null;

        calculateDetailAmountChanged();

        var amount = document.forms['invoiceForm'].oilSaleDetailAmount;
        if (amount != null) {
            if (amount.length != null) {
                for (var i = 0; i < amount.length; i++) {
                    tryNumberFormatCurrentcy(amount[i]);
                }
            } else {
                tryNumberFormatCurrentcy(amount);
            }
        }
        amount = null;
    });
    return false;
}
function showOilCustomerDebtReportPanel() {
    popupName = 'B\u1EA3ng \u0111\u1ED1i chi\u1EBFu c\u00F4ng n\u1EE3 kh\u00E1ch h\u00E0ng d\u1EA7u nh\u1EDBt';
    var url = 'getOilCustomerDebtReportPanel.do';
    callAjax(url, null, null, function(data) {
        showPopupForm(data);
        var myCalendar = new dhtmlXCalendarObject(["fromDate", "toDate"]);
        myCalendar.setSkin('dhx_web');
        var currentTime = getCurrentDate();
        document.forms['reportOilCustomerDebtSearchForm'].fromDate.value = currentTime;
        document.forms['reportOilCustomerDebtSearchForm'].toDate.value = currentTime;
        myCalendar.setDateFormat("%d/%m/%Y");
        // ============================
        window.dhx_globalImgPath = "js/dhtmlx/combo/imgs/";
        var customerIdCombobox = dhtmlXComboFromSelect("customerIdComboboxPopup");
        customerIdCombobox.enableFilteringMode(true);
        customerIdCombobox.attachEvent("onSelectionChange", function() {
            setCustomerSelectedForm('reportOilCustomerDebtSearchForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
        });
        customerIdCombobox.attachEvent("onBlur", function() {
            setCustomerSelectedForm('reportOilCustomerDebtSearchForm', customerIdCombobox.getComboText(), customerIdCombobox.getSelectedValue());
            customerIdCombobox.setComboText(customerIdCombobox.getSelectedText());
        });
        customerIdCombobox.DOMelem_input.onfocus = function(event) {
            if (isManuallySeleted == 1) {
                customerIdCombobox.openSelect();
                isManuallySeleted = 0;
            }
        }
        customerIdCombobox.setComboValue("");
    });
}
function printComapreLPGReport(fromDate, toDate) {
    var list = document.getElementById("reportOilCustomerDebtSearchFormTime");
    if (list == null || list.selectedIndex == -1)
        return false;
    if (list.selectedIndex == 1) {
        fromDate = "01/" + fromDate;
        var ind = toDate.indexOf("/");
        var month = toDate.substring(0, ind);
        var year = toDate.substring(ind + 1);
        toDate = month + "/01/" + year;
        var d = new Date(toDate);
        var lastDay = new Date(d.getFullYear(), d.getMonth() + 1, 0).getDate();
        toDate = lastDay + "/" + month + "/" + year;
    } else if (list.selectedIndex == 2) {
        fromDate = "01/01/" + fromDate;
        toDate = "31/12/" + toDate;
    }
    var url = "reportOilCustomerDebtPrint.do?temp=1";
    if (fromDate !== null)
        url += "&fromDate=" + fromDate;
    if (toDate !== null)
        url += "&toDate=" + toDate;
    list = null;
    url += "&customerId=" + document.forms['reportOilCustomerDebtSearchForm'].customerSelectedHidden.value;
    callServer(url);
    return false;
}
