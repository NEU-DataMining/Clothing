package bean;

/**
 * Subtype entity. @author MyEclipse Persistence Tools
 */

public class Subtype implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer superTypeId;
	private String typeName;

	// Constructors

	/** default constructor */
	public Subtype() {
	}

	/** minimal constructor */
	public Subtype(String typeName) {
		this.typeName = typeName;
	}

	/** full constructor */
	public Subtype(Integer superTypeId, String typeName) {
		this.superTypeId = superTypeId;
		this.typeName = typeName;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getSuperTypeId() {
		return this.superTypeId;
	}

	public void setSuperTypeId(Integer superTypeId) {
		this.superTypeId = superTypeId;
	}

	public String getTypeName() {
		return this.typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

}