package model;
import javax.persistence.Entity;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.GenerationType;
@Entity
@Table(name="PRODUCT")
public class Product implements Comparable<Product> {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int product_id=0;
	@Column(name="name")
	private String name;
	@Column(name="image")
	private String image;
	@Column(name="price")
	private double price;
	@Column(name="description")
	private String description;
	@Column(name="category_id")
	private int category_id;
	public Product() {
	
	}
	
	public Product(int product_id, String name, String image, double price, String description, int category_id) {
		this.product_id = product_id;
		this.name = name;
		this.image = image;
		this.price = price;
		this.description = description;
		this.category_id = category_id;
	}

	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	@Override
	public int compareTo(Product p) {
	
		return this.product_id - p.product_id;
	}
	
	
}
