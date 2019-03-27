function countPrice(productId, productPrice, productIdList) {
    var quantity = parseInt(document.getElementById(productId+"-quantity").value);
    var totalPrice = productPrice*quantity;
    var cartPrice = 0;

    document.getElementById(productId+"-price").innerHTML = totalPrice + "$";
    for (var i = 0; i < productIdList.length; i++) {
        var price = document.getElementById(productIdList[i]+"-price").innerHTML.replace('$','');
        cartPrice += parseFloat(price);
    }
    document.getElementById("cart-price").innerHTML = cartPrice + "$";
    document.getElementById("header-cart-price").innerHTML = cartPrice.toString();

    $.ajax({
        type: "post",
        url: "/cart",
        data: "productId=" + productId + "&quantity="+quantity,
        success: function(msg){
            //
        }
    });
}
