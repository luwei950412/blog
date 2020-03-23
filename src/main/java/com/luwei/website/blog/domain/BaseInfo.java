package com.luwei.website.blog.domain;

import javax.persistence.MappedSuperclass;
import java.io.Serializable;
import java.util.Date;


@MappedSuperclass
public class BaseInfo implements Serializable {

    private Date createDate;

    private Date modifyDate;

    private Integer deleteFlag=0;

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    public Integer getDeleteFlag() {
        return deleteFlag;
    }

    public void setDeleteFlag(Integer deleteFlag) {
        this.deleteFlag = deleteFlag;
    }
}
