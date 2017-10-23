package cn.oocl.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

// 購物車,當提交數據之後就是訂單,它與訂單項的關係是一對多
public class Order implements Serializable {

	private static final long serialVersionUID = -2792665360763002611L;
	// ID,總價格,送貨地址,聯繫電話
	private String id;
	private Double total;
	private String address;
	private String phone;
	// 必須實例化,否則添加訂單項會拋出空異常
	private List<OrderItem> itemList = new ArrayList<OrderItem>();
	
	public List<OrderItem> getItemList() {
		return itemList;
	}

	public void setItemList(List<OrderItem> itemList) {
		this.itemList = itemList;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

}