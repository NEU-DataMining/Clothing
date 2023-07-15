package bean;

/**
 * Shop64372798 entity. @author MyEclipse Persistence Tools
 */

public class Shop64372798 implements java.io.Serializable {

	// Fields

	private String id;
	private String name;
	private String price;
	private String pic1;
	private String pic2;
	private String pic3;
	private String pic4;
	private String pic5;
	private String url;
	private String reviewcount;
	private String salesamount;
	private String description;
	private String texture;

	// Constructors

	/** default constructor */
	public Shop64372798() {
	}

	/** minimal constructor */
	public Shop64372798(String id) {
		this.id = id;
	}

	/** full constructor */
	public Shop64372798(String id, String name, String price, String pic1,
			String pic2, String pic3, String pic4, String pic5, String url,
			String reviewcount, String salesamount, String description,
			String texture) {
		this.id = id;
		this.name = name;
		this.price = price;
		this.pic1 = pic1;
		this.pic2 = pic2;
		this.pic3 = pic3;
		this.pic4 = pic4;
		this.pic5 = pic5;
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

	public String getPic1() {
		return this.pic1;
	}

	public void setPic1(String pic1) {
		this.pic1 = pic1;
	}

	public String getPic2() {
		return this.pic2;
	}

	public void setPic2(String pic2) {
		this.pic2 = pic2;
	}

	public String getPic3() {
		return this.pic3;
	}

	public void setPic3(String pic3) {
		this.pic3 = pic3;
	}

	public String getPic4() {
		return this.pic4;
	}

	public void setPic4(String pic4) {
		this.pic4 = pic4;
	}

	public String getPic5() {
		return this.pic5;
	}

	public void setPic5(String pic5) {
		this.pic5 = pic5;
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