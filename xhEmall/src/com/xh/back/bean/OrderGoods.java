package com.xh.back.bean;


import java.io.Serializable;

public class OrderGoods implements Serializable {

    private int ogID;

    private int orderID;

    private int pID;
    
    private double orderPrice;

    private String goodsName;

    private int goodsNumber;

    private double marketPrice;

    private double goodsPrice;

    private int sendNumber;

    private int isReal;
    
    private Xhproduct product;
    
    private Xhorderinfo orderInfo;
    
    private long orderNumber;

	public long getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(long orderNumber) {
		this.orderNumber = orderNumber;
	}

	public Xhproduct getProduct() {
		return product;
	}

	public void setProduct(Xhproduct product) {
		this.product = product;
	}

	public Xhorderinfo getOrderInfo() {
		return orderInfo;
	}

	public void setOrderInfo(Xhorderinfo orderInfo) {
		this.orderInfo = orderInfo;
	}

	public int getOgID() {
		return ogID;
	}

	public void setOgID(int ogID) {
		this.ogID = ogID;
	}

	public int getOrderID() {
		return orderID;
	}

	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}

	public int getpID() {
		return pID;
	}

	public void setpID(int pID) {
		this.pID = pID;
	}		

	public double getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(double orderPrice) {
		this.orderPrice = orderPrice;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public int getGoodsNumber() {
		return goodsNumber;
	}

	public void setGoodsNumber(int goodsNumber) {
		this.goodsNumber = goodsNumber;
	}

	public double getMarketPrice() {
		return marketPrice;
	}

	public void setMarketPrice(double marketPrice) {
		this.marketPrice = marketPrice;
	}

	public double getGoodsPrice() {
		return goodsPrice;
	}

	public void setGoodsPrice(double goodsPrice) {
		this.goodsPrice = goodsPrice;
	}

	public int getSendNumber() {
		return sendNumber;
	}

	public void setSendNumber(int sendNumber) {
		this.sendNumber = sendNumber;
	}

	public int getIsReal() {
		return isReal;
	}

	public void setIsReal(int isReal) {
		this.isReal = isReal;
	}

	@Override
	public String toString() {
		return "OrderGoods [ogID=" + ogID + ", orderID=" + orderID + ", pID="
				+ pID + ", orderPrice=" + orderPrice + ", goodsName="
				+ goodsName + ", goodsNumber=" + goodsNumber + ", marketPrice="
				+ marketPrice + ", goodsPrice=" + goodsPrice + ", sendNumber="
				+ sendNumber + ", isReal=" + isReal + ", product=" + product
				+ ", orderInfo=" + orderInfo + ", orderNumber=" + orderNumber
				+ "]";
	}

	

}

    