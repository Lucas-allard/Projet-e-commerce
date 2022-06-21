<?php

declare(strict_types=1);


namespace controllers;

use models\Order;
use models\Cart;
use models\Products;
use controllers\SecurityController;

class OrderController extends SecurityController
{
  private $order;

  public function __construct()
  {
    $this -> order = new Order();
    $this -> products = new Products();
  }

  public function validOrder() 
  {
    if ($this -> isConnectUser()) 
    {
      if(array_key_exists('total',$_GET))
      {
        $totalPrice = $_GET['total'];
        $id_user = $_SESSION['user']['id_user'];

        $test = $this -> order -> insertOrder($totalPrice,$id_user);

        foreach($_SESSION['user']['panier'] as $id_product => $quantity_ordered)
        {
          $this -> order -> insertOrderDetail($id_product, $quantity_ordered);
        }
        
        if($test) 
        {
          if(isset($_SESSION['user']['panier'])) 
          {
            foreach($_SESSION['user']['panier'] as $id_product => $quantity_ordered)
            {
              unset($_SESSION['user']['panier'][$id_product]);
            }
            
            $message = "Commande effectuée en attente de validation par le commerçant";
            header("location:index.php?message=" .$message);
            exit();
          }          
        }
      }
    }
  }
}