function onAjaxRequest() {
  let search = $("#search").val();
  if (search.length > 0) {
    console.log($.get("index.php?action=products", "search=" + search, displayProducts));
    $("#products").addClass("hidden");
  } else {
    $("#search-result").empty();
    $("#products").removeClass("hidden");
  }
}

function displayProducts(products) {
  products = JSON.parse(products);
  $("#search-result").empty();
  for (let i = 0; i < products.length; i++) {
    $("#search-result").append(`<div class="product-box">
                                  <a href="index.php?action=detailsProduct&id_product=${products[i][0]}">
                                    <img src="views/${products[i][6]}" alt="${products[i][5]}" />
                                    <div class="product-content">
                                      <div class="product-description">
                                        <h3>Camiseta</h3>
                                        <p>${products[i][1]}</p>
                                        <p><em>${products[i][3]}</em></p>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                      </div>
                                      <div class="product-price">
                                        <p>${products[i][4]} €</p>
                                        <i class="fas fa-shopping-basket"></i>
                                      </div>
                                    </div>
                                  </a>
                                </div>`);
  }
}

window.addEventListener("DOMContentLoaded", (event) => {
  $("#search").on("input", onAjaxRequest);
});
