package bean;

/**
 * Shop108678795 entity. @author MyEclipse Persistence Tools
 */

public class Shop108678795 implements java.io.Serializable {

	// Fields

	private String id;
	private String name;
	private String price;
	private String url;
	private String picture;
	private String salesAmount;
	private String reviewcount;
	private String texture;

	// Constructors

	/** default constructor */
	public Shop108678795() {
	}

	/** minimal constructor */
	public Shop108678795(String id) {
		this.id = id;
	}

	/** full constructor */
	public Shop108678795(String id, String name, String price, String url,
			String picture, String salesAmount, String reviewcount,
			String texture) {
		this.id = id;
		this.name = name;
		this.price = price;
		this.url = url;
		this.picture = picture;
		this.salesAmount = salesAmount;
		this.reviewcount = reviewcount;
		this.texture = texture;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPrice() {
		return this.price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getPicture() {
		return this.picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getSalesAmount() {
		return this.salesAmount;
	}

	public void setSalesAmount(String salesAmount) {
		this.salesAmount = salesAmount;
	}

	public String getReviewcount() {
		return this.reviewcount;
	}

	public void setReviewcount(String reviewcount) {
		this.reviewcount = reviewcount;
	}

	public String getTexture() {
		return this.texture;
	}

	public void setTexture(String texture) {
		this.texture = texture;
	}

}