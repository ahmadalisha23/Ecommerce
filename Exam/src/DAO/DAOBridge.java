package DAO;

import DAL.Contract;
import DAL.DalLayer;

public class DAOBridge {
	private static Contract cn = null;

	public static Contract getDalObj() {
		if (cn == null) {
			cn = new DalLayer();
		}
		return cn;
	}
}