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

  public function searchProduct(): ?array
  {
    if (array_key_exists("search", $_GET)) {
      $search = $_GET["search"];
    }

    $query = $this -> prepare('
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
  }
}