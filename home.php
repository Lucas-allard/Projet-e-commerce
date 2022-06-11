<?php 

require 'connexion.php';

$query1 = $connexion -> prepare('
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
                                WHERE
                                  image_src LIKE "%f%";
                                ');

$query1 -> execute();

$sliderItems1 = $query1 -> fetchAll();

$query2 = $connexion -> prepare('
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
                                WHERE
                                  image_src LIKE "%n%";
                                ');

$query2 -> execute();

$sliderItems2 = $query2 -> fetchAll();

$template = "home";

require "layout.phtml";
