package bean;

/**
 * AbstractUserId entity provides the base persistence definition of the UserId
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractUserId implements java.io.Serializable {

	// Fields

	private Integer id;
	private String userName;
	private String passWord;
	private String email;
	private Integer userTypeId;

	// Constructors

	/** default constructor */
	public AbstractUserId() {
	}

	/** minimal constructor */
	public AbstractUserId(Integer id, String userName, String passWord,
			String email) {
		this.id = id;
		this.userName = userName;
		this.passWord = passWord;
		this.email = email;
	}

	/** full constructor */
	public AbstractUserId(Integer id, String userName, String passWord,
			String email, Integer userTypeId) {
		this.id = id;
		this.userName = userName;
		this.passWord = passWord;
		this.email = email;
		this.userTypeId = userTypeId;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassWord() {
		return this.passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getUserTypeId() {
		return this.userTypeId;
	}

	public void setUserTypeId(Integer userTypeId) {
		this.userTypeId = userTypeId;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof AbstractUserId))
			return false;
		AbstractUserId castOther = (AbstractUserId) other;

		return ((this.getId() == castOther.getId()) || (this.getId() != null
				&& castOther.getId() != null && this.getId().equals(
				castOther.getId())))
				&& ((this.getUserName() == castOther.getUserName()) || (this
						.getUserName() != null
						&& castOther.getUserName() != null && this
						.getUserName().equals(castOther.getUserName())))
				&& ((this.getPassWord() == castOther.getPassWord()) || (this
						.getPassWord() != null
						&& castOther.getPassWord() != null && this
						.getPassWord().equals(castOther.getPassWord())))
				&& ((this.getEmail() == castOther.getEmail()) || (this
						.getEmail() != null && castOther.getEmail() != null && this
						.getEmail().equals(castOther.getEmail())))
				&& ((this.getUserTypeId() == castOther.getUserTypeId()) || (this
						.getUserTypeId() != null
						&& castOther.getUserTypeId() != null && this
						.getUserTypeId().equals(castOther.getUserTypeId())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + (getId() == null ? 0 : this.getId().hashCode());
		result = 37 * result
				+ (getUserName() == null ? 0 : this.getUserName().hashCode());
		result = 37 * result
				+ (getPassWord() == null ? 0 : this.getPassWord().hashCode());
		result = 37 * result
				+ (getEmail() == null ? 0 : this.getEmail().hashCode());
		result = 37
				* result
				+ (getUserTypeId() == null ? 0 : this.getUserTypeId()
						.hashCode());
		return result;
	}

}