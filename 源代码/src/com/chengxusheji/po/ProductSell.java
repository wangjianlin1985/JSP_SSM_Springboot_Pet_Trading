package com.chengxusheji.po;

import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotEmpty;
import org.json.JSONException;
import org.json.JSONObject;

public class ProductSell {
    /*出售id*/
    private Integer sellId;
    public Integer getSellId(){
        return sellId;
    }
    public void setSellId(Integer sellId){
        this.sellId = sellId;
    }

    /*宠物主图*/
    private String productPhoto;
    public String getProductPhoto() {
        return productPhoto;
    }
    public void setProductPhoto(String productPhoto) {
        this.productPhoto = productPhoto;
    }

    /*宠物名称*/
    @NotEmpty(message="宠物名称不能为空")
    private String productName;
    public String getProductName() {
        return productName;
    }
    public void setProductName(String productName) {
        this.productName = productName;
    }

    /*宠物类别*/
    private ProductClass productClassObj;
    public ProductClass getProductClassObj() {
        return productClassObj;
    }
    public void setProductClassObj(ProductClass productClassObj) {
        this.productClassObj = productClassObj;
    }

    /*交易地点*/
    @NotEmpty(message="交易地点不能为空")
    private String publish;
    public String getPublish() {
        return publish;
    }
    public void setPublish(String publish) {
        this.publish = publish;
    }

    /*宠物品种*/
    @NotEmpty(message="宠物品种不能为空")
    private String author;
    public String getAuthor() {
        return author;
    }
    public void setAuthor(String author) {
        this.author = author;
    }

    /*出售价格*/
    @NotNull(message="必须输入出售价格")
    private Float sellPrice;
    public Float getSellPrice() {
        return sellPrice;
    }
    public void setSellPrice(Float sellPrice) {
        this.sellPrice = sellPrice;
    }

    /*宠物年龄*/
    @NotEmpty(message="宠物年龄不能为空")
    private String xjcd;
    public String getXjcd() {
        return xjcd;
    }
    public void setXjcd(String xjcd) {
        this.xjcd = xjcd;
    }

    /*出售说明*/
    @NotEmpty(message="出售说明不能为空")
    private String sellDesc;
    public String getSellDesc() {
        return sellDesc;
    }
    public void setSellDesc(String sellDesc) {
        this.sellDesc = sellDesc;
    }

    /*发布用户*/
    private UserInfo userObj;
    public UserInfo getUserObj() {
        return userObj;
    }
    public void setUserObj(UserInfo userObj) {
        this.userObj = userObj;
    }

    /*用户发布时间*/
    private String addTime;
    public String getAddTime() {
        return addTime;
    }
    public void setAddTime(String addTime) {
        this.addTime = addTime;
    }

    public JSONObject getJsonObject() throws JSONException {
    	JSONObject jsonProductSell=new JSONObject(); 
		jsonProductSell.accumulate("sellId", this.getSellId());
		jsonProductSell.accumulate("productPhoto", this.getProductPhoto());
		jsonProductSell.accumulate("productName", this.getProductName());
		jsonProductSell.accumulate("productClassObj", this.getProductClassObj().getProductClassName());
		jsonProductSell.accumulate("productClassObjPri", this.getProductClassObj().getProductClassId());
		jsonProductSell.accumulate("publish", this.getPublish());
		jsonProductSell.accumulate("author", this.getAuthor());
		jsonProductSell.accumulate("sellPrice", this.getSellPrice());
		jsonProductSell.accumulate("xjcd", this.getXjcd());
		jsonProductSell.accumulate("sellDesc", this.getSellDesc());
		jsonProductSell.accumulate("userObj", this.getUserObj().getName());
		jsonProductSell.accumulate("userObjPri", this.getUserObj().getUser_name());
		jsonProductSell.accumulate("addTime", this.getAddTime());
		return jsonProductSell;
    }}