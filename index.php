<?php

session_start();

use config\DataBase;
use controllers\SliderController;
use controllers\UserController;
use controllers\AdminController;
use controllers\ProductsController;
use controllers\AboutController;
use controllers\ActionController;
use controllers\CartController;
use controllers\OrderController;
use controllers\ArticlesController;
use controllers\CommentsController;

function chargerClasse($classe)
{
    $classe = str_replace('\\', '/', $classe);
    require $classe . '.php';
}

spl_autoload_register('chargerClasse'); //fin Autoload

$sliderController = new SliderController();
$productsController = new ProductsController();
$aboutController = new AboutController();
$adminController = new AdminController();
$userController = new UserController();
$cartController = new CartController();
$orderController = new OrderController();
$articlesController = new ArticlesController();
$commentsController = new CommentsController();
$actionController = new ActionController();

if (array_key_exists('action', $_GET)) {
    switch ($_GET['action']) {
        case 'products':
            if (array_key_exists('search', $_GET)) {
                $productsController->searchAjax($_GET['search']);
            } else {
                $productsController->products();
            }
            break;
        case 'productsSortByLowPrice':
            $productsController->productsSortByLowPrice();
            break;
        case 'productsSortByHighPrice':
            $productsController->productsSortByHighPrice();
            break;
        case 'detailsProduct':
            $productsController->detailsProduct();
            break;
        case 'articles':
            if (array_key_exists('search', $_GET)) {
                $articlesController->searchAjax($_GET['search']);
            } else {
                $articlesController->articles();
            }
            break;
        case 'details_article':
            $articlesController->detailsArticle();
            break;
        case 'like':
            if (array_key_exists('id_article', $_GET)) {
                $actionController->addLike();
            }
            break;
        case 'dislike':
            if (array_key_exists('id_article', $_GET)) {
                $actionController->addDislike();
            }
            break;
        case 'add_comment':
            $commentsController->addComment();
            break;
        case 'about':
            $aboutController->about();
            break;
        case 'login':
            $userController->loginUser();
            break;
        case 'deconnexion':
            $adminController->deconnexionAdmin();
            $userController->deconnexionUser();
            break;
        case 'create_account':
            $userController->create_account();
            break;
        case 'add_cart':
            if (array_key_exists('id_product', $_GET)) {
                $cartController->addCart($_GET['id_product']);
            }
            break;
        case 'remove_cart':
            if (array_key_exists('id_product', $_GET)) {
                $cartController->removeCart($_GET['id_product']);
            }
            break;
        case 'del_cart':
            if (array_key_exists('id_product', $_GET)) {
                $cartController->deleteCart($_GET['id_product']);
            }
            break;
        case 'get_cart':
            if (array_key_exists('id_user', $_GET)) {
                $cartController->getCart($_GET['id_user']);
            }
            break;
        case 'valid_order':
            if (array_key_exists('id_user', $_GET)) {
                $orderController->validOrder($_GET['id_user']);
            }
            break;
    }
} elseif (array_key_exists('admin', $_GET)) {
    switch ($_GET['admin']) {
        case 'login':
            $adminController->loginAdmin();
            break;
        case 'add_product':
            $productsController->addProduct();
            break;
        case 'edit_product':
            $productsController->editProduct();
            break;
        case 'delete_product':
            if (array_key_exists('id_product', $_GET)) {
                $productsController->deleteProduct();
            }
            break;
        case 'searchProduct':
            if (array_key_exists('product', $_GET)) {
                $productsController->searchProduct($_GET['product']);
            }
            break;
        case 'add_article':
            $articlesController->addArticle();
            break;
        case 'edit_article':
            $articlesController->editArticle();
            break;
        case 'delete_article':
            if (array_key_exists("id_article", $_GET)) {
                $articlesController->deleteArticle();
            }
            break;
        case 'searchArticle':
            if (array_key_exists('article', $_GET)) {
                $articlesController->searchArticle($_GET['article']);
            }
            break;
        case 'edit_comment':
            if (array_key_exists('id_comment', $_GET)) {
                $commentsController->displayComment();
            } else {
                $commentsController->editComment();
            }
            break;
        case 'delete_comment':
            if (array_key_exists('id_comment', $_GET)) {
                $commentsController->deleteComment();
            }
            break;
        case 'searchOrder':
            if (array_key_exists('order', $_GET)) {
                $orderController->searchOrder();
            }
            break;
        case 'order_detail':
            if (array_key_exists('id_order', $_GET)) {
                $orderController->displayOrder();
            }
            break;
        case 'valid_order':
            if (array_key_exists('id_order', $_GET)) {
                $orderController->validOrderExpedition();
            }
            break;
        case 'delete_order':
            if (array_key_exists('id_order', $_GET)) {
                $orderController->validOrderExpedition();
            }
            break;
        default:
            header('location:index.php');
            break;
    }
} else {
    $sliderController->listProduct();
}
