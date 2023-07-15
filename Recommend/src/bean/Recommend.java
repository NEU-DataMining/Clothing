package bean;

/**
 * Recommend entity. @author MyEclipse Persistence Tools
 */

public class Recommend implements java.io.Serializable {

	// Fields

	private Integer id;
	private double score;
	private float price;
	private Integer hit;
	private float satisfaction;
	private Integer degree;

	// Constructors

	/** default constructor */
	public Recommend() {
	}

	/** minimal constructor */
	public Recommend(Integer id) {
		this.id = id;
	}

	/** full constructor */
	public Recommend(Integer id, double score, float price, Integer hit,
			float satisfaction, Integer degree) {
		this.id = id;
		this.score = score;
		this.price = price;
		this.hit = hit;
		this.satisfaction = satisfaction;
		this.degree = degree;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public double getScore() {
		return this.score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public float getPrice() {
		return this.price;
	}

	public void setPrice(float price) {
		this.price = price;
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

	public Integer getDegree() {
		return this.degree;
	}

	public void setDegree(Integer degree) {
		this.degree = degree;
	}

}