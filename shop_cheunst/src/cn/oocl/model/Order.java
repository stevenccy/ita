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
@Table(name="ORDERS")  // 對應的表名
public class Order implements Serializable {

	private static final long serialVersionUID = -2792665360763002611L;
	@Id
	@GeneratedValue(generator = "orderSeq",strategy=GenerationType.AUTO)
	@SequenceGenerator(name="orderSeq",initialValue = 1,allocationSize=1,sequenceName="order_seq")
	private String id;
	private BigDecimal total;
	private String address;
	private String name;
	private String phone;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	@OneToMany(cascade = CascadeType.PERSIST)  // 默認是支持級聯入庫的,需要自己配置
	@JoinColumn(name="oid")
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