package bean;

/**
 * Goods entity. @author MyEclipse Persistence Tools
 */

public class Goods implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer typeId;
	private String brand;
	private String goodsName;
	private String introduce;
	private float price;
	private String picture;
	private String feature;
	private Integer hit;
	private float satisfaction;
	private String keywords;
	private String url;
	private String feature2;
	private Integer texture;

	// Constructors

	/** default constructor */
	public Goods() {
	}

	/** minimal constructor */
	public Goods(Integer typeId, String picture, String feature, Integer hit) {
		this.typeId = typeId;
		this.picture = picture;
		this.feature = feature;
		this.hit = hit;
	}

	/** full constructor */
	public Goods(Integer typeId, String brand, String goodsName,
			String introduce, float price, String picture, String feature,
			Integer hit, float satisfaction, String keywords, String url,
			String feature2, Integer texture) {
		this.typeId = typeId;
		this.brand = brand;
		this.goodsName = goodsName;
		this.introduce = introduce;
		this.price = price;
		this.picture = picture;
		this.feature = feature;
		this.hit = hit;
		this.satisfaction = satisfaction;
		this.keywords = keywords;
		this.url = url;
		this.feature2 = feature2;
		this.texture = texture;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getTypeId() {
		return this.typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public String getBrand() {
		return this.brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getGoodsName() {
		return this.goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public String getIntroduce() {
		return this.introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public float getPrice() {
		return this.price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getPicture() {
		return this.picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getFeature() {
		return this.feature;
	}

	public void setFeature(String feature) {
		this.feature = feature;
	}

	public Integer getHit() {
		return this.hit;
	}

	public void setHit(Integer hit) {
		this.hit = hit;
	}

	public float getSatisfaction() {
		return this.satisfaction;
	}

	public void setSatisfaction(float satisfaction) {
		this.satisfaction = satisfaction;
	}

	public String getKeywords() {
		return this.keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getFeature2() {
		return this.feature2;
	}

	public void setFeature2(String feature2) {
		this.feature2 = feature2;
	}

	public Integer getTexture() {
		return this.texture;
	}

	public void setTexture(Integer texture) {
		this.texture = texture;
	}

}