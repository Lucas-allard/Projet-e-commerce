<?php 

declare(strict_types=1);

namespace models;

use config\DataBase;

class Products extends DataBase 
{
  private $connexion;

  public function __construct()
  {
    $this -> connexion = $this -> getConnexion();
  }

  public function insertProduct($productName, $productDescription, $productAlt, $price, $imageSrc, $imageAlt) 
  {
    $test = [];

    $query = $this -> connexion -> prepare('
                                            INSERT INTO `products`(
                                              `product_name`,
                                              `product_description`,
                                              `product_alt`,
                                              `price`)
                                            VALUES(
                                              ?,
                                              ?,
                                              ?,
                                              ?)
                                            ');
    
    $test[]= $query -> execute([$productName, $productDescription, $productAlt, $price]);
    
    $id_product = $this -> connexion -> lastInsertId();

    // $query2 = $this -> connexion -> prepare('
    //                                           SELECT
    //                                           `id_product`
    //                                           FROM
    //                                               products
    //                                           ORDER BY
    //                                               id_product
    //                                           DESC
    //                                           LIMIT 1
    //                                           ');
    // $query2 -> execute();

    // $id_product = $query2 -> fetch();

    $query3 = $this -> connexion -> prepare('
                                            INSERT INTO `images`(
                                              `image_src`,
                                              `image_alt`,
                                              `id_product`
                                              )
                                            VALUES(
                                              ?,
                                              ?,
                                              ?
                                              )
                                            ');

    $test[] = $query3 -> execute ([$imageSrc, $imageAlt, $id_product]);

    var_dump($test);
    return $test;
  }

  public function getProducts(): ?array 
  {
    $query = $this -> connexion -> prepare('
                                            SELECT
                                              products.`id_product`,
                                              `product_name`,
                                              `product_alt`,
                                              `price`,
                                              `image_alt`,
                                              `image_src`
                                            FROM
                                              products
                                            INNER JOIN images ON products.id_product = images.id_product
                                            ');
    $query -> execute();

    $productsList = $query -> fetchAll();
   
    return $productsList;
  }
  
   public function getProductById($id_product) 
  {

    $query = $this -> connexion -> prepare('
                                            SELECT
                                              id_product,
                                              price
                                            FROM 
                                              products
                                            WHERE
                                              id_product = ?
                                          ');
  
    $query -> execute([$id_product]);
    $product = $query -> fetch();
  
    return $product;
  }
  
   public function getProductsSortByLowPrice()
  {
    $query = $this -> connexion -> prepare('
                                            SELECT
                                              products.`id_product`,
                                              `product_name`,
                                              `product_alt`,
                                              `price`,
                                              `image_alt`,
                                              `image_src`
                                            FROM
                                              products
                                            INNER JOIN images ON products.id_product = images.id_product
                                            ORDER BY price ASC
                                            ');
    $query -> execute();
    
    $productsList = $query -> fetchAll();
    
    return $productsList;
  } 
  
  public function getProductsSortByHighPrice()
  {
    $query = $this -> connexion -> prepare('
                                            SELECT
                                              products.`id_product`,
                                              `product_name`,
                                              `product_alt`,
                                              `price`,
                                              `image_alt`,
                                              `image_src`
                                            FROM
                                              products
                                            INNER JOIN images ON products.id_product = images.id_product
                                            ORDER BY price DESC
                                            ');
    $query -> execute();
    
    $productsList = $query -> fetchAll();
    
    return $productsList;
  }
  
   public function searchProduct($search)
  {
    $query = $this -> connexion -> prepare('
                          SELECT
                            products.`id_product`,
                            `product_name`,
                            `product_description`,
                            `product_alt`,
                            `price`,
                            `image_alt`,
                            `image_src`
                          FROM
                            products
                          INNER JOIN images ON products.id_product = images.id_product
                          WHERE `product_name` LIKE ?
                          ');
    $query -> execute(["%".$search."%"]);
    
    $searchResult = $query -> fetchAll();
    
    return $searchResult;
  }

  public function getProductDetails(): ?array
  {
    if (array_key_exists("id_product", $_GET) && is_numeric($_GET["id_product"])) {
      $id = $_GET["id_product"];
    }

    $query = $this -> connexion -> prepare('
                                            SELECT
                                              products.`id_product`,
                                              `product_name`,
                                              product_alt,
                                              `product_description`,
                                              `price`,
                                              image_src,
                                              image_alt
                                            FROM
                                              products
                                            INNER JOIN images ON products.id_product = images.id_product
                                            WHERE
                                              products.id_product = ?  
                                            ');
    $query -> execute(["$id"]);

    $productDetails = $query -> fetch();

    return $productDetails;
  }

  public function getDeliveryDate():string
  {
    $date = new \DateTime();
    $date->add(new \DateInterval('P7D')); 
    $deliveryDate = $date->format('d-m-Y'); 
    return $deliveryDate;
  } 
  
  public function getDeliveryPrice($id_product)
  {
    $query = $this -> connexion -> prepare('
                                            SELECT
                                              delivery_price
                                            FROM
                                              products
                                            ');
    $query -> execute();

    $deliveryPrice = $query -> fetch();
   
    return $deliveryPrice;
  }
}