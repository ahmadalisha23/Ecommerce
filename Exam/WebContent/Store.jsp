<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>E-Commerce</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f3f3f3;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .navbar {
            background-color: #232f3e;
            color: #ffffff;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .navbar h3 {
            margin: 0;
            font-size: 24px;
        }

        .navbar p {
            margin: 5px 0;
            font-size: 16px;
            color: #ffffff;
        }

        .filter {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
            align-items: center;
            background-color: #ffffff;
            padding: 10px 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .categories select {
            padding: 8px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ccc;
            background-color: #f9f9f9;
            color: #333;
            width: 100%;
            cursor: pointer;
            outline: none;
        }

        .items-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .item-card {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: calc(33.33% - 20px);
            text-align: center;
        }

        .item-card img {
            max-width: 100%;
            height: auto;
            margin-bottom: 20px;
        }

        .item-card h4 {
            font-size: 18px;
            margin-bottom: 10px;
        }

        .item-card p {
            font-size: 16px;
            margin-bottom: 10px;
            color: #888888;
        }

        .item-card button {
            background-color: #ff9900;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .item-card button:hover {
            background-color: #ff6600;
        }
    </style>
</head>
<body>
    <div class="container">
       <div class="navbar">
    <div class="title-wrapper">
        <h3>PennKart</h3>
        <p>An Online Shopping Platform</p>
    </div>
    <div><button type="button" class="btn btn-primary"><a href="Cart.jsp">Your Cart</a></button></div>
</div>
        <div class="filter">
    <div class="categories">
        <label for="category">Select Category:</label>
        <form action="AllProducts" method="get">
            <select id="category">
                <option value="All">All</option>
            </select>
        </form>
    </div>
    <div class="sort-by">
        <label for="sort">Sort By:</label>
        <select id="sort">
            <option value="price">Price</option>
            <option value="name">Name</option>
            <!-- Add more options if needed -->
        </select>
    </div>
</div>
        <div class="items-container" id="items">
        </div>
    </div>
    <script src="Store.js"></script>
</body>
</html>