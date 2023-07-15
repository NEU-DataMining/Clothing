package bean;

/**
 * Product entity. @author MyEclipse Persistence Tools
 */
public class Product extends AbstractProduct implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Product() {
	}

	/** minimal constructor */
	public Product(String id) {
		super(id);
	}

	/** full constructor */
	public Product(String id, String name, String price, String pic1,
			String pic2, String pic3, String pic4, String pic5, String url,
			String reviewcount, String salesamount, String description,
			String texture) {
		super(id, name, price, pic1, pic2, pic3, pic4, pic5, url, reviewcount,
				salesamount, description, texture);
	}

}
