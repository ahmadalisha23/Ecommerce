<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Details</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background-color: 	#cd5151;

    }
    .card {
        width: 100%;
        max-width: 1000px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        background-color: #ffffff;
        padding: 20px;
    }
    h2 {
        text-align: center;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    th, td {
        border: 1px solid #dddddd;
        padding: 8px;
    }
    th {
        background-color: #f2f2f2;
        text-align: left;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    tfoot {
        font-weight: bold;
    }
    tfoot td {
        background-color: #f2f2f2;
    }
    tfoot td:first-child {
        text-align: right;
    }
</style>
</head>
<body onload="loadOrderItems()">
    <div class="card">
        <h2>Order Details</h2>
        <table>
            <thead>
                <tr>
                    <th>Item Name</th>
                    <th>Quantity</th>
                    <th>MRP</th>
                    <th>GST</th>
                    <th>Shipping Cost</th>
                    <th>Shipping GST</th>
                    <th>Total Amount</th>
                </tr>
            </thead>
            <tbody id="orderItems">
                <tr>
                	<td>blackjean</td>
                	<td>1</td>
                	<td>999.0</td>
                	<td>153</td>
                	<td>200</td>
                	<td>36</td>
                	<td>1235</td>
                </tr>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="6"><strong>Order ID:</strong></td>
                    <td>order_O8KlNpafkohhIA<span id="orderId"></span></td>
                </tr>
                <tr>
                    <td colspan="6"><strong>Total Fare With GST:</strong></td>
                    <td>1235<span id="totalFare"></span></td>
                </tr>
            </tfoot>
        </table>
        <div><button id="rzp-button1" style="font-weight:bold;align-items:center;font-size:22px;margin-top:30px;margin-leftt:120px">Pay</button></div>
    </div>
    <script>
        function loadOrderItems() {
            let dl={};
            for (var i = 0; i < localStorage.length; i++) {
                var key = localStorage.key(i);
                var value = localStorage.getItem(key);
                var item = JSON.parse(value);
                dl[item.itemId]=item.quantity;
            }
            console.log(dl);
            $.ajax({
                url:"http://localhost:8080/Exam/CheckOutServlet",
                method:'GET',
                data:{
                    "product_details":JSON.stringify(dl)
                },
                success: function(data) {
                    console.log("success")
                },
                error: function(xhr, status, error) {
                    console.log("Error: " + error);
                }
            })
        }

    </script>
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script>
var options = {
    "key": "rzp_test_chqsdEBwXADpOi", 
    "amount": "123500", 
    "currency": "INR",
    "name": "Pennant Cart", 
    "description": "Test Transaction",
    "image": "PennantCartLogo.png",
    "order_id": "order_O8jREoOKig8Syq", 
    "handler": function (response){
        alert(response.razorpay_payment_id);
        alert(response.razorpay_order_id);
        alert(response.razorpay_signature)
    },
    "prefill": { 
        "name": "Ahamad Alisha", 
        "email": "ahmadalisha23092002@gmail.com", 
        "contact": "7981678443"
    },
    "notes": {
        "address": "Pennant Technologies Vizag"
    },
    "theme": {
        "color": "#8fce00"
    }
};
var rzp1 = new Razorpay(options);
rzp1.on('payment.failed', function (response){
        alert(response.error.code);
        alert(response.error.description);
        alert(response.error.source);
        alert(response.error.step);
        alert(response.error.reason);
        alert(response.error.metadata.order_id);
        alert(response.error.metadata.payment_id);
});
document.getElementById('rzp-button1').onclick = function(e){
    rzp1.open();
    e.preventDefault();
}
</script>
</body>
</html>