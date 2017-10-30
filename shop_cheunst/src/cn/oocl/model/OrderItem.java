package cn.oocl.model;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

// 訂單項,存儲了購買商品的信息(訂單項并不是商品對象)

@Entity
@Table(name="orderItem")
public class OrderItem implements Serializable {

	private static final long serialVersionUID = 6669038488581154327L;

	@Id
	@GeneratedValue(generator = "orderitem_Seq", strategy = GenerationType.AUTO)
	@SequenceGenerator(name = "orderitem_Seq",initialValue=1,allocationSize=1)
	private String id;

	private Integer number;

	private String name;

	private BigDecimal price;
	// 當前購物項在沒有購買時就是一個商品
	private Product product;
	
	@ManyToOne
	@JoinColumn(name="oid")
	private Order order;
	
	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

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

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal bigDecimal) {
		this.price = bigDecimal;
	}

}