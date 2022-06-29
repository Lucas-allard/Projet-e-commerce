<?php

declare(strict_types=1);

namespace models;

use config\DataBase;

class Order extends DataBase
{
  private $connexion;

  public function __construct()
  {
    $this->connexion = $this->getConnexion();
  }

  public function insertOrder($totalPrice, $id_user)
  {
    $query = $this->connexion->prepare('
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

    $test = $query->execute([$totalPrice, $id_user]);

    $id_order = $this->connexion->lastInsertId();
    return $id_order;
  }

  public function insertOrderDetail($id_order, $id_product, $quantity_ordered)
  {
    $query = $this->connexion->prepare('
                                        INSERT INTO orders_details (
                                          id_order,
                                          id_product,
                                          quantity)
                                        VALUE (
                                          ?,
                                          ?,
                                          ?
                                          )
                                            ');

    $test = $query->execute([$id_order, $id_product, $quantity_ordered]);

    return $test;
  }

  public function updateStatut($statut, $idOrder)
  {
    $query = $this->connexion->prepare('
                                      UPDATE
                                        `orders`
                                      SET
                                        `shipped_date` = NOW(),
                                        `statut` = ?
                                      WHERE
                                          `orders`.`id_order` = ?
                                        ');
    $test = $query->execute([$statut, $idOrder]);

    var_dump($test);
    return $test;
  }

  public function delOrder($idOrder)
  {
    $query = $this->connexion->prepare('
                                        DELETE
                                        FROM
                                            `orders`
                                        WHERE
                                            `orders`.`id_order` = ?
                                      ');
    $test = $query->execute([$idOrder]);

    return $test;
  }

  public function getOrders()
  {
    $query = $this->connexion->prepare('
                                      SELECT
                                        `id_order`,
                                        `total_price`,
                                        `order_date`,
                                        `shipped_date`,
                                        `statut`,
                                        orders.`id_user`,
                                        lastname,
                                        name
                                      FROM
                                        `orders`
                                      INNER JOIN users ON orders.id_user = users.id_user
                                      ORDER BY 
                                        id_order DESC
                                      ');
    $query->execute();
    $test = $query->fetchAll();

    return $test;
  }

  public function getOrderById($idOrder)
  {
    $query = $this->connexion->prepare('
                                        SELECT
                                          orders.`id_order`,
                                          `total_price`,
                                          `order_date`,
                                          `shipped_date`,
                                          `statut`,
                                          orders.`id_user`,
                                          lastname,
                                          name,
                                          product_name,
                                          quantity,
                                          price
                                        FROM
                                          orders
                                        INNER JOIN users ON orders.id_user = users.id_user
                                        INNER JOIN orders_details ON orders.id_order = orders_details.id_order
                                        INNER JOIN products ON orders_details.id_product = products.id_product
                                        WHERE
                                          orders.id_order = ?
                                        ');
    $query->execute([$idOrder]);

    $order = $query->fetchAll();

    return $order;
  }
}
