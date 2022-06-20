<?php

declare(strict_types=1);


namespace controllers;

use models\Products;
use controllers\SecurityController;

class ProductsController extends SecurityController
{
  private $products;
  
  public function __construct()
  {
    $this -> products = new Products();
  }

  public function addProduct() 
  {
    var_dump($_POST);
    if (isset($_POST["product_name"]) && !empty($_POST["product_name"]) && isset($_POST["product_description"]) 
        && !empty($_POST["product_description"]) && isset($_POST["product_alt"]) && !empty($_POST["product_alt"]) 
        && isset($_POST["price"]) && !empty($_POST["price"]));
        {
          var_dump('coucou');
          $productName = $_POST["product_name"];
          $productName = htmlspecialchars($productName);
          $productDescription = $_POST["product_description"];
          $productDescription = htmlspecialchars($productDescription);
          $productAlt = $_POST["product_alt"];
          $productAlt = htmlspecialchars($productAlt);
          $price = $_POST["price"];
          $price = htmlspecialchars($price);
          $imageSrc = "img/products/".$_FILES["image_src"]["name"];
          $imageSrc = htmlspecialchars($imageSrc);
          var_dump($imageSrc);
          $imageAlt = $_POST["image_alt"];
          $imageAlt = htmlspecialchars($imageAlt);
          
          $test = $this -> products -> insertProduct($productName, $productDescription, $productAlt, $price, $imageSrc, $imageAlt);
          if($test)
          {
            $uploads_dir = 'views/images/product';
            if (!empty($_FILES['image_src']['name'])) { //si le nom de l'image n'est pas vide
              $tmp_name = $_FILES["image_src"]["tmp_name"];
              $imageSrc = $_FILES["image_src"]["name"];
              move_uploaded_file($tmp_name, "$uploads_dir/$imageSrc");
             }
            // importer l'image dans le dossier
            $message = " insert OK ";
            header('location:index.php?admin=login&add_product&message='.$message);
          }
        }   
  }

  public function products():void
  {
    $productsList = $this -> products -> getProducts();

    $template = 'products/products';

    require 'views/layout.phtml';
  }
  
  public function productsSortByHighPrice():void
  {
    $productsList = $this -> products -> getProductsSortByHighPrice();
    
    $template = 'products/productsSortByHighPrice';
    
    require 'views/layout.phtml';
  }
  
  public function productsSortByLowPrice():void
  {
    $productsList = $this -> products -> getProductsSortByLowPrice();
    
    $template = 'products/productsSortByLowPrice';
    
    require 'views/layout.phtml';
  }

  public function detailsProduct():void
  {
    $productDetails = $this -> products -> getProductDetails();
    $deliveryDate = $this -> products -> getDeliveryDate();

    $template = 'products/detailsProduct';

    require 'views/layout.phtml';
  }

  public function searchAjax($search)
  {
    $searchResult = $this -> products -> searchProduct($search);
    
    echo json_encode($searchResult);
  }
}


