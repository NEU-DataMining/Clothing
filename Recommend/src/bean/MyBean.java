package bean;

import javax.persistence.Entity;

@Entity
public class MyBean {
    private int id;
    private String name;
    private float price;
    private String introduce;
    private String pic;
    private String url;
    
    
    
    public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id =id;
	}
	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price =price;
	}
	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	public String getpic() {
		return pic;
	}

	public void setpic(String pic) {
		this.pic = pic;
	}
	public String geturl() {
		return url;
	}

	public void seturl(String url) {
		this.url = url;
	}
	

}
