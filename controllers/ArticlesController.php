<?php

declare(strict_types=1);

namespace controllers;

use models\Articles;
use models\Comments;
use controllers\SecurityController;

class ArticlesController extends SecurityController
{
    private $articles;

    public function __construct()
    {
        $this->articles = new Articles();
        $this->comments = new Comments();
    }

    public function addArticle()
    {
        if ($this->isConnectAdmin()) {
            if (
                isset($_POST['article_title']) &&
                !empty($_POST['article_title']) &&
                isset($_POST['article_content']) &&
                !empty($_POST['article_content']) &&
                isset($_POST['image_alt']) &&
                !empty($_POST['image_alt'])
            ) {
                $title = $_POST['article_title'];
                $title = htmlspecialchars($title);
                $content = $_POST['article_content'];
                $content = htmlspecialchars($content);
                $imageSrc = 'img/blog/' . $_FILES['image_src']['name'];
                $imageSrc = htmlspecialchars($imageSrc);
                $imageAlt = $_POST['image_alt'];
                $imageAlt = htmlspecialchars($imageAlt);

                $test = $this->articles->insertArticle(
                    $title,
                    $content,
                    $imageSrc,
                    $imageAlt
                );

                if ($test) {
                    $uploads_dir = 'views/img/blog/';
                    if (!empty($_FILES['image_src']['name'])) {
                        //si le nom de l'image n'est pas vide
                        $tmp_name = $_FILES['image_src']['tmp_name'];
                        $imageSrc = $_FILES['image_src']['name'];
                        move_uploaded_file($tmp_name, "$uploads_dir/$imageSrc");
                    }

                    $message = 'ajout article OK';
                    header(
                        'location:index.php?admin=login&add_article&message=' .
                            $message
                    );
                    exit();
                }
            }
        }
    }

    public function editArticle()
    {
        if ($this->isConnectAdmin()) {
            if (
                isset($_POST['article_title']) &&
                !empty($_POST['article_title']) &&
                isset($_POST['article_content']) &&
                !empty($_POST['article_content']) &&
                isset($_POST['image_alt']) &&
                !empty($_POST['image_alt'])
            ) {
                $idArticle = $_POST['id_article'];
                $idArticle = htmlspecialchars($idArticle);
                $title = $_POST['article_title'];
                $title = htmlspecialchars($title);
                $content = $_POST['article_content'];
                $content = htmlspecialchars($content);
                $imageAlt = $_POST['image_alt'];
                $imageAlt = htmlspecialchars($imageAlt);

                $imageSrc = 'img/blog/' . $_POST['actual_image_src'];
                if (!empty($_FILES['image_src']['name'])) {
                    $uploads_dir = 'views/img/blog';
                    unlink('views/' . $_POST['actual_image_src']);
                    $tmp_name = $_FILES['image_src']['tmp_name'];
                    $newImageSrc = $_FILES['image_src']['name'];
                    move_uploaded_file($tmp_name, "$uploads_dir/$newImageSrc");
                    $newImageSrc = 'img/blog/' . $_FILES['image_src']['name'];
                } else {
                    $newImageSrc = $imageSrc;
                }

                $newImageSrc = htmlspecialchars($newImageSrc);

                $test = $this->articles->updateArticle(
                    $idArticle,
                    $title,
                    $content,
                    $newImageSrc,
                    $imageAlt
                );

                if ($test) {
                    $message = 'update OK';
                    header(
                        'location:index.php?admin=login&edit_article&message=' .
                            $message
                    );
                    exit();
                }
            }
        }
    }

    public function deleteArticle()
    {
        if ($this->isConnectAdmin()) {
            if (isset($_GET['id_article']) && !empty($_GET['id_article'])) {
                $idArticle = $_GET['id_article'];
                $article = $this->articles->getArticleById($idArticle);

                $test = $this->articles->delArticle($idArticle);

                if ($test) {
                    $image = 'views/' . $article['image_src'];
                    unlink($image);
                    $message = 'delete OK';
                    header(
                        'location:index.php?admin=login&delete_article&message=' .
                            $message
                    );
                    exit();
                }
            }
        }
    }

    public function searchArticle()
    {
        if (array_key_exists('article', $_GET)) {
            $idArticle = $_GET['article'];
            $article = $this->articles->getArticleById($idArticle);
            echo json_encode($article);
        }
    }

    public function articles(): void
    {
        $articlesList = $this->articles->getArticles();
        $comments = $this->comments->getComments();

        $template = 'articles/articles';

        require 'views/layout.phtml';
    }

    public function detailsArticle(): void
    {
        if (array_key_exists("id_article", $_GET)) {
            $idArticle = $_GET["id_article"];
            $article = $this->articles->getArticleById($idArticle);
            $comments = $this->comments->getCommentsById($idArticle);
            $template = 'articles/detailsArticle';

            require 'views/layout.phtml';
        }
    }
}
