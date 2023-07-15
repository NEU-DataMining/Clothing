package bean;

/**
 * RecordId entity. @author MyEclipse Persistence Tools
 */

public class RecordId implements java.io.Serializable {

	// Fields

	private Integer userId;
	private Integer goodsId;

	// Constructors

	/** default constructor */
	public RecordId() {
	}

	/** full constructor */
	public RecordId(Integer userId, Integer goodsId) {
		this.userId = userId;
		this.goodsId = goodsId;
	}

	// Property accessors

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getGoodsId() {
		return this.goodsId;
	}

	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof RecordId))
			return false;
		RecordId castOther = (RecordId) other;

		return ((this.getUserId() == castOther.getUserId()) || (this
				.getUserId() != null && castOther.getUserId() != null && this
				.getUserId().equals(castOther.getUserId())))
				&& ((this.getGoodsId() == castOther.getGoodsId()) || (this
						.getGoodsId() != null && castOther.getGoodsId() != null && this
						.getGoodsId().equals(castOther.getGoodsId())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getUserId() == null ? 0 : this.getUserId().hashCode());
		result = 37 * result
				+ (getGoodsId() == null ? 0 : this.getGoodsId().hashCode());
		return result;
	}

}