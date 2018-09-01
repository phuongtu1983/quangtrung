/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.fixedassetdepreciation;

import com.stepup.gasoline.qt.bean.FixedAssetDepreciationBean;

/**
 *
 * @author phuongtu
 */
public class FixedAssetDepreciationFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String code;
    private String createdDate;
    private String note;
    private String[] fixedAssetDepreciationDetailId;
    private String[] fixedAssetId;
    private String[] isCheck;

    public FixedAssetDepreciationFormBean() {
    }

    public FixedAssetDepreciationFormBean(FixedAssetDepreciationBean bean) {
        this.id = bean.getId();
        this.code = bean.getCode();
        this.createdDate = bean.getCreatedDate();
        this.note = bean.getNote();
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String[] getFixedAssetDepreciationDetailId() {
        return fixedAssetDepreciationDetailId;
    }

    public void setFixedAssetDepreciationDetailId(String[] fixedAssetDepreciationDetailId) {
        this.fixedAssetDepreciationDetailId = fixedAssetDepreciationDetailId;
    }

    public String[] getFixedAssetId() {
        return fixedAssetId;
    }

    public void setFixedAssetId(String[] fixedAssetId) {
        this.fixedAssetId = fixedAssetId;
    }

    public String[] getIsCheck() {
        return isCheck;
    }

    public void setIsCheck(String[] isCheck) {
        this.isCheck = isCheck;
    }

}
