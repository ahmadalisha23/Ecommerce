package DAL;

import java.sql.Array;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;

import Models.CartProductDetails;
import Models.OrderDetails;
import Models.Products;

public class DalLayer implements Contract {
	Connection con = JDBCConn.getJDBCConn();

	public ArrayList<Products> getProd() throws SQLException {
		ArrayList<Products> al = new ArrayList<>();
		CallableStatement cs = con.prepareCall("{call getAllProd()}");
		ResultSet rs = cs.executeQuery();

		while (rs.next()) {
			Products p = new Products(rs.getString("pname"), rs.getString("image"), rs.getDouble("price"),
					rs.getInt("pid"));
			al.add(p);
		}

		rs.close();
		cs.close();
		return al;
	}

	public ArrayList<String> getCat() throws SQLException {
		ArrayList<String> al = new ArrayList<>();
		CallableStatement cs = con.prepareCall("{call getAllCat()}");
		ResultSet rs = cs.executeQuery();

		while (rs.next()) {
			al.add(rs.getString("catigory"));
		}

		rs.close();
		cs.close();
		return al;
	}

	public ArrayList<Products> getCatProd(String catVal) throws SQLException {
		int val = Integer.parseInt(catVal);
		ArrayList<Products> al = new ArrayList<>();
		CallableStatement cs = con.prepareCall("{call getAllProd(?)}");
		cs.setInt(1, val);
		ResultSet rs = cs.executeQuery();

		while (rs.next()) {
			Products p = new Products(rs.getString("pname"), rs.getString("image"), rs.getDouble("price"),
					rs.getInt("pid"));
			al.add(p);
		}

		rs.close();
		cs.close();
		return al;
	}

	public ArrayList<CartProductDetails> getCartProd(HashMap<Integer, Integer> idqu) throws SQLException {
		ArrayList<Integer> ids = new ArrayList<>();
		ArrayList<Integer> qu = new ArrayList<>();
		for (int i : idqu.keySet()) {
			ids.add(i);
			qu.add(idqu.get(i));
		}
		ArrayList<CartProductDetails> al = new ArrayList<>();
		CallableStatement cs = con.prepareCall("{call getCartProd(?)}");
		Array array = con.createArrayOf("Integer", ids.toArray(new Integer[0]));

		cs.setArray(1, array);

		ResultSet rs = cs.executeQuery();
		while (rs.next()) {
			int productId = rs.getInt("pid");
			int quantity = qu.get(ids.indexOf(productId)); // Retrieve quantity using productId
			CartProductDetails p = new CartProductDetails(productId, rs.getDouble("price"), rs.getInt("gst"), quantity);
			al.add(p);
		}
		return al;
	}

	public OrderDetails createOrder(double totalPrice) {

		OrderDetails ord = null;
		try {
			CallableStatement cs = con.prepareCall("{call createorder(?,?,?)}");
			cs.setDate(1, java.sql.Date.valueOf(LocalDate.now()));
			cs.setDouble(2, totalPrice);
			cs.setInt(3, 1234);
			ResultSet rst = cs.executeQuery();
			rst.next();
			ord = new OrderDetails(rst.getInt(1), rst.getDate(2), rst.getDouble(3), rst.getInt(4));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return ord;
	}

	public void createOrderProducts(ArrayList<CartProductDetails> userProds, OrderDetails ord) {
		try {
			CallableStatement cs = con.prepareCall("{call createOrderProduct(?,?,?,?)}");
			for (CartProductDetails ordprod : userProds) {
				cs.setInt(1, ord.getOrderid());
				cs.setInt(2, ordprod.getPid());
				cs.setInt(3, ordprod.getQuantity());
				cs.setDouble(4, ((ordprod.getGst() / 100.0) * ordprod.getPrice())
						+ (ordprod.getPrice() * ordprod.getQuantity()));
				cs.addBatch();
			}
			cs.executeBatch();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
