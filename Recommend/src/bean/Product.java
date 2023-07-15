package bean;

/**
 * Product entity. @author MyEclipse Persistence Tools
 */

public class Product implements java.io.Serializable {

	// Fields

	private String id;
	private String shopid;
	private String name;
	private String price;
	private String pic;
	private String url;
	private String reviewcount;
	private String salesamount;
	private String description;
	private String texture;

	// Constructors

	/** default constructor */
	public Product() {
	}

	/** minimal constructor */
	public Product(String id) {
		this.id = id;
	}

	/** full constructor */
	public Product(String id, String shopid, String name, String price,
			String pic, String url, String reviewcount, String salesamount,
			String description, String texture) {
		this.id = id;
		this.shopid = shopid;
		this.name = name;
		this.price = price;
		this.pic = pic;
		this.url = url;
		this.reviewcount = reviewcount;
		this.salesamount = salesamount;
		this.description = description;
		this.texture = texture;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getShopid() {
		return this.shopid;
	}

	public void setShopid(String shopid) {
		this.shopid = shopid;
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

	public String getPic() {
		return this.pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getReviewcount() {
		return this.reviewcount;
	}

	public void setReviewcount(String reviewcount) {
		this.reviewcount = reviewcount;
	}

	public String getSalesamount() {
		return this.salesamount;
	}

	public void setSalesamount(String salesamount) {
		this.salesamount = salesamount;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTexture() {
		return this.texture;
	}

	public void setTexture(String texture) {
		this.texture = texture;
	}

}