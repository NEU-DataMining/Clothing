package bean;

import java.util.Date;

/**
 * Record entity. @author MyEclipse Persistence Tools
 */

public class Record implements java.io.Serializable {

	// Fields

	private RecordId id;
	private Date time;

	// Constructors

	/** default constructor */
	public Record() {
	}

	/** minimal constructor */
	public Record(RecordId id) {
		this.id = id;
	}

	/** full constructor */
	public Record(RecordId id, Date time) {
		this.id = id;
		this.time = time;
	}

	// Property accessors

	public RecordId getId() {
		return this.id;
	}

	public void setId(RecordId id) {
		this.id = id;
	}

	public Date getTime() {
		return this.time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

}