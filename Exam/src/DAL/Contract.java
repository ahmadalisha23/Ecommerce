package DAL;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import Models.CartProductDetails;
import Models.OrderDetails;
import Models.Products;

public interface Contract {
	ArrayList<Products> getProd() throws SQLException;

	ArrayList<String> getCat() throws SQLException;

	ArrayList<Products> getCatProd(String catVal) throws SQLException;

	ArrayList<CartProductDetails> getCartProd(HashMap<Integer, Integer> idqu) throws SQLException;

	OrderDetails createOrder(double totalPrice);

	void createOrderProducts(ArrayList<CartProductDetails> userProds, OrderDetails ord);
}