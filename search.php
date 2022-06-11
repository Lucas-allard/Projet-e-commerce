<?php 
// Connexion a la BDD
require 'connexion.php';
// Verification que la récuperation de l'input
if (array_key_exists("search", $_GET)) {
  $search = $_GET["search"];
}
// Requete 
$query = $connexion -> prepare('
                                SELECT
                                  products.`id_product`,
                                  `product_name`,
                                  `product_description`,
                                  `product_alt`,
                                  `MSRP`,
                                  `image_alt`,
                                  `image_src`
                                FROM
                                  products
                                INNER JOIN images ON products.id_product = images.id_product
                                WHERE `product_name` LIKE ?
                              ');

$query -> execute(["%".$search."%"]);

$searchProduct = $query -> fetchAll();

echo json_encode($searchProduct);
