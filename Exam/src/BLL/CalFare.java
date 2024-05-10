package BLL;

import java.util.ArrayList;

import Models.CartProductDetails;

public class CalFare {
	public double caluclateAmount(ArrayList<CartProductDetails> orderPros) {
		double total = 0;
		for (CartProductDetails prod : orderPros) {
			total += ((prod.getGst() / 100.0) * prod.getPrice()) + (prod.getPrice() * prod.getQuantity());
		}
		return total;
	}
}