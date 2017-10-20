package cn.oocl.model;

import java.math.BigDecimal;
import java.util.Date;

// model模型, Product 与  oracle的表对应, 对象对应oracle一条记录  

public class Product {
	// 在项目运行的时候,这些属性都在 JVM里面的 Product.class文件中

	// 1: 获取*.class文件中的所有信息(属性,方法)
	private String id;
	
	private String name;

	private BigDecimal price;

	private String remark;

	private Date pdate;
	// 所属的类别对象
	private Category category;
	
	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", price=" + price + ", remark=" + remark + ", pDate=" + pdate
				+ ", category=" + category + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Date getpdate() {
		return pdate;
	}

	public void setpdate(Date pDate) {
		this.pdate = pDate;
	}

}
