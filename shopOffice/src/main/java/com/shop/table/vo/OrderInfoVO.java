package com.shop.table.vo;

public class OrderInfoVO extends BaseVO{
	
	private String orderNo;				//주문번호	
	private String userId;				//회원ID
	private String orderGoodsName;		//주문상품명
	private String orderPrice;			//주문금액
	private String orderStatus;			//주문상태
	private String orderDt;				//주문일
	private String receiveName;			//수취인명
	private String zipcd;				//배송지우편번호
	private String addr;				//배송지주소
	private String addtDtl;				//배송지상세주소
	private String memo;				//메모
	private String regDt;				//등록일
	
	private String buyQty;              //구매수량

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getOrderGoodsName() {
		return orderGoodsName;
	}

	public void setOrderGoodsName(String orderGoodsName) {
		this.orderGoodsName = orderGoodsName;
	}

	public String getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(String orderPrice) {
		this.orderPrice = orderPrice;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getOrderDt() {
		return orderDt;
	}

	public void setOrderDt(String orderDt) {
		this.orderDt = orderDt;
	}

	public String getReceiveName() {
		return receiveName;
	}

	public void setReceiveName(String receiveName) {
		this.receiveName = receiveName;
	}

	public String getZipcd() {
		return zipcd;
	}

	public void setZipcd(String zipcd) {
		this.zipcd = zipcd;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getAddtDtl() {
		return addtDtl;
	}

	public void setAddtDtl(String addtDtl) {
		this.addtDtl = addtDtl;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getRegDt() {
		return regDt;
	}

	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}

	public String getBuyQty() {
		return buyQty;
	}

	public void setBuyQty(String buyQty) {
		this.buyQty = buyQty;
	}
	
	
	
	
	
	
		
}
