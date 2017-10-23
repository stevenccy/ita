package cn.oocl.model;

import java.io.Serializable;

// 訂單項,存儲了購買商品的信息(訂單項并不是商品對象)
public class OrderItem implements Serializable {

	private static final long serialVersionUID = 6669038488581154327L;

	private String id;

	private Integer number;

	private String name;

	private Double price;
	// 當前購物項在沒有購買時就是一個商品
	private Product product;
	
	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

}