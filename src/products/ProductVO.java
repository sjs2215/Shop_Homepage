package products;

import java.util.Date;

public class ProductVO {

	private Integer product_id;
	private String product_name;
	private Integer product_price;
	private Integer product_stock;
	private String product_desc;
	private Date product_cre_date;
	
	public Integer getProduct_id() {
		return product_id;
	}
	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public Integer getProduct_price() {
		return product_price;
	}
	public void setProduct_price(Integer product_price) {
		this.product_price = product_price;
	}
	public Integer getProduct_stock() {
		return product_stock;
	}
	public void setProduct_stock(Integer product_stock) {
		this.product_stock = product_stock;
	}
	public String getProduct_desc() {
		return product_desc;
	}
	public void setProduct_desc(String product_desc) {
		this.product_desc = product_desc;
	}
	public Date getProduct_cre_date() {
		return product_cre_date;
	}
	public void setProduct_cre_date(Date product_cre_date) {
		this.product_cre_date = product_cre_date;
	}
	
}

