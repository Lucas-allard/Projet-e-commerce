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
  $.getJSON(
    "index.php?admin=searchArticle",
    "article=" + idArticle,
    displayArticle
  );
}

function onAjaxRequest4() {
  let search = $("#search_article").val();
  if (search.length > 0) {
    $.get("index.php?action=articles", "search=" + search, displayArticles);
    $("#articles").addClass("hidden");
  } else {
    $("#search_article_result").empty();
    $("#articles").removeClass("hidden");
  }
}

function onAjaxRequest5() {
  let idOrder = $("#orders").val();
  $.getJSON("index.php?admin=searchOrder", "order=" + idOrder, displayOrder);
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
  $("#id_article").val(article[0]);
  $("#title").val(article[1]);
  $("#content").val(article[3]);
  $("#actual_image_src").val(article[3]);
  $("#image_alt").val(article[4]);
}

function displayArticles(articles) {
  articles = JSON.parse(articles);
  $("#search_article_result").empty();
  for (let i = 0; i < articles.length; i++) {
    $("#search_article_result").append(`<div class="article-content">
                                          <h2>${articles[i].title}</h1>
                                            <p><em>Le ${
                                              articles[i].date_create
                                            }</em></p>
                                            <p>${articles[i].content.substring(
                                              0,
                                              255
                                            )} ...</p>
                                            <a href="index.php?action=details_article&id_article=${
                                              articles[i].id_article
                                            }"><button>En savoir plus</button></a>
                                        </div>`);
  }
}

function displayOrder(orders) {
  if ($("#orders").val() === "default") {
    $("#order-table").show();
  } else {
    $("#order-table").hide();
    $("#order-details").empty();
    $("#order-details").append(`
                                <div  class="order-details">
                                  <p><em>Commande N° ${orders[0]["id_order"]}</em></p>
                                  <ul>
                                    <li>Commande effectuée le ${orders[0]["order_date"]} par ${orders[0]["lastname"]} ${orders[0]["name"]}</li>
                                    <li>Statut : ${orders[0]["statut"]} <a href="index.php?admin=valid_order&id_order= ${orders[0]["id_order"]}"><button>Valider l'expédition de la commande</button></a> <a href="index.php?admin=delete_order&id_order= ${orders[0]["id_order"]}"><button>Supprimer la commande</button></a></li>
                                  </ul>
                                `);
  }
}

window.addEventListener("DOMContentLoaded", (event) => {
  $("#search").on("input", onAjaxRequest);
  $("#product").on("change", onAjaxRequest2);
  $("#article").on("change", onAjaxRequest3);
  $("#search_article").on("input", onAjaxRequest4);
  $("#orders").on("change", onAjaxRequest5);
});
