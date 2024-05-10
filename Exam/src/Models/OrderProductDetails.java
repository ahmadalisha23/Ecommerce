package Models;

public class OrderProductDetails extends CartProductDetails {
	int Orderid;
	int Productid = getPid();
	int quantity = getQuantity();
	double price = getPrice();

	public OrderProductDetails(int id, double amount, int tax, int quantity) {
		super(id, amount, tax, quantity);
	}

	public OrderProductDetails(int id) {
		super();
		Orderid = id;
	}
}