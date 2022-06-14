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

  public function detailsProduct():void
  {
    $productDetails = $this -> products -> getProductDetails();
    $deliveryDate = $this -> products -> getDeliveryDate();

    $template = 'products/detailsProduct';

    require 'views/layout.phtml';
  }
}