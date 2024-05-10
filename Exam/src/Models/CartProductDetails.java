package Models;

public class CartProductDetails {
	private int pid;
	private double price;
	private int gst;
	private int quantity;

	public CartProductDetails(int id, double amount, int tax, int quantity) {
		setPid(id);
		setPrice(amount);
		setGst(tax);
		this.quantity = quantity;
	}

	public CartProductDetails() {
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getGst() {
		return gst;
	}

	public void setGst(int gst) {
		this.gst = gst;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}