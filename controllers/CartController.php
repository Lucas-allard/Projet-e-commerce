<?php 

declare(strict_types=1);

namespace controllers;

use models\Cart;
use models\Products;
use controllers\SecurityController;

class CartController extends SecurityController 
{
  private $cart;

  public function __construct()
  {
    $this -> cart = new Cart();
    $this -> product = new Products();
  }

public function getCart($id_product)
{
  if ($this -> isConnectUser()) {
      $template = "cart/cart";
    
      $ids = $this -> cart -> getCartSession();
    
      $cartList = $this -> cart -> displayCart($ids);
    
      $product = $this -> product -> getProductById($id_product);

      $totalPricePerProduct = $this -> cart -> getTotalPricePerProduct($product, $id_product);

      $totalProductsPrice = $this -> cart -> getProductsPrice($product, $id_product);
    
      $deliveryPrice = $this -> product -> getDeliveryPrice($id_product);
    
      $totalPrice = $this -> cart -> getTotalPrice($totalProductsPrice, $deliveryPrice);
      
      require 'views/layout.phtml';
  }
  else 
  {
    header('location:index.php?');
    exit();
  }
}

public function addCart($id_product)
  {  
    if ($this -> isConnectUser()) {
      $this -> product -> getProductById($id_product);
    
      $this -> cart -> addToCart($id_product);
    }
    else 
    {
      header('location:index.php?');
      exit();
    }
    
    header('location:index.php?action=get_cart&id_user='.$_SESSION["user"]["id_user"]);
  }

  public function removeCart($id_product)
  {
    if ($this -> isConnectUser()) {
      $this -> cart -> removeFromCart($id_product);

      header('location:index.php?action=get_cart&id_user='.$_SESSION['user']['id_user']);
    }
    else 
    {
      header('location:index.php?');
      exit();
    }
  }
   
  public function deleteCart($id_product)
  {
    if ($this -> isConnectUser()) {
      $this -> cart -> deleteFromCart($id_product);

      header('location:index.php?action=get_cart&id_user='.$_SESSION['user']['id_user']);
    }
    else 
    {
      header('location:index.php?');
      exit();
    }
  }


}