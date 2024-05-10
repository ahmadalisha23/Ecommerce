let a=5;


$(document).ready(function(){
        $.ajax({
            url: 'http://localhost:8080/Exam/AllProducts',
            method: 'GET',
            success: function(data) {
                $('#items').empty();
                data=JSON.parse(data);
                $.each(data.AllProducts, function(ind, ele) {
                    var item = '<div class="item-card" id="' + ele[3] + '">' +
                    '<img src="images/' + ele[0] + '" alt="Item">' +
                    '<h4>' + ele[1] + '</h4>' +
                    '<p>' + ele[2] + '</p>' +
                    '<button>Add to Cart</button>' +
                    '</div>';
                    $('#items').append(item);
                });
                $.each(data.Catigories, function(ind, ele1) {
                    var item1 = '<option value="'+(a++).toString()+'">'+ele1+'</option>';
                    $('#category').append(item1);
                });
            },
            error: function(xhr, status, error) {
                console.log("Error: " + error);
            }
 	       });
})

$(document).ready(function(){
    $('#category').change(function(){
        var selectedVal=$(this).val();
        $.ajax({
            url:"http://localhost:8080/Exam/CategoryServlet?cat="+selectedVal,
            method:'GET',
            success: function(data) {
                $('#items').empty();
                try {
                    data = JSON.parse(data);
                    $.each(data.AllProducts, function(ind, ele) {
                        var item = '<div class="item-card" id="' + ele[3] + '">' +
                                        '<img src="images/' + ele[0] + '" alt="Item">' +
                                        '<h4>' + ele[1] + '</h4>' +
                                        '<p>' + ele[2] + '</p>' +
                                        '<button>Add to Cart</button>' +
                                        '</div>';
                        $('#items').append(item);
                    });
                } catch (e) {
                    console.log("Error parsing JSON: " + e);
                }

            },
            error: function(xhr, status, error) {
                console.log("Error: " + error);
            }
        })
    })
})

$(document).ready(function() {
    $('#items').on('click', '.item-card button', function() {
        var itemCard = $(this).closest('.item-card');
        var imageSrc = itemCard.find('img').attr('src');
        var itemName = itemCard.find('h4').text();
        var itemDescription = itemCard.find('p').text();
        var itemId = itemCard.attr('id');
        console.log(itemId)
        var itemData = {
            itemId: itemId,
            imageSrc: imageSrc,
            itemName: itemName,
            itemDescription: itemDescription,
            quantity: 1 
        };

        var existingItemDataJSON = localStorage.getItem(itemName);
        if (existingItemDataJSON) {
            var existingItemData = JSON.parse(existingItemDataJSON);
            existingItemData.quantity++;
            itemData = existingItemData;
        }

        var itemDataJSON = JSON.stringify(itemData);

        localStorage.setItem(itemName, itemDataJSON);

        prompt("Please enter your PINCODE");
		alert("Item cannot be delivered to your area!!!!");
    });
});