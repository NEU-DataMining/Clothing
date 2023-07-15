package bean;

/**
 * Supertype entity. @author MyEclipse Persistence Tools
 */

public class Supertype implements java.io.Serializable {

	// Fields

	private Integer id;
	private String typeName;

	// Constructors

	/** default constructor */
	public Supertype() {
	}

	/** full constructor */
	public Supertype(String typeName) {
		this.typeName = typeName;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTypeName() {
		return this.typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

}