package cn.oocl.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

// 購物車,當提交數據之後就是訂單,它與訂單項的關係是一對多
@Entity
@Table (name="order")
public class Order implements Serializable {

	private static final long serialVersionUID = -2792665360763002611L;
	// ID,總價格,送貨地址,聯繫電話
	@Id
	@GeneratedValue(generator = "order_Seq", strategy = GenerationType.AUTO)
	@SequenceGenerator(name = "order_Seq",initialValue=1,allocationSize=1)
	private String id;
	private String name;
	private BigDecimal total;
	private String address;
	private String phone;
	
	@OneToMany(cascade=CascadeType.PERSIST) // default can't insert cascade 
	@JoinColumn(name="oid")
	private List<OrderItem> itemList = new ArrayList<OrderItem>();

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	// 必須實例化,否則添加訂單項會拋出空異常

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

	public BigDecimal getTotal() {
		return total;
	}

	public void setTotal(BigDecimal total) {
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