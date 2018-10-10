/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.gui;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.dao.PermissionDAO;
import com.stepup.gasoline.qt.dao.UserDAO;
import com.stepup.gasoline.qt.permission.ApplicationPermissionBean;
import com.stepup.gasoline.qt.util.QTUtil;
import com.stepup.gasoline.qt.util.PermissionUtil;
import java.util.ArrayList;

/**
 *
 * @author phuongtu
 */
public class GenerateMenu {

    private ArrayList<ApplicationPermissionBean> arrPer = null;

    public void generate(int memberId) {
        try {

            PermissionDAO permissionDAO = new PermissionDAO();
            arrPer = permissionDAO.getPermissionsOfEmployee(memberId);

            StringBuilder buff = new StringBuilder();
            buff.append("<?xml version=\"1.0\"?>");
            buff.append("<menu>");

            StringBuilder buffTemp = new StringBuilder();

            if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD,
                    PermissionUtil.PER_PERMISSION + "," + PermissionUtil.PER_USER + "," + PermissionUtil.PER_PARAMTER)) {
                buffTemp.append("<item id=\"system\" complex=\"true\" text=\"").append(QTUtil.getBundleString("menu.admin.system.title")).append("\">");//start system
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_USER)) {
                    buffTemp.append("<item id=\"users\" complex=\"true\" text=\"").append(QTUtil.getBundleString("user.title")).append("\">");//start users
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_USER)) {
                        buffTemp.append("<item id=\"userlist\" text=\"").append(QTUtil.getBundleString("user.list.title")).append("\"/>");//list user
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_USER)) {
                        buffTemp.append("<item id=\"useradd\" text=\"").append(QTUtil.getBundleString("user.detail.add.title")).append("\"/>");//add user
                    }
                    buffTemp.append("</item>");//end users
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_PARAMTER)) {
                    buffTemp.append("<item id=\"parameter\" text=\"").append(QTUtil.getBundleString("parameter.title")).append("\"/>");//parameter
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_PERMISSION)) {
                    buffTemp.append("<item id=\"permissionlist\" text=\"").append(QTUtil.getBundleString("permission.title")).append("\"/>");//permission
                }
                buffTemp.append("</item>");//end system
            }

            if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD,
                    PermissionUtil.PER_ORGANIZATION + "," + PermissionUtil.PER_STORE + "," + PermissionUtil.PER_EMPLOYEE + "," + PermissionUtil.PER_ACCOUNT)) {
                buffTemp.append("<item id=\"organization\" complex=\"true\" text=\"").append(QTUtil.getBundleString("menu.admin.organization.title")).append("\">");//start organization
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_ORGANIZATION)) {
                    buffTemp.append("<item id=\"organizations\" complex=\"true\" text=\"").append(QTUtil.getBundleString("organization.title")).append("\">");//start organizations
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_ORGANIZATION)) {
                        buffTemp.append("<item id=\"organizationlist\" text=\"").append(QTUtil.getBundleString("organization.list.title")).append("\"/>");//list organization
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_ORGANIZATION)) {
                        buffTemp.append("<item id=\"organizationadd\" text=\"").append(QTUtil.getBundleString("organization.detail.add.title")).append("\"/>");//add organization
                    }
                    buffTemp.append("</item>");//end organizations
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_STORE)) {
                    buffTemp.append("<item id=\"stores\" complex=\"true\" text=\"").append(QTUtil.getBundleString("store.title")).append("\">");//start stores
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_STORE)) {
                        buffTemp.append("<item id=\"storelist\" text=\"").append(QTUtil.getBundleString("store.list.title")).append("\"/>");//list store
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_STORE)) {
                        buffTemp.append("<item id=\"storeadd\" text=\"").append(QTUtil.getBundleString("store.detail.add.title")).append("\"/>");//add store
                    }
                    buffTemp.append("</item>");//end stores
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_EMPLOYEE)) {
                    buffTemp.append("<item id=\"employees\" complex=\"true\" text=\"").append(QTUtil.getBundleString("employee.title")).append("\">");//start employees
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_EMPLOYEE)) {
                        buffTemp.append("<item id=\"employeelist\" text=\"").append(QTUtil.getBundleString("employee.list.title")).append("\"/>");//list employee
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_EMPLOYEE)) {
                        buffTemp.append("<item id=\"employeeadd\" text=\"").append(QTUtil.getBundleString("employee.detail.add.title")).append("\"/>");//add employee
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_DYNAMIC_FIELD)) {
                        buffTemp.append("<item id=\"employeefiellist\" text=\"").append(QTUtil.getBundleString("employee.field.title")).append("\"/>");//add employee field
                    }
                    buffTemp.append("</item>");//end employees
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_ACCOUNT)) {
                    buffTemp.append("<item id=\"accounts\" complex=\"true\" text=\"").append(QTUtil.getBundleString("account.title")).append("\">");//start accounts
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_ACCOUNT)) {
                        buffTemp.append("<item id=\"accountlist\" text=\"").append(QTUtil.getBundleString("account.list.title")).append("\"/>");//list account
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_ACCOUNT)) {
                        buffTemp.append("<item id=\"accountadd\" text=\"").append(QTUtil.getBundleString("account.detail.add.title")).append("\"/>");//add account
                    }
                    buffTemp.append("</item>");//end accounts
                }
                buffTemp.append("</item>");//end organization
            }

            if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD,
                    PermissionUtil.PER_UNIT + "," + PermissionUtil.PER_SHELL_KIND + "," + PermissionUtil.PER_SHELL
                    + "," + PermissionUtil.PER_ACCESSORY + "," + PermissionUtil.PER_ACCESSORY_KIND + "," + PermissionUtil.PER_PROMOTION_MATERIAL)) {
                buffTemp.append("<item id=\"good\" complex=\"true\" text=\"").append(QTUtil.getBundleString("menu.admin.good.title")).append("\">");//start good
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_UNIT)) {
                    buffTemp.append("<item id=\"units\" complex=\"true\" text=\"").append(QTUtil.getBundleString("unit.title")).append("\">");//start units
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_UNIT)) {
                        buffTemp.append("<item id=\"unitlist\" text=\"").append(QTUtil.getBundleString("unit.list.title")).append("\"/>");//list unit
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_UNIT)) {
                        buffTemp.append("<item id=\"unitadd\" text=\"").append(QTUtil.getBundleString("unit.detail.add.title")).append("\"/>");//add unit
                    }
                    buffTemp.append("</item>");//end units
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_SHELL_KIND)) {
                    buffTemp.append("<item id=\"shellkinds\" complex=\"true\" text=\"").append(QTUtil.getBundleString("shellKind.title")).append("\">");//start shell kind
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_SHELL_KIND)) {
                        buffTemp.append("<item id=\"shellkindlist\" text=\"").append(QTUtil.getBundleString("shellKind.list.title")).append("\"/>");//list shell kind
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_SHELL_KIND)) {
                        buffTemp.append("<item id=\"shellkindadd\" text=\"").append(QTUtil.getBundleString("shellKind.detail.add.title")).append("\"/>");//add shell kind
                    }
                    buffTemp.append("</item>");//end shell kinds
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_SHELL)) {
                    buffTemp.append("<item id=\"shells\" complex=\"true\" text=\"").append(QTUtil.getBundleString("shell.title")).append("\">");//start shell
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_SHELL)) {
                        buffTemp.append("<item id=\"shelllist\" text=\"").append(QTUtil.getBundleString("shell.list.title")).append("\"/>");//list shell
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_SHELL)) {
                        buffTemp.append("<item id=\"shelladd\" text=\"").append(QTUtil.getBundleString("shell.detail.add.title")).append("\"/>");//add shell
                    }
                    buffTemp.append("</item>");//end shells
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_ACCESSORY_KIND)) {
                    buffTemp.append("<item id=\"accessorykinds\" complex=\"true\" text=\"").append(QTUtil.getBundleString("accessoryKind.title")).append("\">");//start accessory kind
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_ACCESSORY_KIND)) {
                        buffTemp.append("<item id=\"accessorykindlist\" text=\"").append(QTUtil.getBundleString("accessoryKind.list.title")).append("\"/>");//list accessory kind
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_ACCESSORY_KIND)) {
                        buffTemp.append("<item id=\"accessorykindadd\" text=\"").append(QTUtil.getBundleString("accessoryKind.detail.add.title")).append("\"/>");//add accessory kind
                    }
                    buffTemp.append("</item>");//end accessory kinds
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_ACCESSORY)) {
                    buffTemp.append("<item id=\"accessorys\" complex=\"true\" text=\"").append(QTUtil.getBundleString("accessory.title")).append("\">");//start accessory
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_ACCESSORY)) {
                        buffTemp.append("<item id=\"accessorylist\" text=\"").append(QTUtil.getBundleString("accessory.list.title")).append("\"/>");//list accessory
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_ACCESSORY)) {
                        buffTemp.append("<item id=\"accessoryadd\" text=\"").append(QTUtil.getBundleString("accessory.detail.add.title")).append("\"/>");//add accessory
                    }
                    buffTemp.append("</item>");//end accessorys
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_PROMOTION_MATERIAL)) {
                    buffTemp.append("<item id=\"promotionmaterials\" complex=\"true\" text=\"").append(QTUtil.getBundleString("promotionMaterial.title")).append("\">");//start promotionmaterial
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_PROMOTION_MATERIAL)) {
                        buffTemp.append("<item id=\"promotionmateriallist\" text=\"").append(QTUtil.getBundleString("promotionMaterial.list.title")).append("\"/>");//list promotionmaterial
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_PROMOTION_MATERIAL)) {
                        buffTemp.append("<item id=\"promotionmaterialadd\" text=\"").append(QTUtil.getBundleString("promotionMaterial.detail.add.title")).append("\"/>");//add promotionmaterial
                    }
                    buffTemp.append("</item>");//end promotionmaterials
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_PETRO)) {
                    buffTemp.append("<item id=\"petros\" complex=\"true\" text=\"").append(QTUtil.getBundleString("petro.title")).append("\">");//start petro
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_PETRO)) {
                        buffTemp.append("<item id=\"petrolist\" text=\"").append(QTUtil.getBundleString("petro.list.title")).append("\"/>");//list petro
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_PETRO)) {
                        buffTemp.append("<item id=\"petroadd\" text=\"").append(QTUtil.getBundleString("petro.detail.add.title")).append("\"/>");//add petro
                    }
                    buffTemp.append("</item>");//end petros
                }
                buffTemp.append("</item>");//end good
            }

            if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD,
                    PermissionUtil.PER_VENDOR)) {
                buffTemp.append("<item id=\"vendor\" complex=\"true\" text=\"").append(QTUtil.getBundleString("menu.admin.vendor.title")).append("\">");//start vendor
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_VENDOR)) {
                    buffTemp.append("<item id=\"vendors\" complex=\"true\" text=\"").append(QTUtil.getBundleString("vendor.title")).append("\">");//start vendors
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_VENDOR)) {
                        buffTemp.append("<item id=\"vendorlist\" text=\"").append(QTUtil.getBundleString("vendor.list.title")).append("\"/>");//list vendor
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_VENDOR)) {
                        buffTemp.append("<item id=\"vendoradd\" text=\"").append(QTUtil.getBundleString("vendor.detail.add.title")).append("\"/>");//add vendor
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_DYNAMIC_FIELD)) {
                        buffTemp.append("<item id=\"vendorfiellist\" text=\"").append(QTUtil.getBundleString("vendor.field.title")).append("\"/>");//add vendor field
                    }
                    buffTemp.append("</item>");//end vendors

                    buffTemp.append("<item id=\"vendororganizations\" complex=\"true\" text=\"").append(QTUtil.getBundleString("vendorOrganization.title")).append("\">");//start vendorOrganizations
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_VENDOR)) {
                        buffTemp.append("<item id=\"vendororganizationlist\" text=\"").append(QTUtil.getBundleString("vendorOrganization.list.title")).append("\"/>");//list vendor
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_VENDOR)) {
                        buffTemp.append("<item id=\"vendororganizationadd\" text=\"").append(QTUtil.getBundleString("vendorOrganization.detail.add.title")).append("\"/>");//add vendor
                    }
                    buffTemp.append("</item>");//end vendorOrganizations
                }
                buffTemp.append("</item>");//end vendor
            }

            if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD,
                    PermissionUtil.PER_CUSTOMER + "," + PermissionUtil.PER_CUSTOMER_DOCUMENT)) {
                buffTemp.append("<item id=\"customer\" complex=\"true\" text=\"").append(QTUtil.getBundleString("menu.admin.customer.title")).append("\">");//start customer
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_CUSTOMER)) {
                    buffTemp.append("<item id=\"customers\" complex=\"true\" text=\"").append(QTUtil.getBundleString("customer.title")).append("\">");//start customers
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_CUSTOMER)) {
                        buffTemp.append("<item id=\"customerlist\" text=\"").append(QTUtil.getBundleString("customer.list.title")).append("\"/>");//list customer
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_CUSTOMER)) {
                        buffTemp.append("<item id=\"customeradd\" text=\"").append(QTUtil.getBundleString("customer.detail.add.title")).append("\"/>");//add customer
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_DYNAMIC_FIELD)) {
                        buffTemp.append("<item id=\"customerfiellist\" text=\"").append(QTUtil.getBundleString("customer.field.title")).append("\"/>");//add customer field
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_CUSTOMER_DOCUMENT)) {
                        buffTemp.append("<item id=\"customerdocumentlist\" text=\"").append(QTUtil.getBundleString("customerDocument.list.title")).append("\"/>");//list customerDocument
                    }
                    buffTemp.append("</item>");//end customers
                }
                buffTemp.append("</item>");//end customer
            }

            if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_VEHICLE + "," + PermissionUtil.PER_ROUTE)) {
                buffTemp.append("<item id=\"vehicle\" complex=\"true\" text=\"").append(QTUtil.getBundleString("vehicle.title")).append("\">");//start vehicle
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_VEHICLE)) {
                    buffTemp.append("<item id=\"vehicles\" complex=\"true\" text=\"").append(QTUtil.getBundleString("vehicle.title")).append("\">");//start vehicles
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_VEHICLE)) {
                        buffTemp.append("<item id=\"vehiclelist\" text=\"").append(QTUtil.getBundleString("vehicle.list.title")).append("\"/>");//list vehicle
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_VEHICLE)) {
                        buffTemp.append("<item id=\"vehicleadd\" text=\"").append(QTUtil.getBundleString("vehicle.detail.add.title")).append("\"/>");//add vehicle
                    }
                    buffTemp.append("</item>");//end vehicles
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_ROUTE)) {
                    buffTemp.append("<item id=\"routes\" complex=\"true\" text=\"").append(QTUtil.getBundleString("route.title")).append("\">");//start routes
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_ROUTE)) {
                        buffTemp.append("<item id=\"routelist\" text=\"").append(QTUtil.getBundleString("route.list.title")).append("\"/>");//list route
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_ROUTE)) {
                        buffTemp.append("<item id=\"routeadd\" text=\"").append(QTUtil.getBundleString("route.detail.add.title")).append("\"/>");//add route
                    }
                    buffTemp.append("</item>");//end routes
                }
                buffTemp.append("</item>");//end vehicle
            }

            if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_FIXED_ASSET_GROUP + "," + PermissionUtil.PER_FIXED_ASSET)) {
                buffTemp.append("<item id=\"fixedassetgroup\" complex=\"true\" text=\"").append(QTUtil.getBundleString("fixedasset.title")).append("\">");//start fixedassetgroup
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_FIXED_ASSET_GROUP)) {
                    buffTemp.append("<item id=\"fixedassetgroups\" complex=\"true\" text=\"").append(QTUtil.getBundleString("fixedassetgroup.title")).append("\">");//start fixedassetgroups
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_FIXED_ASSET_GROUP)) {
                        buffTemp.append("<item id=\"fixedassetgrouplist\" text=\"").append(QTUtil.getBundleString("fixedassetgroup.list.title")).append("\"/>");//list fixedassetgroup
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_FIXED_ASSET_GROUP)) {
                        buffTemp.append("<item id=\"fixedassetgroupadd\" text=\"").append(QTUtil.getBundleString("fixedassetgroup.detail.add.title")).append("\"/>");//add fixedassetgroup
                    }
                    buffTemp.append("</item>");//end fixedassetgroups
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_FIXED_ASSET)) {
                    buffTemp.append("<item id=\"fixedassets\" complex=\"true\" text=\"").append(QTUtil.getBundleString("fixedasset.title")).append("\">");//start fixedassets
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_FIXED_ASSET)) {
                        buffTemp.append("<item id=\"fixedassetlist\" text=\"").append(QTUtil.getBundleString("fixedasset.list.title")).append("\"/>");//list fixedasset
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_FIXED_ASSET)) {
                        buffTemp.append("<item id=\"fixedassetadd\" text=\"").append(QTUtil.getBundleString("fixedasset.detail.add.title")).append("\"/>");//add fixedasset
                    }
                    buffTemp.append("</item>");//end fixedassets
                }
                buffTemp.append("</item>");//end fixedasset
            }

            if (buffTemp.length() > 0) {
                buff.append("<item id=\"list\" complex=\"true\" text=\"").append(QTUtil.getBundleString("menu.admin.list.title")).append("\">");//start list
                buff.append(buffTemp);
                buff.append("</item>");//end list
            }

            buffTemp = new StringBuilder();
            if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD,
                    PermissionUtil.PER_EMPLOYEE_ADVANCE + "," + PermissionUtil.PER_SALARY + "," + PermissionUtil.PER_EMPLOYEE_TIMESHEET
                    + "," + PermissionUtil.PER_EMPLOYEE_OFF + "," + PermissionUtil.PER_EMPLOYEE_OFF_INCREASE)) {
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_EMPLOYEE_ADVANCE)) {
                    buffTemp.append("<item id=\"employeeadvances\" complex=\"true\" text=\"").append(QTUtil.getBundleString("employeeAdvance.title")).append("\">");
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_EMPLOYEE_ADVANCE)) {
                        buffTemp.append("<item id=\"employeeadvancelist\" text=\"").append(QTUtil.getBundleString("employeeAdvance.list.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_EMPLOYEE_ADVANCE)) {
                        buffTemp.append("<item id=\"employeeadvanceadd\" text=\"").append(QTUtil.getBundleString("employeeAdvance.detail.add.title")).append("\"/>");
                    }
                    buffTemp.append("</item>");
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_EMPLOYEE_TIMESHEET)) {
                    buffTemp.append("<item id=\"employeetimesheets\" complex=\"true\" text=\"").append(QTUtil.getBundleString("employeeTimesheet.title")).append("\">");
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_EMPLOYEE_TIMESHEET)) {
                        buffTemp.append("<item id=\"employeetimesheetlist\" text=\"").append(QTUtil.getBundleString("employeeTimesheet.list.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_EMPLOYEE_TIMESHEET)) {
                        buffTemp.append("<item id=\"employeetimesheetadd\" text=\"").append(QTUtil.getBundleString("employeeTimesheet.detail.add.title")).append("\"/>");
                    }
                    buffTemp.append("</item>");
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_EMPLOYEE_OFF)) {
                    buffTemp.append("<item id=\"employeeoffs\" complex=\"true\" text=\"").append(QTUtil.getBundleString("employeeOff.title")).append("\">");
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_EMPLOYEE_OFF)) {
                        buffTemp.append("<item id=\"employeeofflist\" text=\"").append(QTUtil.getBundleString("employeeOff.list.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_EMPLOYEE_OFF)) {
                        buffTemp.append("<item id=\"employeeoffadd\" text=\"").append(QTUtil.getBundleString("employeeOff.detail.add.title")).append("\"/>");
                    }
                    buffTemp.append("</item>");
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_EMPLOYEE_OFF_INCREASE)) {
                    buffTemp.append("<item id=\"employeeoffincreases\" complex=\"true\" text=\"").append(QTUtil.getBundleString("employeeOffIncrease.title")).append("\">");
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_EMPLOYEE_OFF_INCREASE)) {
                        buffTemp.append("<item id=\"employeeoffincreaselist\" text=\"").append(QTUtil.getBundleString("employeeOffIncrease.list.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_EMPLOYEE_OFF_INCREASE)) {
                        buffTemp.append("<item id=\"employeeoffincreaseadd\" text=\"").append(QTUtil.getBundleString("employeeOffIncrease.detail.add.title")).append("\"/>");
                    }
                    buffTemp.append("</item>");
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_EMPLOYEE_OFF_MONEY)) {
                    buffTemp.append("<item id=\"employeeoffmoneys\" complex=\"true\" text=\"").append(QTUtil.getBundleString("employeeOffMoney.title")).append("\">");
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_EMPLOYEE_OFF_MONEY)) {
                        buffTemp.append("<item id=\"employeeoffmoneylist\" text=\"").append(QTUtil.getBundleString("employeeOffMoney.list.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_EMPLOYEE_OFF_MONEY)) {
                        buffTemp.append("<item id=\"employeeoffmoneyadd\" text=\"").append(QTUtil.getBundleString("employeeOffMoney.detail.add.title")).append("\"/>");
                    }
                    buffTemp.append("</item>");
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_SALARY)) {
                    buffTemp.append("<item id=\"salarys\" complex=\"true\" text=\"").append(QTUtil.getBundleString("salary.title")).append("\">");
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_SALARY)) {
                        buffTemp.append("<item id=\"salarylist\" text=\"").append(QTUtil.getBundleString("salary.list.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_DYNAMIC_FIELD)) {
                        buffTemp.append("<item id=\"salarysalaryfiels\" complex=\"true\" text=\"").append(QTUtil.getBundleString("field.title")).append("\">");
                        buffTemp.append("<item id=\"salaryfiellist\" text=\"").append(QTUtil.getBundleString("salary.field.title")).append("\"/>");//add salary field
                        buffTemp.append("<item id=\"timesheetfiellist\" text=\"").append(QTUtil.getBundleString("timesheet.field.title")).append("\"/>");//add time sheet field
                        buffTemp.append("</item>");

                        buffTemp.append("<item id=\"dynamicfielvalues\" complex=\"true\" text=\"").append(QTUtil.getBundleString("field.value.title")).append("\">");
                        buffTemp.append("<item id=\"employeesalarylist\" text=\"").append(QTUtil.getBundleString("salary.employee.list.title")).append("\"/>");
                        buffTemp.append("<item id=\"organizationtimesheetlist\" text=\"").append(QTUtil.getBundleString("timesheet.organization.list.title")).append("\"/>");
                        buffTemp.append("</item>");
                    }
                    buffTemp.append("</item>");
                }
            }
            if (buffTemp.length() > 0) {
                buff.append("<item id=\"employeefunction\" complex=\"true\" text=\"").append(QTUtil.getBundleString("menu.function.employee.title")).append("\">");//start function employee
                buff.append(buffTemp);
                buff.append("</item>");//end function employee
            }

            buffTemp = new StringBuilder();
            if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD,
                    PermissionUtil.PER_TRIP_FEE + "," + PermissionUtil.PER_VEHICLE_OUT + "," + PermissionUtil.PER_VEHICLE_IN + "," + PermissionUtil.PER_EXPORT_WHOLESALE)) {
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_TRIP_FEE)) {
                    buffTemp.append("<item id=\"tripfees\" complex=\"true\" text=\"").append(QTUtil.getBundleString("tripFee.title")).append("\">");
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_TRIP_FEE)) {
                        buffTemp.append("<item id=\"tripfeelist\" text=\"").append(QTUtil.getBundleString("tripFee.list.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_TRIP_FEE)) {
                        buffTemp.append("<item id=\"tripfeeadd\" text=\"").append(QTUtil.getBundleString("tripFee.detail.add.title")).append("\"/>");
                    }
                    buffTemp.append("</item>");
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_VEHICLE_OUT)) {
                    buffTemp.append("<item id=\"vehicleouts\" complex=\"true\" text=\"").append(QTUtil.getBundleString("vehicleOut.title")).append("\">");
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_VEHICLE_OUT)) {
                        buffTemp.append("<item id=\"vehicleoutlist\" text=\"").append(QTUtil.getBundleString("vehicleOut.list.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_VEHICLE_OUT)) {
                        buffTemp.append("<item id=\"vehicleoutadd\" text=\"").append(QTUtil.getBundleString("vehicleOut.detail.add.title")).append("\"/>");
                    }
                    buffTemp.append("</item>");
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_VEHICLE_IN)) {
                    buffTemp.append("<item id=\"vehicleins\" complex=\"true\" text=\"").append(QTUtil.getBundleString("vehicleIn.title")).append("\">");
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_VEHICLE_IN)) {
                        buffTemp.append("<item id=\"vehicleinlist\" text=\"").append(QTUtil.getBundleString("vehicleIn.list.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_VEHICLE_IN)) {
                        buffTemp.append("<item id=\"vehicleinadd\" text=\"").append(QTUtil.getBundleString("vehicleIn.detail.add.title")).append("\"/>");
                    }
                    buffTemp.append("</item>");
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_EXPORT_WHOLESALE)) {
                    buffTemp.append("<item id=\"exportwholesales\" complex=\"true\" text=\"").append(QTUtil.getBundleString("exportWholesale.title")).append("\">");
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_EXPORT_WHOLESALE)) {
                        buffTemp.append("<item id=\"exportwholesalelist\" text=\"").append(QTUtil.getBundleString("exportWholesale.list.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_EXPORT_WHOLESALE)) {
                        buffTemp.append("<item id=\"exportwholesaleadd\" text=\"").append(QTUtil.getBundleString("exportWholesale.detail.add.title")).append("\"/>");
                    }
                    buffTemp.append("</item>");
                }
            }
            if (buffTemp.length() > 0) {
                buff.append("<item id=\"vehiclefunction\" complex=\"true\" text=\"").append(QTUtil.getBundleString("menu.function.vehicle.title")).append("\">");//start function vehicle
                buff.append(buffTemp);
                buff.append("</item>");//end function vehicle
            }

            buffTemp = new StringBuilder();
            if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD,
                    PermissionUtil.PER_SHELL_IMPORT + "," + PermissionUtil.PER_LPG_IMPORT + "," + PermissionUtil.PER_FRACTION + "," + PermissionUtil.PER_GAS_PRICE
                    + "," + PermissionUtil.PER_GAS_IMPORT + "," + PermissionUtil.PER_GAS_RETAIL + "," + PermissionUtil.PER_GAS_WHOLESALE
                    + "," + PermissionUtil.PER_SALE_SHELL + "," + PermissionUtil.PER_SHELL_RETURN + "," + PermissionUtil.PER_GAS_RETURN
                    + "," + PermissionUtil.PER_SHELL_RETURN_SUPPLIER + "," + PermissionUtil.PER_LPG_SALE)) {
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_SHELL_IMPORT)) {
                    buffTemp.append("<item id=\"shellimports\" complex=\"true\" text=\"").append(QTUtil.getBundleString("shellImport.title")).append("\">");
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_SHELL_IMPORT)) {
                        buffTemp.append("<item id=\"shellimportlist\" text=\"").append(QTUtil.getBundleString("shellImport.list.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_SHELL_IMPORT)) {
                        buffTemp.append("<item id=\"shellimportadd\" text=\"").append(QTUtil.getBundleString("shellImport.detail.add.title")).append("\"/>");
                    }
                    buffTemp.append("</item>");
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_LPG_IMPORT)) {
                    buffTemp.append("<item id=\"lpgimports\" complex=\"true\" text=\"").append(QTUtil.getBundleString("lpgImport.title")).append("\">");
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_LPG_IMPORT)) {
                        buffTemp.append("<item id=\"lpgimportlist\" text=\"").append(QTUtil.getBundleString("lpgImport.list.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_LPG_IMPORT)) {
                        buffTemp.append("<item id=\"lpgimportadd\" text=\"").append(QTUtil.getBundleString("lpgImport.detail.add.title")).append("\"/>");
                    }
                    buffTemp.append("</item>");
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_LPG_SALE)) {
                    buffTemp.append("<item id=\"lpgsales\" complex=\"true\" text=\"").append(QTUtil.getBundleString("lpgSale.title")).append("\">");
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_LPG_SALE)) {
                        buffTemp.append("<item id=\"lpgsalelist\" text=\"").append(QTUtil.getBundleString("lpgSale.list.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_LPG_SALE)) {
                        buffTemp.append("<item id=\"lpgsaleadd\" text=\"").append(QTUtil.getBundleString("lpgSale.detail.add.title")).append("\"/>");
                    }
                    buffTemp.append("</item>");
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_FRACTION)) {
                    buffTemp.append("<item id=\"fractions\" complex=\"true\" text=\"").append(QTUtil.getBundleString("fraction.title")).append("\">");
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_FRACTION)) {
                        buffTemp.append("<item id=\"fractionlist\" text=\"").append(QTUtil.getBundleString("fraction.list.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_FRACTION)) {
                        buffTemp.append("<item id=\"fractionadd\" text=\"").append(QTUtil.getBundleString("fraction.detail.add.title")).append("\"/>");
                    }
                    buffTemp.append("</item>");
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_GAS_PRICE)) {
                    buffTemp.append("<item id=\"gasprices\" complex=\"true\" text=\"").append(QTUtil.getBundleString("gasPrice.title")).append("\">");
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_GAS_PRICE)) {
                        buffTemp.append("<item id=\"gaspricelist\" text=\"").append(QTUtil.getBundleString("gasPrice.list.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_GAS_PRICE)) {
                        buffTemp.append("<item id=\"gaspriceadd\" text=\"").append(QTUtil.getBundleString("gasPrice.detail.add.title")).append("\"/>");
                    }
                    buffTemp.append("</item>");
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_GAS_IMPORT)) {
                    buffTemp.append("<item id=\"gasimports\" complex=\"true\" text=\"").append(QTUtil.getBundleString("gasImport.title")).append("\">");
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_GAS_IMPORT)) {
                        buffTemp.append("<item id=\"gasimportlist\" text=\"").append(QTUtil.getBundleString("gasImport.list.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_GAS_IMPORT)) {
                        buffTemp.append("<item id=\"gasimportadd\" text=\"").append(QTUtil.getBundleString("gasImport.detail.add.title")).append("\"/>");
                    }
                    buffTemp.append("</item>");
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_GAS_WHOLESALE)) {
                    buffTemp.append("<item id=\"gaswholesales\" complex=\"true\" text=\"").append(QTUtil.getBundleString("gasWholesale.title")).append("\">");
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_GAS_WHOLESALE)) {
                        buffTemp.append("<item id=\"gaswholesalelist\" text=\"").append(QTUtil.getBundleString("gasWholesale.list.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_GAS_WHOLESALE)) {
                        buffTemp.append("<item id=\"gaswholesaleadd\" text=\"").append(QTUtil.getBundleString("gasWholesale.detail.add.title")).append("\"/>");
                    }
                    buffTemp.append("</item>");
                }
//                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_GAS_RETAIL)) {
//                    buffTemp.append("<item id=\"gasretails\" complex=\"true\" text=\"").append(QTUtil.getBundleString("gasRetail.title")).append("\">");
//                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_GAS_RETAIL)) {
//                        buffTemp.append("<item id=\"gasretaillist\" text=\"").append(QTUtil.getBundleString("gasRetail.list.title")).append("\"/>");
//                    }
//                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_GAS_RETAIL)) {
//                        buffTemp.append("<item id=\"gasretailadd\" text=\"").append(QTUtil.getBundleString("gasRetail.detail.add.title")).append("\"/>");
//                    }
//                    buffTemp.append("</item>");
//                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_SALE_SHELL)) {
                    buffTemp.append("<item id=\"saleshells\" complex=\"true\" text=\"").append(QTUtil.getBundleString("saleShell.title")).append("\">");
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_SALE_SHELL)) {
                        buffTemp.append("<item id=\"saleshelllist\" text=\"").append(QTUtil.getBundleString("saleShell.list.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_SALE_SHELL)) {
                        buffTemp.append("<item id=\"saleshelladd\" text=\"").append(QTUtil.getBundleString("saleShell.detail.add.title")).append("\"/>");
                    }
                    buffTemp.append("</item>");
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_OLD_SHELL)) {
                    buffTemp.append("<item id=\"oldshells\" complex=\"true\" text=\"").append(QTUtil.getBundleString("oldShell.title")).append("\">");
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_OLD_SHELL)) {
                        buffTemp.append("<item id=\"oldshelllist\" text=\"").append(QTUtil.getBundleString("oldShell.list.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_OLD_SHELL)) {
                        buffTemp.append("<item id=\"oldshelladd\" text=\"").append(QTUtil.getBundleString("oldShell.detail.add.title")).append("\"/>");
                    }
                    buffTemp.append("</item>");
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_SHELL_RETURN)) {
                    buffTemp.append("<item id=\"shellreturns\" complex=\"true\" text=\"").append(QTUtil.getBundleString("shellReturn.title")).append("\">");
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_SHELL_RETURN)) {
                        buffTemp.append("<item id=\"shellreturnlist\" text=\"").append(QTUtil.getBundleString("shellReturn.list.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_SHELL_RETURN)) {
                        buffTemp.append("<item id=\"shellreturnadd\" text=\"").append(QTUtil.getBundleString("shellReturn.detail.add.title")).append("\"/>");
                    }
                    buffTemp.append("</item>");
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_SHELL_RETURN_SUPPLIER)) {
                    buffTemp.append("<item id=\"shellreturnsuppliers\" complex=\"true\" text=\"").append(QTUtil.getBundleString("shellReturnSupplier.title")).append("\">");
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_SHELL_RETURN_SUPPLIER)) {
                        buffTemp.append("<item id=\"shellreturnsupplierlist\" text=\"").append(QTUtil.getBundleString("shellReturnSupplier.list.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_SHELL_RETURN_SUPPLIER)) {
                        buffTemp.append("<item id=\"shellreturnsupplieradd\" text=\"").append(QTUtil.getBundleString("shellReturnSupplier.detail.add.title")).append("\"/>");
                    }
                    buffTemp.append("</item>");
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_GAS_RETURN)) {
                    buffTemp.append("<item id=\"gasreturns\" complex=\"true\" text=\"").append(QTUtil.getBundleString("gasReturn.title")).append("\">");
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_GAS_RETURN)) {
                        buffTemp.append("<item id=\"gasreturnlist\" text=\"").append(QTUtil.getBundleString("gasReturn.list.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_GAS_RETURN)) {
                        buffTemp.append("<item id=\"gasreturnadd\" text=\"").append(QTUtil.getBundleString("gasReturn.detail.add.title")).append("\"/>");
                    }
                    buffTemp.append("</item>");
                }
            }
            if (buffTemp.length() > 0) {
                buff.append("<item id=\"gasfunction\" complex=\"true\" text=\"").append(QTUtil.getBundleString("menu.function.gas.title")).append("\">");//start function gas
                buff.append(buffTemp);
                buff.append("</item>");//end function gas
            }

            buffTemp = new StringBuilder();
            if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD,
                    PermissionUtil.PER_ACCESSORY_IMPORT + "," + PermissionUtil.PER_PROMOTION_MATERIAL_IMPORT + "," + PermissionUtil.PER_PETRO_IMPORT
                    + "," + PermissionUtil.PER_SALE_ACCESSORY + "," + PermissionUtil.PER_SALE_PETRO + "," + PermissionUtil.PER_FIXED_ASSET_DEPRECIATION)) {
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_ACCESSORY_IMPORT)) {
                    buffTemp.append("<item id=\"accessoryimports\" complex=\"true\" text=\"").append(QTUtil.getBundleString("accessoryImport.title")).append("\">");
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_ACCESSORY_IMPORT)) {
                        buffTemp.append("<item id=\"accessoryimportlist\" text=\"").append(QTUtil.getBundleString("accessoryImport.list.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_ACCESSORY_IMPORT)) {
                        buffTemp.append("<item id=\"accessoryimportadd\" text=\"").append(QTUtil.getBundleString("accessoryImport.detail.add.title")).append("\"/>");
                    }
                    buffTemp.append("</item>");
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_PROMOTION_MATERIAL_IMPORT)) {
                    buffTemp.append("<item id=\"promotionmaterialimports\" complex=\"true\" text=\"").append(QTUtil.getBundleString("promotionMaterialImport.title")).append("\">");
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_PROMOTION_MATERIAL_IMPORT)) {
                        buffTemp.append("<item id=\"promotionmaterialimportlist\" text=\"").append(QTUtil.getBundleString("promotionMaterialImport.list.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_PROMOTION_MATERIAL_IMPORT)) {
                        buffTemp.append("<item id=\"promotionmaterialimportadd\" text=\"").append(QTUtil.getBundleString("promotionMaterialImport.detail.add.title")).append("\"/>");
                    }
                    buffTemp.append("</item>");
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_PETRO_IMPORT)) {
                    buffTemp.append("<item id=\"petroimports\" complex=\"true\" text=\"").append(QTUtil.getBundleString("petroImport.title")).append("\">");
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_PETRO_IMPORT)) {
                        buffTemp.append("<item id=\"petroimportlist\" text=\"").append(QTUtil.getBundleString("petroImport.list.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_PETRO_IMPORT)) {
                        buffTemp.append("<item id=\"petroimportadd\" text=\"").append(QTUtil.getBundleString("petroImport.detail.add.title")).append("\"/>");
                    }
                    buffTemp.append("</item>");
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_SALE_ACCESSORY)) {
                    buffTemp.append("<item id=\"saleaccessorys\" complex=\"true\" text=\"").append(QTUtil.getBundleString("saleAccessory.title")).append("\">");
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_SALE_ACCESSORY)) {
                        buffTemp.append("<item id=\"saleaccessorylist\" text=\"").append(QTUtil.getBundleString("saleAccessory.list.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_SALE_ACCESSORY)) {
                        buffTemp.append("<item id=\"saleaccessoryadd\" text=\"").append(QTUtil.getBundleString("saleAccessory.detail.add.title")).append("\"/>");
                    }
                    buffTemp.append("</item>");
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_SALE_PETRO)) {
                    buffTemp.append("<item id=\"salepetros\" complex=\"true\" text=\"").append(QTUtil.getBundleString("salePetro.title")).append("\">");
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_SALE_PETRO)) {
                        buffTemp.append("<item id=\"salepetrolist\" text=\"").append(QTUtil.getBundleString("salePetro.list.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_SALE_PETRO)) {
                        buffTemp.append("<item id=\"salepetroadd\" text=\"").append(QTUtil.getBundleString("salePetro.detail.add.title")).append("\"/>");
                    }
                    buffTemp.append("</item>");
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_FIXED_ASSET_DEPRECIATION)) {
                    buffTemp.append("<item id=\"fixedassetdepreciations\" complex=\"true\" text=\"").append(QTUtil.getBundleString("fixedAssetDepreciation.title")).append("\">");
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_FIXED_ASSET_DEPRECIATION)) {
                        buffTemp.append("<item id=\"fixedassetdepreciationlist\" text=\"").append(QTUtil.getBundleString("fixedAssetDepreciation.list.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_FIXED_ASSET_DEPRECIATION)) {
                        buffTemp.append("<item id=\"fixedassetdepreciationadd\" text=\"").append(QTUtil.getBundleString("fixedAssetDepreciation.detail.add.title")).append("\"/>");
                    }
                    buffTemp.append("</item>");
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_SHIELD_IMPORT)) {
                    buffTemp.append("<item id=\"shieldimports\" complex=\"true\" text=\"").append(QTUtil.getBundleString("shieldImport.title")).append("\">");
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_SHIELD_IMPORT)) {
                        buffTemp.append("<item id=\"shieldimportlist\" text=\"").append(QTUtil.getBundleString("shieldImport.list.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_SHIELD_IMPORT)) {
                        buffTemp.append("<item id=\"shieldimportadd\" text=\"").append(QTUtil.getBundleString("shieldImport.detail.add.title")).append("\"/>");
                    }
                    buffTemp.append("</item>");
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_SHIELD_DECREASE)) {
                    buffTemp.append("<item id=\"shielddecreases\" complex=\"true\" text=\"").append(QTUtil.getBundleString("shieldDecrease.title")).append("\">");
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_SHIELD_DECREASE)) {
                        buffTemp.append("<item id=\"shielddecreaselist\" text=\"").append(QTUtil.getBundleString("shieldDecrease.list.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_SHIELD_DECREASE)) {
                        buffTemp.append("<item id=\"shielddecreaseadd\" text=\"").append(QTUtil.getBundleString("shieldDecrease.detail.add.title")).append("\"/>");
                    }
                    buffTemp.append("</item>");
                }
            }
            if (buffTemp.length() > 0) {
                buff.append("<item id=\"goodfunction\" complex=\"true\" text=\"").append(QTUtil.getBundleString("menu.function.good.title")).append("\">");//start function good
                buff.append(buffTemp);
                buff.append("</item>");//end function good
            }

            buffTemp = new StringBuilder();
            if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD,
                    PermissionUtil.PER_DEBT_VENDOR + "," + PermissionUtil.PER_DEBT_RETAIL + "," + PermissionUtil.PER_DEBT_WHOLESALE + "," + PermissionUtil.PER_INCOME
                    + "," + PermissionUtil.PER_CONTRACT)) {
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_CONTRACT)) {
                    buffTemp.append("<item id=\"contracts\" complex=\"true\" text=\"").append(QTUtil.getBundleString("contract.title")).append("\">");
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_CONTRACT)) {
                        buffTemp.append("<item id=\"contractlist\" text=\"").append(QTUtil.getBundleString("contract.list.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_CONTRACT)) {
                        buffTemp.append("<item id=\"contractadd\" text=\"").append(QTUtil.getBundleString("contract.detail.add.title")).append("\"/>");
                    }
                    buffTemp.append("</item>");
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_DEBT_VENDOR)) {
                    buffTemp.append("<item id=\"debtvendors\" complex=\"true\" text=\"").append(QTUtil.getBundleString("debtVendor.title")).append("\">");
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_DEBT_VENDOR)) {
                        buffTemp.append("<item id=\"debtvendorlist\" text=\"").append(QTUtil.getBundleString("debtVendor.list.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_DEBT_VENDOR)) {
                        buffTemp.append("<item id=\"debtvendoradd\" text=\"").append(QTUtil.getBundleString("debtVendor.detail.add.title")).append("\"/>");
                    }
                    buffTemp.append("</item>");
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_DEBT_RETAIL)) {
                    buffTemp.append("<item id=\"debtretails\" complex=\"true\" text=\"").append(QTUtil.getBundleString("debtRetail.title")).append("\">");
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_DEBT_RETAIL)) {
                        buffTemp.append("<item id=\"debtretaillist\" text=\"").append(QTUtil.getBundleString("debtRetail.list.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_DEBT_RETAIL)) {
                        buffTemp.append("<item id=\"debtretailadd\" text=\"").append(QTUtil.getBundleString("debtRetail.detail.add.title")).append("\"/>");
                    }
                    buffTemp.append("</item>");
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_DEBT_WHOLESALE)) {
                    buffTemp.append("<item id=\"debtwholesales\" complex=\"true\" text=\"").append(QTUtil.getBundleString("debtWholesale.title")).append("\">");
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_DEBT_WHOLESALE)) {
                        buffTemp.append("<item id=\"debtwholesalelist\" text=\"").append(QTUtil.getBundleString("debtWholesale.list.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_DEBT_WHOLESALE)) {
                        buffTemp.append("<item id=\"debtwholesaleadd\" text=\"").append(QTUtil.getBundleString("debtWholesale.detail.add.title")).append("\"/>");
                    }
                    buffTemp.append("</item>");
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_INCOME)) {
                    buffTemp.append("<item id=\"incomes\" complex=\"true\" text=\"").append(QTUtil.getBundleString("income.title")).append("\">");
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_INCOME)) {
                        buffTemp.append("<item id=\"incomelist\" text=\"").append(QTUtil.getBundleString("income.list.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_INCOME)) {
                        buffTemp.append("<item id=\"incomeadd\" text=\"").append(QTUtil.getBundleString("income.detail.add.title")).append("\"/>");
                    }
                    buffTemp.append("</item>");
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_EXPENSE)) {
                    buffTemp.append("<item id=\"expenses\" complex=\"true\" text=\"").append(QTUtil.getBundleString("expense.title")).append("\">");
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_EXPENSE)) {
                        buffTemp.append("<item id=\"expenselist\" text=\"").append(QTUtil.getBundleString("expense.list.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_EXPENSE)) {
                        buffTemp.append("<item id=\"expenseadd\" text=\"").append(QTUtil.getBundleString("expense.detail.add.title")).append("\"/>");
                    }
                    buffTemp.append("</item>");
                }
            }
            if (buffTemp.length() > 0) {
                buff.append("<item id=\"paymentfunction\" complex=\"true\" text=\"").append(QTUtil.getBundleString("menu.function.payment.title")).append("\">");//start function payment
                buff.append(buffTemp);
                buff.append("</item>");//end function payment
            }

            buffTemp = new StringBuilder();
            if (isHasPermission(PermissionUtil.OPERATION_LIST + "",
                    PermissionUtil.PER_REPORT_LPG_IMPORT + "," + PermissionUtil.PER_REPORT_LPG_STOCK)) {
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "", PermissionUtil.PER_REPORT_LPG_IMPORT + "," + PermissionUtil.PER_REPORT_LPG_STOCK
                        + "," + PermissionUtil.PER_REPORT_LPG_STOCK_SUM + "," + PermissionUtil.PER_REPORT_SUM + "," + PermissionUtil.PER_REPORT_COMPARE
                        + "," + PermissionUtil.PER_REPORT_SALE + "," + PermissionUtil.PER_REPORT_SALE_CUSTOMER + "," + PermissionUtil.PER_REPORT_LPG_STOCK_SUM_ORGANIZATION)) {
                    buffTemp.append("<item id=\"reportstock\" complex=\"true\" text=\"").append(QTUtil.getBundleString("report.stock.title")).append("\">");
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_REPORT_LPG_IMPORT)) {
                        buffTemp.append("<item id=\"reportlpgimport\" text=\"").append(QTUtil.getBundleString("report.lpgImport.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_REPORT_LPG_STOCK)) {
                        buffTemp.append("<item id=\"reportlpgstock\" text=\"").append(QTUtil.getBundleString("report.lpgStock.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_REPORT_LPG_STOCK_SUM)) {
                        buffTemp.append("<item id=\"reportlpgstocksum\" text=\"").append(QTUtil.getBundleString("report.lpgStockSum.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_REPORT_LPG_STOCK_SUM_ORGANIZATION)) {
                        buffTemp.append("<item id=\"reportlpgstocksumorganization\" text=\"").append(QTUtil.getBundleString("report.lpgStockSumOrganization.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_REPORT_SUM)) {
                        buffTemp.append("<item id=\"reportsum\" text=\"").append(QTUtil.getBundleString("report.sum.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_REPORT_COMPARE)) {
                        buffTemp.append("<item id=\"reportcompare\" text=\"").append(QTUtil.getBundleString("report.compare.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_REPORT_SALE)) {
                        buffTemp.append("<item id=\"reportsale\" text=\"").append(QTUtil.getBundleString("report.sale.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_REPORT_SALE_CUSTOMER)) {
                        buffTemp.append("<item id=\"reportsalecustomer\" text=\"").append(QTUtil.getBundleString("report.saleCustomer.title")).append("\"/>");
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_REPORT_CASH_BOOK)) {
                        buffTemp.append("<item id=\"reportcashbook\" text=\"").append(QTUtil.getBundleString("report.cashbook.title")).append("\"/>");
                    }
                    buffTemp.append("</item>");
                }
            }
            if (buffTemp.length() > 0) {
                buff.append("<item id=\"reportfunction\" complex=\"true\" text=\"").append(QTUtil.getBundleString("menu.function.report.title")).append("\">");//start report
                buff.append(buffTemp);
                buff.append("</item>");//end report
            }

            buff.append("<item id=\"setting\" complex=\"true\" text=\"").append(QTUtil.getBundleString("menu.admin.setting.title")).append("\">");//start setting
            buff.append("<item id=\"resetpassword\" text=\"").append(QTUtil.getBundleString("message.passwordform.title")).append("\"/>");//reset pasword
            buff.append("</item>");//end setting
            buff.append("<item id=\"logout\" text=\"").append(QTUtil.getBundleString("logout.title")).append("\"/>");//logout
            buff.append("</menu>");

            UserDAO userDAO = new UserDAO();
            userDAO.updateUserMenu(memberId, buff.toString());
        } catch (Exception ex) {
        }
    }

    private boolean isHasPermission(String operations, String functions) {
        try {
            ApplicationPermissionBean permission = null;
            String[] opes = operations.split(",");
            for (int i = 0; i < arrPer.size(); i++) {
                permission = (ApplicationPermissionBean) arrPer.get(i);
                for (int k = 0; k < opes.length; k++) {
                    if (permission.getOperation() == NumberUtil.parseInt(opes[k], 0)) {
                        String[] p = functions.split(",");
                        String func = "," + permission.getFunction() + ",";
                        for (int j = 0; j < p.length; j++) {
                            if (func.contains(',' + p[j] + ',')) {
                                return true;
                            }
                        }
                    }
                }

            }
        } catch (Exception ex) {
        }
        return false;
    }

    private boolean isHasPermission(int operation, int function) {
        ApplicationPermissionBean permission = null;
        for (int i = 0; i < arrPer.size(); i++) {
            permission = (ApplicationPermissionBean) arrPer.get(i);
            if (permission.getOperation() == operation) {
                String func = "," + permission.getFunction() + ",";
                if (func.contains("," + function + ",")) {
                    return true;
                }
            }
        }
        return false;
    }

    private boolean isHasPermission(String operations, int function) {
        ApplicationPermissionBean permission = null;
        String[] opes = operations.split(",");
        for (int i = 0; i < arrPer.size(); i++) {
            permission = (ApplicationPermissionBean) arrPer.get(i);
            for (int k = 0; k < opes.length; k++) {
                if (permission.getOperation() == NumberUtil.parseInt(opes[k], 0)) {
                    String func = "," + permission.getFunction() + ",";
                    if (func.contains("," + function + ",")) {
                        return true;
                    }
                }
            }

        }
        return false;
    }
}
