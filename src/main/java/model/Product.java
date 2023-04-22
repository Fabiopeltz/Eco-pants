package model;

public class Product {
	private int id;
	private String name;
	private float price;
	private String description;
	private String img;
	private int quantity;
	
	public Product() {
		super();
	}
	
	public Product(int id, String name, float price, String description, String img, int quantity) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.description = description;
		this.img = img;
		this.quantity = quantity;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
