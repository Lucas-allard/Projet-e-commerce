<?php 

declare(strict_types=1);

namespace models;

use config\DataBase;

class Order extends DataBase 
{
  private $connexion;

  public function __construct()
  {
    $this -> connexion = $this -> getConnexion();
  }

  public function insertOrder($totalPrice,$id_user)
  {
    $query = $this -> connexion -> prepare('
                                            INSERT INTO orders (
                                              total_price,
                                              order_date,
                                              id_user)
                                            VALUE (
                                              ?,
                                              NOW(),
                                              ?
                                              )
                                            ');
    
    $test = $query -> execute([$totalPrice,$id_user]);
    
    return $test;
  }

  public function insertOrderDetail($id_product, $quantity_ordered)
  {
    $id_order = $this -> connexion -> lastInsertId();
    
    $query = $this -> connexion -> prepare('
                                          INSERT INTO orders_details (
                                            id_order,
                                            id_product,
                                            quantity_ordered)
                                          VALUE (
                                            ?,
                                            ?,
                                            ?
                                            )
                                            ');
    
    $test = $query -> execute([$id_order,$id_product, $quantity_ordered]);

    return $test;
  }

}