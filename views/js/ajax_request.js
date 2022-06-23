function onAjaxRequest() {
  let search = $("#search").val();
  if (search.length > 0) {
    $.get("index.php?action=products", "search=" + search, displayProducts);
    $("#products").addClass("hidden");
  } else {
    $("#search-result").empty();
    $("#products").removeClass("hidden");
  }
}

function onAjaxRequest2() {
  let idProduct = $("#product").val();
  $.getJSON(
    "index.php?admin=searchProduct",
    "product=" + idProduct,
    displayProduct
  );
}

function onAjaxRequest3() {
  let idArticle = $("#article").val();
  console.log(idArticle);
  $.getJSON(
    "index.php?admin=searchArticle",
    "article=" + idArticle,
    displayArticle
  );
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

function displayProduct(product) {
  $("#id_product").val(product[0]);
  $("#product_name").val(product[1]);
  $("#product_description").val(product[2]);
  $("#product_alt").val(product[3]);
  $("#price").val(product[4]);
  $("#actual_image_src").val(product[6]);
  $("#image_alt").val(product[5]);
}

function displayArticle(article) {
  console.log(article);
  $("#id_article").val(article[0]);
  $("#title").val(article[1]);
  $("#content").val(article[2]);
  $("#actual_image_src").val(article[3]);
  $("#image_alt").val(article[4]);
}

window.addEventListener("DOMContentLoaded", (event) => {
  $("#search").on("input", onAjaxRequest);
  $("#product").on("change", onAjaxRequest2);
  $("#article").on("change", onAjaxRequest3);
});
