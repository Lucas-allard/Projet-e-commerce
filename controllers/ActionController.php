<?php

declare(strict_types=1);

namespace controllers;

use models\Action;
use controllers\SecurityController;

class ActionController extends SecurityController
{
  private $like;
  private $dislike;

  public function __construct()
  {
    $this->action = new Action();
  }

  public function addLike()
  {
    if (isset($_GET['id_article']) && !empty($_GET['id_article'])) {
      $idArticle = $_GET['id_article'];

      $test = $this->action->insertLike($idArticle);

      if ($test) {
        header("location:index.php?action=details_article&id_article=" . $idArticle);
      }
    }
  }

  public function addDislike()
  {
    if (isset($_GET['id_article']) && !empty($_GET['id_article'])) {
      $idArticle = $_GET['id_article'];

      $test = $this->action->insertDislike($idArticle);

      if ($test) {
        header("location:index.php?action=details_article&id_article=" . $idArticle);
      }
    }
  }
}
