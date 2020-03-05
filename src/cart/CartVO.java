package cart;

import java.util.Date;

public class CartVO {
	
	private Integer orderId; //auto-increment. PK
	private String product_id; //product테이블. FK -> product_price 참조 가능.
	private String userId; //user테이블. FK
	private Integer how_many; // order할 수량
	private Date order_Credate; //sysdate. timestamp
	
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public Integer getHow_many() {
		return how_many;
	}
	public void setHow_many(Integer how_many) {
		this.how_many = how_many;
	}
	public Date getOrder_Credate() {
		return order_Credate;
	}
	public void setOrder_Credate(Date order_Credate) {
		this.order_Credate = order_Credate;
	}
	
}