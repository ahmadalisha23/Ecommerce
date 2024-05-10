package Models;

import java.util.Date;

public class OrderDetails {
	private int Orderid;
	private Date Odate;
	private double Ototal;
	private int custid;

	public OrderDetails(int a, Date b, double c, int d) {
		setOrderid(a);
		setOdate(b);
		setOtotal(c);
		setCustid(d);
	}

	public int getOrderid() {
		return Orderid;
	}

	public void setOrderid(int orderid) {
		Orderid = orderid;
	}

	public Date getOdate() {
		return Odate;
	}

	public void setOdate(Date odate) {
		Odate = odate;
	}

	public double getOtotal() {
		return Ototal;
	}

	public void setOtotal(double ototal) {
		Ototal = ototal;
	}

	public int getCustid() {
		return custid;
	}

	public void setCustid(int custid) {
		this.custid = custid;
	}

}