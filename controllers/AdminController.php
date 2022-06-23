<?php

declare(strict_types=1);

namespace controllers;

use models\Admin;
use models\Products;
use models\Articles;
use controllers\SecurityController;

class AdminController extends SecurityController
{
    private $admin;

    public function __construct()
    {
        $this->admin = new Admin();
        $this->products = new Products();
        $this->articles = new Articles();
    }

    // public function create_admin(){
    //     $username = "admin";
    //     $password = password_hash("admin", PASSWORD_DEFAULT);

    //     $this -> admin -> addAdmin($username,$password);
    // }

    public function loginAdmin()
    {
        if (isset($_GET['add_product'])) {
            $templateAdmin = 'addProduct';
        } elseif (isset($_GET['edit_product'])) {
            $products = $this->products->getProducts();

            $templateAdmin = 'editProduct';
        } elseif (isset($_GET['delete_product'])) {
            $productsList = $this->products->getProducts();

            $templateAdmin = 'deleteProduct';
        } elseif (isset($_GET['add_article'])) {
            $templateAdmin = 'addArticle';
        } elseif (isset($_GET['edit_article'])) {
            $articles = $this->articles->getArticles();
            $templateAdmin = 'editArticle';
        }

        if (
            isset($_POST['username']) &&
            !empty($_POST['username']) &&
            isset($_POST['password']) &&
            !empty($_POST['password'])
        ) {
            $username = $_POST['username'];
            $username = htmlspecialchars($username);
            $password = $_POST['password'];
            $password = htmlspecialchars($password);

            $result = $this->admin->getAdminByUsername($username);

            if ($result) {
                if (password_verify($password, $result['password'])) {
                    $_SESSION['admin'] = $username;
                    $message = 'Connexion validé';
                    header(
                        'location:index.php?admin=login&message=' . $message
                    );
                    exit();
                } else {
                    $message = 'Votre mot de passe est incorrect';
                    header('location:index.php?message=' . $message);
                    exit();
                }
            } else {
                $message = "Votre nom d'utilisateur est incorrect";
                header('location:index.php?message=' . $message);
                exit();
            }
        }
        $template = 'admin/admin';
        require 'views/layout.phtml';
    }

    public function deconnexionAdmin()
    {
        unset($_SESSION['admin']);
        session_destroy();
        $message = 'Vous avez été déconnecté';
        header('location:index.php?message=' . $message);
        exit();
    }
}
