<?php 

require 'connexion.php';

$query = $connexion -> prepare('
                                SELECT
                                  products.`id_product`,
                                  `product_name`,
                                  `product_alt`,
                                  `MSRP`,
                                  `image_alt`,
                                  `image_src`
                                FROM
                                  products
                                INNER JOIN images ON products.id_product = images.id_product
                                ');

$query -> execute();

$productsList = $query -> fetchAll();

$template = "catalogue";

require "layout.phtml";