package products;

import java.util.Date;

public class ProductVO {

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
	public Date getProdcut_cre_date() {
		return prodcut_cre_date;
	}
	public void setProdcut_cre_date(Date prodcut_cre_date) {
		this.prodcut_cre_date = prodcut_cre_date;
	}
	private Integer product_id;
	private String product_name;
	private Integer product_price;
	private Integer product_stock;
	private String product_desc;
	private Date prodcut_cre_date;
	
}

