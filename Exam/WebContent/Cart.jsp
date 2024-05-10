<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
     body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #fffaea;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color:  #93c47d;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .container h3 {
            text-align: center;
            color: #333;
        }

        .cart-items {
            margin-top: 50px;
        }

        .item-card {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            padding: 15px;
            border-radius: 8px;
            background-color: #f9f9f9;
        }

        .item-image img {
            max-width: 100px;
            height: auto;
            margin-right: 20px;
        }

        .item-details {
            flex: 1;
        }

        .item-details h4 {
            margin: 0 0 10px 0;
            color: #333;
        }

        .item-details p {
            margin: 0;
            color: #666;
        }

        .quantity-controls {
            display: flex;
            align-items: center;
            margin-top: 10px;
        }

        .quantity-controls button {
            padding: 5px 10px;
            border: none;
            background-color: #ddd;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .quantity-controls button:hover {
            background-color: #ccc;
        }

        .quantity {
            margin: 0 10px;
            font-size: 18px;
            font-weight: bold;
            color: #333;
        }

        .checkout-btn {
            display: block;
            width: fit-content;
            padding: 15px;
            margin: 20px auto 0;
            border: none;
            background-color:#6fa8dc; 
            color: #fff;
            text-align: center;
            text-decoration: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .checkout-btn:hover {
            background-color: #0056b3;
        }

        @media (max-width: 600px) {
            .container {
                padding: 10px;
            }

            .item-image img {
                max-width: 80px;
            }
        }
        h3{
        	font-size:24px;
        }
        a{
        	font-weight:bold;
        	color:black;
        }
</style>
</head>
<body onload="loadCartItems()">
	<div class="container">
        <h3>Here are your Products!!!</h3>
        <div class="cart-items" id="cartItems">
           
        </div>
    </div>
    <div></div>
    <div><button class="checkout-btn"><a href="CheckOut.jsp">Proceed to CheckOut</a></button></div>
<script src="Cart.js"></script>
</body>

</html>