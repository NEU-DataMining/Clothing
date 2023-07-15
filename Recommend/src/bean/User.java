package bean;

/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {

	// Fields

	private Integer id;
	private String userName;
	private String passWord;
	private String email;
	private Integer userTypeId;

	// Constructors

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(Integer id, String userName, String passWord, String email) {
		this.id = id;
		this.userName = userName;
		this.passWord = passWord;
		this.email = email;
	}

	/** full constructor */
	public User(Integer id, String userName, String passWord, String email,
			Integer userTypeId) {
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

}