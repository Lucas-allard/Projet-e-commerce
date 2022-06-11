<?php 

require 'connexion.php';

if (array_key_exists("id_product", $_GET) && is_numeric($_GET["id_product"])) {
  $id = $_GET["id_product"];
}

// if (array_key_exists("id_product", $_GET) && is_numeric($_GET["id_product"])) {
//   $id = $_GET["id_product"];
// }

$query = $connexion -> prepare('
                                SELECT
                                  products.`id_product`,
                                  `product_name`,
                                  product_alt,
                                  `product_description`,
                                  `MSRP`,
                                  `TVA`,
                                  image_src,
                                  image_alt
                                FROM
                                  products
                                INNER JOIN images ON products.id_product = images.id_product
                                WHERE
                                  products.id_product = ?
                              ');

$query -> execute(["$id"]);

$product = $query -> fetch();

$date = new DateTime();
$date->add(new DateInterval('P7D')); 
$deliveryDate = $date->format('d-m-Y'); 

$template = "product";

require "layout.phtml";