<?php

declare(strict_types=1);

require "models/Products.php";

class ProductsController 
{
  private $products;

  public function __construct()
  {
    $this -> products = new Products();
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


