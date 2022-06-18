<?php 

declare(strict_types=1);

namespace models;

use config\DataBase;

class Cart extends DataBase 
{
  private $connexion;

  public function __construct()
  {
    $this -> connexion = $this -> getConnexion();
  }

  public function getCartSession() 
  {
    if(isset($_SESSION['user']['panier']))
    {
      $ids = array_keys($_SESSION['user']['panier']);
      
      return $ids;
    }
    else
    {
      return [];
    }
  }
 
  public function addToCart($id_product) 
  {

    if(isset($_SESSION['user']['panier']))
    {
      if(isset($_SESSION['user']['panier'][$id_product]))
      {
        $_SESSION['user']['panier'][$id_product]++;
      } 
      else 
      {
        $_SESSION['user']['panier'][$id_product] = 1;
      }

      $ids = array_keys($_SESSION['user']['panier']);
      return $ids;
    }
    else
    {
      return [];
    }
  }

  public function removeFromCart($id_product) 
  {
    if(isset($_SESSION['user']['panier'])) 
    {
      if(isset($_SESSION['user']['panier'][$id_product]))
      {
        if($_SESSION['user']['panier'][$id_product] <= 1)
        {
          unset($_SESSION['user']['panier'][$id_product]);
        }
        else {
          $_SESSION['user']['panier'][$id_product]--;
        }        
      } 
    }
  }
  
  public function deleteFromCart($id_product)
  {
    unset($_SESSION['user']['panier'][$id_product]);
  }

  public function displayCart($ids) 
  {
    if (!empty($ids)) 
    {
      $query = $this -> connexion -> prepare('
                                            SELECT
                                              products.`id_product`,
                                              `product_name`,
                                              `product_alt`,
                                              product_description,
                                              `price`,
                                              `image_alt`,
                                              `image_src`
                                            FROM
                                              products
                                            INNER JOIN images ON products.id_product = images.id_product
                                            WHERE products.id_product IN ('.implode(",",$ids).')
                                            ');
      $query -> execute();
  
      $productsList = $query -> fetchAll();
  
      return $productsList;
    }
    else {
      return null;
    }
  }
  
  public function getTotalPricePerProduct($product,$id_product) 
  {
    $totalPricePerProduct = [];
    foreach ($_SESSION['user']['panier'] as $panier) {
      $quantity = $panier;
      $totalPricePerProduct[] = $quantity * $product['price'];
    }
    return $totalPricePerProduct;
  }
  
  public function getProductsPrice($product,$id_product) 
  {
    $totalProductsPrice = 0;
    foreach ($_SESSION['user']['panier'] as $panier) {
      $quantity = $panier;
      $totalProductsPrice += $quantity * $product['price'];
    }
    return $totalProductsPrice;
  }
  
  public function getTotalPrice($totalProductsPrice,$deliveryPrice) 
  {
    $totalPrice = $totalProductsPrice + $deliveryPrice['delivery_price'];
    return $totalPrice;
  }
}