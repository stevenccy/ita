package cn.oocl.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

// model模型, Product 与  oracle的表对应, 对象对应oracle一条记录  

@Entity
@Table(name = "PRODUCT")
public class Product implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1490609714722518511L;

	// 在项目运行的时候,这些属性都在 JVM里面的 Product.class文件中

	// 1: 获取*.class文件中的所有信息(属性,方法)
	@Id
	@GeneratedValue(generator = "pro_Seq", strategy = GenerationType.AUTO)
	@SequenceGenerator(name = "pro_Seq",initialValue=1,allocationSize=1)
	private String id;

	private String name;

	private BigDecimal price;

	private String remark;

	@Column(name="pDate",insertable=false,updatable=false,columnDefinition="DATETIME")
	@Temporal(TemporalType.TIMESTAMP)
	private Date pdate;

	private String imgurl;
	// 所属的类别对象
	
	//JPA -- tell it its Product (many) --> Category (one)
	@ManyToOne
	@JoinColumn (name="cid")
	private Category category;

	public Date getPdate() {
		return pdate;
	}

	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", price=" + price + ", remark=" + remark + ", pDate=" + pdate
				+ category +"]";
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

	public String getImgurl() {
		return imgurl;
	}

	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}

}
