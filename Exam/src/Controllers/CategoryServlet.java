package Controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import DAL.Contract;
import DAO.DAOBridge;
import Models.Products;

@WebServlet("/CategoryServlet")
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String CategoryVal = request.getParameter("cat");
		ArrayList<Products> products;
		JSONObject ob = new JSONObject();
		Contract c = DAOBridge.getDalObj();
		try {
			if (CategoryVal.equals("All")) {
				products = c.getProd();
			} else {
				products = c.getCatProd(CategoryVal);
			}
			ArrayList<ArrayList<String>> all = new ArrayList<>();
			for (Products it : products) {
				ArrayList<String> ls = new ArrayList<>();
				ls.add(it.getImgurl());
				ls.add(it.getProdname());
				ls.add(it.getPrice().toString());
				ls.add(String.valueOf(it.getPid()));
				all.add(ls);

			}

			ob.put("AllProducts", all);

		} catch (Exception e) {

			e.printStackTrace();
		}
		response.getWriter().write(ob.toString());
	}

}