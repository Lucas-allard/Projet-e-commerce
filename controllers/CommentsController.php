<?php

declare(strict_types=1);

namespace controllers;

use models\Comments;
use controllers\SecurityController;

class CommentsController extends SecurityController
{
  private $comments;

  public function __construct()
  {
    $this->comments = new Comments();
  }

  public function addComment()
  {
    if (
      isset($_POST['last_name']) &&
      !empty($_POST['last_name']) &&
      isset($_POST['name']) &&
      !empty($_POST['name']) &&
      isset($_POST['content']) &&
      !empty($_POST['content']) &&
      isset($_POST['id_article'])
    ) {
      $lastName = htmlspecialchars($_POST['last_name']);
      $name = htmlspecialchars($_POST['name']);
      $content = htmlspecialchars($_POST['content']);
      $idArticle = htmlspecialchars($_POST['id_article']);

      $test = $this->comments->insertComment($lastName, $name, $content, $idArticle);

      if ($test) {
        $message = 'ajout du commentaire OK';

        header('location:index.php?action=details_article&id_article=' . $idArticle . '&message=' . $message);
        exit();
      }
    }
  }

  public function editComment()
  {

    if ($this->isConnectAdmin()) {
      if (
        isset($_POST['id_comment']) &&
        !empty($_POST['id_comment']) &&
        isset($_POST['last_name']) &&
        !empty($_POST['last_name']) &&
        isset($_POST['name']) &&
        !empty($_POST['name']) &&
        isset($_POST['content']) &&
        !empty($_POST['content'])
      ) {
        $idComment = $_POST['id_comment'];
        $lastName = htmlspecialchars($_POST['last_name']);
        $name = htmlspecialchars($_POST['name']);
        $content = htmlspecialchars($_POST['content']);

        $test = $this->comments->updateComment($lastName, $name, $content, $idComment);

        if ($test) {
          $message = 'update du commentaire OK';

          header('location:index.php?admin=login&edit_comment&message=' . $message);
          exit();
        }
      }
    }
  }

  public function deleteComment()
  {
    if ($this->isConnectAdmin()) {
      if (isset($_GET['id_comment']) && !empty($_GET['id_comment'])) {
        $idComment = $_GET['id_comment'];

        $test = $this->comments->delComment($idComment);

        if ($test) {
          $message = 'ajout du commentaire OK';

          header('location:index.php?admin=login&delete_comment&message=' . $message);
          exit();
        }
      }
    }
  }

  public function displayComment()
  {
    if (isset($_GET['id_comment']) && !empty($_GET['id_comment'])) {
      $idComment = $_GET['id_comment'];

      $comment = $this->comments->getCommentById($idComment);

      $template = 'admin/editCommentDetail';

      require 'views/layout.phtml';
    }
  }
}
