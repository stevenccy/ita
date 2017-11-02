package cn.oocl.model;

import java.io.Serializable;
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

import org.eclipse.persistence.jpa.config.Cascade;

@Entity
@Table(name="category")
public class Category implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6474792555237512942L;
	@OneToMany(cascade=CascadeType.PERSIST) // default can't insert cascade 
	@JoinColumn(name="cid")
	private List<Product> proList = new ArrayList<Product>();
	
	public List<Product> getProList() {
		return proList;
	}

	public void setProList(List<Product> proList) {
		this.proList = proList;
	}

	public Category() {
		super();
	}

	public Category(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	@Override
	public String toString() {
		return "Category [id=" + id + ", name=" + name + ", hot=" + hot + "]";
	}
	@Id
	@GeneratedValue(generator = "cat_Seq", strategy = GenerationType.AUTO)
	@SequenceGenerator(name = "cat_Seq",initialValue=1,allocationSize=1)
	private String id;
	private String name;
	
	private char hot;
	public char getHot() {
		return hot;
	}

	public void setHot(char hot) {
		this.hot = hot;
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

}
