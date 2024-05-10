package Models;

public class Products {
	private String prodname;
	private String imgurl;
	private Double price;
	private int pid;

	public Products(String title, String url, Double cost, int id) {
		setProdname(title);
		setImgurl(url);
		setPrice(cost);
		setPid(id);
	}

	public String getImgurl() {
		return imgurl;
	}

	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}

	public String getProdname() {
		return prodname;
	}

	public void setProdname(String prodname) {
		this.prodname = prodname;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

}