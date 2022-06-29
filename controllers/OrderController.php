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
    $this->order = new Order();
    $this->products = new Products();
  }

  public function validOrder()
  {
    if ($this->isConnectUser()) {
      if (array_key_exists('total', $_GET)) {
        $totalPrice = $_GET['total'];
        $id_user = $_SESSION['user']['id_user'];

        $id_order = $this->order->insertOrder($totalPrice, $id_user);

        foreach ($_SESSION['user']['panier'] as $id_product => $quantity_ordered) {
          $test = $this->order->insertOrderDetail($id_order, $id_product, $quantity_ordered);
        }

        if ($test) {
          if (isset($_SESSION['user']['panier'])) {
            foreach ($_SESSION['user']['panier'] as $id_product => $quantity_ordered) {
              unset($_SESSION['user']['panier'][$id_product]);
            }

            $message = "Commande effectuée en attente de validation par le commerçant";
            header("location:index.php?message=" . $message);
            exit();
          }
        }
      }
    }
  }

  public function validOrderExpedition()
  {
    if ($this->isConnectAdmin()) {
      if (isset($_GET["id_order"]) && !empty($_GET['id_order'])) {
        $idOrder = $_GET['id_order'];
        $statut = "Commande expédié";

        $test = $this->order->updateStatut($statut, $idOrder);

        if ($test) {
          $message = 'update OK';

          header('location:index.php?admin=login&edit_order&message=' . $message);
          exit();
        }
      }
    }
  }

  public function deleteOrder()
  {
    if ($this->isConnectAdmin()) {
      if (isset($_GET['id_order']) && !empty($_GET['id_order'])) {
        $idOrder = $_GET['id_order'];

        $test = $this->order->delOrder($idOrder);

        if ($test) {
          $message = 'delete OK';

          header('location:index.php?admin=login&edit_order&message=' . $message);
          exit();
        }
      }
    }
  }

  public function displayOrder()
  {
    if (isset($_GET['id_order']) && !empty($_GET['id_order'])) {
      $idOrder = $_GET['id_order'];

      $orders = $this->order->getOrderById($idOrder);

      $template = "admin/detailOrder";

      require 'views/layout.phtml';
    }
  }

  public function searchOrder()
  {
    if (isset($_GET['order']) && !empty($_GET['order'])) {
      $idOrder = $_GET['order'];

      $order = $this->order->getOrderById($idOrder);

      echo json_encode($order);
    }
  }
}
