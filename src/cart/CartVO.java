package cart;

import java.util.Date;

public class CartVO {
	
	private Integer orderId; //auto-increment. PK
	private String product_id; //product���̺�. FK
	private String userName; //user���̺�. FK
	private Integer how_many; // order�� ����
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
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
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