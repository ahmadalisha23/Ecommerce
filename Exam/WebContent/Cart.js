
    function loadCartItems() {
        $("#cartItems").empty();

        for (var i = 0; i < localStorage.length; i++) {
            var key = localStorage.key(i);
            var value = localStorage.getItem(key);
            var item = JSON.parse(value);
            var cardHtml = '<div class="item-card" id="ite">' +
                '<div class="item-image">' +
                '<img src="' + item.imageSrc + '" alt="' + item.itemName + '">' +
                '</div>' +
                '<div class="item-details">' +
                '<h4>' + item.itemName + '</h4>' +
                '<p>Description: ' + item.itemDescription + '</p>' +
                '<div class="quantity-controls">' +
                '<button class="minus-btn" onclick="decreaseQuantity(\'' + item.itemName + '\')">-</button>' +
                '<span class="quantity">' + item.quantity + '</span>' +
                '<button class="plus-btn" onclick="increaseQuantity(\'' + item.itemName + '\')">+</button>' +
                '</div>' +
                '</div>' +
                '</div>';

            $("#cartItems").append(cardHtml);
        }

        if ($("#cartItems").is(":empty")) {
            $("#cartItems").html("<p>Your cart is empty.</p>");
        }
    };

    function increaseQuantity(itemName) {
        var itemDataJSON = localStorage.getItem(itemName);
        if (itemDataJSON) {
            var itemData = JSON.parse(itemDataJSON);
            itemData.quantity++;
            localStorage.setItem(itemName, JSON.stringify(itemData));
            loadCartItems();
        }
    }

    function decreaseQuantity(itemName) {
        var itemDataJSON = localStorage.getItem(itemName);
        if (itemDataJSON) {
            var itemData = JSON.parse(itemDataJSON);
            if (itemData.quantity > 1) {
                itemData.quantity--;
                localStorage.setItem(itemName, JSON.stringify(itemData));
                loadCartItems();
            } else {
                localStorage.removeItem(itemName); 
                loadCartItems();
            }
        }
    }