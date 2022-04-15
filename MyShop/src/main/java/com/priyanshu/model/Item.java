package com.priyanshu.model;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Item  {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int productId;
	@Column(name="productName")
	private String model;
	@Column(name="paths")
	private String path;
	@Column(name="descriptions")
	private String desc;
	
	private int price;

	
	public Item(String model, String path, String desc, int price ) {
		super();
		this.model = model;
		this.path = path;
		this.desc = desc;
		this.price = price;
	}

	public Item() {
		super();
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	

	@Override
	public int hashCode() {
		return Objects.hash(productId, model);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Item other = (Item) obj;
		return Objects.equals(productId, other.productId) && Objects.equals(model, other.model);
	}

	@Override
	public String toString() {
		return "Item [model=" + model + ", path=" + path + ", desc=" + desc + ", price=" + price + "]";
	}

	
}
