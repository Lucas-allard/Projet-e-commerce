<?php 

declare(strict_types=1);

class Products extends DataBase 
{
  private $connexion;

  public function __construct()
  {
    $this -> connexion = $this -> getConnexion();
  }

  public function getProducts(): ?array 
  {
    $query = $this -> connexion -> prepare('
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
   
    return $productsList;
  }
  
   public function getProductsSortByLowPrice()
  {
    $query = $this -> connexion -> prepare('
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
                                            ORDER BY MSRP ASC
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
                                              `MSRP`,
                                              `image_alt`,
                                              `image_src`
                                            FROM
                                              products
                                            INNER JOIN images ON products.id_product = images.id_product
                                            ORDER BY MSRP DESC
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
                            `MSRP`,
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

    $productDetails = $query -> fetch();

    return $productDetails;
  }

  public function getDeliveryDate():string
  {
    $date = new DateTime();
    $date->add(new DateInterval('P7D')); 
    $deliveryDate = $date->format('d-m-Y'); 
    return $deliveryDate;
  }

 
}